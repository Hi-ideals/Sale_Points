package com.hiideals

class AssignPoints {
	
	SecUser userId
	Date createdDate
	String challanNo
	Products product
	int numberOfBox
	int pointsPerBox
	int totalPoints
	Admin adminId
	String engineering
	
    static constraints = {
		
		userId nullable:true
		createdDate nullable:true
		challanNo nullable:true
		product nullable:true
		numberOfBox nullable:true
		pointsPerBox nullable:true
		totalPoints nullable:true
		adminId nullable:true
		engineering nullbale:true
    }
}
