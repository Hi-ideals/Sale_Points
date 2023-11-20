


<div class="row">
	<div class="col-md-12">


		<div class="block">
			<div class="block-content">

				<table class="table  table-bordered table-hover">
					<thead>
						<tr>


							<th>Name</th>
							<th>Unique number</th>
							<th>Mobile Number</th>
							<th>Actions</th>

						</tr>
					</thead>
					<tbody>
						<g:each in="${userlistinstance}" var="s" status="i">
							<tr>

								<g:if test="${s?.name == null && s?.userBarcode == null}"></g:if>
								<g:else>


									<td scope="row">
											${s?.name}
										</td>

									<td scope="row">
										${s?.uniqueNo}
									</td>

									<td scope="row">
										${s?.phoneNo}
									</td>
									<td><g:link controller="users" action="show"
											id="${s.id}"> <i class="fa fa-eye"></i> View </g:link></td>
								</g:else>

							</tr>
						</g:each>







					</tbody>

				</table>


			</div>


		</div>
	</div>
</div>

