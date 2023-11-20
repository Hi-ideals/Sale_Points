class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
         "/Reports"(controller:'reports', action:'index')
		"500"(view:'/error')		

		"/ListOfUserspts"(controller:'assignPoints', action:'index')
		"500"(view:'/error')
		
		"/EditUsersptsDetail"(controller:'assignPoints', action:'edit')
		"500"(view:'/error')
		
		"/ShowUserptsDetail"(controller:'assignPoints', action:'show')
		"500"(view:'/error')
		
		"/CreateUserpts"(controller:'assignPoints', action:'create')
		"500"(view:'/error')
		
		
		"/PointsRedeem"(controller:'assignPoints', action:'redeemPoints1')
		"500"(view:'/error')
		
		
		"/superadmin"(controller:'superadmin', action:'index')
		"500"(view:'/error')
		
		"/ListOfProducts"(controller:'products', action:'index')
		"500"(view:'/error')
		
		"/EditProduct"(controller:'products', action:'edit')
		"500"(view:'/error')
		
		"/ShowProductDetail"(controller:'products', action:'show')
		"500"(view:'/error')
		
		"/AddProduct"(controller:'products', action:'create')
		"500"(view:'/error')
		
		"/ListOfUsers"(controller:'users', action:'index')
		"500"(view:'/error')
		
		"/EditUsersDetail"(controller:'users', action:'edit')
		"500"(view:'/error')
		
		"/ShowUserDetail"(controller:'users', action:'show')
		"500"(view:'/error')
		
		"/CreateUser"(controller:'users', action:'create')
		"500"(view:'/error')

             "/"(controller:"home") 
			"500"(view:'/error')
			
			"/Dashboard"(controller:'home', action:'dashboard')
			"500"(view:'/error')
			
			
	}
}
