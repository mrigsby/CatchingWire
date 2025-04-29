<cfoutput>
	#wire( "customerTable2" )#
</cfoutput>
<!--- SHOWCODE : REMOVE BELOW --->
<cfoutput>
	#view(
		"wiredemos/showCode",
		{
			"codeIntro" : "/views/wiredemos/partials/codeIntro-customerTable2.cfm",
			"files" : [
				"/views/wiredemos/customerTable2.cfm",
				"/wires/customerTable2.cfc",
				"/wires/customerTable2.cfm",
				"/views/wiredemos/customerTable2Sort.cfm"
			]
		}
	)#
</cfoutput>
