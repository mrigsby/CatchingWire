component  {
    property name="wirebox"     inject="wirebox";
    property name="cache"       inject="cachebox:default";
    property name="html"        inject="HTMLHelper@coldbox";
    property name="flash"       inject="coldbox:flash";
    
    function select2Customers(
        required name,
        selectedID     	= 0,
        placeholder    	= "Customer",
        clearBtn       	= true,
        getFullData    	= false,
		useQBID			= false,
        onSelect		= "", // jsFunction name or anonymous function
        onUnSelect		= "" // jsFunction name or anonymous function
    ){
		// cache.clear( "htmlUtil_Select2Customers_allCustomers_QBID");
		// cache.clear( "htmlUtil_Select2Customers_allCustomers_ID");
		var fullDataColumns = "";
		if( getFullData ){
			fullDataColumns = ", Title, givenName, middleName, familyName, suffix, companyName, DisplayName, mobile, primaryPhone, alternatePhone, PrimaryEmailAddr, addressBilling_id, addressBilling_line1, addressBilling_line2, addressBilling_line3, addressBilling_city, addressBilling_CountrySubDivisionCode, addressBilling_PostalCode, addressShipping_useBilling, addressShipping_id, addressShipping_line1, addressShipping_line2, addressShipping_line3, addressShipping_city, addressShipping_CountrySubDivisionCode, addressShipping_PostalCode, Notes";
		}
        if( useQBID ){
            var allCustomers = cache.getOrSet(
                    objectKey   =   "htmlUtil_Select2Customers_allCustomers_QBID",
                    produce     =   function(){
                        return wirebox.getInstance("QueryBuilder@qb")
                            .selectRaw("qbID as id, COMBINE_WITH_SEPERATOR( companyName, DisplayName ) as text#fullDataColumns#")
                            .from( "customers" )
                            .where("active","=",1)
                            .orderBy( "text" )
                            .get();
                    },
                    timeout     =   5
                );
        }else{
            var allCustomers = cache.getOrSet(
                    objectKey   =   "htmlUtil_Select2Customers_allCustomers_ID",
                    produce     =   function(){
                        return wirebox.getInstance("QueryBuilder@qb")
                            .selectRaw("id, COMBINE_WITH_SEPERATOR( companyName, DisplayName ) as text#fullDataColumns#")
                            .from( "customers" )
                            .where("active","=",1)
                            .orderBy( "text" )
                            .get();
                    },
                    timeout     =   5
                );
        }

        return $insertSelect2( name, selectedID, placeholder, allCustomers, clearBtn, onSelect, onUnSelect );
    } // select2Customers()

    function select2SalesReps(
        required name,
        required selectedID     = 0,
        required placeholder    = "Customer",
        required clearBtn       = true,
        onSelect                = "", // jsFunction name or anonymous function
        onUnSelect              = "" // jsFunction name or anonymous function
    ){
       var allReps = cache.getOrSet(
			objectKey   =   "htmlUtil_Select2SalesReps_allReps",
			produce     =   function(){
				return wirebox.getInstance("QueryBuilder@qb")
                    .selectRaw("id, CONCAT( fname, ' ', lname, ' (', email, ')' ) as text")
                    .from( "sales_reps" )
                    .where("active","=",1)
                    .orderBy( "text" )
                    .get();
			},
            timeout     =   5
		);
        return $insertSelect2( name, selectedID, placeholder, allReps, clearBtn, onSelect, onUnSelect );
    } // select2SalesReps()

    function datePicker(
        required name,
        required value="",
        required placeholder="Select Date",
        required clearBtn=true
    ){
        // application.cbcontroller.getRequestService().getContext().getPrivateContext().layoutDetails.inc_Select2 = true;
        var outputHTML = createObject( "java", "java.lang.StringBuilder" ).init( "" );
        outputHTML.append( '<div class="input-group">' );
            outputHTML.append( '<span class="input-group-prepend">' );
                outputHTML.append( '<button class="btn bd" type="button" onclick="$(''###name#'').datepicker(''show'');"><i class="fa-solid fa-calendar-days"></i></button>' );
            outputHTML.append( '</span>' );
            outputHTML.append( '<input type="text" value="#value#" id="#name#" name="#name#" class="form-control fc-datepicker" placeholder="#placeHolder#">' );
            if( clearBtn ){
                outputHTML.append( '<span class="input-group-btn">' );
                    outputHTML.append( '<button class="btn bd bd-l-0 bg-white tx-gray-600" type="button" onclick="$(''###name#'').val('''');"><i class="fa-solid fa-square-minus"></i></button>' );    
                outputHTML.append( '</span>' );
            }
        outputHTML.append( '</div>' );
        outputHTML.append( '<script>' );
            outputHTML.append( '$(document).ready(function () {' );
                outputHTML.append( '$("###name#").datepicker({' );
                    outputHTML.append( 'showOtherMonths: true,' );
                    outputHTML.append( 'selectOtherMonths: true' );
                outputHTML.append( '});' );
            outputHTML.append( '}); // onReady()' );
        outputHTML.append( '</script>' );
        return outputHTML.toString();
    } // datePicker()

    function selectOrderStatus(
        required name           =   "status_order",
        required value          =   "",
        required placeholder    =   "Order Status",
        required clearBtn       =   true,
        multiselect             =   false
    ){
        application.cbcontroller.getRequestService().getContext().getPrivateContext().layoutDetails.inc_Select2 = true;
        var outputHTML = createObject( "java", "java.lang.StringBuilder" ).init( "" );
        var orderStatuses = application.cbcontroller.getSetting("orderStatuses");
        var defaultOrderStatus = application.cbcontroller.getSetting("defaultOrderStatus");
        outputHTML.append( '<div class="input-group">' );
            outputHTML.append( '<select id="#name#" name="#name#" class="form-control" data-placeholder="#placeholder#" #( multiselect ?  'multiple="multiple"' : "" )# >' );
                outputHTML.append( '<option label="#placeholder#"></option>' );
                orderStatuses.each( function( key, keyValue ) {
                    outputHTML.append( '<option value="#key#" ' );
                    if( listFindNoCase( lcase(value) , lcase(key) ) ){
                        outputHTML.append( ' selected="selected" ' ); 
                    }
                    outputHTML.append( '>#key#</option>' );
                });
            outputHTML.append( '</select>' );
            if( clearBtn ){
                outputHTML.append( '<span class="input-group-btn">' );
                    outputHTML.append( '<button class="btn bd bd-l-0 bg-white tx-gray-600" type="button" onclick="$(''###name#'').val('''').trigger(''change'');"><i class="fa-solid fa-square-minus"></i></button>' );    
                outputHTML.append( '</span>' );
            }
        outputHTML.append( '</div>' );

        outputHTML.append( '<script>' );
            outputHTML.append( '$(document).ready(function () {' );
                outputHTML.append( '$("###name#").select2({' );
                    outputHTML.append( 'minimumResultsForSearch: Infinity,' );
                    outputHTML.append( 'placeholder: "#placeHolder#",' );
                outputHTML.append( '});' );            
            outputHTML.append( '}); // onReady()' );
        outputHTML.append( '</script>' );
        return outputHTML.toString();
    } //selectOrderStatus()

    function selectPaymentStatus(
        required name           =   "status_payment",
        required value          =   "",
        required placeholder    =   "Payment Status",
        required clearBtn       =   true,
        multiselect             =   false
    ){
        application.cbcontroller.getRequestService().getContext().getPrivateContext().layoutDetails.inc_Select2 = true;
        var outputHTML = createObject( "java", "java.lang.StringBuilder" ).init( "" );
        var paymentStatuses = application.cbcontroller.getSetting("paymentStatuses");
        var defaultPaymentStatus = application.cbcontroller.getSetting("defaultPaymentStatus");
        outputHTML.append( '<div class="input-group">' );
            outputHTML.append( '<select id="#name#" name="#name#" class="form-control" data-placeholder="#placeholder#" #( multiselect ?  'multiple="multiple"' : "" )# >' );
                outputHTML.append( '<option label="#placeholder#"></option>' );
                paymentStatuses.each( function( key, keyValue ) {
                    outputHTML.append( '<option value="#key#" ' );
                    if( listFindNoCase( lcase(value) , lcase(key) ) ){ 
                        outputHTML.append( ' selected="selected" ' ); 
                    }
                    outputHTML.append( '>#key#</option>' );
                });
            outputHTML.append( '</select>' );
            if( clearBtn ){
                outputHTML.append( '<span class="input-group-btn">' );
                    outputHTML.append( '<button class="btn bd bd-l-0 bg-white tx-gray-600" type="button" onclick="$(''###name#'').val('''').trigger(''change'');"><i class="fa-solid fa-square-minus"></i></button>' );    
                outputHTML.append( '</span>' );
            }
        outputHTML.append( '</div>' );

        outputHTML.append( '<script>' );
            outputHTML.append( '$(document).ready(function () {' );
                outputHTML.append( '$("###name#").select2({' );
                    outputHTML.append( 'minimumResultsForSearch: Infinity,' );
                    outputHTML.append( 'placeholder: "#placeHolder#",' );
                outputHTML.append( '});' );            
            outputHTML.append( '}); // onReady()' );
        outputHTML.append( '</script>' );
        return outputHTML.toString();
    } //selectPaymentStatus()

    function input(
        required name,
        type		=	"text",
        value		=	"",
        placeholder	=	"",
		isRequired	=	false,
        clearBtn	=	true,
		igPrepend	=	"",
		mask		=	"",
		formID		=	""
    ){
        // application.cbcontroller.getRequestService().getContext().getPrivateContext().layoutDetails.inc_Select2 = true;
        var outputHTML = createObject( "java", "java.lang.StringBuilder" ).init( "" );
        outputHTML.append( '<div class="input-group">' );
			if( len(igPrepend) ){
				outputHTML.append( '<div class="input-group-prepend">' );
					outputHTML.append( '<div class="input-group-text">' );
						outputHTML.append( igPrepend );
					outputHTML.append( '</div>' );
				outputHTML.append( '</div>' );
			}
            outputHTML.append( '<input class="form-control" type="#type#" name="#name#" id="#name#" value="#value#" #( isRequired ? "required":"")# placeholder="#placeholder#">' );
            if( clearBtn ){
                outputHTML.append( '<span class="input-group-btn">' );
                    outputHTML.append( '<button class="btn bd bd-l-0 bg-white tx-gray-600" type="button" onclick="$(''###name#'').val('''');"><i class="fa-solid fa-square-minus"></i></button>' );    
                outputHTML.append( '</span>' );
            }
        outputHTML.append( '</div>' );
		if( len(mask) ){
			application.cbcontroller.getRequestService().getContext().getPrivateContext().layoutDetails.inc_inputMask = true;
			outputHTML.append( '<script>' );
				outputHTML.append( '$(document).ready(function () {' );
					outputHTML.append( '$("#(len(formID) ? formID & " ":"")####name#").mask("#mask#");' );
				outputHTML.append( '}); // onReady()' );
			outputHTML.append( '</script>' );
		}
        return outputHTML.toString();
    }

    function toggle(
        required name,
        required value="1",
        required onText="Yes",
        required offText="No",
        required checked=false,
        required onToggle=""
    ){
        var outputHTML = createObject( "java", "java.lang.StringBuilder" ).init( "" );
        outputHTML.append( '<div class="toggle-wrapper">' );
            outputHTML.append( '<div class="toggle-modern success" id="#name#__Toggle" data-checbox-id="#name#"></div>' );
        outputHTML.append( '</div>' );
        outputHTML.append( '<input type="checkbox" id="#name#" name="#name#" value="#value#" style="display: none;"' );
        if( checked ){ 
            outputHTML.append( ' checked ' ); 
        }
        outputHTML.append( '>' );
        outputHTML.append( '<script>' );
            outputHTML.append( '$(document).ready(function () {' );
                outputHTML.append( '$("###name#__Toggle").toggles({' );
                    outputHTML.append( 'text: { on: "#onText#", off: "#offText#" },' );
                    outputHTML.append( 'checkbox: $("###name#"),' );
                    outputHTML.append( 'on: #( checked ? "true" : "false" )#,' );
                    outputHTML.append( 'height: 26,' );
                    outputHTML.append( 'width: 75' );
                outputHTML.append( '});' );
                if( len(onToggle) ){
                    outputHTML.append( '$("###name#__Toggle").on("toggle", #onToggle#);' );
                }
            outputHTML.append( '}); // onReady()' );
        outputHTML.append( '</script>' );
        return outputHTML.toString();
    } // toggle()

    function textarea(
        required name,
        value		=	"",
        placeholder	=	"",
		rows		=	3,
		isRequired	=	false
    ){
        // application.cbcontroller.getRequestService().getContext().getPrivateContext().layoutDetails.inc_Select2 = true;
        var outputHTML = createObject( "java", "java.lang.StringBuilder" ).init( "" );
        outputHTML.append( '<div class="input-group">' );
			outputHTML.append( '<textarea rows="#rows#" name="#name#" id="#name#" class="form-control" #( isRequired ? "required":"")# placeholder="#placeholder#">#value#</textarea>' );
        outputHTML.append( '</div>' );
        return outputHTML.toString();
    }

	function select2Items(
		required name,
        selectedID     			= 0,
        placeholder    			= "Items",
        clearBtn       			= true,
        onSelect                = "", // jsFunction name or anonymous function
        onUnSelect              = "", // jsFunction name or anonymous function
        formatter       		= "", // jsFunction name for formatter function
        matcher                 = ""  // jsFunction name for matcher function 
	){
		var fullCatalog = wirebox.getInstance("itemUtilities").getProductCatalogData();
		var select2Data = [];
		var indentLevel = 0;
		for( var item IN fullCatalog ){
			select2Data.append({
				"QtyOnHand"		:	( item.keyExists("QtyOnHand") ? item.QtyOnHand : 0 ),
				"description"	:	( item.keyExists("description") ? item.description : "" ),
				"isCat"			:	item.isCat,
				"UnitPrice"		:	( item.keyExists("UnitPrice") ? item.UnitPrice : 0 ),
				"text"			:	item.name,
				"id"			:	item.id,
				"sku"			:	( item.keyExists("sku") ? item.sku : "" ),
				"name"			:	item.name,
				"disabled"		:	( item.isCat ? true : false ),
				"indentSize"	:	"#indentLevel * 10#px"
			});
			if( item.cats.len() ){
				select2Data.append( select2Items_Add( item.cats, duplicate(indentLevel) ), true );
			}
			if( item.items.len() ){
				select2Data.append( select2Items_Add( item.items, duplicate(indentLevel) ), true );
			}
		}
		formatter = 'function(item){
			if( item.hasOwnProperty("loading") ){
				return item.text;
			}
			var jqElementString = "";
			jqElementString += ''<span style="padding-left: '' + item.indentSize + '';'';
			if ( item.isCat ) {
					jqElementString += ''font-weight: 800;'';
			}
			jqElementString += ''">'' + item.text;
			if( item.description.length ){
				jqElementString += '' | '' + item.description;
			}
			jqElementString += ''</span>'';
			return $(jqElementString);
		}';
		return $insertSelect2( name, selectedID, placeHolder, select2Data, clearBtn, onSelect, onUnSelect, formatter );
	}

	function select2Items_Add( inData, indentLevel="" ){
		var outArray = [];
		indentLevel++;
		for( var item IN inData ){
			outArray.append({
				"QtyOnHand"		:	( item.keyExists("QtyOnHand") ? item.QtyOnHand : 0 ),
				"description"	:	( item.keyExists("description") ? item.description : "" ),
				"isCat"			:	item.isCat,
				"UnitPrice"		:	( item.keyExists("UnitPrice") ? item.UnitPrice : 0 ),
				"text"			:	item.name,
				"id"			:	item.id,
				"sku"			:	( item.keyExists("sku") ? item.sku : "" ),
				"name"			:	item.name,
				"disabled"		:	( item.isCat ? true : false ),
				"indentSize"	:	"#indentLevel * 10#px"
			});
			if( item.cats.len() ){
				outArray.append( select2Items_Add( item.cats, duplicate(indentLevel) ), true );
			}
			if( item.items.len() ){
				outArray.append( select2Items_Add( item.items, duplicate(indentLevel) ), true );
			}
		}
		return outArray;
	}

	function dataTables_items(){
		var fullCatalog = wirebox.getInstance("itemUtilities").getProductCatalogData();
		this.dataTablesCatRows = fullCatalog[1]["maxCatDepth"];
		var theRows = dataTables_items_buildRows( fullCatalog );
		return theRows;
	} // dataTablesItems()

	function dataTables_items_buildRows( required inArray ){
		var tableRows = [];
		for( var item IN inArray ){
			if( !item.isCat ){
				tableRows.append({
					"QtyOnHand"		:	( item.keyExists("QtyOnHand") ? item.QtyOnHand : 0 ),
					"description"	:	( item.keyExists("description") ? item.description : "" ),
					"isCat"			:	item.isCat,
					"UnitPrice"		:	( item.keyExists("UnitPrice") ? item.UnitPrice : 0 ),
					"text"			:	item.name,
					"id"			:	item.id,
					"sku"			:	( item.keyExists("sku") ? item.sku : "" ),
					"name"			:	item.name,
					"disabled"		:	( item.isCat ? true : false ),
					"catPath"		:	item.catPath
				});
			}
			if( item.cats.len() ){
				tableRows.append( dataTables_items_buildRows( item.cats ), true );
			}
			if( item.items.len() ){
				tableRows.append( dataTables_items_buildRows( item.items ), true );
			}
		}
		return tableRows;
	}

	function linkIconRound(
		required link,
        linkClass           = "",
        divClass            = "",
		iconClass 			= "fa-solid fa-pen-to-square",
		colorClass			= "primary",
		tooltip				= "",
		tooltipPlacement	= "top",
		target				= "_self"
	){	
		var toolTipHTML = createObject( "java", "java.lang.StringBuilder" ).init( "" );
		if( len(tooltip) ){
			toolTipHTML.append( 'title="#tooltip#" data-placement="#tooltipPlacement#" data-toggle="tooltip#( len(colorClass) ? "-#colorClass#" : "" )#"' )
		}
		var outputHTML = createObject( "java", "java.lang.StringBuilder" ).init( "" );
		outputHTML.append('<a href="#link#" class="btn btn-outline-#colorClass# btn-icon rounded-circle #linkClass#" target="#target#" #toolTipHTML.toString()#>');
		outputHTML.append('<div class="#divClass#">');
		outputHTML.append('<i class="#iconClass#"></i>');
		outputHTML.append('</div>');
		outputHTML.append('</a>');
		return outputHTML.toString();
	} // linkIconRound

	function buttonIconRound(
		required onclick,
        buttonClass         = "",
        divClass            = "",
		iconClass 			= "fa-solid fa-pen-to-square",
		colorClass			= "primary",
		tooltip				= "",
		tooltipPlacement	=	"top"
		
	){	
		var toolTipHTML = createObject( "java", "java.lang.StringBuilder" ).init( "" );
		if( len(tooltip) ){
			toolTipHTML.append( 'title="#tooltip#" data-placement="#tooltipPlacement#" data-toggle="tooltip#( len(colorClass) ? "-#colorClass#" : "" )#"' )
		}
		var outputHTML = createObject( "java", "java.lang.StringBuilder" ).init( "" );
		// outputHTML.append('<a href="#link#" class="btn btn-outline-#colorClass# btn-icon rounded-circle" #toolTipHTML.toString()#>');
		outputHTML.append( '<button type="button" onclick="#onclick#" class="btn btn-outline-#colorClass# btn-icon rounded-circle #buttonClass#" #toolTipHTML.toString()# >' );
		outputHTML.append('<div class="#divClass#">');
		outputHTML.append('<i class="#iconClass#"></i>');
		outputHTML.append('</div>');
		outputHTML.append('</button>');
		//outputHTML.append('</a>');
		return outputHTML.toString();
	} // buttonIconRound

	function iconLink(
		required link,
		iconClass 			= "fa-solid fa-pen-to-square",
		colorClass			= "primary",
		tooltip				= "",
		tooltipPlacement	= "top",
		target				= "_self"
		
	){	
		var toolTipHTML = createObject( "java", "java.lang.StringBuilder" ).init( "" );
		if( len(tooltip) ){
			toolTipHTML.append( 'title="#tooltip#" data-placement="#tooltipPlacement#" data-toggle="tooltip#( len(colorClass) ? "-#colorClass#" : "" )#"' )
		}
		var outputHTML = createObject( "java", "java.lang.StringBuilder" ).init( "" );
		outputHTML.append('<a href="#link#" target="#target#" class="tx-#colorClass#" #toolTipHTML.toString()#>');
		outputHTML.append('<i class="#iconClass#"></i>');
		outputHTML.append('</a>');
		return outputHTML.toString();
	} // iconLink()
	
	/**
	 * Used to output the actual Select2. Functions above just prepare data to be passed
     * to $insertSelect2 based on entity type. input data is an array of structs ie:
     * [ { "text" : "Option Text", "id" : "Entity ID" } ]
	 */
    function $insertSelect2(
        required name,
        required inputSelectedID=0,
        required placeHolder    ="",
        required inputData      =[],
        required clearBtn       =true,
        onSelect                = "", // jsFunction name or anonymous function
        onUnSelect              = "", // jsFunction name or anonymous function
        formatter       		= "", // jsFunction name for formatter function
        matcher                 = ""  // jsFunction name for matcher function 
    ){        
        // get prc then set so we have access to prc later
        // var prc = application.cbcontroller.getRequestService().getContext().getPrivateContext();
        // prc.layoutDetails.inc_Select2 = true;
        // inline method if we don't need prc later
        application.cbcontroller.getRequestService().getContext().getPrivateContext().layoutDetails.inc_Select2 = true;
        var outputHTML = createObject( "java", "java.lang.StringBuilder" ).init( "" );

        outputHTML.append( '<div class="input-group">' );
            outputHTML.append( '<select class="form-control" name="#name#" id="#name#" >' );
                outputHTML.append( '<option label="#placeHolder#"></option>' );
            outputHTML.append( '</select>' );
            if( clearBtn ){
                outputHTML.append( '<span class="input-group-btn">' );
                    outputHTML.append( '<button class="btn bd bd-l-0 bg-white tx-gray-600" type="button" onclick="$(''###name#'').val(''0'').trigger(''change'');"><i class="fa-solid fa-square-minus"></i></button>' );    
                outputHTML.append( '</span>' );
            }
        outputHTML.append( '</div>' );
        outputHTML.append( '<script>' );
            outputHTML.append( '$(document).ready(function () {' );
                outputHTML.append( '$("###name#").select2({' );
                    outputHTML.append( 'minimumResultsForSearch: "",' );
                    outputHTML.append( 'minimumInputLength: 0,' );
					if( len(formatter) ){
						outputHTML.append( 'templateResult: #formatter#,' );
					}
					if( len(matcher) ){
						outputHTML.append( 'matcher: #matcher#,' );
					}
                    outputHTML.append( 'placeholder: "#placeHolder#",' );
                    outputHTML.append( 'data: #serializeJSON( inputData )#' );
				outputHTML.append( '});' );
				// outputHTML.append( '$("###name#").on("select2:select", function (e) {' );
				// 	outputHTML.append( 'var data = e.params.data;' );
				// outputHTML.append( '});' );
                if( len(onSelect) ){
                    outputHTML.append( '$("###name#").on("select2:select", #onSelect# );' );
                }
                if( len(onUnSelect) ){
                    outputHTML.append( '$("###name#").on("select2:unselect", #onUnSelect# );' );
                }
				outputHTML.append( '$("###name#").val("#inputSelectedID#");' );
                outputHTML.append( '$("###name#").trigger("change");' );
            outputHTML.append( '}); // onReady()' );
        outputHTML.append( '</script>' );
        return outputHTML.toString();
    } //  $insertSelect2()
    
    function helpIcon( text ){
        return '<div class="helpToolipIcon" data-html="true" data-toggle="tooltip" data-placement="top" title="#encodeForHTMLAttribute(text)#"><i class="far fa-question-circle"></i></div>';
    } // helpIcon()

    function addToolTip( required text, placement="top" ){
        return 'data-toggle="tooltip" data-html="true" data-placement="#encodeForHTMLAttribute(placement)#" title="#encodeForHTMLAttribute(text)#"';
    } // addToolTip()

    function getLoader(){
        return '<div class="d-flex ht-100 pos-relative align-items-center">
                    <div class="sk-wave">
                        <div class="sk-rect sk-rect1" style="background-color: var(--indigo);"></div>
                        <div class="sk-rect sk-rect2" style="background-color: var(--indigo);"></div>
                        <div class="sk-rect sk-rect3" style="background-color: var(--indigo);"></div>
                        <div class="sk-rect sk-rect4" style="background-color: var(--indigo);"></div>
                        <div class="sk-rect sk-rect5" style="background-color: var(--indigo);"></div>
                    </div>
                </div>';
    } // getLoader

    function hanldeFlashToastr( boolean wrapInOnReady=true ){
        var toastrHTML = createObject( "java", "java.lang.StringBuilder" ).init( "" );
        if( flash.exists("toastr") ){
				var toastr      = flash.get("toastr");
                toastr.type     = toastr.keyExists("type") ? toastr.type : "success";
                toastr.title    = toastr.keyExists("title") ? toastr.title : "";
                toastr.timeout  = toastr.keyExists("timeout") ? toastr.timeout : 30000;
                toastrHTML.append("<script>");
                if( wrapInOnReady ){
                    toastrHTML.append("$(function(){");
                }
                toastrHTML.append("toastr['#toastr.type#']('#toastr.msg#','#toastr.title#', { timeOut: #toastr.timeout# , 'progressBar': true });");
                if( wrapInOnReady ){
                    toastrHTML.append("});");
                }
                toastrHTML.append("</script>");	
        }
        return toastrHTML.toString();
    } // hanldeFlashToastr()


	/**
	 * Facade to CFML htmlHead
	 */
	private function $htmlHead( required content ){
		cfhtmlhead( text = "#arguments.content#" );
		return this;
	} // $htmlHead()
    
	/**
	 * Facade to htmlHelper
	 */
    public function onMissingMethod(missingMethodName, missingMethodArguments) {
        var returnData = javaCast( "null", "" );
        try{
            cfinvoke(
                component           =   html,
                method              =   missingMethodName,
                returnVariable      =   "returnData",
                argumentCollection  =   missingMethodArguments
            );
        }catch(any e){
            returnData = "Error: #e.message#";
        }
        return returnData;
    } // onMissingMethod()

}