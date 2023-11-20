<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<title>Welcome to Token Generate</title>

</head>
<body>
	<div class="page-container">

		<div class="page-head">

			<g:render template="shared/topMenu"></g:render>



		</div>

		<g:render template="shared/leftMenu"></g:render>

		<div class="page-content">

			<div class="container">

				<div class="page-toolbar">

					<div class="page-toolbar-block">
						<div class="page-toolbar-title">Dashboard</div>
						<div class="page-toolbar-subtitle">Exclusive responsive
							dashboard</div>
					</div>

					<div class="page-toolbar-block pull-right">
						<div class="widget-info widget-from">
							<div id="reportrange" class="dtrange">
								<span></span><b class="caret"></b>
							</div>
						</div>
					</div>

				</div>

				<div class="block-wide">
					<div class="block-wide-title">Latest Visits</div>
					<div id="dashboard-chart"
						style="height: 250px; width: 100%; float: left;"></div>
					<div class="chart-legend">
						<div id="dashboard-legend"></div>
					</div>
				</div>

				<div class="row">

					<div class="col-md-4">
						<div class="widget-pie">
							<div class="knob">
								<input type="text" data-fgColor="#334454" data-bgColor="#FFFFFF"
									data-min="0" data-max="100" data-width="90" data-height="90"
									value="95" />
							</div>
							<div class="widget-pie-info">
								<div class="widget-pie-info-num">5,352</div>
								<div class="widget-pie-info-text">Total Visits</div>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="widget-pie">
							<div class="knob">
								<input type="text" data-fgColor="#8CC152" data-bgColor="#FFFFFF"
									data-min="0" data-max="100" data-width="90" data-height="90"
									value="75" />
							</div>
							<div class="widget-pie-info">
								<div class="widget-pie-info-num">1,582</div>
								<div class="widget-pie-info-text">New Visitors</div>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="widget-pie">
							<div class="knob">
								<input type="text" data-fgColor="#F6BB42" data-bgColor="#FFFFFF"
									data-min="0" data-max="100" data-width="90" data-height="90"
									value="25" />
							</div>
							<div class="widget-pie-info">
								<div class="widget-pie-info-num">3,770</div>
								<div class="widget-pie-info-text">Returned Visitors</div>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-4">

						<div class="widget-window">
							<div class="window" style="padding: 0px;">
								<div id="europe-map" style="height: 250px;"></div>
							</div>
							<div class="window window-dark">
								<div class="window-block">
									<h4>Orders</h4>
									<p>1,954</p>
									<h4>Total Amount</h4>
									<p>1,543,987.65</p>
									<h4>In Queue</h4>
									<p>15</p>
								</div>
								<div class="window-block pull-right">
									<div class="knob">
										<input type="text" data-fgColor="#8CC152" data-min="0"
											data-max="100" data-width="100" data-height="100" value="15" />
									</div>
								</div>
							</div>
						</div>

					</div>
					<div class="col-md-8">

						<div class="block">
							<div class="block-head">
								<h2>Projects</h2>
								<ul class="buttons">
									<li><a href="#" class="block-refresh"><span
											class="fa fa-refresh"></span></a></li>
									<li><a href="#" class="block-toggle"><span
											class="fa fa-chevron-down"></span></a></li>
									<li><a href="#" class="block-remove"><span
											class="fa fa-times"></span></a></li>
								</ul>
							</div>
							<div class="block-content list nbfc">
								<div class="list-item">
									<div class="list-item-content">
										<div class="list-item-container list-item-container-small">
											<p>
												<span class="label label-info">Working</span>
											</p>
											<p class="list-item-date">
												<i class="fa fa-clock-o"></i> 17:43
											</p>
										</div>
										<div class="list-item-container">
											<h4>Development UI Kit</h4>
											<div class="progress progress-small">
												<div class="progress-bar progress-bar-info"
													role="progressbar" aria-valuenow="40" aria-valuemin="0"
													aria-valuemax="100" style="width: 40%"></div>
											</div>
										</div>
										<div class="list-item-container">
											<h4>John Doe</h4>
											<p class="text-muted">Web Designer</p>
										</div>
										<div class="list-item-container">
											<h4>State:</h4>
											<p class="text-muted">In progress...</p>
										</div>
										<div class="list-item-right">
											<button class="btn btn-primary list-item-trigger">
												<i class="fa fa-pencil"></i>
											</button>
										</div>
									</div>
									<div class="list-item-controls">
										<button class="btn btn-default">
											<i class="fa fa-pencil-square-o"></i> View
										</button>
										<button class="btn btn-warning">
											<i class="fa fa-pause"></i> Pause
										</button>
										<button class="btn btn-danger">
											<i class="fa fa-trash-o"></i> Delete
										</button>
									</div>
								</div>
								<div class="list-item">
									<div class="list-item-content">
										<div class="list-item-container list-item-container-small">
											<p>
												<span class="label label-info">Working</span>
											</p>
											<p class="list-item-date">
												<i class="fa fa-clock-o"></i> 15:55
											</p>
										</div>
										<div class="list-item-container">
											<h4>Working with customers</h4>
											<div class="progress progress-small">
												<div class="progress-bar progress-bar-info"
													role="progressbar" aria-valuenow="40" aria-valuemin="0"
													aria-valuemax="100" style="width: 60%"></div>
											</div>
										</div>
										<div class="list-item-container">
											<h4>Brad Pitt</h4>
											<p class="text-muted">Manager</p>
										</div>
										<div class="list-item-container">
											<h4>State:</h4>
											<p class="text-muted">In progress...</p>
										</div>
										<div class="list-item-right">
											<button class="btn btn-primary list-item-trigger">
												<i class="fa fa-pencil"></i>
											</button>
										</div>
									</div>
									<div class="list-item-controls">
										<button class="btn btn-default">
											<i class="fa fa-pencil-square-o"></i> View
										</button>
										<button class="btn btn-warning">
											<i class="fa fa-pause"></i> Pause
										</button>
										<button class="btn btn-danger">
											<i class="fa fa-trash-o"></i> Delete
										</button>
									</div>
								</div>
								<div class="list-item">
									<div class="list-item-content">
										<div class="list-item-container list-item-container-small">
											<p>
												<span class="label label-danger">Removed</span>
											</p>
											<p class="list-item-date">
												<i class="fa fa-clock-o"></i> 14:12
											</p>
										</div>
										<div class="list-item-container">
											<h4>MySQL - Update Server</h4>
											<div class="progress progress-small">
												<div class="progress-bar progress-bar-danger"
													role="progressbar" aria-valuenow="40" aria-valuemin="0"
													aria-valuemax="100" style="width: 5%"></div>
											</div>
										</div>
										<div class="list-item-container">
											<h4>Martin Freeman</h4>
											<p class="text-muted">System Administrator</p>
										</div>
										<div class="list-item-container">
											<h4>Reason:</h4>
											<p class="text-muted">Money...</p>
										</div>
										<div class="list-item-right">
											<button class="btn  btn-primary list-item-trigger">
												<i class="fa fa-pencil"></i>
											</button>
										</div>
									</div>
									<div class="list-item-controls">
										<button class="btn btn-danger">
											<i class="fa fa-refresh"></i> Restore
										</button>
									</div>
								</div>
								<div class="list-item">
									<div class="list-item-content">
										<div class="list-item-container list-item-container-small">
											<p>
												<span class="label label-warning">Paused</span>
											</p>
											<p class="list-item-date">
												<i class="fa fa-clock-o"></i> 12:32
											</p>
										</div>
										<div class="list-item-container">
											<h4>dashboard.html</h4>
											<div class="progress progress-small">
												<div class="progress-bar progress-bar-warning"
													role="progressbar" aria-valuenow="40" aria-valuemin="0"
													aria-valuemax="100" style="width: 75%"></div>
											</div>
										</div>
										<div class="list-item-container">
											<h4>John Doe</h4>
											<p class="text-muted">Web Designer</p>
										</div>
										<div class="list-item-container">
											<h4>Comment:</h4>
											<p class="text-muted">Waiting for dev...</p>
										</div>
										<div class="list-item-right">
											<button class="btn btn-primary list-item-trigger">
												<i class="fa fa-pencil"></i>
											</button>
										</div>
									</div>
									<div class="list-item-controls">
										<button class="btn btn-default">
											<i class="fa fa-pencil-square-o"></i> View
										</button>
										<button class="btn btn-warning">
											<i class="fa fa-play"></i> Start
										</button>
										<button class="btn btn-danger">
											<i class="fa fa-trash-o"></i> Delete
										</button>
									</div>
								</div>
								<div class="list-item">
									<div class="list-item-content">
										<div class="list-item-container list-item-container-small">
											<p>
												<span class="label label-success">Done</span>
											</p>
											<p class="list-item-date">
												<i class="fa fa-clock-o"></i> 09:17
											</p>
										</div>
										<div class="list-item-container">
											<h4>Framework-ui.psd</h4>
											<div class="progress progress-small">
												<div class="progress-bar progress-bar-success"
													role="progressbar" aria-valuenow="40" aria-valuemin="0"
													aria-valuemax="100" style="width: 99%"></div>
											</div>
										</div>
										<div class="list-item-container">
											<h4>Lucy Liu</h4>
											<p class="text-muted">Designer</p>
										</div>
										<div class="list-item-container">
											<h4>Complete:</h4>
											<p class="text-muted">
												<a href="#"><i class="fa fa-floppy-o"></i> download</a>
											</p>
										</div>
										<div class="list-item-right">
											<button class="btn btn-primary list-item-trigger">
												<i class="fa fa-pencil"></i>
											</button>
										</div>
									</div>
									<div class="list-item-controls">
										<button class="btn btn-danger">
											<i class="fa fa-trash-o"></i> Delete
										</button>
									</div>
								</div>
								<div class="list-item">
									<div class="list-item-content">
										<div class="list-item-container list-item-container-small">
											<p>
												<span class="label label-success">Done</span>
											</p>
											<p class="list-item-date">
												<i class="fa fa-clock-o"></i> 08:35
											</p>
										</div>
										<div class="list-item-container">
											<h4>Template Update</h4>
											<div class="progress progress-small">
												<div class="progress-bar progress-bar-success"
													role="progressbar" aria-valuenow="40" aria-valuemin="0"
													aria-valuemax="100" style="width: 99%"></div>
											</div>
										</div>
										<div class="list-item-container">
											<h4>John Doe</h4>
											<p class="text-muted">Web Designer</p>
										</div>
										<div class="list-item-container">
											<h4>Complete:</h4>
											<p class="text-muted">
												<a href="#"><i class="fa fa-link"></i> Project link</a>
											</p>
										</div>
										<div class="list-item-right">
											<button class="btn btn-primary list-item-trigger">
												<i class="fa fa-pencil"></i>
											</button>
										</div>
									</div>
									<div class="list-item-controls">
										<button class="btn btn-danger">
											<i class="fa fa-trash-o"></i> Delete
										</button>
									</div>
								</div>
								<div class="list-item">
									<div class="list-item-content">
										<div class="list-item-container list-item-container-small">
											<p>
												<span class="label label-danger">Removed</span>
											</p>
											<p class="list-item-date">
												<i class="fa fa-clock-o"></i> 8:21
											</p>
										</div>
										<div class="list-item-container">
											<h4>statistic.html</h4>
											<div class="progress progress-small">
												<div class="progress-bar progress-bar-danger"
													role="progressbar" aria-valuenow="40" aria-valuemin="0"
													aria-valuemax="100" style="width: 5%"></div>
											</div>
										</div>
										<div class="list-item-container">
											<h4>John Doe</h4>
											<p class="text-muted">Web Designer</p>
										</div>
										<div class="list-item-container">
											<h4>Reason:</h4>
											<p class="text-muted">No time</p>
										</div>
										<div class="list-item-right">
											<button class="btn  btn-primary list-item-trigger">
												<i class="fa fa-pencil"></i>
											</button>
										</div>
									</div>
									<div class="list-item-controls">
										<button class="btn btn-danger">
											<i class="fa fa-refresh"></i> Restore
										</button>
									</div>
								</div>
							</div>
						</div>

					</div>

				</div>

				<div class="row">

					<div class="col-md-12">
						<div class="block">
							<div class="block-head" style="border-bottom: 0px;">
								<h2>5 latest transactions</h2>
								<div class="block-head-form">
									<button class="btn btn-primary">
										<i class="fa fa-eye"></i> View All
									</button>
								</div>
							</div>
							<div class="block-content np">
								<table class="table table-bordered table-striped">
									<tr>
										<th>Payee name</th>
										<th>Amount</th>
										<th>Description</th>
										<th>Date/Time</th>
										<th>Fee</th>
										<th>Manager</th>
									</tr>
									<tr>
										<td>Angelina Jolie</td>
										<td>$157.10</td>
										<td>Dont forget about fee</td>
										<td>20.01.2014 19:24</td>
										<td>$30.42</td>
										<td>John Doe</td>
									</tr>
									<tr>
										<td>Brad Pitt</td>
										<td>$39.45</td>
										<td>Delivery...</td>
										<td>20.01.2014 18:55</td>
										<td>$3.94</td>
										<td>John Doe</td>
									</tr>
									<tr>
										<td>Martin Freeman</td>
										<td>$78.00</td>
										<td>Will pay by cash</td>
										<td>20.01.2014 16:41</td>
										<td>$0.00</td>
										<td>John Doe</td>
									</tr>
									<tr>
										<td>Lucy Liu</td>
										<td>$427.31</td>
										<td>Call me...</td>
										<td>20.01.2014 15:11</td>
										<td>$15.71</td>
										<td>John Doe</td>
									</tr>
									<tr>
										<td>Jonny Lee Miller</td>
										<td>$65.15</td>
										<td>Empty</td>
										<td>20.01.2014 12:01</td>
										<td>$5.65</td>
										<td>John Doe</td>
									</tr>
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
