<cfoutput>
	#wire( "Counter1" )#
</cfoutput>
<!--- SHOWCODE : REMOVE BELOW --->
<cfoutput>
	#view(
		"wiredemos/showCode",
		{
			"codeIntro" : "/views/wiredemos/partials/codeIntro-counter1.cfm",
			"files" : [
				"/views/wiredemos/Counter1.cfm",
				"/wires/Counter1.cfc",
				"/wires/Counter1.cfm"
			]
		}
	)#
</cfoutput>
