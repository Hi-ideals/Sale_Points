package com.hiideals

import java.security.SecureRandom;
import java.util.Date;
import javax.servlet.ServletContext;
import grails.plugin.springsecurity.annotation.Secured;

@Secured(["ROLE_ADMIN","ROLE_SUPERADMIN"])
class UsersController {

	def userService

	def index(Integer max) {
		params.max = Math.min(params.max?.toInteger() ?: 50, 100)
         params.offset = params.offset ? params.offset.toInteger() : 0
		 def c = SecUser.createCriteria()
		 def results = c.list (params) {
				 eq("adminId",SecUser.findByUsername(userService.getUsername()).adminId)
			     order("dateCreated", "desc")
		 }
		[usersInstanceList:results,usersInstanceCount:results.totalCount]
	}

	def show() {
		def userInstance=SecUser.findById(params?.id)
		[userInstance:userInstance]
	}

	def create() {

		SecureRandom random = new SecureRandom()
		int num = random.nextInt(1000000);
		String uniqueNo = String.format("%05d", num);
		[uniqueNo:uniqueNo]
	}


	def save() {
		
		def userexist=SecUser.findByUsername(params?.phoneNo)
		if(userexist){
			flash.message="This number Already Exist Please use different Number"
			redirect(  controller:'users',action:'create')
		}else{

			def userInstance= new SecUser()
			def userRole = SecRole.findByAuthority('ROLE_USER')
			userInstance.username = params.phoneNo
			userInstance?.properties=params
			userInstance.password = params.phoneNo

			def stPath = grailsApplication.config.userPhotos
			userService.createImagePath(stPath)

			if(params?.file_1){
			def file = request.getFile('file_1')
			String s = stPath + file.getOriginalFilename()
			try{
				file.transferTo(new File(s))
				Images image = new Images(name:file.getOriginalFilename(),imgpath:s).save(flush:true)
				userInstance.setProfilePic(image)
			}catch(Exception e){}
			}
			Address address=new Address(params)
			MediaUtils mediautils=new MediaUtils();
			def a=mediautils.getMediaInstance(params, null, "Barcode");
			userInstance.setUserBarcode(a)
			userInstance.setAddress(address.save(flush:true))
			
            userInstance.setAdminId(SecUser.findByUsername(userService.getUsername()).adminId)
			userInstance.save(flush:true,failOnError:true)
			if(!userInstance.authorities.contains(userRole)){
				new SecUserSecRole(userInstance, userRole).save(flush:true,failOnError:true)
			}
			redirect(action:'show',id:userInstance?.id)
		}
	}


	def edit() {
		def usersInstance =SecUser.findById(params?.id)
		[usersInstance:usersInstance]
	}


	def update() {
		def userInstance = SecUser.findById(params?.editid)
		userInstance?.properties=params
		def address=Address.findById(userInstance?.address?.id)
		address?.properties=params
		def stPath = grailsApplication.config.userPhotos
		userService.createImagePath(stPath)
		
			def file = request.getFile('file_1')
			if(file.getOriginalFilename()){
			String s = stPath + file.getOriginalFilename()
				try {
					file.transferTo(new File(s))
				} catch (Exception e) {
					e.printStackTrace()
				}
				
				def profilepic=Images.findById(userInstance?.profilePic?.id)
				profilepic.imgpath=s
				profilepic.save(flush:true)
				
		}		
		address.save(flush:true)
		userInstance.save flush:true
		redirect(action:'show',id:userInstance?.id)
	}

	def delete() {

		def userInstance = SecUser.findById(params?.id)
		userInstance.delete(flush:true)
	}

	protected void notFound() {
		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.not.found.message', args: [
					message(code: 'user.label', default: 'User'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
	
	
	def viewimg(){
		SecUser imgInstance = SecUser.get(params.int('id'));
		if ( imgInstance == null) {
			flash.message = "image not found."
			redirect (action:'index')
		} else {
			def file = new File(imgInstance?.profilePic?.imgpath)
			println("file  :  "+file)
			def fileInputStream = new FileInputStream(file)
			def outputStream = response.getOutputStream()
			byte[] buffer = new byte[4096];
			int len;
			while ((len = fileInputStream.read(buffer)) > 0) {
				outputStream.write(buffer, 0, len);
			}
			outputStream.flush()
			outputStream.close()
			fileInputStream.close()
		}
		
	}


def downloadBarCodePDF(){
		
		def filefile=SecUser.findById(params.id)
		String filePath = filefile?.userBarcode?.imagePath//grailsApplication.config.generalFiles//+file.getOriginalFilename()//params.file;
		File dwnldFile = new File(filePath);
		FileInputStream inStream = new FileInputStream(dwnldFile);
		// if you want to use a relative path to context root:
		String relativePath = getServletContext().getRealPath("");

		// obtains ServletContext
		ServletContext context = getServletContext();

		// gets MIME type of the file
		String mimeType = context.getMimeType(filePath);
		if (mimeType == null) {
			// set to binary type if MIME mapping not found
			mimeType = "application/octet-stream";
		}
		System.out.println("MIME type: " + mimeType);

		// modifies response
		response.setContentType(mimeType);
		response.setContentLength((int) dwnldFile.length());

		// forces download
		String headerKey = "Content-Disposition";
		String headerValue = String.format("attachment; filename=\"%s\"", dwnldFile.getName());
		response.setHeader(headerKey, headerValue);

		// obtains response's output stream
		OutputStream outStream = response.getOutputStream();

		byte[] buffer = new byte[4096];
		int bytesRead = -1;

		while ((bytesRead = inStream.read(buffer)) != -1) {
			outStream.write(buffer, 0, bytesRead);
		}

		println("File Downloaded Successfully ")
		inStream.close();
		outStream.close();
	
	}
}

