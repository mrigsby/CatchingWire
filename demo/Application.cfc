component {

	this.name                 = "CatchingWire";
	this.applicationTimeout	  = createTimespan( 4, 0, 0, 0 );
	this.sessionManagement    = true;
	this.sessionTimeout       = createTimespan( 4, 0, 0, 0 );
	this.setClientCookies     = true;
	this.setDomainCookies     = true;
	this.scriptProtect        = false;
	this.secureJSON           = false;
	this.timezone             = "America/New_York";
	this.whiteSpaceManagement = "smart";

	COLDBOX_APP_ROOT_PATH = getDirectoryFromPath( getCurrentTemplatePath() );
	COLDBOX_APP_MAPPING   = "";
	COLDBOX_CONFIG_FILE   = "";
	COLDBOX_APP_KEY       = "";
	COLDBOX_FAIL_FAST     = true;

	this.mappings[ "/cbapp" ]   = COLDBOX_APP_ROOT_PATH;
	this.mappings[ "/coldbox" ] = COLDBOX_APP_ROOT_PATH & "coldbox";

	this.datasource = "catchingwire";

	public boolean function onApplicationStart(){
		setting requestTimeout ="300";
		application.dsn = this.datasource;
		application.cbBootstrap= new coldbox.system.Bootstrap(
			COLDBOX_CONFIG_FILE,
			COLDBOX_APP_ROOT_PATH,
			COLDBOX_APP_KEY,
			COLDBOX_APP_MAPPING
		);
		application.cbBootstrap.loadColdbox();
		return true;
	}

	public void function onApplicationEnd( struct appScope ){
		arguments.appScope.cbBootstrap.onApplicationEnd( arguments.appScope );
	}

	public boolean function onRequestStart( string targetPage ){
		// Process ColdBox Request
		application.cbBootstrap.onRequestStart( arguments.targetPage );
		return true;
	}

	public void function onSessionStart(){
		if ( !isNull( application.cbBootstrap ) ) {
			application.cbBootStrap.onSessionStart();
		}
	}

	public void function onSessionEnd( struct sessionScope, struct appScope ){
		arguments.appScope.cbBootStrap.onSessionEnd( argumentCollection = arguments );
	}

	public boolean function onMissingTemplate( template ){
		return application.cbBootstrap.onMissingTemplate( argumentCollection = arguments );
	}

}
