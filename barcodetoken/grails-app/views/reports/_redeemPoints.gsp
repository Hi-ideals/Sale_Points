
<div class="row">
	<div class="col-md-12">
		<div class="block">
			<div class="block-content">

				<table class="table table-bordered table-striped" id="table"
					border="1">
					<thead>
						<tr>
							<th>Name</th>
							<th>Phone Number</th>
							<th>Date</th>
							<th>Redeem Points</th>
						</tr>
					</thead>
					<tbody>
						<g:each in="${redeemPoints?.reverse()}" status="i"
							var="redeemPointsInstance">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

								<td>
									${fieldValue(bean: redeemPointsInstance?.userId, field: "name")}
								</td>
								<td>
									${fieldValue(bean: redeemPointsInstance?.userId, field: "phoneNo")}
								</td>

								<td><g:formatDate
										date="${redeemPointsInstance.dateCreated}"
										format="dd-MMM-yyyy" /></td>
								<td class="sum">
									${fieldValue(bean: redeemPointsInstance, field: "reedemPoints")}
								</td>

							</tr>

						</g:each>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<strong style="margin-left:57%">Total Points Redeemed :   <span id="val"></span></strong>

<script type="text/javascript">
var table = document.getElementById("table"), sumVal = 0;

for(var i = 1; i < table.rows.length; i++)
{
    sumVal = sumVal + parseInt(table.rows[i].cells[3].innerHTML);
}
document.getElementById("val").innerHTML = sumVal;
console.log(sumVal);

</script>

