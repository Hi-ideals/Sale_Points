

<g:form controller="superadmin" enctype="multipart/form-data" name="validateip">
<div class="row">
<div class="col-md-3">
<div class="fieldcontain ${hasErrors(bean: usersInstance, field: 'username', 'error')} ">
	<label for="username">
		<g:message code="user.username.label" default="Username" />
		
	</label>
	<g:if test="${params?.action !="adminEdit"}">
	<g:textField name="username" class="form-control" value="${usersInstance?.username}"/>
</g:if><g:else>
<input name="username" class="form-control" value="${usersInstance?.username}" readonly="readonly"/>
</g:else>
</div>
</div>

<div class="col-md-3">
<div class="fieldcontain ${hasErrors(bean: usersInstance, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		
	</label>
	<g:if test="${params?.action !="adminEdit"}">
	<g:textField name="password" class="form-control" value="${usersInstance?.password}"/>
</g:if><g:else>
<input name="password" class="form-control" value="${usersInstance?.password}" readonly="readonly"/>
</g:else>
</div>
</div>

<%--<div class="col-md-3">
<div class="fieldcontain ${hasErrors(bean: usersInstance, field: 'uniqueNo', 'error')} ">
	<label for="uniqueNo">
		<g:message code="user.uniqueNo.label" default="Unique No" />
		
	</label>
	<g:textField name="uniqueNo" class="form-control" value="${usersInstance?.uniqueNo ? usersInstance?.uniqueNo : uniqueNo }"/>

</div>
</div>
--%><div class="col-md-3">
<div class="fieldcontain ${hasErrors(bean: usersInstance, field: 'phoneNo', 'error')} ">
	<label for="phoneNo">
		<g:message code="user.phoneNo.label" default="Phone No" />
		
	</label>
	<g:textField name="phoneNo" class="form-control" value="${usersInstance?.phoneNo}"/>

</div>
</div>
<div class="col-md-3">
	<div class="fieldcontain ${hasErrors(bean: usersInstance, field: 'pinCode', 'error')} ">
	<label for="address">
		Pincode
		
	</label>
	<g:textField name="pinCode" class="form-control" value="${usersInstance?.userId?.address?.pinCode}"/>

</div>
</div>

</div>

<div class="row">
	<div class="col-md-3">
		<label>House Number</label>
		<g:textField name="hsno" value="${usersInstance?.userId?.address?.hsno}" class="form-control"/>
	</div>
	<div class="col-md-3">
		<label>Street</label>
		<g:textField name="street" value="${usersInstance?.userId?.address?.street}" class="form-control"/>
	</div>
	<div class="col-md-3">
		<label>City</label>
		<g:textField name="city" value="${usersInstance?.userId?.address?.city}" class="form-control"/>	
	</div>
	<div class="col-md-3">
		<label>State</label>
		<g:textField name="state" value="${usersInstance?.userId?.address?.state}" class="form-control"/>
	</div>
</div>



<div class="row">
	<div class="col-md-3">
		<label>SMS Sender ID</label>
		<g:textField name="smsSenderId" value="${usersInstance?.smsSenderId}"  class="form-control"/>
	</div>
	<div class="col-md-3">
		<label>SMS Username</label>
		<g:textField name="smsUsername" value="${usersInstance?.smsUsername}"  class="form-control"/>
	</div>
	<div class="col-md-3">
		<label>SMS Password</label>
		<g:textField name="smsPassword" value="${usersInstance?.smsPassword}"  class="form-control"/>	
	</div>
	<div class="col-md-3">
		<label>Country</label>
		<g:textField name="country" value="India" readonly="true"  class="form-control"/>
	</div>
</div>

<g:if test="${params?.action !="adminEdit"}">
<div class="row">
	
	<div class="col-md-3">
		<label>Upload Image</label>
<input type="file" class="form-control"
						placeholder="Student Contact Number" name="file_1" 
						value="" >
	</div>
</div>
<br>
<g:actionSubmit action="SaveAdmin" class="btn btn-primary"
						value="Save Details"></g:actionSubmit>
</g:if>
<g:else>
<br>
<g:hiddenField name="userListid" value="${usersInstance?.id}" />
<g:actionSubmit action="updateAdmin" class="btn btn-primary"
						value="Update Details"></g:actionSubmit>
						</g:else>
						

</g:form>


<script type="text/javascript">
                                var validateip = $("#validateip").validate({
                                    rules: {                                            
                                    	username: {
                                                    required: true,
                                                    minlength: 2,
                                                    maxlength: 20
                                            },
                                            password: {
                                                required: true,
                                                minlength: 8,
                                                
                                        },
                                           
                                            
                                            phoneNo: {
                                                    required: true,
                                                    maxlength: 10
                                            },
                                            pinCode: {
                                                    required: true
                                                    
                                            },
                                            hsno: {
                                                    required: true
                                                   
                                            },
                                            street: {
                                                    required: true
                                                   
                                            },
                                            city: {
                                                required: true
                                               
                                        },
                                        state: {
                                            required: true
                                           
                                    },
                                  },                                        
                                        
                                });                                
                            </script> 


