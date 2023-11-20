package com.hiideals



import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
import grails.util.Environment

import java.text.DateFormat
import java.text.SimpleDateFormat

@Transactional(readOnly = false)
@Secured(["ROLE_ADMIN"])
class AssignPointsController {

	SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
	def userService
	  
	static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]

	  def index(Integer max) {
		params.max = Math.min(params.max?.toInteger() ?: 50, 100)
		params.offset = params.offset ? params.offset.toInteger() : 0
		def c = AssignPoints.createCriteria()
		def results = c.list (params) {
				eq("adminId",SecUser.findByUsername(userService.getUsername()).adminId)
		}
	   [assignPointsInstanceList:results,assignPointsInstanceCount:results.totalCount]
	   // params.max = Math.min(max ?: 10, 100)
	   // respond AssignPoints.list(params), model:[assignPointsInstanceCount: AssignPoints.count()]
	}

	def show(AssignPoints assignPointsInstance) {
   if(params?.id){
		def pointsassigns=AssignPoints.findAllByUserId(assignPointsInstance?.userId)
		respond assignPointsInstance,model:[pointsassigns:pointsassigns]
}
	}

	def create() {
		respond new AssignPoints(params)
	}

	@Transactional
	def save(AssignPoints assignPointsInstance) {
		
		def challanexist=AssignPoints.findByChallanNo(params?.challanNo)
		if(challanexist){
			flash.message="This challan number is already exist. Please use different Number"
			redirect(  controller:'assignPoints',action:'create')
		}else{
		  
		
		
		if (assignPointsInstance == null) {
			notFound()
			return
		}

		if (assignPointsInstance.hasErrors()) {
			respond assignPointsInstance.errors, view:'create'
			return
		}
		assignPointsInstance.setAdminId(SecUser.findByUsername(userService.getUsername()).adminId)
		assignPointsInstance.setUserId(SecUser.findById(params?.userid))
		
		def points=UsersPoints.findByUserId(SecUser.findById(params?.userid))
		if(points){
			points.overAllPoints=points.overAllPoints+Integer.parseInt(params?.totalPoints)
			points.save(flush:true)
		}else{
		  def usrpts=new UsersPoints()
		  usrpts.setUserId(SecUser.findById(params?.userid))
		  usrpts.overAllPoints=Integer.parseInt(params?.totalPoints);
		  usrpts.save(flush:true)
		}

		 def admin=Admin.findById(SecUser.findByUsername(userService.getUsername()).adminId?.id)
		 def overallpoints=UsersPoints.findByUserId(assignPointsInstance?.userId)
		
			String message = "Dear "+assignPointsInstance?.userId?.name +",You have earned "+params?.totalPoints+ " points for challan Number  "+assignPointsInstance?.challanNo+
			" . And your total balance points are "+overallpoints?.overAllPoints
			SendSMS.sendSMS(assignPointsInstance.userId?.phoneNo,message)
		//}
	  
		assignPointsInstance.createdDate=df.parse(params?.createdDate1)
		assignPointsInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = "Point Assigned and sent SMS to "+assignPointsInstance?.userId?.name+" Successfully"
				redirect assignPointsInstance
			}
			'*' { respond assignPointsInstance, [status: CREATED] }
		}
	}
	}
	def edit(AssignPoints assignPointsInstance) {
		respond assignPointsInstance
	}

	@Transactional
	def update(AssignPoints assignPointsInstance) {
		if (assignPointsInstance == null) {
			notFound()
			return
		}

		if (assignPointsInstance.hasErrors()) {
			respond assignPointsInstance.errors, view:'edit'
			return
		}

		assignPointsInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.updated.message', args: [message(code: 'AssignPoints.label', default: 'AssignPoints'), assignPointsInstance.id])
				redirect assignPointsInstance
			}
			'*'{ respond assignPointsInstance, [status: OK] }
		}
	}

	@Transactional
	def delete(AssignPoints assignPointsInstance) {

		if (assignPointsInstance == null) {
			notFound()
			return
		}

		assignPointsInstance.delete flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.deleted.message', args: [message(code: 'AssignPoints.label', default: 'AssignPoints'), assignPointsInstance.id])
				redirect action:"index", method:"GET"
			}
			'*'{ render status: NO_CONTENT }
		}
	}

	protected void notFound() {
		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.not.found.message', args: [message(code: 'assignPoints.label', default: 'AssignPoints'), params.id])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
	
	def SearchUser(){
		
		def user=SecUser.findByUniqueNoAndAdminId(params?.uniqueNo,SecUser.findByUsername(userService.getUsername()).adminId)
		if(user){
			def challanNo=null//getchallanUniqueNumber(params)
			def	productList=Products.findAllByAdminId(SecUser.findByUsername(userService.getUsername()).adminId)
			render(template:'form',model:[user:user,productList:productList,challanNo:challanNo])
		}else{
			render("No User found by this unique No. Click on => Add Customers from left menu")
		}
	}
	
	
	def getchallanUniqueNumber(params){
		def randomno;
		def c = AssignPoints.createCriteria()
		def results = c.list {
			eq ('adminId', SecUser.findByUsername(userService.getUsername()).adminId)
			maxResults(1)
			order("id", "desc")
		}
		def number;
		String line;
		if(results[0]?.challanNo)
		{
			line = results[0]?.challanNo;
			number=(line.toInteger()+1).toInteger();
		}else{
			randomno="000001"
		}
		if(number!=null){
			if(number<=9){
				randomno="00000"+number
			}else if(number<100 && number>=10){
				randomno="0000"+number
			}else if(number<1000 && number>=100){
				randomno="000"+number
			}
			else if(number<10000 && number>=1000){
				randomno="00"+number
			}else if(number<100000 && number>=10000){
				randomno="0"+number
			}
			else{
				randomno="000001"
			}
		}
		return randomno;
	}
	
	def redeemPoints1(){
		
		def points=UsersPoints.findByUserId(SecUser.findById(params?.userid))
		[points:points]
		
	}
	
	def redeemPoints(){
		
		def user=SecUser.findByUniqueNo(params?.uniqueNo)
		def usr=UsersPoints.findByUserId(user)
		session.userpoints= usr?.overAllPoints
		 if(user){
		 if(!usr){
				render("Point is not assigned to this User")
				}else{
			render(template:'redeemPoints',model:[user:usr])
			//redirect [controller: AssignPoints ,action:redeemPoints]
			  }
		}else{
			render("No User found by this unique No")
		}
		//
		
	}
	
	def clearUserPoints(){
		def user=UsersPoints.findByUserId(SecUser.findById(params?.userid))
		user.overAllPoints=Integer.parseInt("0")
		user.save(flash:true,failOnError:true)
		flash.reddemMessage=" Successfully redeemed "+user?.userId?.name+"'s "+session.userpoints+" points "
		def redeem=new RedeemPoints()
		redeem.overallPoints=session.userpoints
		redeem.reedemPoints=session.userpoints
		redeem.setUserId(SecUser.findById(params?.userid))
		redeem.save(flush:true)
		def admin=Admin.findById(SecUser.findByUsername(userService.getUsername()).adminId?.id)
		
		
			String message = "You have redeem your " +session.userpoints+ " points "
			//SendSMS.sendSMSDynamic(user?.userId?.username, message, admin?.smsUsername,admin?.smsPassword,admin?.smsSenderId)
			SendSMS.sendSMS(user?.userId?.phoneNo,message)
			//}

	redirect(action:'redeemPoints1')

	}
	
	
}

