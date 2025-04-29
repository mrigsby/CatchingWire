<cfoutput>
	#wire( "Counter3" )#
</cfoutput>
<!--- SHOWCODE : REMOVE BELOW --->
<cfoutput>
	#view(
		"wiredemos/showCode",
		{
			"codeIntro" : "/views/wiredemos/partials/codeIntro-counter3.cfm",
			"files" : [
				"/views/wiredemos/Counter3.cfm",
				"/wires/Counter3.cfc",
				"/wires/Counter3.cfm"
			]
		}
	)#
</cfoutput>
