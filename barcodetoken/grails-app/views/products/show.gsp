
<%@ page import="com.hiideals.Products" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'products.label', default: 'Products')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
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
						<li><g:link action="dashboard">Dashboard</g:link></li>
						<li><g:link controller="products" action="index">List of Products</g:link></li>
						<li class="active">Product Details</li>
					</ul>

				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="block">
							<div class="block-content">
								<h2>
									<strong>View</strong> Details
								</h2>
								<hr>
								<g:if test="${flash.message}">
			<div class="message" role="status">
			<p style="color:green; font-size:18px; margin-bottom:10px">${flash.message}</p>
			</div>
			</g:if>
			<div class="table-responsive">
			<table class="table table-bordered">
			
				<g:if test="${productsInstance?.name}">
				<tr>
				<td class="fieldcontain" width="20%">
					<span id="name-label" class="property-label"><g:message code="products.name.label" default="Name" /></span>
					</td>
					<td>
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${productsInstance}" field="name"/></span>
					
				</td>
				</tr>
				</g:if>
			
				<g:if test="${productsInstance?.dateCreated}">
				<tr>
				<td class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="products.dateCreated.label" default="Date Created" /></span>
					</td>
					<td>
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${productsInstance?.dateCreated}" format="dd-MMM-yyyy"/></span>
					
				</td>
				</tr>
				</g:if>
			
				<%--<g:if test="${productsInstance?.lastUpdated}">
				<tr>
				<td class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="products.lastUpdated.label" default="Last Updated" /></span>
					</td>
					<td>
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${productsInstance?.lastUpdated}" /></span>
					
				</td>
				</tr>
				</g:if>
			
			--%>
			
			</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		
	
	
	
		
		
			
			</div>
			<%--<g:form url="[resource:productsInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${productsInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		
	--%>
	</body>
</html>
