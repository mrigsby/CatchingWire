<cfoutput>
	#wire( "editMyAccount" )#
</cfoutput>
<!--- SHOWCODE : REMOVE BELOW --->
<cfoutput>
	#view(
		"wiredemos/showCode",
		{
			"codeIntro" : "/views/wiredemos/partials/codeIntro-editMyAccount.cfm",
			"files" : [
				"/views/wiredemos/editMyAccount.cfm",
				"/wires/editMyAccount.cfc",
				"/wires/editMyAccount.cfm"
			]
		}
	)#
</cfoutput>
