component extends="coldbox.system.EventHandler" secured {
	
	function preHandler( event, rc, prc, action, eventArguments ){
		prc.layoutDetails.main_menu_active = "wiredemos";
		// insert CSS to add shadow to all wire components
		cfhtmlhead( text='<style>.wireOuterWrapper{ box-shadow: 0px 0px 8px 3px rgba(255, 193, 7, 0.7); padding: 5px; }</style>');
	}

	function counter1( event, rc, prc ){
		prc.layoutDetails.sub_menu_active = "counter1";
		prc.layoutMeta = { 
			pageTitle : "Basic Counter", 
			breadCrumbs : [
				{ Title : "Home", Link : "/" },
				{ Title : "Basic Counter", active : true }
			]
		};
		event.setView( "wiredemos/counter1" );
	}

	function counter2( event, rc, prc ){
		prc.layoutDetails.sub_menu_active = "counter2";
		prc.layoutMeta = { 
			pageTitle : "Counter + Progress Bar", 
			breadCrumbs : [
				{ Title : "Home", Link : "/" },
				{ Title : "Counter + Progress Bar", active : true }
			]
		};
		event.setView( "wiredemos/counter2" );
	}

	function counter3( event, rc, prc ){
		prc.layoutDetails.sub_menu_active = "counter3";
		prc.layoutMeta = { 
			pageTitle : "Counter + Data Bindings", 
			breadCrumbs : [
				{ Title : "Home", Link : "/" },
				{ Title : "Counter + Data Bindings", active : true }
			]
		};
		event.setView( "wiredemos/counter3" );
	}

	function counter4( event, rc, prc ){
		prc.layoutDetails.sub_menu_active = "counter4";
		prc.layoutMeta = { 
			pageTitle : "Javascript Outside The Wire!", 
			breadCrumbs : [
				{ Title : "Home", Link : "/" },
				{ Title : "JS Outside The Wire!", active : true }
			]
		};
		event.setView( "wiredemos/counter4" );
	}

	function editMyAccount( event, rc, prc ){
		prc.layoutDetails.sub_menu_active = "editMyAccount";
		prc.layoutMeta = { 
			pageTitle : "Edit My Account", 
			breadCrumbs : [
				{ Title : "Home", Link : "/" },
				{ Title : "Edit My Account", active : true }
			]
		};
		event.setView( "wiredemos/editMyAccount" );
	}

	function customerTable( event, rc, prc ){
		prc.layoutDetails.sub_menu_active = "customerTable";
		prc.layoutMeta = { 
			pageTitle : "Customer Table", 
			breadCrumbs : [
				{ Title : "Home", Link : "/" },
				{ Title : "Customer Table", active : true }
			]
		};
		event.setView( "wiredemos/customerTable" );
	}

	function customerTable2( event, rc, prc ){
		prc.layoutDetails.sub_menu_active = "customerTable2";
		prc.layoutMeta = { 
			pageTitle : "Customer Table +", 
			breadCrumbs : [
				{ Title : "Home", Link : "/" },
				{ Title : "Customer Table +", active : true }
			]
		};
		event.setView( "wiredemos/customerTable2" );
	}

}
