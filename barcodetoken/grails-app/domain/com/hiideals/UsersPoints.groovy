package com.hiideals

class UsersPoints {
	
	SecUser userId
	int overAllPoints
	

    static constraints = {
		userId nullable:true
		overAllPoints nullable:true
    }
}
