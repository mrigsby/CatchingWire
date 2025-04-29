<cfoutput>
	<cfscript>
		param args.codeIntro = "";
		param args.codeIntroTitle = "Let's Take a Deeper Look";
		param args.files         = [];
		// helper function to insert links in code explainer text easier
		function scLink( linkurl ){
			return '<a href="#linkurl#" target="_blank"><i class="bi bi-box-arrow-up-right"></i></a>';
		}

	</cfscript>
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

			<cfif len( args.codeIntro ) >
				<h4 class="mt-3">
					<span class="badge text-bg-info">
						<i class="bi bi-person-raised-hand"></i> #args.codeIntroTitle#
					</span>
				</h4>
				<cfinclude template="#args.codeIntro#" />
			</cfif>

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
