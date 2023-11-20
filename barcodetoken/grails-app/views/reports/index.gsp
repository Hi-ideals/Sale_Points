
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">

</head>
<body>
	<div class="page-container">

		<div class="page-head">
			<g:render template="/shared/topMenu"></g:render>
		</div>

		<g:render template="/shared/leftMenu"
			model="[active:[ReportHeader:'active open' , Report:'active']]"></g:render>

		<div class="page-content">

			<div class="container">
				<div class="page-toolbar">

					<ul class="breadcrumb">
						<li><g:link controller="home" action="dashboard">Dashboard</g:link></li>
						<li><g:link controller="users" action="index">List of Customers</g:link></li>
						<li class="active">Get Report</li>
					</ul>

				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="block">
							<div class="block-content">
								<h2>
									<strong>Customer</strong> Details
								</h2>

								<div class="block">
									<ul class="nav nav-tabs">
										<li class="active"><a href="#tab1" data-toggle="tab">Search
												User By Date</a></li>
										<li><a href="#tab2" data-toggle="tab">Search User By
												ID or Mobile Number</a></li>

										<li><a href="#tab3" data-toggle="tab">Search Assigned
												Points </a></li>

										<li><a href="#tab4" data-toggle="tab">Redeemed Points
										</a></li>


									</ul>
									<div class="block-content tab-content">
										<div class="tab-pane active" id="tab1">
											<g:formRemote name="ss1" update="update2"
												url="[action:'userlist']">
												<div class="row">

													<div class="col-md-3">
														<label for="exampleInputPassword1">From Date</label> <input
															type="text" class="form-control date-picker"
															placeholder="Choose the Date" name="From"
															required="required" value="">
													</div>
													<div class="col-md-3">
														<label for="exampleInputPassword1">To Date</label> <input
															type="text" class="form-control date-picker"
															placeholder="Choose the Date" name="To"
															required="required" value="">
													</div>
													<div class="col-md-3">
														<g:submitButton name="Search" class="btn btn-success"
															style="margin-top: 21px" />
													</div>
												</div>
											</g:formRemote>
											<div id="update2"></div>
										</div>
										<div class="tab-pane" id="tab2">
											<g:formRemote name="sss1" update="update1"
												url="[action:'userlist']">
												<div class="row">
													<div class="col-md-12" style="margin: 10px 0">
														<p>
															<strong><i class="fa fa-info-circle"></i> Note:</strong>
															Please select any one input
														</p>
													</div>
												</div>
												<div class="row">
													<div class="col-md-3">
														<label>Enter Unique ID</label> <input type="text"
															placeholder="Enter the user's unique ID "
															class="form-control" name="uniqueNo" value="">
													</div>
													<div class="col-md-3">
														<label>Enter Mobile Number</label> <input type="text"
															placeholder="Enter user's registered number"
															name="phoneNo" class="form-control" value="">
													</div>
													<div class="col-md-3">
														<g:submitButton name="Search1" value="Search"
															class="btn btn-success" style="margin-top: 21px" />
													</div>
												</div>
											</g:formRemote>
											<div id="update1"></div>
										</div>
										<div class="tab-pane" id="tab3">
											<g:formRemote name="ss1" update="update3"
												url="[action:'pointassign']">
												<div class="row">
													<div class="col-md-12" style="margin: 10px 0">
														<p>
															<strong><i class="fa fa-info-circle"></i> Note:</strong>
															Please select any one input
														</p>
													</div>
												</div>
												<div class="row">
													<div class="col-md-3">
														<label>Enter challanNo</label> <input type="text"
															placeholder="Enter the Challan Number "
															class="form-control" name="Challan" value="">
													</div>
													<div class="col-md-3" style="display: none">
														<label>Enter Product Name</label> <select
															name="productname" class="form-control">
															<option value="">Select</option>
															<g:each in="${productList}">
																<option value="${it?.name}">
																	${it?.name}
																</option>
															</g:each>
														</select>
													</div>
													<div class="col-md-3">
														<label>Enter Phone Number</label> <input type="text"
															placeholder="Enter the Phone Number "
															class="form-control" name="pnno" value="">
													</div>
													<div class="col-md-3">
														<g:submitButton name="Search1" value="Search"
															class="btn btn-success" style="margin-top: 21px" />

													</div>
												</div>
											</g:formRemote>
											<div id="update3"></div>

											<br> <br>

											<div class="col-md-3">
												<label>Search User By Barcode</label> <input
													class="form-control" type="text" name="uniqueNo"
													placeholder="Scan the card to detect the user"
													onchange="${remoteFunction(controller:'reports',action:'pointassign',update:'updateusr',params:'\'uniqueNo=\' + this.value')};">
											</div>


											<div id="updateusr"></div>

										</div>

										<div class="tab-pane" id="tab4">

											<div class="row">
												<div class="col-md-12" style="margin: 10px 0">
													<p>
														<strong><i class="fa fa-info-circle"></i> Note:</strong>
														Please select any one input
													</p>
												</div>
											</div>
											<div class="row">
												<div class="col-md-3">
													<label>Enter Unique ID</label> <input type="text"
														placeholder="Enter the user's unique ID "
														class="form-control" name="uniqueNo" value=""
														onchange="${remoteFunction(controller:'reports',
																action:'redeemPoints',update:'updateredeemusr',params:'\'uniqueNo=\' + this.value')};">
												</div>
												<div class="col-md-3">
													<label>Enter Mobile Number</label> <input type="text"
														placeholder="Enter user's registered number"
														name="phoneNo" class="form-control" value=""
														onchange="${remoteFunction(controller:'reports',
																action:'redeemPoints',update:'updateredeemusr',params:'\'phoneNo=\' + this.value')};">
												</div>


											</div>

											<div id="updateredeemusr"></div>
										</div>


									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<script type="text/javascript">
		$(function() {
			$(".date-picker").datepicker({
				changeMonth : true,
				changeYear : true,
				dateFormat : 'yy-mm-dd',
				yearRange : "1800:3000",
			});
		});
	</script>

</body>
</html>
