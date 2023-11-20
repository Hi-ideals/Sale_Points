
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

		<g:render template="/shared/leftMenu" model="[active:[UserPointHeader:'active open',CreateUserPoint:'active']]"></g:render>

		<div class="page-content">

			<div class="container">
				<div class="page-toolbar">

					<ul class="breadcrumb">
						<li><g:link controller="home" action="dashboard">Dashboard</g:link></li>
						<li><g:link controller="assignPoints" action="index">List of Points</g:link></li>
						<li class="active">Assign Points</li>

					</ul>

				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="block">
							<div class="block-content">
								<h2>
									<strong>Assign</strong> Points
								</h2>
								<g:if test="${flash.message}">
									<div class="message" role="status">
										<p style="color:green; font-size:18px; margin:10px">${flash.message}</p>
									</div>
								</g:if>

								<div class="block">
									<ul class="nav nav-tabs">
										<li class="active"><a href="#barcode" data-toggle="tab">Search
												User By Barcode Scanning </a></li>
										<li style="display: none;"><a href="#manual" data-toggle="tab">Search User
												By Entering Unique ID</a></li>

									</ul>
									<div class="block-content tab-content">
										<div class="tab-pane active" id="barcode">

											<div class="row">
												<div class="col-md-5">

													<label>Search User By Barcode/Unique ID</label> <input
														class="form-control" type="text" name="uniqueNo"
														placeholder="Scan the card to detect the user"
														onchange="${remoteFunction(controller:'assignPoints',action:'SearchUser',update:'updateusr',params:'\'uniqueNo=\' + this.value')};">

												</div>
											</div>
											<div id="updateusr"></div>


										</div>
										<div class="tab-pane" id="manual">
											<g:formRemote name="kk" url="[action:'SearchUser']"
												update="update1">
												<div class="row">
													<div class="col-md-4">
														<label>Enter the Unique ID of user</label> <input
															type="text" value="" placeholder="Unique ID"
															class="form-control" name="uniqueNo" />
													</div>
													<div class="col-md-4">
														<button class="btn btn-primary" style="margin-top: 21px">
															Search</button>
													</div>
												</div>
											</g:formRemote>


											<div id="update1"></div>
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
