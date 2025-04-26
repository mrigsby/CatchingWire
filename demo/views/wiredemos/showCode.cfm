<cfoutput>
	<button
		class="btn btn-info mt-5"
		type ="button"
		data-bs-toggle="collapse"
		data-bs-target="##collapseWireCode"
		aria-expanded="true"
		aria-controls="collapseWireCode"
	>
		<i class="bi bi-code-slash"></i> Show Code
	</button>
	<div class="collapse mt-3" id="collapseWireCode" style="">
		<div class="card card-body">
			<cfloop index="currentIndex" item="currentItem" array="#args.files#">
				<cfscript>
				// set file type
				if ( findNoCase( "/wires/", currentItem ) ) {
					if ( findNoCase( ".cfc", currentItem ) ) {
						fileType         = "wireComponent";
						highlightJSClass = "language-javascript";
					} else if ( findNoCase( ".cfm", currentItem ) ) {
						fileType         = "wireTemplate";
						highlightJSClass = "language-html";
					}
				} else if ( findNoCase( "/views/", currentItem ) ) {
					fileType         = "view";
					highlightJSClass = "language-html";
				} else {
					fileType         = "file";
					highlightJSClass = "language-html";
				}
				// read file content
				fileContent       = fileRead( currentItem, "utf-8" );
				// remove the anything below the <!--- SHOWCODE : REMOVE BELOW ---> comment
				removeBelowString = "<!--- SHOWCODE : REMOVE BELOW --->";
				removeBelow       = find( removeBelowString, fileContent, 1 );
				if ( removeBelow > 0 ) {
					fileContent = left( fileContent, removeBelow - 1 );
				}
				</cfscript>
				<h4 class="mt-3">
					<cfswitch expression="#fileType#">
						<cfcase value="view">
							<span class="badge text-bg-success">
								<i class="bi bi-eye-fill"></i> VIEW
							</span>
						</cfcase>
						<cfcase value="wireComponent">
							<span class="badge text-bg-warning">
								<i class="bi bi-lightning-fill"></i>
								CBWIRE COMPONENT
							</span>
						</cfcase>
						<cfcase value="wireTemplate">
							<span class="badge text-bg-warning">
								<i class="bi bi-lightning-fill"></i>
								CBWIRE TEMPLATE
							</span>
						</cfcase>
						<cfdefaultcase>
							<span class="badge text-bg-info">
								<i class="bi bi-file-earmark-code"></i> FILE
							</span>
						</cfdefaultcase>
					</cfswitch>
					#currentItem#
				</h4>
				<pre>
					<code class="#highlightJSClass#">#encodeForHTML( fileContent )#</code>
				</pre>
			</cfloop>
		</div>
	</div>
</cfoutput>
