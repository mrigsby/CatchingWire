<cfoutput>

	<div class="card mb-4">

		<div class="card-body p-0">

			<table class="table">
				<thead>
					<tr>
						<th style="width: 10px">Active</th>
						<th>
							Name &nbsp;&nbsp;
							<a href="#event.buildLink( "customers", "page=#prc.qUsers.pagination.page#&sort=desc" )#">
								<i class="bi bi-arrow-down-circle-fill <cfif rc.sort EQ "desc">text-success<cfelse>text-black</cfif>"></i></a>

							<a href="#event.buildLink( "customers", "page=#prc.qUsers.pagination.page#&sort=asc" )#">
								<i class="bi bi-arrow-up-circle-fill <cfif rc.sort EQ "asc">text-success<cfelse>text-black</cfif>"></i></a>
						</th>
						<th>Email</th>
						<th>Title</th>
						<th>Joined</th>
						<th>Last Login</th>
						<th>&nbsp;</th>
					</tr>
				</thead>
				<tbody>
					<cfloop index="customerIndex" item="customer" array="#prc.qUsers.results#">
						<tr class="align-middle">
							<td>
								<cfif customer.active>
									<i class="bi bi-check2-square text-success" style="font-size: 1.2rem;"></i>
								<cfelse>
									<i class="bi bi-exclamation-square text-danger" style="font-size: 1.2rem;"></i>
								</cfif>
							</td>
							<td>#customer.lname#, #customer.fname#</td>
							<td>#customer.email#</td>
							<td>#customer.title#</td>
							<td>#dateFormat( customer.dt_created, "mm/dd/yyyy" )#</td>
							<td>#dateTimeFormat( customer.dt_lastlogin, "short" )#</td>
							<td>
								<a href="#event.buildLink( "customers." & customer.id )#" class="btn btn-success btn-sm" style="--bs-btn-font-size: 0.65rem;">
									<i class="bi bi-pencil-square"></i> Edit
								</a>
							</td>
						</tr>
					</cfloop>
				</tbody>
			</table>

		</div>
		<!--- /.card-body --->

		<div class="card-footer clearfix">

			<div class="pagination pagination-sm m-0 float-start">
				<cfif prc.qUsers.pagination.totalRecords GT 0>
					viewing #prc.qUsers.pagination.offset + 1# to #prc.qUsers.pagination.offset + prc.qUsers.results.len()# of #prc.qUsers.pagination.totalRecords# customers
				</cfif>
			</div>


			<ul class="pagination pagination-sm m-0 float-end">
				<li class="page-item <cfif prc.qUsers.pagination.page EQ 1>disabled</cfif>" data-bs-toggle="tooltip" data-bs-title="First Page">
					<a class="page-link" href="#event.buildLink( "customers", "page=1&sort=#rc.sort#" )#"><i class="bi bi-chevron-double-left"></i></a>
				</li>
				<cfloop index="i" from="1" to="#prc.qUsers.pagination.totalPages#" >
					<li class="page-item <cfif prc.qUsers.pagination.page EQ i >disabled</cfif>">
						<a class="page-link" href="#event.buildLink( "customers", "page=#i#&sort=#rc.sort#" )#">#i#</a>
					</li>
				</cfloop>
				<li class="page-item <cfif prc.qUsers.pagination.page EQ prc.qUsers.pagination.totalPages >disabled</cfif>" data-bs-toggle="tooltip" data-bs-title="Last Page">
					<a class="page-link" href="#event.buildLink( "customers", "page=#prc.qUsers.pagination.totalPages#&sort=#rc.sort#" )#"><i class="bi bi-chevron-double-right"></i></a>
				</li>
			</ul>
		</div>
		<!--- /.card-footer --->

	</div>

</cfoutput>