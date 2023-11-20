
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'user.label', default: 'User')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
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
						<li><g:link action="dashboard">Dashboard</g:link></li>
						<li><g:link controller="users" action="index">List of Customers</g:link></li>
						<li class="active">Customer Details</li>
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
										${flash.message}
									</div>
								</g:if>
								<table class="table table-bordered">
									<g:if test="${userInstance?.profilePic}">
										<tr>
											<td width="20%">Image</td>
											<td><img
												src="${createLink(controller:'users', action:'viewimg', id:userInstance?.id)}"
												alt="${userInstance?.name}" class="img-circle" width="80px" height="80px" >
												</td>
										</tr>
									</g:if><g:else>
									<tr>
											<td width="20%">Image</td>
											<td>
									<img src="images/user.jpg" class="img-circle" width="80px" height="80px"/>
									</td>
									
									</g:else>
									<g:if test="${userInstance?.name}">
										<tr>
											<td class="fieldcontain"><span id="username-label"
												class="property-label"><g:message
														code="user.username.label" default="Username" /></span></td>
											<td><span class="property-value"
												aria-labelledby="username-label"><g:fieldValue
														bean="${userInstance}" field="name" /></span></td>
										</tr>
									</g:if>

									<g:if test="${userInstance?.uniqueNo}">
										<tr>
											<td class="fieldcontain"><span id="uniqueNo-label"
												class="property-label"><g:message
														code="user.uniqueNo.label" default="Unique No" /></span></td>
											<td><span class="property-value"
												aria-labelledby="uniqueNo-label"><g:fieldValue
														bean="${userInstance}" field="uniqueNo" /></span></td>
										</tr>
									</g:if>
									<g:if test="${userInstance?.adharNum}">
										<tr>
											<td class="fieldcontain"><span id="adharNum-label"
												class="property-label"><g:message
														code="user.adharNum.label" default="Adhar Number" /></span></td>
											<td><span class="property-value"
												aria-labelledby="adharNum-label"><g:fieldValue
														bean="${userInstance}" field="adharNum" /></span></td>
										</tr>
									</g:if>

									<g:if test="${userInstance?.phoneNo}">
										<tr>
											<td class="fieldcontain"><span id="phoneNo-label"
												class="property-label"><g:message
														code="user.phoneNo.label" default="Phone No" /></span></td>
											<td><span class="property-value"
												aria-labelledby="phoneNo-label"><g:fieldValue
														bean="${userInstance}" field="phoneNo" /></span></td>
										</tr>
									</g:if>




									<g:if test="${userInstance?.address}">
										<tr>
											<td class="fieldcontain"><span id="address-label"
												class="property-label"><g:message
														code="user.address.label" default="Address" /></span></td>
											<td><span class="property-value"
												aria-labelledby="address-label">${userInstance?.address?.hsno},
												${userInstance?.address?.street},${userInstance?.address?.city} - ${userInstance?.address?.pinCode},
												${userInstance?.address?.state} ${userInstance?.address?.country}
												</span></td>
										</tr>
									</g:if>



										<tr>
											<td class="fieldcontain"><span id="address-label"
												class="property-label">Download Barcode Pdf File</span></td>
											<td><span class="property-value"
												aria-labelledby="address-label">
												<a class="btn btn-info" href="${createLink(controller:'users', action:'downloadBarCodePDF', id:userInstance?.id)}">
												Download Barcode</a>
												</span></td>
										</tr>
										<tr>
										<td>Actions</td>
										<td><g:link controller="users" action="edit"
												id="${userInstance?.id}" class="btn btn-warning">Edit</g:link>

										</td>
									</tr>

								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<a href="#show-user" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="list" action="index">
					<g:message code="default.list.label" args="[entityName]" />
				</g:link></li>
			<li><g:link class="create" action="create">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>
	<div id="show-user" class="content scaffold-show" role="main">
		<h1>
			<g:message code="default.show.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<ol class="property-list user">

			<g:if test="${userInstance?.name}">
				<li class="fieldcontain"><span id="username-label"
					class="property-label"><g:message code="user.username.label"
							default="Username" /></span> <span class="property-value"
					aria-labelledby="username-label"><g:fieldValue
							bean="${userInstance}" field="name" /></span></li>
			</g:if>

			<g:if test="${userInstance?.uniqueNo}">
				<li class="fieldcontain"><span id="uniqueNo-label"
					class="property-label"><g:message code="user.uniqueNo.label"
							default="Unique No" /></span> <span class="property-value"
					aria-labelledby="uniqueNo-label"><g:fieldValue
							bean="${userInstance}" field="uniqueNo" /></span></li>
			</g:if>

			<g:if test="${userInstance?.phoneNo}">
				<li class="fieldcontain"><span id="phoneNo-label"
					class="property-label"><g:message code="user.phoneNo.label"
							default="Phone No" /></span> <span class="property-value"
					aria-labelledby="phoneNo-label"><g:fieldValue
							bean="${userInstance}" field="phoneNo" /></span></li>
			</g:if>

			<g:if test="${userInstance?.profilePic}">
				<img
					src="${createLink(controller:'users', action:'viewimg', id:userInstance?.id)}"
					alt="Project Image" class="img-responsive" height="100px"
					width="100px">
			</g:if>

			<g:if test="${userInstance?.address}">
				<li class="fieldcontain"><span id="address-label"
					class="property-label"><g:message code="user.address.label"
							default="Address" /></span> <span class="property-value"
					aria-labelledby="address-label"><g:fieldValue
							bean="${userInstance}" field="address" /></span></li>
			</g:if>

		</ol>
		<%--<g:form url="[resource:userInstance, action:'delete']" method="DELETE">
			<fieldset class="buttons">
				<g:link class="edit" action="edit" resource="${userInstance}">
					<g:message code="default.button.edit.label" default="Edit" />
				</g:link>
				<g:actionSubmit class="delete" action="delete"
					value="${message(code: 'default.button.delete.label', default: 'Delete')}"
					onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
			</fieldset>
		</g:form>
	--%>
	</div>
</body>
</html>
