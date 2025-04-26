component table="users_password_reset" extends="quick.models.BaseEntity" accessors="true" {

    property name="id";
    property name="userID" 		column="users_id";
    property name="uuid"		column="reset_uuid" ;
    property name="reqDate"		column="reset_req_date";
    property name="expDate"		column="reset_exp_date";

    function user() {
		return belongsTo( "user", "users_id");
	 }

	// create UUID and expire date before inserting into DB
	function preInsert() {
		setUUID( createUUID() );
		setExpDate( dateAdd( "d", 7, now() ) );
	}

	function isExpired(){
		return ( DateDiff("d", now(), expDate ) >= 0 ) ? false : true;
	}

	function expireRequest(){
		return assignAttribute( "expDate", dateAdd("d", -8, now() ) );
	}

}