package com.hiideals

import java.util.Date;

class SecUser implements Serializable {

	private static final long serialVersionUID = 1

	transient springSecurityService

	String username
	String name
	String password
	String uniqueNo
	String adharNum
	String phoneNo
	Address address
	BarcodeMedia userBarcode
	Date dateCreated
	Date lastUpdated 
	Images profilePic
	Admin adminId
	
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	SecUser(String username, String password) {
		this()
		this.username = username
		this.password = password
	}

	@Override
	int hashCode() {
		username?.hashCode() ?: 0
	}

	@Override
	boolean equals(other) {
		is(other) || (other instanceof SecUser && other.username == username)
	}

	@Override
	String toString() {
		username
	}

	Set<SecRole> getAuthorities() {
		SecUserSecRole.findAllBySecUser(this)*.secRole
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}

	static transients = ['springSecurityService']

	static constraints = {
		username blank: true, unique: true
		password blank: true
		uniqueNo nullable:true
		adharNum nullable:true
		phoneNo nullable:true
		address nullable:true
		dateCreated nullable:true
		lastUpdated nullable:true
		profilePic nullable:true
		userBarcode nullable:true
		name nullable:true
		adminId nullable:true
	}

	static mapping = {
		password column: '`password`'
	}
}
