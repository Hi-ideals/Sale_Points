
<g:form controller="assignPoints" method="Post">
	<h4>
		<strong>User</strong> Details
	</h4>
	<div class="row" style="margin-top: 10px">
		<div class="col-md-3">
			<label>Name</label> <input type="text" value="${user?.userId?.name}"
				class="form-control" readonly="readonly">
		</div>
		<div class="col-md-3">
			<label>Phone Number</label> <input type="text"
				value="${user?.userId?.username}" class="form-control"
				readonly="readonly">
		</div>
		<div class="col-md-3">
			<label>Over All Points</label> <input type="text"
				value="${user?.overAllPoints}" class="form-control"
				readonly="readonly">
		</div>
		<g:hiddenField name="userid" value="${user?.userId?.id}" />

		<div class="col-md-3">
			<g:actionSubmit value="Redeem Points" action="clearUserPoints"
				class="btn btn-danger" style="margin-top:21px"
				onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
		</div>
	</div>
</g:form>


