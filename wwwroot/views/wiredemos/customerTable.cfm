<cfoutput>
	#wire( "customerTable" )#
</cfoutput>
<!--- SHOWCODE : REMOVE BELOW --->
<cfoutput>
	#view(
		"wiredemos/showCode",
		{
			"files" : [
				"/views/wiredemos/customerTable.cfm",
				"/wires/customerTable.cfc",
				"/wires/customerTable.cfm"
			]
		}
	)#
</cfoutput>
