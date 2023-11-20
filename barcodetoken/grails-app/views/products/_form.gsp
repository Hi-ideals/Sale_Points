<%@ page import="com.hiideals.Products" %>


<div class="row">
	<div class="col-md-4">

<div class="fieldcontain ${hasErrors(bean: productsInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="products.name.label" default="Name" />
		
	</label>
	<g:textField name="name" class="form-control" value="${productsInstance?.name}"/>

</div>
</div>
</div>
