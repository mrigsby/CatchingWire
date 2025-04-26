<cfoutput>
	<cfset qryCustomers = getCustomers()>
	<div class="card mb-4 wireOuterWrapper">
		<div class="card-body p-0">
			<table class="table">
				<thead>
					<tr>
						<th style="width: 25px">
							Active
						</th>
						<th>
							Name #view( "wiredemos/customerTable2Sort", { "data" : data, "column" : "lname" } )#
						</th>
						<th>
							Email #view( "wiredemos/customerTable2Sort", { "data" : data, "column" : "email" } )#
						</th>
						<th>
							Title #view( "wiredemos/customerTable2Sort", { "data" : data, "column" : "title" } )#
						</th>
						<th>
							Joined #view( "wiredemos/customerTable2Sort", { "data" : data, "column" : "dt_created" } )#
						</th>
						<th>
							Last Login #view( "wiredemos/customerTable2Sort", { "data" : data, "column" : "dt_lastlogin" } )#
						</th>
						<th>&nbsp;</th>
					</tr>
				</thead>
				<tbody>
					<tr class="align-middle">
						<td colspan="2" class="text-left">
							<div class="form-check form-switch">
								<input
									class="form-check-input"
									type ="checkbox"
									role ="switch" id="switchIncInactive"
									value="1"
									wire:model.live="show_inactive" <cfif show_inactive>checked</cfif>
								>
								<label class="form-check-label text-primary" for="switchIncInactive">Include In-Active Accounts</label>
							</div>
						</td>
					</tr>
					<cfloop index="customerIndex" item="customer" array="#qryCustomers.results#">
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
								<a
									href ="#edit_customer_link.replaceNoCase( "{{ID}}", customer.id )#"
									class="btn btn-success btn-sm" style="--bs-btn-font-size: 0.65rem;"
								>
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
				<cfif qryCustomers.pagination.totalRecords GT 0>
					viewing #qryCustomers.pagination.offset + 1# to #qryCustomers.pagination.offset + qryCustomers.results.len()# of #qryCustomers.pagination.totalRecords# customers
				</cfif>
			</div>

			<ul class="pagination pagination-sm m-0 float-end">
				<li
					class="page-item <cfif qryCustomers.pagination.page EQ 1>disabled</cfif>"
					data-bs-toggle="tooltip"
					data-bs-title="First Page"
				>
					<button type="button" class="page-link" wire:click.prevent="setPage( 1 )">
						<i class="bi bi-chevron-double-left"></i>
					</button>
				</li>
				<cfloop index="i" from="1" to="#qryCustomers.pagination.totalPages#">
					<li class="page-item <cfif qryCustomers.pagination.page EQ i>disabled</cfif>">
						<button type="button" class="page-link" wire:click.prevent="setPage( #i# )">#i#</button>
					</li>
				</cfloop>
				<li
					class="page-item <cfif qryCustomers.pagination.page EQ qryCustomers.pagination.totalPages>disabled</cfif>"
					data-bs-toggle="tooltip"
					data-bs-title="Last Page"
				>
					<button
						type ="button"
						class="page-link"
						wire:click.prevent="setPage( #qryCustomers.pagination.totalPages# )"
					>
						<i class="bi bi-chevron-double-right"></i>
					</button>
				</li>
			</ul>
		</div>
		<!--- /.card-footer --->
	</div>
</cfoutput>
