package com.hiideals

import com.sun.webkit.network.URLLoader.Redirect;

import grails.plugin.springsecurity.SpringSecurityService;
import grails.plugin.springsecurity.SpringSecurityUtils;
import grails.plugin.springsecurity.annotation.Secured;

@Secured(["ROLE_ADMIN","ROLE_SUPERADMIN"])
class HomeController {
def SpringSecurityService
    def index() { 
		if(SpringSecurityUtils.ifAnyGranted("ROLE_ADMIN")){
			redirect(controller:'home',action:'dashboard')
		}
		
		else if(SpringSecurityUtils.ifAnyGranted("ROLE_SUPERADMIN")){
		redirect(controller:'superadmin',action:'index')
		}
		
		else{
		redirect(controller:'login',action:'auth')
		}
	}
	
	def userService
	def dashboard(){
		
	
        def c0 = SecUser.createCriteria()
		def c1 = Products.createCriteria()
		def c2 = AssignPoints.createCriteria()
		def results4 = c0.list (params) {
			    eq("adminId",SecUser.findByUsername(userService.getUsername()).adminId)
			    ne("username",userService.getUsername())
		}
		def results2 = c1.list (params) {
			eq("adminId",SecUser.findByUsername(userService.getUsername()).adminId)
	      }
		def results3 = c2.list (params) {
			eq("adminId",SecUser.findByUsername(userService.getUsername()).adminId)
			projections {
				distinct('userId')
			}
		  }
		
		def c = SecUser.createCriteria()
		def results = c.list (params) {
				eq("adminId",SecUser.findByUsername(userService.getUsername()).adminId)
				order("dateCreated", "desc")
		}
		
		
	   [usersInstanceList:results,usercount:results4,Productlist:results2,assignPoints:results3]
	}
}

