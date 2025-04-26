<cfoutput>
	<cfset qryCustomers = getCustomers()>
	<div class="card mb-4 wireOuterWrapper">
		<div class="card-body p-0">
			<table class="table">
				<thead>
					<tr>
						<th style="width: 10px">Active</th>
						<th>
							Name &nbsp;&nbsp;
							<a wire:click.prevent="setSort( 'asc', 'lname' )" style="cursor:n-resize;">
								<i class="bi bi-arrow-up-circle-fill <cfif data.sort EQ 'asc' AND data.sort_col EQ 'lname'>text-success<cfelse>text-black</cfif>" ></i>
							</a>
							<a wire:click.prevent="setSort( 'desc', 'lname' )" style="cursor:s-resize;">
								<i class="bi bi-arrow-down-circle-fill <cfif data.sort EQ 'desc' AND data.sort_col EQ 'lname'>text-success<cfelse>text-black</cfif>" ></i>
							</a>
						</th>
						<th>Email</th>
						<th>Title</th>
						<th>Joined</th>
						<th>Last Login</th>
						<th>&nbsp;</th>
					</tr>
				</thead>
				<tbody>
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
						wire
						:click.prevent="setPage( #qryCustomers.pagination.totalPages# )"
					>
						<i class="bi bi-chevron-double-right"></i>
					</button>
				</li>
			</ul>
		</div>
		<!--- /.card-footer --->
	</div>
</cfoutput>
