package com.hiideals
import grails.plugin.springsecurity.annotation.Secured

import java.net.URLPermission.Authority;
import java.text.DateFormat
import java.text.SimpleDateFormat


@Secured(["ROLE_ADMIN"])
class ReportsController {
	private static DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	def UserService
	def index() {
		def	productList=Products.findAllByAdminId(SecUser.findByUsername(userService.getUsername()).adminId)
		[productList:productList]
	}

	def userlist(){
		println("paramssssssssss"+ params)
		if( params?.uniqueNo || params?.phoneNo || params?.From){
			def c=SecUser.createCriteria()
			def result=c.list{
				eq("adminId",SecUser.findByUsername(UserService.getUsername()).adminId)
				if(params?.From){
					def fromdate=df.parse(params?.From)
					def todate=df.parse(params?.To)
					between("dateCreated", fromdate,todate)
				}
				else if(params?.uniqueNo){
					eq("uniqueNo",params?.uniqueNo)
				}
				else if(params?.phoneNo){
					eq("username",params?.phoneNo)
				}
			}
			println("result : "+ result)
			render(template:'userlists',model:[userlistinstance:result])
		}else{

			render("<span style='color:red;margin-top:5px;'>Please Select any one input</span>")
		}
	}

	def pointassign(){
		println()
		if(params?.Challan ||  params?.uniqueNo || params?.pnno){
			def c=AssignPoints.createCriteria()
			def point=c.list{
				eq("adminId", SecUser.findByUsername(UserService.getUsername()).adminId)
				if(params?.Challan){
					eq("challanNo",params?.Challan)
				}
				if(params?.pnno){
					userId{
						eq("phoneNo",params?.pnno)
					}
				}
				
				if(params?.uniqueNo){
					userId{
						eq("uniqueNo",params?.uniqueNo)
					}

					
				}
			}
			//println("point"+point)
			render(template:'pointassign',model:[pointsassigns:point])
		}
		else{

			render("<span style='color:red;margin-top:5px;'>Please Select any one input</span>")
		}
	}

	def redeemPoints(){
		def c=RedeemPoints.createCriteria()
		def redeemPoint=c.list{
			if(params?.phoneNo){
				userId{
					eq("phoneNo",params?.phoneNo)
				}
			}
			if(params?.uniqueNo){
				userId{
					eq("uniqueNo",params?.uniqueNo)
				}
			}
			
		}
		render(template:'redeemPoints',model:[redeemPoints:redeemPoint])
	}

}


