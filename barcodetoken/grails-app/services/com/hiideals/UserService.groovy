package com.hiideals

import grails.transaction.Transactional

@Transactional
class UserService {
	
	def springSecurityService
	static createImagePath(String path){
				def storagePathDirectory = new File(path)//(gpath)
		
				if (!storagePathDirectory.exists()) {
					if (storagePathDirectory.mkdirs()) {
					} else {
					}
				}
			}

    def serviceMethod() {

    }
	

	def String getUsername() {
		def user = springSecurityService.currentUser
		def userName = null;
		if(user!=null){
			userName = user.username;
		}
		return userName;
	}
	
}

