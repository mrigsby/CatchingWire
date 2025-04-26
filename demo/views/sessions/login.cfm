<cfoutput>

	<p class="login-box-msg">
		<cfif prc.errors.keyExists( "login" )>
			<div class="alert alert-danger m-0">#prc.errors.login#</div>
		<cfelse>
			Sign in to start your session
		</cfif>
	</p>

	<form action="#event.buildLink( "login" )#" id="frmLogin" name="frmLogin" method="post">

		<input type="hidden" name="_token" value="#csrfGenerateToken()#" />

		<div class="input-group mb-1">
			<div class="form-floating">
				<input id="email" name="email" type="email" class="form-control" value="" placeholder="" />
				<label for="email">Email</label>
			</div>
			<div class="input-group-text"><span class="bi bi-envelope"></span></div>
		</div>

		<cfif prc.errors.keyExists( "email" )>
			<small class="form-text text-danger">
				<cfloop array="#prc.errors.email#" index="error">
					<p>#error.message#</p>
				</cfloop>
			</small>
		</cfif>

		<div class="input-group mb-1">
			<div class="form-floating">
				<input id="password" name="password" type="password" class="form-control" placeholder="" />
				<label for="password">Password</label>
			</div>
			<div class="input-group-text"><span class="bi bi-lock-fill"></span></div>
		</div>

		<cfif prc.errors.keyExists( "password" )>
			<small class="form-text text-danger">
				<cfloop array="#prc.errors.password#" index="error">
					<p>#error.message#</p>
				</cfloop>
			</small>
		</cfif>

		<!--begin::Row-->
		<div class="row">
			<div class="col-12">
				<div class="d-grid gap-2">
					<button type="submit" class="btn btn-primary">Sign In</button>
				</div>
			</div>
			<!-- /.col -->
		</div>
		<!--end::Row-->
	</form>

	<p class="mt-3"><a href="/lost-password">I forgot my password</a></p>

	<!--- Auto Login Demo User with CMD+l --->
	<cfif
		( getSystemSetting( "ENVIRONMENT", "" ) EQ "development" )
		AND isValid( "email", getSystemSetting( "DEMO_USER_EMAIL", "" ) )
		AND len( getSystemSetting( "DEMO_USER_PASSWORD", "" ) ) >
		<script>
			document.addEventListener('keydown', function(event) {
				if ( event.metaKey && event.key === 'l' ) {
					document.getElementById('email').value = '#getSystemSetting( "DEMO_USER_EMAIL", "" )#';
					document.getElementById('password').value = '#getSystemSetting( "DEMO_USER_PASSWORD", "" )#';
					document.getElementById('frmLogin').submit();
				}
			});
		</script>
	</cfif>

</cfoutput>
