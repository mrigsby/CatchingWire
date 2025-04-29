<cfoutput>
    <h3>Lost Password</h3>
	<p>Enter your email address below and click "Reset Password"</p>
    <form method="POST" id="frmLostPass"  action="#event.buildLink( "lost-password" )#"  class="mg-b-30">
        <input type="hidden" name="_token" value="#csrfGenerateToken()#" />
        <div class="form-group">
            <label for="email">Email Address:</label>
            <input name="email" type="email" class="form-control" id="email" />
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-primary">Reset Password</button>
        </div>
    </form>

	<a href="/login"><i class="fa-solid fa-angle-left"></i> Return to Login</a>

	<script>
		$(function() {

			$("##frmLostPass").submit(function(event){
				event.preventDefault(); //prevent default action
				toastr.clear();

				var email = $("##email").val();
				if( email.length === 0 ){
					toastr.error( 'Please enter a valid email address', 'Error', { timeOut: 30000, progressBar : true } );
					return;
				}

				var post_url = $(this).attr("action"); //get form action url
				var form_data = $(this).serialize(); //Encode form elements for submission
				$.post( post_url, form_data, function( data ) {
					console.log( data );
					if( data.success ){
						$("##email").val("");
						toastr.success(  data.msg, 'Success!', { timeOut: 30000, progressBar : true } );
					}else{
						toastr.error(  data.msg, 'Error', { timeOut: 30000, progressBar : true } );
					}
				});

			});

		});  // onready
	</script>
</cfoutput>
