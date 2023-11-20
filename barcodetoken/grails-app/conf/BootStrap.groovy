import com.hiideals.SecRole;
import com.hiideals.SecUser;
import com.hiideals.SecUserSecRole;

class BootStrap {

	def init = { servletContext ->

		def superadminRole = SecRole.findByAuthority('ROLE_SUPERADMIN') ?: new SecRole(authority: 'ROLE_SUPERADMIN').save(flush: true)
		def adminRole = SecRole.findByAuthority('ROLE_ADMIN') ?: new SecRole(authority: 'ROLE_ADMIN').save(flush: true)
		def userRole = SecRole.findByAuthority('ROLE_USER') ?: new SecRole(authority: 'ROLE_USER').save(flush: true)

		def superadmin = SecUser.findByUsername("superadmin") ?: new SecUser(username: 'superadmin', password: '123123123').save(flush: true)
		def admin = SecUser.findByUsername("admin") ?: new SecUser(username: 'admin', password: '123123123').save(flush: true)
		def user = SecUser.findByUsername("user") ?: new SecUser(username: 'user', password: '123123123').save(flush: true)
		

		if(!admin.authorities.contains(adminRole)){
			SecUserSecRole.create(admin,adminRole)
		}

		if(!user.authorities.contains(userRole)){
			SecUserSecRole.create(user,userRole)
		}
		
		if(!superadmin.authorities.contains(superadminRole)){
			SecUserSecRole.create(superadmin,superadminRole)
		}
	}
	def destroy = {
	}
}

