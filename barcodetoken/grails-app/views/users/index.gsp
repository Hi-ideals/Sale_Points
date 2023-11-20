
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		
	</head>
	<body>	
		<div class="page-container">
            
            <div class="page-head">
                <g:render template="/shared/topMenu"></g:render>
            </div>
            
           <g:render template="/shared/leftMenu" model="[active:[UserHeader:'active open',UserList:'active']]"></g:render>
            
            <div class="page-content">

                <div class="container">
                	<div class="page-toolbar">
                        
                        <ul class="breadcrumb">
                            <li><g:link controller="home" action="dashboard">Dashboard</g:link></li>
                            <li><g:link controller="users" action="create">Create Customer</g:link></li>
                            <li class="active">List of Customers</li>
                        </ul>
                          
                    </div>
                    <div class="row">
                    	<div class="col-md-12">
                    		<div class="block">
                    			<div class="block-content">
                    			<h2><strong>Customer</strong> Details</h2>
                    				<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div class="table-responsive">
				<div class="block-content np">
			<table class="table table-bordered table-hover">
			<thead>
					<tr>
					<th>name</th>
					<th>uniqueNo</th>
					<th>Mobile</th>
					<th>Actions</th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${usersInstanceList}" status="i" var="usersInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
 <g:if test="${usersInstance?.name == null && usersInstance?.userBarcode == null}">
					     </g:if><g:else>
					
						<td>${fieldValue(bean: usersInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: usersInstance, field: "uniqueNo")}</td>
					
						<td>${fieldValue(bean: usersInstance, field: "phoneNo")}</td>
						<td>
							<g:link action="show" id="${usersInstance.id}"><i class="fa fa-eye">View</i></g:link>
<g:link action="edit" id="${usersInstance.id}"><i class="fa fa-pencil">Edit</i></g:link>
							
						</td>
						
					</g:else>
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
