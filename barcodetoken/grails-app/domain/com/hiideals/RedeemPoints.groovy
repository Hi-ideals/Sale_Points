package com.hiideals

class RedeemPoints {
	
	Date dateCreated
	Date lastUpdated
	int reedemPoints
	int overallPoints
	SecUser userId

    static constraints = {
		
		dateCreated nullable:true
		lastUpdated nullable:true
		reedemPoints nullable:true
		overallPoints nullable:true
		userId nullable:true
		
		
    }
}
