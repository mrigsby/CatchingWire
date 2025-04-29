<cfoutput>
	#wire( "Counter2" )#
</cfoutput>
<!--- SHOWCODE : REMOVE BELOW --->
<cfoutput>
	#view(
		"wiredemos/showCode",
		{
			"codeIntro" : "/views/wiredemos/partials/codeIntro-counter2.cfm",
			"files" : [
				"/views/wiredemos/Counter2.cfm",
				"/wires/Counter2.cfc",
				"/wires/Counter2.cfm"
			]
		}
	)#
</cfoutput>
