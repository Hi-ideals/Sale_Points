package com.hiideals

import com.sun.org.apache.bcel.internal.generic.NEW;

import grails.plugin.springsecurity.annotation.Secured;



@Secured("ROLE_SUPERADMIN")
class SuperadminController {

	def userService
	def index() {

		def  usersInstanceList = Admin.list()
		[usersInstanceList:usersInstanceList]
	}


	def createadmin(){
		render(template:'adminFORM')
	}


	def SaveAdmin(){
		def userexist=SecUser.findByUsername(params?.username)
		if(userexist){
			flash.message="This username Already Exist Please use different username"
			redirect(action:'index')
		}else{

			def userInstance= new SecUser()
			def adminRole = SecRole.findByAuthority('ROLE_ADMIN')
			userInstance.properties=params
			def stPath = grailsApplication.config.userPhotos
			userService.createImagePath(stPath)
			
				def file = request.getFile('file_1')
				if(file.getOriginalFilename()){
				String s = stPath + file.getOriginalFilename()
				try{
					file.transferTo(new File(s))
				}catch(Exception e){}
				Images image = new Images(name:file.getOriginalFilename(),imgpath:s).save(flush:true)
				userInstance.setProfilePic(image)
			}
			Address address=new Address(params)
			userInstance.setAddress(address.save(flush:true))
			def admin=new Admin(params)
			admin.properties=params
			userInstance.setAdminId(admin.save(flush:true))
			userInstance.save(flush:true,failOnError:true)
			admin.setUserId(userInstance)
			if(!userInstance.authorities.contains(adminRole)){
				new SecUserSecRole(userInstance, adminRole).save(flush:true,failOnError:true)
			}
			flash.message="Admin Created Successfully."
			redirect(action:'index')
		}
	}
	def adminEdit(){
		def usersInstance=Admin.findById(params?.userListid)
		render(template:'adminFORM',model:[usersInstance:usersInstance])
	}

	def updateAdmin(){
		def admin=Admin.findById(params?.userListid)
		admin.properties=params
		def address=Address.findById(admin.userId.address?.id)
		address.properties=params
		address.save(flush:true)
		admin.save(flush:true)
		flash.message="Admin Updated Successfully."
		redirect(action:'index')
	}
}
