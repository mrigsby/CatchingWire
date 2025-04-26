component {

    function configure(){
        return {
			authentication : {
				// The WireBox ID of the authentication service to use which must adhere to the cbsecurity.interfaces.IAuthService interface.
				"provider" 			: "authenticationService@cbauth",
				"UserService"		: "User",
				"prcUserVariable"	: "oCurrentUser"
			},
			firewall : {
				// Auto load the global security firewall automatically, else you can load it a-la-carte via the `Security` interceptor
				"autoLoadFirewall" : true,
				"invalidAuthenticationEvent" : "login",
				"defaultAuthenticationAction" : "redirect",
				"invalidAuthorizationEvent" : "sessions.new",
				"defaultAuthorizationAction" : "redirect",
				"logs" : {
					"enabled"    : true,
					"schema"     : "",
					"table"      : "cbsecurity_logs",
					"autoCreate" : true
				},
				"rules" : []
			},
			visualizer : {
				"enabled"      : true,
				"secured"      : true,
				"securityRule" : {}
			},
			jwt : {
				"secretKey" : getSystemSetting( "JWT_SECRET", "" )
			}

		}; // return

    }

}