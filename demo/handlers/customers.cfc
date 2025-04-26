component extends="coldbox.system.EventHandler" secured {

	property name="htmlUtilities"	inject="htmlUtilities";
	property name="userService"		inject="UserService";

	function preHandler( event, rc, prc, action, eventArguments ){
		prc.htmlUtilities = htmlUtilities;
	}

	function index( event, rc, prc ){
		param rc.sort = "desc";
		param rc.page = 1;

		prc.qUsers = getInstance( "QueryBuilder@qb" )
			.table( "users" )
			.where( "accountType", "user" )
			.orderBy( "fname", rc.sort )
			.paginate( rc.page );

		prc.layoutMeta = { pageTitle : "All Customers", breadCrumbs : [
			{ Title : "Dashboard", Link : "/" },
			{ Title : "Customers", active : true }
		] };
		event.setView( "customers/allCustomers" );
	}


	function editCustomer( event, rc, prc ){
		prc.oUser = getInstance( "User" )
			.where( "id", rc.id )
			.firstOrFail();
		prc.CustomerFullName = prc.oUser.getFName() & " " & prc.oUser.getLName();

		prc.layoutMeta = { pageTitle : "Edit " & prc.CustomerFullName, breadCrumbs : [
			{ Title : "Dashboard", Link : "/" },
			{ Title : "Customers", Link : "/customers" },
			{ Title : "Edit " & prc.CustomerFullName, active : true }
		] };
		event.setView( "customers/editCustomer" );
	}

	function saveCustomer( event, rc, prc ){
		var oUser = getInstance( "User" )
			.where( "id", rc.id )
			.firstOrFail();

		oUser.update( {
			fname = rc.fname,
			lname = rc.lname,
			title = rc.title
		} );

		return { "success" : true, "message" : "Customer updated successfully!" };
	}


	function changePassword( event, rc, prc ){
		param rc.currentPassword="";
		param rc.newPassword="";
		param rc.confirmNewPassword="";

		if( !len( rc.currentPassword ) || !len( rc.newPassword ) || !len( rc.confirmNewPassword ) ) return { "success" : false, "message" : "All fields are required." };

		var oUser = getInstance( "User" )
			.where( "id", rc.id )
			.firstOrFail();


		if ( !userService.isValidCredentials( oUser.getEmail(), rc.currentPassword ) ) return { "success" : false, "message" : "Current Password is invalid" };

		if( rc.newPassword != rc.confirmNewPassword ) return { "success" : false, "message" : "New Password and Confirm New Password do not match." };

		if( rc.newPassword == rc.currentPassword ) return { "success" : false, "message" : "New Password cannot be the same as Current Password." };

		oUser.setPassword( rc.newPassword ).save();
		return { "success" : true, "message" : "Password updated successfully." };
	}


}