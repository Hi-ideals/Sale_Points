
<%@ page import="com.hiideals.AssignPoints" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'assignPoints.label', default: 'AssignPoints')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	
		<div class="page-container">
            
            <div class="page-head">
                <g:render template="/shared/topMenu"></g:render>
            </div>
            
            <g:render template="/shared/leftMenu" model="[active:[UserPointHeader:'active open',UserPointList:'active']]"></g:render>
            
            <div class="page-content">

                <div class="container">
                	<div class="page-toolbar">
                        
                        <ul class="breadcrumb">
                            <li><g:link controller="home" action="dashboard">Dashboard</g:link></li>
                            <li><g:link controller="assignPoints" action="create">Add Points</g:link></li>
                            <li class="active">List of Points</li>
                        </ul>
                          
                    </div>
                    <div class="row">
                    	<div class="col-md-12">
                    		<div class="block">
                    			<div class="block-content">
                    				<h2><strong>List of</strong> Points Assigned</h2>
                    				
                    				<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div class="table-responsive">
			<table class="table table-bordered table-striped">
			<thead>
					<tr>
						<th>Name</th>
						<th>Mobile Number</th>
						<th>Created Date</th>
						<th>Challan No.</th>
						<th>Product</th>
						<th>No.of Box</th>
						<th>Points/Box</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${assignPointsInstanceList?.reverse()}" status="i" var="assignPointsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: assignPointsInstance?.userId, field: "name")}</td>
						<td>${fieldValue(bean: assignPointsInstance?.userId, field: "username")}</td>
					
						<td><g:formatDate date="${assignPointsInstance.createdDate}" format="dd-MMM-yyyy"/></td>
					
						<td>${fieldValue(bean: assignPointsInstance, field: "challanNo")}</td>
					
						<td>${fieldValue(bean: assignPointsInstance?.product, field: "name")}</td>
					
						<td>${fieldValue(bean: assignPointsInstance, field: "numberOfBox")}</td>
					
						<td>${fieldValue(bean: assignPointsInstance, field: "pointsPerBox")}</td>
						<td><g:link action="show" id="${assignPointsInstance.id}"><i class="fa fa-eye"> View</i></g:link></td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${assignPointsInstanceCount ?: 0}" />
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
