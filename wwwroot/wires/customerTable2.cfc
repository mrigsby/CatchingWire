component extends="cbwire.models.Component" {

	data = {
		"page"               : 1,
		"sort"               : "asc",
		"sort_col"           : "lname",
		"edit_customer_link" : "",
		"show_inactive"      : 0
	};

	function getCustomers(){
		return getInstance( "QueryBuilder@qb" )
			.table( "users" )
			.where( "accountType", "user" )
			.when( !data.show_inactive, function( q ){
				q.andWhere( "active", 1 );
			} )
			.orderBy( data.sort_col, data.sort )
			.paginate( data.page );
	}

	function setPage( page ){
		data.page = page;
	}

	function setSort( sort, sort_col ){
		data.sort     = sort;
		data.sort_col = sort_col;
	}

	function setShowInactive( showInactive ){
		data.show_inactive = showInactive;
	}

	function onMount( params, event, rc, prc ){
		// build link "template" from the event in the onMount
		data.edit_customer_link = event.buildLink( "customers.{{ID}}" );
	}

}
