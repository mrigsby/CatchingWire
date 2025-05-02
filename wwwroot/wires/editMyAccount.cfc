component extends="cbwire.models.Component" {

	property name="cbSecurity" inject="@CBSecurity";

	data = {
		"currentPasswordConfirm" : "",
		"newPassword"            : "",
		"newPasswordConfirm"     : "",
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
		var oUser = cbSecurity.getUser();
		if ( oUser.getId() == data.id ) {
			oUser
				.setFname( data.fname )
				.setLname( data.lname )
				.setTitle( data.title )
				.save();
			js('Swal.fire({ position: "top-end", icon: "success", title: "Account Saved!", showConfirmButton: false, timer: 3000 })');
		} else {
			js('Swal.fire({ title: "Error", html: "User ID mismatch", icon: "error" });');
		}
	}

	function changePassword(){
		var changePasswordError = [];
		if ( data.newPassword != data.newPasswordConfirm )
			changePasswordError.append( "The new password and confirmation do not match." );
		if ( len( data.newPassword ) < 8 )
			changePasswordError.append( "The new password must be at least 8 characters long." );
		if ( !len( data.currentPasswordConfirm ) )
			changePasswordError.append( "The current password is required." );
		if ( changePasswordError.len() ){
			js('Swal.fire({ title: "Errors", html: "#changePasswordError.toList("<br>")#", icon: "error" });');
			return;
		};

		try {
			cbSecurity
				.authenticate( data.email, data.currentPasswordConfirm )
				.setPassword( data.newPassword )
				.save();
			js('Swal.fire({ position: "top-end", icon: "success", title: "Password Updated", showConfirmButton: false, timer: 3000 });');
			data.append(
				{
					"currentPasswordConfirm" : "",
					"newPassword"            : "",
					"newPasswordConfirm"     : ""
				},
				true
			);
		} catch ( any e ) {
			js('Swal.fire({ title: "Errors", html: "#encodeForJavaScript(e.message)#", icon: "error" });');
		}
	}

	function onMount( params, event, rc, prc ){
		var oUser = cbSecurity.getUser(); // could use prc.oCurrentUser
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
