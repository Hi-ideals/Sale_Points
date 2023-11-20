<!DOCTYPE html>
<%@page import="com.hiideals.AssignPoints"%>
<html>
<head>
<meta name="layout" content="main" />
<title>Welcome to Token Generate</title>

</head>
<body>
	<div class="page-container">

		<div class="page-head">
			<g:render template="/shared/topMenu"></g:render>
		</div>

		<g:render template="/shared/leftMenu"
			model="[active:[dashboard:'active']]"></g:render>

		<div class="page-content">

			<div class="container">

				<div class="page-toolbar">

					<div class="page-toolbar-block">
						<div class="page-toolbar-title">Dashboard</div>
						<div class="page-toolbar-subtitle">Exclusive for your
							business</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="block">
							<div class="block-content">
								<img src="images/1.jpg" width="100%" />
							</div>
						</div>
					</div>
				</div>


				<div class="row">

					<div class="col-md-4">
						<div class="widget widget-success">
							<div class="widget-container">
								<div class="widget-chart">
									<span style="font-size: 25px"><i class="fa fa-group"></i></span>
								</div>
							</div>
							<div class="widget-content">
								<div class="widget-text">
									<strong>Total Users</strong>
									${usercount?.size()}
								</div>

							</div>
						</div>

					</div>

					<div class="col-md-4">
						<div class="widget widget-warning">
							<div class="widget-container">

								<div class="widget-chart">
									<span style="font-size: 25px"><i class="fa fa-rocket"></i></span>
								</div>
							</div>
							<div class="widget-content">
								<div class="widget-text">
									<strong>Point Assigned </strong>
									${assignPoints?.size()}
								</div>

							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="widget widget-info">
							<div class="widget-container">

								<div class="widget-chart">
									<span style="font-size: 25px"><i class="fa fa-tags"></i></span>
								</div>
							</div>
							<div class="widget-content">
								<div class="widget-text">
									<strong>Total Products</strong>
									${Productlist?.size()}
								</div>

							</div>
						</div>
					</div>
				</div>

				<div class="row">

					<div class="col-md-12">

						<div class="block">

							<div class="block-head">
								<h2>All Users</h2>

							</div>
							<div class="block-content list nbfc">

								<table class="table table-bordered table-hover">
									<thead>
										<tr>
											<th>Name</th>
											<th>Unique No</th>
											<th>Mobile</th>
											
											<th>Actions</th>

										</tr>
									</thead>
									<tbody>
										<g:each in="${usersInstanceList}" status="i"
											var="usersInstance">
											<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
												<g:if
													test="${usersInstance?.name == null && usersInstance?.userBarcode == null}">
												</g:if>
												<g:else>

													<td>
														${fieldValue(bean: usersInstance, field: "name")}
													</td>

													<td>
														${fieldValue(bean: usersInstance, field: "uniqueNo")}
													</td>

													<td>
														${fieldValue(bean: usersInstance, field: "phoneNo")}
													</td>
													
													
													<g:set value="${AssignPoints.findByUserId(usersInstance)}" var="ss"> </g:set> 
													
													<td><g:link controller="assignPoints" action="show"
															id="${ss?.id}">
															<i class="fa fa-eye">View</i>
														</g:link></td>

												</g:else>
											</tr>
										</g:each>
									</tbody>
								</table>
							</div>
						</div>
					</div>

				</div>

			</div>



		</div>

	</div>


</body>
</html>
