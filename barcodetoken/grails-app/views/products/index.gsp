
<%@ page import="com.hiideals.Products" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'products.label', default: 'Products')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	
		<div class="page-container">
            
            <div class="page-head">
                <g:render template="/shared/topMenu"></g:render>
            </div>
            
            <g:render template="/shared/leftMenu" model="[active:[ProductHeader:'active open' , ProductList:'active']]"></g:render>
            
            <div class="page-content">

                <div class="container">
                	<div class="page-toolbar">
                        
                        <ul class="breadcrumb">
                            <li><g:link controller="home" action="dashboard">Dashboard</g:link></li>
                            <li><g:link controller="products" action="create">Add Product</g:link></li>
                            <li class="active">List of Products</li>
                        </ul>
                          
                    </div>
                    <div class="row">
                    	<div class="col-md-12">
                    		<div class="block">
                    			<div class="block-content">
                    				<h2><strong>List</strong> of Products</h2>
                    				<div class="table-responsive">
                    					<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-bordered">
			<thead>
					<tr>
						<th>Name</th>
						<th>Date Created</th>
						<th>Last Updated</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${productsInstanceList}" status="i" var="productsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: productsInstance, field: "name")}</td>
					
						<td><g:formatDate date="${productsInstance.dateCreated}" format="dd-MMM-yyyy" /></td>
					
						<td><g:formatDate date="${productsInstance.lastUpdated}" format="dd-MMM-yyyy"/></td>
						<td><g:link action="show" id="${productsInstance.id}"><i class="fa fa-eye"></i> View</g:link>
<g:link action="edit" id="${productsInstance.id}"><i class="fa fa-pencil"></i> Edit</g:link></td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${productsInstanceCount ?: 0}" />
			</div>
                    				</div>
                    			</div>
                    		</div>
                    	</div>
                    </div>
                 </div>
               </div>
               </div>
               
	
		<a href="#list-products" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-products" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			
		</div>
	</body>
</html>
