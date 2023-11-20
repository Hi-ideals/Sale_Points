<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'products.label', default: 'Products')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>
</head>
<body>

	<div class="page-container">

		<div class="page-head">
			<g:render template="/shared/topMenu"></g:render>
		</div>

		<g:render template="/shared/leftMenu"
			model="[active:[ProductHeader:'active open' , CreateProduct:'active']]"></g:render>

		<div class="page-content">

			<div class="container">
				<div class="page-toolbar">

					<ul class="breadcrumb">
						<li><g:link action="dashboard">Dashboard</g:link></li>
						<li><g:link controller="products" action="index">List of Products</g:link></li>
						<li class="active">Add Product</li>
					</ul>

				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="block">
							<div class="block-content">
								<h2>
									<strong>Add</strong> Product
								</h2>
								<hr>
								<g:if test="${flash.message}">
									<div class="message" role="status">
										${flash.message}
									</div>
								</g:if>
								<g:hasErrors bean="${productsInstance}">
									<ul class="errors" role="alert">
										<g:eachError bean="${productsInstance}" var="error">
											<li
												<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
													error="${error}" /></li>
										</g:eachError>
									</ul>
								</g:hasErrors>
								<g:form url="[resource:productsInstance, action:'save']"
									name="validate2">
									<fieldset class="form">
										<g:render template="form" />
									</fieldset>
									<br>
									<fieldset class="buttons">
										<g:submitButton name="create"
											class="btn btn-primary btn-rounded"
											value="${message(code: 'default.button.create.label', default: 'Create')}" />
									</fieldset>
								</g:form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		var validate2 = $("#validate2").validate({
			rules : {
				name : {
					required : true,
					minlength : 4,

				},

			},

		});
	</script>

</body>
</html>
