<cfoutput>

	<div class="card card-success card-outline mb-4">

		<div class="card-header">
			<div class="card-title">My Account</div>
		</div>

		<form novalidate="" name="frmMyAccount" id="frmMyAccount" method="post" action="">

			<div class="card-body">

				<div class="row g-3">

					<div class="col-md-6">
						<label for="fname" class="form-label">First name</label>
						<input type="text" class="form-control" id="fname" name="fname" value="#prc.oCurrentUser.getFName()#" required="">
						<div class="invalid-feedback">First Name is required.</div>
					</div>

					<div class="col-md-6">
						<label for="lname" class="form-label">Last name</label>
						<input type="text" class="form-control" id="lname" name="lname" value="#prc.oCurrentUser.getLName()#" required="">
						<div class="invalid-feedback">Last Name is required.</div>
					</div>

					<div class="col-md-12">
						<label for="title" class="form-label">Title</label>
						<input type="text" class="form-control" id="title" name="title" value="#prc.oCurrentUser.getTitle()#">
					</div>

				</div>

			</div>

			<div class="card-footer">
				<button class="btn btn-success" type="submit">Save</button>
			</div>

		</form>

	</div>
	<script>
		// Example starter JavaScript for disabling form submissions if there are invalid fields
		( () => {
			'use strict';

			const myAccountForm = document.getElementById('frmMyAccount');
			myAccountForm.addEventListener( 'submit', (event) => {
				event.preventDefault();
				if (!myAccountForm.checkValidity()) {
					event.stopPropagation();
					myAccountForm.classList.add( 'was-validated' );
					return;
				}
				fetch( '#event.buildLink( "my-account" )#', {
					method: 'POST',
					body: new FormData( myAccountForm ),
				} )
				.then( response => response.json() )
				.then( data => {
					if( data.success ){
						Swal.fire({ position: "top-end", icon: "success", title: data.message, showConfirmButton: false, timer: 3000 });
					}else{
						Swal.fire({ position: "top-end", icon: "error", title: data.message, showConfirmButton: false, timer: 3000 });
					}
				} )
				.catch( error => {
					console.error( 'Error:', error );
					Swal.fire({ title: "Network Error", text: "There was a network error. Please refresh the page and try again.", icon: "error" });
				} );
			} );

		} )();
	</script>




	<div class="card card-warning card-outline mb-4">

		<div class="card-header">
			<div class="card-title">Change Password</div>
		</div>

		<form novalidate="" name="frmChangePassword" id="frmChangePassword" method="post" action="">

			<div class="card-body">

				<div class="row g-3">


					<div class="col-md-6">
						<label for="currentPassword" class="form-label">Current Password</label>
						<input type="password" class="form-control" id="currentPassword" name="currentPassword" value="" required="">
						<div class="invalid-feedback">Enter your current password.</div>
					</div>

					<div class="w-100"></div>

					<div class="col-md-6">
						<label for="newPassword" class="form-label">New Password</label>
						<input type="password" class="form-control" id="newPassword" name="newPassword" value="" required="">
					</div>

					<div class="col-md-6">
						<label for="confirmNewPassword" class="form-label">Confirm New Password</label>
						<input type="password" class="form-control" id="confirmNewPassword" name="confirmNewPassword" value="" required="">
					</div>

				</div>

			</div>

			<div class="card-footer">
				<button class="btn btn-warning" type="submit">Change Password</button>
			</div>

		</form>

	</div>
	<script>
		( () => {
			'use strict';

			const changePassForm = document.getElementById('frmChangePassword');
			changePassForm.addEventListener( 'submit', (event) => {
				event.preventDefault();
				if (!changePassForm.checkValidity()) {
					event.stopPropagation();
					changePassForm.classList.add( 'was-validated' );
					return;
				}
				fetch( '#event.buildLink( "my-account.change-password" )#', {
					method: 'POST',
					body: new FormData( changePassForm ),
				} )
				.then( response => response.json() )
				.then( data => {
					console.log( 'Success:', data );
					if( data.success ){
						Swal.fire({ position: "top-end", icon: "success", title: data.message, showConfirmButton: false, timer: 3000 });
					}else{
						Swal.fire({ position: "top-end", icon: "error", title: data.message, showConfirmButton: false, timer: 3000 });
					}
				} )
				.catch( error => {
					console.error( 'Error:', error );
					Swal.fire({ title: "Network Error", text: "There was a network error. Please refresh the page and try again.", icon: "error" });
				} );
			} );

		} )();
	</script>
</cfoutput>