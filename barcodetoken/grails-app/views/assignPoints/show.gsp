
<%@ page import="com.hiideals.AssignPoints"%>
<%@ page import="com.hiideals.UsersPoints"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'assignPoints.label', default: 'AssignPoints')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="page-container">

		<div class="page-head">
			<g:render template="/shared/topMenu"></g:render>
		</div>

		<g:render template="/shared/leftMenu"
			model="[active:[UserPointHeader:'active open',UserPointList:'active']]"></g:render>

		<div class="page-content">

			<div class="container">
				<div class="page-toolbar">

					<ul class="breadcrumb">
						<li><g:link controller="home" action="dashboard">Dashboard</g:link></li>
						<li><g:link controller="assignPoints" action="create">Add Points</g:link></li>
						<li class="active">View Points</li>
					</ul>

				</div>
				<g:set
					value="${UsersPoints.findByUserId(assignPointsInstance?.userId)}"
					var="pts"></g:set>

				<div class="row">
					<div class="col-md-12">
						<div class="block">
							<div class="block-content">
								<g:if test="${pts?.overAllPoints !=0}">
									<div class="row">
										<div class="col-md-12">
											<div class="pull-right">
												<p style="margin-right: 25px">Total Points Earned</p>
												<div class="informer informer-pulsate">
													${pts?.overAllPoints}
												</div>
											</div>
										</div>
									</div>
								</g:if>
								<h2>
									<strong>View</strong> Details
								</h2>

								<g:if test="${flash.message}">
									<div class="message" role="status">
										<p style="color: green; font-size: 18px; margin-bottom: 10px">
											${flash.message}
										</p>
									</div>
								</g:if>
								<table class="table table-bordered">
									
									<g:if test="${assignPointsInstance?.userId?.profilePic}">
										<tr>
											<td width="20%">Image</td>
											<td><img
												src="${createLink(controller:'users', action:'viewimg', id:assignPointsInstance?.userId?.id)}"
												alt="${assignPointsInstance?.userId?.name}" class="img-circle" width="80px" height="80px" >
												</td>
											</tr>
									</g:if><g:else>
										<tr>
											<td width="20%">Image</td>
											<td>
									<img src="images/user.jpg" class="img-circle" width="80px" height="80px"/>
									</td>
									</tr>
									</g:else>
									
									
									<g:if test="${assignPointsInstance?.userId}">
										<tr>
											<td class="fieldcontain" width="20%"><span
												id="userId-label" class="property-label">Name</span></td>
											<td><span class="property-value"
												aria-labelledby="userId-label"> ${assignPointsInstance?.userId?.name}
											</span></td>
										</tr>
									</g:if>


									<g:if test="${assignPointsInstance?.userId}">
										<tr>
											<td class="fieldcontain" width="20%"><span
												id="userId-label" class="property-label">Phone Number</span>
											</td>
											<td><span class="property-value"
												aria-labelledby="userId-label"> ${assignPointsInstance?.userId?.username}
											</span></td>
										</tr>
									</g:if>

									<g:if test="${assignPointsInstance?.userId}">
										<tr>
											<td class="fieldcontain" width="20%"><span
												id="userId-label" class="property-label">Unique
													Number</span></td>
											<td><span class="property-value"
												aria-labelledby="userId-label"> ${assignPointsInstance?.userId?.uniqueNo}
											</span></td>
										</tr>
									</g:if>

									<g:if test="${assignPointsInstance?.createdDate}">
										<tr>
											<td class="fieldcontain"><span id="createdDate-label"
												class="property-label"><g:message
														code="assignPoints.createdDate.label"
														default="Created Date" /></span></td>
											<td><span class="property-value"
												aria-labelledby="createdDate-label"><g:formatDate
														date="${assignPointsInstance?.createdDate}"
														format="dd-MMM-yyyy" /></span></td>
										</tr>
									</g:if>

									<g:if test="${assignPointsInstance?.challanNo}">
										<tr>

											<td class="fieldcontain"><span id="challanNo-label"
												class="property-label"><g:message
														code="assignPoints.challanNo.label" default="Challan No" /></span>
											</td>
											<td><span class="property-value"
												aria-labelledby="challanNo-label"><g:fieldValue
														bean="${assignPointsInstance}" field="challanNo" /></span></td>
										</tr>
									</g:if>

									<g:if test="${assignPointsInstance?.product}">
										<tr>
											<td class="fieldcontain"><span id="product-label"
												class="property-label"><g:message
														code="assignPoints.product.label" default="Product" /></span></td>
											<td><span class="property-value"
												aria-labelledby="product-label"> ${assignPointsInstance?.product?.name}
											</span></td>
										</tr>
									</g:if>
									
									<g:if test="${assignPointsInstance?.engineering}">
										<tr>
											<td class="fieldcontain"><span id="product-label"
												class="property-label"><g:message
														code="assignPoints.product.label" default="Engineer Name" /></span></td>
											<td><span class="property-value"
												aria-labelledby="product-label"> ${assignPointsInstance?.engineering}
											</span></td>
										</tr>
									</g:if>
									
									

									<g:if test="${assignPointsInstance?.numberOfBox}">
										<tr>
											<td class="fieldcontain"><span id="numberOfBox-label"
												class="property-label"><g:message
														code="assignPoints.numberOfBox.label"
														default="Number Of Box" /></span></td>
											<td><span class="property-value"
												aria-labelledby="numberOfBox-label"><g:fieldValue
														bean="${assignPointsInstance}" field="numberOfBox" /></span></td>
										</tr>
									</g:if>

									<g:if test="${assignPointsInstance?.pointsPerBox}">
										<tr>
											<td class="fieldcontain"><span id="pointsPerBox-label"
												class="property-label"><g:message
														code="assignPoints.pointsPerBox.label"
														default="Points Per Box" /></span></td>
											<td><span class="property-value"
												aria-labelledby="pointsPerBox-label"><g:fieldValue
														bean="${assignPointsInstance}" field="pointsPerBox" /></span></td>
										</tr>
									</g:if>

									<g:if test="${assignPointsInstance?.totalPoints}">
										<tr>
											<td class="fieldcontain"><span id="totalPoints-label"
												class="property-label"><g:message
														code="assignPoints.totalPoints.label"
														default="Total Points" /></span></td>
											<td><span class="property-value"
												aria-labelledby="totalPoints-label"><g:fieldValue
														bean="${assignPointsInstance}" field="totalPoints" /></span></td>
										</tr>
									</g:if>



									<g:if test="${assignPointsInstance?.totalPoints}">
										<tr>
											<td class="fieldcontain"><span id="totalPoints-label"
												class="property-label"><g:message
														code="assignPoints.totalPoints.label"
														default="Over All Points" /></span></td>
											<td><span class="property-value"
												aria-labelledby="totalPoints-label"> ${pts?.overAllPoints}
											</span></td>
										</tr>
									</g:if>

								</table>
							</div>
						</div>
					</div>
				</div>


				<div class="row">
					<div class="col-md-12">
						<div class="block">
							<div class="block-content">
								<h2>Points</h2>
								<div class="table-responsive">
									<table class="table table-bordered table-hover">
										<tr>
											<th>Sl.No</th>
											<th>Created Date</th>
											<th>Challan No</th>
											<th>Number of Boxes</th>
											<th>Number of Points</th>
											<th>Total Points</th>

										</tr>


										<g:each in="${pointsassigns?.reverse()}" status="i"
											var="assignPointsInstance">
											<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
												<td>
													${i+1}
												</td>

												<td><g:formatDate
														date="${assignPointsInstance.createdDate}"
														format="dd-MMM-yyyy" /></td>

												<td>
													${fieldValue(bean: assignPointsInstance, field: "challanNo")}
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
											</tr>
										</g:each>

									</table>
								</div>
							</div>
						</div>

					</div>
				</div>

			</div>
		</div>
	</div>



	<%--<g:form url="[resource:assignPointsInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${assignPointsInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		--%>
</body>
</html>

