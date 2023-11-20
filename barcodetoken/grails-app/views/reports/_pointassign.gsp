<%@ page import="com.hiideals.UsersPoints"%>
<div class="row">
	<div class="col-md-12">
		<div class="block">
			<div class="block-content">
				<table class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>Name</th>
							<th><g:message code="assignPoints.userId.label"
									default="User Id" /></th>
							<th>Created Date</th>
							<th>Challan No</th>
							<th>Engineer Name</th>
							<th>Number Of Box</th>
							<th>Points Per Box</th>
							<th>Total Points</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<g:each in="${pointsassigns?.reverse()}" status="i"
							var="assignPointsInstance">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
								<td>
									${fieldValue(bean: assignPointsInstance?.product, field: "name")}
								</td>
								<td>
									${fieldValue(bean: assignPointsInstance?.userId, field: "username")}
								</td>
								<td><g:formatDate
										date="${assignPointsInstance.createdDate}"
										format="dd-MMM-yyyy" /></td>
								<td>
									${fieldValue(bean: assignPointsInstance, field: "challanNo")}
								</td>
								
								<td>
									${fieldValue(bean: assignPointsInstance, field: "engineering")}
								</td>
								
								
								<td>
									${fieldValue(bean: assignPointsInstance, field: "numberOfBox")}
								</td>
								<td>
									${fieldValue(bean: assignPointsInstance, field: "pointsPerBox")}
								</td>
								<td>
									${fieldValue(bean: assignPointsInstance, field: "totalPoints")}
								</td>
								<td><g:link controller="assignPoints" action="show"
										id="${assignPointsInstance.id}">

										<i class="fa fa-eye"></i>	View</g:link></td>
							</tr>
							<g:set
								value="${UsersPoints.findByUserId(assignPointsInstance?.userId)}"
								var="pts"></g:set>
						</g:each>
						<tr>
							<td colspan="6"></td>
							<td><g:if test="${pts?.overAllPoints!=0}">
									<strong>Total Points :${pts?.overAllPoints}</strong>
								</g:if> <g:else>
									<strong>Redeemed The Points To : ${pts?.overAllPoints}</strong>
								</g:else></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

