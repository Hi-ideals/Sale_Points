package com.hiideals

class Images {
	
	String name
	String imgpath
	Date dateCreated
	Date lastUpdated

    static constraints = {
		name nullable:true
		imgpath nullable:true
		dateCreated nullable:true
		lastUpdated nullable:true
		
    }
}
