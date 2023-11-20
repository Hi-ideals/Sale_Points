
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

		<g:render template="/shared/leftMenu" model="[active:[UserPointHeader:'active open',RedeemUserPoint:'active']]"></g:render>

		<div class="page-content">

			<div class="container">
				<div class="page-toolbar">

					<ul class="breadcrumb">
						<li><g:link controller="home" action="dashboard">Dashboard</g:link></li>
						<li><g:link controller="assignPoints" action="index">List of Points</g:link></li>
						<li class="active">Redeem Points</li>
					</ul>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="block">
							<div class="block-content">
								<h2>
									<strong>Redeem</strong> Points
								</h2>
								<g:if test="${flash.reddemMessage}">
									<div class="message" role="status">
										<p style="color:green; font-size:18px; margin:10px">${flash.reddemMessage}</p>
									</div>
								</g:if>
								
								
								<div class="block">
									<ul class="nav nav-tabs">
										<li class="active"><a href="#redeemBarcode"
											data-toggle="tab">Search User By Barcode Scanning</a></li>
										<li style="display: none;"><a href="#redeemManual" data-toggle="tab">Search
												User By Entering Unique ID</a></li>

									</ul>
									<div class="block-content tab-content">
										<div class="tab-pane active" id="redeemBarcode">
											<div class="row">
												<div class="col-md-5">
													<label>Search User By Barcode</label> <input
														class="form-control" type="text" name="uniqueNo"
														placeholder="Scan the card to detect the user"
														onchange="${remoteFunction(controller:'assignPoints',action:'redeemPoints',update:'updateusr1',params:'\'uniqueNo=\' + this.value')};">
												</div>
											</div>
											<div id="updateusr1"></div>


										</div>
										<div class="tab-pane" id="redeemManual">
											<g:formRemote name="kk" url="[action:'redeemPoints']"
												update="update2">
												<div class="row">
													<div class="col-md-4">
														<label>Enter the Unique ID of User</label>
														 <input
															type="text" value="" name="uniqueNo"
															placeholder="Unique ID" class="form-control" />
													</div>
													<div class="col-md-4">
														<button class="btn btn-success" style="margin-top: 21px">Search</button>
													</div>
												</div>
											</g:formRemote>
											<div id="update2"></div>
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


</body>
</html>
