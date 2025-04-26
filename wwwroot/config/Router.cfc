component {

	function configure(){

		setFullRewrites( true );

		route( "/login" ).withHandler( "sessions" ).toAction( { "GET" : "login", "POST" : "create" } );
		route( "/logout", "sessions.delete" );
		route( "/lost-Password" ).withHandler( "sessions" ).toAction( { "GET" : "lostPassword", "POST" : "prcLostPassword" } );

		route( "/reset-password/:uuid" ).withHandler( "sessions" ).toAction( { "GET" : "resetPassword", "POST" : "prcResetPassword" } );
		route( "/reset-password", "sessions.lostPassword" );

		route( "/customers/:id-numeric/change-password", "customers.changePassword" );
		route( "/customers/:id-numeric" ).withHandler( "customers" ).toAction( { "GET" : "editCustomer", "POST" : "saveCustomer" } );
		route( "/customers", "customers.index" );

		route( "/my-account/change-password" ).withHandler( "account" ).toAction( { "GET" : "index", "POST" : "changePassword" } );
		route( "/my-account" ).withHandler( "account" ).toAction( { "GET" : "index", "POST" : "save" } );

		// @app_routes@

		// Conventions-Based Routing
		route( ":handler/:action?" ).end();
	}

}
