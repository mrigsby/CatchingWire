component singleton accessors="true"{

    property name="populator" 		inject="wirebox:populator";
	property name="bcrypt" 			inject="@BCrypt";
	property name="userService" 	inject="quickService:User";
	property name="mailService" 	inject="MailService@cbmailservices";

	UserService function init( ) {
		return this;
	}

   User function retrieveUserById( required id ) {
	   return userService.findOrFail( arguments.id );
   }

   User function retrieveUserByUsername( required username ) {
	   return userService.where( "email", arguments.username ).firstOrFail();
   }

   boolean function isValidCredentials( required username, required password ) {
	   var oUser = retrieveUserByUsername( arguments.username );
	   if( !oUser.isLoaded() || !oUser.isActive() ){
		   return false;
	   }
	   return bcrypt.checkPassword( arguments.password, oUser.getPassword() );
   }

	function list(){
		return queryExecute("SELECT * FROM users ORDER BY lname, fname",{}, { returntype = "array" });
	}

}