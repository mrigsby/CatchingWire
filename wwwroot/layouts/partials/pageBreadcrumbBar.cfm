<cfoutput>
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-6"><h3 class="mb-0">#prc.layoutDetails.keyExists("pageTitle") ? prc.layoutDetails.pageTitle : "" #</h3></div>
		<div class="col-sm-6">
			<cfif prc.layoutDetails.keyExists("breadCrumbs") >
				<ol class="breadcrumb float-sm-end">
					<cfloop index="bcIndex" item="bcItem" array="#prc.layoutDetails.breadCrumbs#">
						<li class="breadcrumb-item <cfif bcItem.keyExists("active") >#bcItem.active ? "active" : ""#</cfif>" <cfif bcItem.keyExists("active") >#bcItem.active ? 'aria-current="page"' : ""#</cfif> >
							<cfif bcItem.keyExists("Link") ><a href="#bcItem.Link#"></cfif>
								#bcItem.Title#
							<cfif bcItem.keyExists("Link") ></a></cfif>
						</li>
					</cfloop>
				</ol>
			</cfif>
		</div>
	</div>
</div>
</cfoutput>