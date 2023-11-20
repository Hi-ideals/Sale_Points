package com.hiideals

class Products {

	String name
	Date DateCreated
	Date lastUpdated
	Admin adminId
	
    static constraints = {
		name nullable:true
		adminId nullable:true
    }
}
