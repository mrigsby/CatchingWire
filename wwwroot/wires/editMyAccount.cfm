<cfoutput>
	<div class="wireOuterWrapper">
		<div class="card card-success card-outline mb-4">
			<div class="card-header">
				<div class="card-title">My Account</div>
			</div>

			<form novalidate="" name="frmMyAccount" id="frmMyAccount" wire:submit="saveAccount">
				<div class="card-body">
					<div class="row g-3">
						<div class="col-md-6">
							<label for="fname" class="form-label">First name</label>
							<input type="text" class="form-control" id="fname" name="fname" wire:model="fname">
							<div class="invalid-feedback">First Name is required.</div>
						</div>

						<div class="col-md-6">
							<label for="lname" class="form-label">Last name</label>
							<input type="text" class="form-control" id="lname" name="lname" wire:model="lname">
							<div class="invalid-feedback">Last Name is required.</div>
						</div>

						<div class="col-md-12">
							<label for="title" class="form-label">Title</label>
							<input type="text" class="form-control" id="title" name="title" wire:model="title">
						</div>
					</div>
				</div>

				<div class="card-footer">
					<button class="btn btn-success" type="submit">Save</button>
				</div>
			</form>
		</div>

		<div class="card card-warning card-outline mb-4">
			<div class="card-header">
				<div class="card-title">Change Password</div>
			</div>

			<form novalidate="" name="frmChangePassword" id="frmChangePassword" wire:submit="changePassword">
				<div class="card-body">

					<div class="row g-3">
						<div class="col-md-6">
							<label for="currentPasswordConfirm" class="form-label">Current Password</label>
							<input
								type ="password"
								class="form-control" id="currentPasswordConfirm"
								name ="currentPasswordConfirm"
								value=""
								wire:model="currentPasswordConfirm"
							>
							<div class="invalid-feedback">Enter your current password.</div>
						</div>

						<div class="w-100"></div>

						<div class="col-md-6">
							<label for="newPassword" class="form-label">New Password</label>
							<input
								type ="password"
								class="form-control" id="newPassword"
								name ="newPassword"
								value=""
								wire:model="newPassword"
							>
						</div>

						<div class="col-md-6">
							<label for="newPasswordConfirm" class="form-label">Confirm New Password</label>
							<input
								type ="password"
								class="form-control" id="newPasswordConfirm"
								name ="newPasswordConfirm"
								value=""
								wire:model="newPasswordConfirm"
							>
						</div>
					</div>
				</div>

				<div class="card-footer">
					<button class="btn btn-warning" type="submit">Change Password</button>
				</div>
			</form>
		</div>
		<script>
			document.addEventListener('livewire:init', () => {
				Livewire.hook('component.init', ({ component, cleanup }) => {
					if( component.id === '#_getID()#' ) window.__editMyAccount = component.$wire;
				});
			});
		</script>
	</div>
	<!--- /.wireOuterWrapper --->
</cfoutput>
