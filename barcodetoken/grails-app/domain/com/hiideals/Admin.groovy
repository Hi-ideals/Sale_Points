package com.hiideals

class Admin {
	
	String username
	String password
	String phoneNo
	String smsSenderId
	String smsUsername
	String smsPassword
	//boolean smsMode
	SecUser userId
	Date dateCreated
	Date lastUpdated
	
	

    static constraints = {
		password nullable:true
		username nullable:true
		phoneNo nullable:true
		userId nullable:true
		dateCreated nullable:true
		lastUpdated nullable:true
		smsSenderId  nullable:true
		smsUsername nullable:true
		smsPassword nullable:true
		//smsMode nullable:true
    }
}

