<cfoutput>
	#wire( "customerTable" )#
</cfoutput>
<!--- SHOWCODE : REMOVE BELOW --->
<cfoutput>
	#view(
		"wiredemos/showCode",
		{
			"codeIntro" : "/views/wiredemos/partials/codeIntro-customerTable.cfm",
			"files" : [
				"/views/wiredemos/customerTable.cfm",
				"/wires/customerTable.cfc",
				"/wires/customerTable.cfm"
			]
		}
	)#
</cfoutput>
