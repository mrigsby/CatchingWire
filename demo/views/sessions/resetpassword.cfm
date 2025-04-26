<cfoutput>
    <h3>Password Reset</h3>
	<p>Welcome #prc.passwordReset.getUser().getFname()#, please enter your new password in both inputs below and click "Reset Password"</p>
	<!--- <div id="errorWrapper"></div> --->
	<form method="POST" id="frmResetPassword" name="frmResetPassword" action="#event.buildLink( "reset-password.#prc.passwordReset.getUUID()#" )#" class="mg-b-30">
        <input type="hidden" name="_token" value="#csrfGenerateToken()#" />
		<input type="hidden" name="uuid" value="#prc.passwordReset.getUUID()#" >
		<input type="hidden" name="id" value="#prc.passwordReset.getID()#" >
		<input type="hidden" name="userID" value="#prc.passwordReset.getUser().getID()#" >
        <div class="form-group">
            <label for="password">New Password:</label>
            <input name="password" type="password" class="form-control" id="password" />
        </div>
		<div class="form-group">
            <label for="password">Confirm New Password:</label>
            <input name="confirm_password" type="password" class="form-control" id="confirm_password" />
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-primary">Reset Password</button>
        </div>
    </form>

	<a href="/login">Login <i class="fa-solid fa-arrow-right"></i></a>

	<script>
		$(function() {

			$("##frmResetPassword").submit(function(event){
				event.preventDefault(); //prevent default action
				toastr.clear();
				var password = $("##password").val();
				var confirm_password = $("##confirm_password").val();
				if( password != confirm_password ){
					toastr.error( 'Passwords do not match. Please try again.', 'Error', { timeOut: 30000, progressBar : true } );
				}else{
					var post_url = $(this).attr("action"); //get form action url
					var form_data = $(this).serialize(); //Encode form elements for submission
					$.post( post_url, form_data, function( data ) {
						console.log( data );
						if( data.success ){
							location.href = '/';
						}else{
							toastr.error(data.msg, 'Error', { timeOut: 30000, 'progressBar' : true } );
							// appendMessage( data.msg );
						}
					});
				}

			});



		});  // onready
	</script>
</cfoutput>
