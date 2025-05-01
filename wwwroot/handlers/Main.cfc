component extends="coldbox.system.EventHandler" secured {

	property name="htmlUtilities" inject="htmlUtilities";

	function preHandler( event, rc, prc, action, eventArguments ){
		prc.htmlUtilities = htmlUtilities;
	}

	function index( event, rc, prc ){
		prc.layoutDetails.append({
			pageTitle : "Dashboard",
			breadCrumbs : [
				{ Title : "Home", Link : "/" },
				{ Title : "Dashboard", active : true }
			]
		} ,true );
		event.setView( "main/index" );
	}

	function importDemoUsers( event, rc, prc ){
		writeOutput( "<h3>This handler will import demo users from /DB/example_users.json but you need to remove or comment out the abort statement first!</h3>" );
		abort;
		var jsonDemoUsersFile = expandPath("../") & "DB/example_users.json";
		if( !fileExists( jsonDemoUsersFile ) ) return "<h3>ERROR: example_users.json DOES NOT EXISTS IN THE 'DB' FOLDER</h3>";

		var demoUsers = deserializeJSON( fileRead( jsonDemoUsersFile ) );
		if( !isArray( demoUsers ) ) return "<h3>ERROR: example_users.json IS NOT AN ARRAY</h3>";

		// writeDump( demoUsers )
		// return "";

		for( var demoUser IN demoUsers ){
			writeOutput( "Creating: " & demoUser.fName & " " & demoUser.lName & " ... " );
			getInstance( "User" ).fill( demoUser ).save();
			writeOutput( "DONE!<br>" );
		}
		return "<h3>DONE!</h3>";
	}

	/**
	 * --------------------------------------------------------------------------
	 * Implicit Actions
	 * --------------------------------------------------------------------------
	 */

	function onAppInit( event, rc, prc ){
		// set demo user (id = 1) to settings in .env or system settings
		if( len( getSystemSetting( "DEMO_USER_EMAIL", "" ) ) && len( getSystemSetting( "DEMO_USER_PASSWORD", "" ) ) ){



			}
		application.cbController.setSetting(
			"profilePicPath",
			application.cbController.getSetting("APPLICATIONPATH") & "includes/images/profiles/"
		);
		application.cbController.setSetting(
			"profilePicURL",
			"/includes/images/profiles/"
		);
	}

	function onRequestStart( event, rc, prc ){
		// set some layout defaults on each request
		prc.layoutDetails = {
			"pageTitle"			:	"",
			"breadCrumbs"		:	[ { "label" : "Dashboard", "url" : "/", "active" : false } ],
			"main_menu_active"	:	"dashboard",
			"sub_menu_active"	:	""
		};
	}

	function onException( event, rc, prc ){
		event.setHTTPHeader( statusCode = 500 );
		var exception = prc.exception;
		// Place exception handler below:
	}

}
