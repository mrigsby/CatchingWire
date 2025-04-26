<cfoutput>
	#wire( "editMyAccount" )#
</cfoutput>
<!--- SHOWCODE : REMOVE BELOW --->
<cfoutput>
	#view(
		"wiredemos/showCode",
		{
			"files" : [
				"/views/wiredemos/editMyAccount.cfm",
				"/wires/editMyAccount.cfc",
				"/wires/editMyAccount.cfm"
			]
		}
	)#
</cfoutput>
