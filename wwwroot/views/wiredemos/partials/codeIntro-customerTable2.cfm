<cfoutput>
	<p>
		<h5>Key Points:</h5>
		<ul>
			<li>
				Same as the previous "Customer Table" example, but this time adding a little more pizzazz to the table
				<ol>
					<li>
						Sorting on any column
					</li>
					<li>
						Inserting the sort icons using a separate view and passing in args <code>view( "wiredemos/customerTable2Sort", { "data" : data, "column" : "lname" } )</code> #scLink("https://coldbox.ortusbooks.com/the-basics/layouts-and-views/views/rendering-views")#
					</li>
					<li>
						A toggle button to show/hide inactive customers using the <code>wire:model.live="show_inactive"</code> template directive #scLink("https://cbwire.ortusbooks.com/template-directives/wire-model##live-updating")#
					</li>
				</ol>
			</li>
			<li>
				A "DataTables" like responsive/reactive table inspired by Grant Copley's #scLink("https://github.com/grantcopley")# "CBWIRE DataTable Example" #scLink("https://github.com/grantcopley/cbwire-datatable-example")#
			</li>
			<li>
				Data properties to track the state of the table sort column, sort direction, include inactive customers, and a "template" string for the edit customer form url #scLink("https://cbwire.ortusbooks.com/the-essentials/data-properties")#
			</li>
			<li>
				Three actions to mange the table state: <code>setPage( page )</code>, <code>setSort( sort, sort_col )</code>, and <code>setShowInactive( showInactive )</code> #scLink("https://cbwire.ortusbooks.com/the-essentials/actions")#
			</li>
			<li>
				Pagination using the <code>data.page</code> and the pagination information returned in the QB query #scLink("https://qb.ortusbooks.com/query-builder/executing-queries/retrieving-results##paginate")#
			</li>
			<li>
				Use of the <code>onMount()</code> lifecyle method so it can use the <code>event.buildLink()</code> and save a "template" string as a data property for the edit customer url. #scLink("https://cbwire.ortusbooks.com/the-essentials/lifecycle-events##onmount")#
			</li>
		</ul>
	</p>
</cfoutput>