<cfoutput>
	<aside class="app-sidebar bg-body-tertiary shadow" data-bs-theme="dark">

		<!--- begin Sidebar Brand --->
		<div class="sidebar-brand">
			<a href="/" class="brand-link">
				<img src="/includes/assets/img/cbWire-Icon.png" alt="CBWire Logo" class="brand-image opacity-75 shadow" />
				<span class="brand-text fw-light">Catching Wire</span>
			</a>
		</div>
		<!--- end Sidebar Brand --->

		<!--- begin Sidebar Wrapper --->
		<div class="sidebar-wrapper">
			<nav class="mt-2">
				<!--- begin Sidebar Menu --->
				<ul class="nav sidebar-menu nav-child-indent flex-column" data-lte-toggle="treeview" role="menu" data-accordion="false" >

					<li class="nav-item">
						<a href="/" class="nav-link<cfif prc.layoutDetails.main_menu_active EQ "dashboard"> active</cfif>">
							<i class="nav-icon bi bi-speedometer"></i>
							<p>Dashboard</p>
						</a>
					</li>

					<li class="nav-item">
						<a href="/customers" class="nav-link<cfif prc.layoutDetails.main_menu_active EQ "customers"> active</cfif>">
							<i class="nav-icon bi bi-people"></i>
							<p>Customers</p>
						</a>
					</li>
					
					<li class="nav-item<cfif prc.layoutDetails.main_menu_active EQ "wiredemos"> menu-open</cfif>">
						<a href="##" class="nav-link<cfif prc.layoutDetails.main_menu_active EQ "wiredemos"> active</cfif>">
							<i class="nav-icon bi bi-circle-fill text-warning"></i>
							<p>
								CBWire Demos
								<i class="nav-arrow bi bi-chevron-right"></i>
							</p>
						</a>
						<ul class="nav nav-treeview">
							<li class="nav-item">
								<a href="/wiredemos/counter1" class="nav-link<cfif prc.layoutDetails.sub_menu_active EQ "counter1"> active</cfif>">
									<i class="nav-icon bi bi-1-square text-warning"></i>
									<p>Basic Counter</p>
								</a>
							</li>
							<li class="nav-item">
								<a href="/wiredemos/counter2" class="nav-link<cfif prc.layoutDetails.sub_menu_active EQ "counter2"> active</cfif>">
									<i class="nav-icon bi bi-2-square text-warning"></i>
									<p>Counter + Progress Bar</p>
								</a>
							</li>
							<li class="nav-item">
								<a href="/wiredemos/counter3" class="nav-link<cfif prc.layoutDetails.sub_menu_active EQ "counter3"> active</cfif>">
									<i class="nav-icon bi bi-3-square text-warning"></i>
									<p>Counter + Data Bindings</p>
								</a>
							</li>
							<li class="nav-item">
								<a href="/wiredemos/counter4" class="nav-link<cfif prc.layoutDetails.sub_menu_active EQ "counter4"> active</cfif>">
									<i class="nav-icon bi bi-4-square text-warning"></i>
									<p>JS Outside The Wire</p>
								</a>
							</li>
							<li class="nav-item">
								<a href="/wiredemos/editMyAccount" class="nav-link<cfif prc.layoutDetails.sub_menu_active EQ "editMyAccount"> active</cfif>">
									<i class="nav-icon bi bi-pencil-square text-warning"></i>
									<p>Edit My Account</p>
								</a>
							</li>
							<li class="nav-item">
								<a href="/wiredemos/customerTable" class="nav-link<cfif prc.layoutDetails.sub_menu_active EQ "customerTable"> active</cfif>">
									<i class="nav-icon bi bi-table text-warning"></i>
									<p>Customers Table</p>
								</a>
							</li>
							<li class="nav-item">
								<a href="/wiredemos/customerTable2" class="nav-link<cfif prc.layoutDetails.sub_menu_active EQ "customerTable2"> active</cfif>">
									<i class="nav-icon bi bi-file-spreadsheet text-warning"></i>
									<p>Customers Table +</p>
								</a>
							</li>
						</ul>
					</li>

					<!--- 
					<li class="nav-header">MULTI LEVEL EXAMPLE</li>

					<li class="nav-item">
						<a href="/" class="nav-link">
							<i class="nav-icon bi bi-circle-fill"></i>
							<p>Level 1</p>
						</a>
					</li>
					<li class="nav-item">
						<a href="##" class="nav-link">
							<i class="nav-icon bi bi-circle-fill"></i>
							<p>
								Level 1
								<i class="nav-arrow bi bi-chevron-right"></i>
							</p>
						</a>
						<ul class="nav nav-treeview">
							<li class="nav-item">
								<a href="/" class="nav-link">
								<i class="nav-icon bi bi-circle"></i>
								<p>Level 2</p>
								</a>
							</li>
							<li class="nav-item">
								<a href="##" class="nav-link">
									<i class="nav-icon bi bi-circle"></i>
									<p>
										Level 2
										<i class="nav-arrow bi bi-chevron-right"></i>
									</p>
								</a>
								<ul class="nav nav-treeview">
									<li class="nav-item">
										<a href="/" class="nav-link">
											<i class="nav-icon bi bi-record-circle-fill"></i>
											<p>Level 3</p>
										</a>
									</li>
									<li class="nav-item">
										<a href="/" class="nav-link">
											<i class="nav-icon bi bi-record-circle-fill"></i>
											<p>Level 3</p>
										</a>
									</li>
									<li class="nav-item">
										<a href="/" class="nav-link">
											<i class="nav-icon bi bi-record-circle-fill"></i>
											<p>Level 3</p>
										</a>
									</li>
								</ul>
							</li>
							<li class="nav-item">
								<a href="/" class="nav-link">
									<i class="nav-icon bi bi-circle"></i>
									<p>Level 2</p>
								</a>
							</li>
						</ul>
					</li>

					<li class="nav-header">LABELS</li>

					<li class="nav-item">
						<a href="/" class="nav-link">
							<i class="nav-icon bi bi-circle text-danger"></i>
							<p class="text">Important</p>
						</a>
					</li>
					<li class="nav-item">
						<a href="/" class="nav-link">
							<i class="nav-icon bi bi-circle text-warning"></i>
							<p>Warning</p>
						</a>
					</li>
					<li class="nav-item">
						<a href="/" class="nav-link">
							<i class="nav-icon bi bi-circle text-info"></i>
							<p>Informational</p>
						</a>
					</li>

					--->
				</ul>
				<!--- end Sidebar Menu --->
			</nav>
		</div>
		<!--- end Sidebar Wrapper --->
	</aside>
</cfoutput>