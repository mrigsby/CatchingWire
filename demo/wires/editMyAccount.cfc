component extends="cbwire.models.Component" {

	property name="cbSecurity" inject="@CBSecurity";

	data = {
		"currentPasswordConfirm" : "",
		"newPassword"            : "",
		"newPasswordConfirm"     : "",
		"changePasswordError"    : [],
		"changePasswordSuccess"  : false,
		"saveAccountError"       : [],
		"saveAccountSuccess"     : false,
		"id"                     : "",
		"fname"                  : "",
		"lname"                  : "",
		"title"                  : "",
		"email"                  : "",
		"prefs"                  : {},
		"permissions"            : [],
		"roles"                  : []
	};

	locked = [ "id", "email" ];

	function saveAccount(){
		data.saveAccountSuccess = false;
		var oUser               = cbSecurity.getUser();
		if ( oUser.getId() == data.id ) {
			oUser
				.setFname( data.fname )
				.setLname( data.lname )
				.setTitle( data.title )
				.save();
			data.saveAccountSuccess = true;
		} else {
			data.saveAccountError.append( "User ID mismatch!" );
		}
	}

	function changePassword(){
		data.append(
			{
				"changePasswordSuccess" : false,
				"changePasswordError"   : []
			},
			true
		);
		if ( data.newPassword != data.newPasswordConfirm )
			data.changePasswordError.append( "The new password and confirmation do not match." );
		if ( len( data.newPassword ) < 8 )
			data.changePasswordError.append( "The new password must be at least 8 characters long. #len( data.newPassword )#" );
		if ( !len( data.currentPasswordConfirm ) )
			data.changePasswordError.append( "The current password is required." );
		if ( data.changePasswordError.len() ) return;

		try {
			cbSecurity
				.authenticate( data.email, data.currentPasswordConfirm )
				.setPassword( data.newPassword )
				.save();
			data.append(
				{
					"changePasswordSuccess"  : true,
					"currentPasswordConfirm" : "",
					"newPassword"            : "",
					"newPasswordConfirm"     : "",
					"changePasswordError"    : []
				},
				true
			);
		} catch ( any e ) {
			data.changePasswordError.append( e.message );
		}
	}

	function onMount( params, event, rc, prc ){
		var oUser = cbSecurity.getUser();
		data.append(
			{
				"id"          : oUser.getId(),
				"fname"       : oUser.getFname(),
				"lname"       : oUser.getLname(),
				"title"       : oUser.getTitle(),
				"email"       : oUser.getEmail(),
				"prefs"       : oUser.getPrefs(),
				"permissions" : oUser.getPermissions(),
				"roles"       : oUser.getRoles()
			},
			true
		);
	}

}
