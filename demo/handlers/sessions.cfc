component {

	// property name="auth" inject="AuthenticationService@cbauth";
	property name="flash" inject="coldbox:flash";
	property name="mailService" inject="MailService@cbmailservices";
	property name="passwordResetService" inject="quickService:passwordResets";
	property name="userService" inject="quickService:User";
	property name="htmlUtilities" inject="htmlUtilities";

	function preHandler( event, rc, prc, action, eventArguments ){
		prc.htmlUtilities = htmlUtilities;
	}

	function login( event, rc, prc ){
		param rc._securedUrl = flash.get( "_securedUrl", "/" );
		flash.put( "_securedUrl", rc._securedUrl );
		param prc.errors = flash.get( "login_form_errors", {} );
		event.setView( view: "sessions/login", layout: "login" );
	} // new()

	function create( event, rc, prc ){
		flash.keep( "_securedUrl" );

		var result = validateModel(
			target = rc,
			constraints = { "email" : { "required" : true, "type" : "email" }, "password" : { "required" : true } }
		);

		if ( result.hasErrors() ) {
			flash.put( "login_form_errors", result.getAllErrorsAsStruct() );
			// event.auditLogLoginFailed( result.getAllErrorsAsStruct() );
			// redirectBack();
			back();
			return;
		}

		try{
			auth().authenticate( rc.email, rc.password );
			// event.auditLogLogin();
			relocate( uri = flash.get( "_securedUrl", "/" ) );
		} catch ( any e ) {
			// writeDump( e.message );
			// writeDump( var="#auth()#", top="2", expand="false" )
			// abort;
			flash.put( "login_form_errors", { "login" : "Invalid Credentials" } );
			// event.auditLogLoginFailed( includeScopes = true );
			// redirectBack();
			back();
		}
	} // create()

	function delete( event, rc, prc ){
		// event.auditLogLogout();
		auth().logout();
		relocate( uri = "/" );
	} // delete()

	function lostPassword( event, rc, prc ){
		prc.layoutDetails.pageTitle = "Lost Password";
		event.setView( view: "sessions/lostpassword", layout: "login" );
	} // lostPassword()

	function prcLostPassword( event, rc, prc ) allowedMethods="POST" {
		param rc.email = "";
		if( !isValid( "email", rc.email ) ){
			// event.auditLogLostPassFailed( includeScopes = true );
			return { "success" : false, "msg" : "Please enter a valid email address" };
		}
		try{
			var oUser = userService.where( "email", rc.email ).firstOrFail();
			// event.auditLogLostPass( includeScopes = true );
		}catch( any e ){
			// event.auditLogLostPassFailed( includeScopes = true );
			return { "success" : false, "msg" : "Email address not found. Please try again", "e" : e };
		}
		// Use JOB for sending email.
		// getInstance( "jobs.users.sendLostPassEmail" )
		// 	.setProperties({
		// 		"userid"		: oUser.getID(),
		// 		"resetLink" 	: event.buildLink( 'reset-password.XXXXXXX' )
		// 	})
		// 	.dispatch();

		// process request and send email immediatly
		var passwordReset = passwordResetService.newEntity().setUserID( oUser.getID() ).save();
		var resetLink = event.buildLink( 'reset-password.#passwordReset.getUUID()#' );
		mailService.newMail(
			to         : oUser.getEmail(),
			subject    : "Password Reset",
			bodyTokens : {
				fname    	: oUser.getFname(),
				lname 		: oUser.getLname(),
				link    	: resetLink
			}
		)
		.setView( view : "emails/passwordReset", layout : "email" )
		.send()


		return { "success" : true, "msg" : "Success! An email is being sent to #jsStringFormat(rc.email)# with instructions to reset your password." };
	} // passResetRequest()

	function resetPassword( event, rc, prc ) allowedMethods="GET" {
		param rc.uuid = "";
		try{
			prc.passwordReset = passwordResetService.where( "uuid", rc.uuid ).firstOrFail();
		}catch( any e ){
			flash.put(
				"toastr",
				{
					"type" : "warning",
					"title" : "Reset Not Found",
					"msg" : "We could not find that password reset reqeust. Please request a new one below."
				}
			);
			relocate('lost-password');
		}
		if( prc.passwordReset.isExpired() ){
			flash.put(
				"toastr",
				{
					"type" : "warning",
					"title" : "Reset Expired",
					"msg" : "Your password reset link has expired. Please request a new one below."
				}
			);
			relocate('lost-password');
		}
		event.setView( view: "sessions/resetPassword", layout: "login" );
	} // resetPassword()

	function prcResetPassword( event, rc, prc ) allowedMethods="POST" {
		param rc.uuid = "";
		param rc.password = "NO";
		param rc.confirm_password = "MATCH";
		try{
			prc.passwordReset = passwordResetService.where( "uuid", rc.uuid ).firstOrFail();
		}catch( any e ){
			return { "success" : false, "msg" : "There was an error retrieving your password reset request. Please request a new one." };
		}
		if( rc.password != rc.confirm_password ){
			return { "success" : false, "msg" : "Your passwords do not match. Please re-enter and try again." };
		}
		if( len(rc.password) < 8 ){
			return { "success" : false, "msg" : "Your password must be at least 8 characters." };
		}
		// ok, reset password
		var oUser = prc.passwordReset.getUser();
		oUser.setPassword( rc.password ).save();
		prc.passwordReset.expireRequest().save();
		auth().authenticate( oUser.getEmail(), rc.password );
		flash.put(
			"toastr",
			{
				"type" : "success",
				"title" : "Success",
				"msg" : "Your password has been reset and you have been logged in.",
				"timeout" : 30000
			}
		);
		return { "success" : true };
	} // passResetRequest()

}
