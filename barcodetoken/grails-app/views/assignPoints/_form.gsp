<%@ page import="com.hiideals.AssignPoints"%>
<hr>
<g:form controller="assignPoints" >
	<h4>
		<strong>User</strong> Details
	</h4>

	<div class="row">
		<div class="col-md-3">
			<label>Name</label> <input type="text" class="form-control" readonly="readonly"
				value="${user?.name}">
		</div>
		<div class="col-md-3">
			<label>Phone Number</label> <input type="text" readonly="readonly" class="form-control"
				value="${user?.username}">
		</div>
		<g:hiddenField name="userid"  value="${user?.id}" />
		<div class="col-md-3">

			<div
				class="fieldcontain ${hasErrors(bean: assignPointsInstance, field: 'createdDate', 'error')} ">
				<label for="createdDate"> Created Date </label>
				 <input
					name="createdDate1" type="text"
					value="${assignPointsInstance?.createdDate}"
					class="form-control date-picker" required="true"/>
				<%--<g:datePicker name="createdDate" precision="day"
		value="${assignPointsInstance?.createdDate}" default="none"
		noSelection="['': '']" />

--%>
			</div>
		</div>
		<div class="col-md-3">

			<div
				class="fieldcontain ${hasErrors(bean: assignPointsInstance, field: 'challanNo', 'error')} ">
				<label for="challanNo"> Challan Number </label> <input
					name="challanNo" class="form-control" 
					 />

			</div>
		</div>
	</div>
	
	

	
	
	
	
	<div class="row" style="margin-top: 10px">
	
	
		<div class="col-md-3">

			<div
				class="fieldcontain ${hasErrors(bean: assignPointsInstance, field: 'engineering', 'error')} ">
				<label for="engineering"> Engineer Name </label> <input
					name="engineering" class="form-control" 
					 />

			</div>
		</div>
	
	
	
		<div class="col-md-3">
			<div
				class="fieldcontain ${hasErrors(bean: assignPointsInstance, field: 'product', 'error')} ">
				<label for="product"> <g:message
						code="assignPoints.product.label" default="Product" />

				</label> <select name="product" class="form-control" required="required">
					<option value="">Select</option>
					<g:each in="${productList}">
						<option value="${it?.id}">
							${it?.name}
						</option>
					</g:each>

				</select>

				<%--<g:select id="product" name="product.id" from="${com?.hiideals?.Products?.list()}" optionKey="id" value="${assignPointsInstance?.product?.id}" class="many-to-one" noSelection="['null': '']"/>

--%>
			</div>
		</div>
		<div class="col-md-3">
			<div
				class="fieldcontain ${hasErrors(bean: assignPointsInstance, field: 'numberOfBox', 'error')} required">
				<label for="numberOfBox"> <g:message
						code="assignPoints.numberOfBox.label" default="Number Of Box" />
					<span class="required-indicator">*</span>
				</label> <input name="numberOfBox" type="number" class="form-control" required="true"
					value="${assignPointsInstance?.numberOfBox}" 
					id="numberOfBox" />

			</div>
		</div>
		<div class="col-md-3">
			<div
				class="fieldcontain ${hasErrors(bean: assignPointsInstance, field: 'pointsPerBox', 'error')} required">
				<label for="pointsPerBox"> <g:message
						code="assignPoints.pointsPerBox.label" default="Points Per Box" />
					<span class="required-indicator">*</span>
				</label> <input name="pointsPerBox" type="number" class="form-control" required="true"
					value="${assignPointsInstance?.pointsPerBox}" 
					id="pointsPerBox" />

			</div>
		</div>
		
		
		<div class="col-md-3">
		<div>
		
		</div>
					</div>
		
		
		<div class="col-md-3">
	
			<div
				class="fieldcontain ${hasErrors(bean: assignPointsInstance, field: 'totalPoints', 'error')} required">
				<label for="totalPoints"> <g:message
						code="assignPoints.totalPoints.label" default="Total Points" /> <span
					class="required-indicator">*</span>
				</label> <input name="totalPoints" type="number" readonly="true" class="form-control"
					value="${assignPointsInstance?.totalPoints}" 
					id="totalPoints" />
			</div>
		</div>
		</div>

	<div class="row" style="margin-top: 10px">
		<div class="col-md-3">
			<g:actionSubmit value="Submit" action="save" class="btn btn-primary " />
		</div>
	</div>
</g:form>
<script type="text/javascript">
	$(function() {
		$(".date-picker").datepicker({
			changeMonth : true,
			changeYear : true,
			dateFormat : 'dd-mm-yy',
			yearRange : "1800:3000",
		});
	});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		//this calculates values automatically 
		sum();
		$("#numberOfBox, #pointsPerBox").on("keydown keyup", function() {
			sum();
		});
	});

	function sum() {
		var num1 = document.getElementById('numberOfBox').value;
		var num2 = document.getElementById('pointsPerBox').value;
		var result = parseInt(num1) * parseInt(num2);
		if (!isNaN(result)) {
			document.getElementById('totalPoints').value = result;
		}
	}
</script>


