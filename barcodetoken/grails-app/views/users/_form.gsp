<div class="row">
<div class="col-md-3">
<div class="fieldcontain ${hasErrors(bean: usersInstance, field: 'uniqueNo', 'error')} ">
	<label for="uniqueNo">
		<g:message code="user.uniqueNo.label" default="Unique No" />
		
	</label>
	<g:textField name="uniqueNo" readonly="true" class="form-control" value="${usersInstance?.uniqueNo ? usersInstance?.uniqueNo : uniqueNo }"/>

</div>
</div>
<div class="col-md-3">
<div class="fieldcontain ${hasErrors(bean: usersInstance, field: 'username', 'error')} ">
	<label for="username">
		<g:message code="user.username.label" default="Name" />
		
	</label>
	<g:textField name="name" class="form-control" value="${usersInstance?.name}" required="required"/>
	<g:hiddenField name="editid" value="${usersInstance?.id}" />

</div>
</div>

<div class="col-md-3">
<div class="fieldcontain ${hasErrors(bean: usersInstance, field: 'adharNum', 'error')} ">
	<label for="adharNum">
		Adhar Number
		
	</label>
	<g:textField name="adharNum" class="form-control" maxlength="12" value="${usersInstance?.adharNum}"/>

</div>
</div>

<div class="col-md-3">
<div class="fieldcontain ${hasErrors(bean: usersInstance, field: 'phoneNo', 'error')} ">
	<label for="phoneNo">
		Phone No <i>( Enter correct number)</i>
		
	</label> 
	<g:if test="${params?.action=="edit"}">
	<input name="phoneNo" class="form-control" value="${usersInstance?.phoneNo}"/>
	</g:if>
	<g:else>
	<g:textField name="phoneNo" class="form-control" value="${usersInstance?.phoneNo}" required="required"/>
	</g:else>

</div>
</div>


</div>

<div class="row">
	
	<div class="col-md-3">
		<label>House Number</label>
		<g:textField name="hsno" value="${usersInstance?.address?.hsno}" class="form-control"/>
	</div>
	<div class="col-md-3">
		<label>Street</label>
		<g:textField name="street" value="${usersInstance?.address?.street}" class="form-control"/>
	</div>
	<div class="col-md-3">
		<label>City</label>
		<g:textField name="city" value="${usersInstance?.address?.city}" class="form-control"/>	
	</div>
	<div class="col-md-3">
	<div class="fieldcontain ${hasErrors(bean: usersInstance, field: 'pinCode', 'error')} ">
	<label for="address">
		Pincode
		
	</label>
	<g:textField name="pinCode" class="form-control" value="${usersInstance?.address?.pinCode}"/>

</div>
</div>
</div>
<div class="row">
<div class="col-md-3">
		<label>State</label>
		<g:textField name="state" value="${usersInstance?.address?.state}" class="form-control"/>
	</div>
	<div class="col-md-3">
		<label>Country</label>
		<g:textField name="country" value="India" readonly="true"  class="form-control"/>
	</div>
	<g:if test="${params?.action!="edit"}">
	<div class="col-md-3">
		<label>Upload Image</label>
<input type="file" class="form-control"
						placeholder="" name="file_1" 
						value="">
	</div>
	</g:if>
		
	<g:if test="${params?.action=="edit" }">
	<div class="col-md-3">
		<label>Update Image</label>
<input type="file" class="form-control"
						placeholder="" name="file_1" 
						value="">
	</div>
	
	</g:if>
</div>






