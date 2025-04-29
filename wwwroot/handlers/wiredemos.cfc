component extends="coldbox.system.EventHandler" secured {
	
	function preHandler( event, rc, prc, action, eventArguments ){
		prc.layoutDetails.main_menu_active = "wiredemos";
		// insert CSS to add shadow to all wire components
		cfhtmlhead( text='<style>.wireOuterWrapper{ box-shadow: 0px 0px 8px 3px rgba(255, 193, 7, 0.7); padding: 5px; }</style>');
	}

	function counter1( event, rc, prc ){
		prc.layoutDetails.append({
			pageTitle : "Basic Counter",
			sub_menu_active : "counter1",
			breadCrumbs : [
				{ Title : "Home", Link : "/" },
				{ Title : "Basic Counter", active : true }
			]
		} ,true );
		event.setView( "wiredemos/counter1" );
	}

	function counter2( event, rc, prc ){
		prc.layoutDetails.append({
			pageTitle : "Counter + Progress Bar",
			sub_menu_active : "counter2",
			breadCrumbs : [
				{ Title : "Home", Link : "/" },
				{ Title : "Counter + Progress Bar", active : true }
			]
		} ,true );
		event.setView( "wiredemos/counter2" );
	}

	function counter3( event, rc, prc ){
		prc.layoutDetails.append({
			pageTitle : "Counter + Data Bindings", 
			sub_menu_active : "counter3",
			breadCrumbs : [
				{ Title : "Home", Link : "/" },
				{ Title : "Counter + Data Bindings", active : true }
			]
		} ,true );
		event.setView( "wiredemos/counter3" );
	}

	function counter4( event, rc, prc ){
		prc.layoutDetails.append({
			pageTitle : "Javascript Outside The Wire!", 
			sub_menu_active : "counter4",
			breadCrumbs : [
				{ Title : "Home", Link : "/" },
				{ Title : "JS Outside The Wire!", active : true }
			]
		} ,true );
		event.setView( "wiredemos/counter4" );
	}

	function editMyAccount( event, rc, prc ){
		prc.layoutDetails.append({
			pageTitle : "Edit My Account", 
			sub_menu_active : "editMyAccount",
			breadCrumbs : [
				{ Title : "Home", Link : "/" },
				{ Title : "Edit My Account", active : true }
			]
		} ,true );
		event.setView( "wiredemos/editMyAccount" );
	}

	function customerTable( event, rc, prc ){
		prc.layoutDetails.append({
			pageTitle : "Customer Table", 
			sub_menu_active : "customerTable",
			breadCrumbs : [
				{ Title : "Home", Link : "/" },
				{ Title : "Customer Table", active : true }
			]
		} ,true );
		event.setView( "wiredemos/customerTable" );
	}

	function customerTable2( event, rc, prc ){
		prc.layoutDetails.append({
			pageTitle : "Customer Table +", 
			sub_menu_active : "customerTable2",
			breadCrumbs : [
				{ Title : "Home", Link : "/" },
				{ Title : "Customer Table +", active : true }
			]
		} ,true );
		event.setView( "wiredemos/customerTable2" );
	}

}
