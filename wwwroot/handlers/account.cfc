component extends="coldbox.system.EventHandler" secured {

	property name="htmlUtilities"	inject="htmlUtilities";
	property name="userService"		inject="UserService";

	function preHandler( event, rc, prc, action, eventArguments ){
		prc.htmlUtilities = htmlUtilities;
	}

	function index( event, rc, prc ){
		prc.layoutDetails.append({
			pageTitle : "Edit My Account", 
			breadCrumbs : [
				{ Title : "Dashboard", Link : "/" },
				{ Title : "My Account", active : true }
			]
		} ,true );
		event.setView( "account/myAccount" );
	}

	function save( event, rc, prc ){
		param rc.fname="";
		param rc.lname="";
		param rc.title="";

		if( !len( rc.fname ) || !len( rc.lname ) ) return { "success" : false, "message" : "First and Last name are required." };

		prc.oCurrentUser.setFName( rc.fname )
			.setLName( rc.lname )
			.setTitle( rc.title )
			.save();

		return { "success" : true, "message" : "Account updated successfully." };
	}

	function changePassword( event, rc, prc ){
		param rc.currentPassword="";
		param rc.newPassword="";
		param rc.confirmNewPassword="";

		if( !len( rc.currentPassword ) || !len( rc.newPassword ) || !len( rc.confirmNewPassword ) ) return { "success" : false, "message" : "All fields are required." };
		
		if ( !userService.isValidCredentials( prc.oCurrentUser.getEmail(), rc.currentPassword ) ) return { "success" : false, "message" : "Current Password is invalid" };

		if( rc.newPassword != rc.confirmNewPassword ) return { "success" : false, "message" : "New Password and Confirm New Password do not match." };

		if( rc.newPassword == rc.currentPassword ) return { "success" : false, "message" : "New Password cannot be the same as Current Password." };

		prc.oCurrentUser.setPassword( rc.newPassword ).save();
		return { "success" : true, "message" : "Password updated successfully." };
	}

}
