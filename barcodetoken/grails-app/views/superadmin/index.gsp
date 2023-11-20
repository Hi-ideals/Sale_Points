
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		
	</head>
	<body>	
		<div class="page-container">
            
            <div class="page-head">
               <ul class="page-head-elements">
                    <li><a href="#" class="page-navigation-toggle"><span class="fa fa-bars"></span></a></li>
                   
                </ul>
<ul class="page-head-elements pull-right">
                    <li>
                       
                        <a href="#" class="dropdown"><span class="fa fa-user"></span> <sec:username/> <i class="fa fa-caret-down"></i></a>                        
                        <div class="popup">
                            <div class="list no-controls">
                                <%--<a href="#" class="list-item">
                                    <div class="list-item-content">
                                        <h4>John Doe</h4>
                                       
                                    </div>                                
                                </a>
                                --%>
                                <a href="#" class="list-item">
                                    <div class="list-item-content">
                                        
                                       
                                    </div>                                
                                </a>
                                <sec:ifLoggedIn>
				
				
				
						<g:form controller="logout">
						<div class="list-item-content">
										<g:submitButton name="Log Out" class="btn btn-warning"/>
									</div>
									</g:form>
								</sec:ifLoggedIn>
                                
                               <a href="#" class="list-item">
                                    <div class="list-item-content">
                                        
                                       
                                    </div>                                
                                </a>
                            </div>
                            
                        </div>
                        
                    </li>
                    
                    <li><a href="#"></a></li>
                </ul>
            </div>
            
            <div class="page-navigation">
                
                <div class="page-navigation-info">
                    <a><p style="color:#fff"><img src="images/favicon.png" />  Hi-Ideals Technologies Pvt Ltd</p></a>
                	
                </div>
                
                

                <ul class="navigation">
                	<li><a><i class="fa fa-ticket"></i>Token Points Generate System </a></li>
                    <li class="active"><g:link controller="superadmin" action="index"><i class="fa fa-user"></i> Create Admin</g:link></li>
                                       
                </ul>
                  
            </div>
            
            <div class="page-content">

                <div class="container">
                	<div class="page-toolbar">
                        
                        <ul class="breadcrumb">
                            <li><a>Dashboard</a></li>
                            <li class="active">Super Admin</li>
                        </ul>
                          
                    </div>
                    <div class="row">
                    	<div class="col-md-12">
                    		<div class="block">
                    			<div class="block-content">
                    			
                    				<g:if test="${flash.message}">
                    				<div class="alert alert-success">
				<div class="text-center" style="color:#000;" role="status">${flash.message}</div>
			</div>
			</g:if>
			
			<g:formRemote name="kk" url="[action:'createadmin']"
								update="update1" >
								<button class="btn btn-primary" style="margin-top:20px">
									<i class="fa fa-plus"></i> Create Admin
								</button>
							</g:formRemote>
							
							<div class="m-content">
		<div id="update1"></div>
	</div><hr>
			<div class="table-responsive">
				<h2><strong>Admin</strong> Details</h2>
				<div class="block-content np">
			<table class="table table-bordered table-hover">
			<thead>
					<tr>
					<th>S.No</th>
					<th>Username</th>
					<th>Password</th>
					<th>Phone No</th>
					<th>Address</th>
					<th>SMS Details</th>
					<th>Image</th>
					<th>Action</th>
					
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${usersInstanceList?.reverse()}" status="i" var="usersInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					 <td>${i+1}</td> 
						<td>${fieldValue(bean: usersInstance, field: "username")}</td>
						
						<td>${fieldValue(bean: usersInstance, field: "password")}</td>
					
						<td>${fieldValue(bean: usersInstance, field: "phoneNo")}</td>
					
						<td>${usersInstance?.userId?.address?.hsno}, ${usersInstance?.userId?.address?.street}
							${usersInstance?.userId?.address?.city} - ${usersInstance?.userId?.address?.pinCode}, 
							${usersInstance?.userId?.address?.state}, ${usersInstance?.userId?.address?.country}
						</td>
						<td>SenderID :  ${usersInstance?.smsSenderId} <br>
						    Username :   ${usersInstance?.smsUsername} <br>
						    Password :   ${usersInstance?.smsPassword} <br>
						   
						   <br>
						</td>
						
							<td>
								<g:if test="${usersInstance?.userId?.profilePic}">
							<img src="${createLink(controller:'users', action:'viewimg', id:usersInstance?.userId?.id)}"
												alt="${fieldValue(bean: usersInstance, field: "username")}" class="img-circle" width="80px" height="80px">
												
												</g:if><g:else>
												
												<img src="images/user.jpg" class="img-circle" alt="${fieldValue(bean: usersInstance, field: "username")}" width="80px" height="80px"/>
												
												</g:else>
							</td>
												
								<td><g:formRemote name="kk" url="[action:'adminEdit']"
											update="update1">
											<g:hiddenField name="userListid"
												value="${usersInstance?.id}" />
											<br>
											<div>
												<g:submitButton name="Edit"
													class="btn btn-primary" />
											</div>
										</g:formRemote></td>
						
						
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${usersInstanceCount ?: 0}" />
			</div>
			</div>
			</div>
                    			</div>
                    		</div>
                    	</div>
                    	
                    </div>
                    
                    
                </div>
            </div>
       </div>
       
	
		
	</body>
</html>

