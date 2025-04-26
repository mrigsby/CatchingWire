<cfoutput>
<!doctype html>
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>#prc.keyExists("metaTitle") ? prc.metaTitle : "Catching Wire"#</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

		<meta name="title" content="#prc.keyExists("metaTitle") ? prc.metaTitle : "Catching Wire"#" />
		<meta name="author" content="#prc.keyExists("metaAuthor") ? prc.metaAuthor : "Michael Rigsby"#" />
		<meta name="description" content="#prc.keyExists("metaDescription") ? prc.metaDescription : "Catching Wire Session Presentation Demo"#" />
		<meta name="keywords" content="#prc.keyExists("metaKeywords") ? prc.metaKeywords : "cbwire coldbox intothebox ITB ITB2025"#" />

		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fontsource/source-sans-3@5.0.12/index.css" integrity="sha256-tXJfXfp6Ewt1ilPzLDtQnJV4hclT9XuaZUKyUvmyr+Q=" crossorigin="anonymous" />
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/overlayscrollbars@2.10.1/styles/overlayscrollbars.min.css" integrity="sha256-tZHrRjVqNSRyWg2wbppGnT833E/Ys0DHWGwT04GiqQg=" crossorigin="anonymous" />
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" integrity="sha256-9kPW/n5nn53j4WMRYAxe9c1rCY96Oogo/MKSVdKzPmI=" crossorigin="anonymous" />
		<link rel="stylesheet" href="/includes/css/adminlte.css" />
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@11.9.0/build/styles/base16/windows-high-contrast.css">
		<!--- <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@11.9.0/build/styles/monokai.css"> --->
		<style>
			.sidebar-menu.nav-child-indent .nav-treeview {
				transition: padding .3s ease-in-out;
				padding-left: 1rem;
			}
		</style>
	</head>
	<body class="layout-fixed sidebar-expand-lg bg-body-tertiary">

		<!---begin::App Wrapper--->
		<div class="app-wrapper">

			<cfinclude template="partials/appHeader.cfm" />
			<cfinclude template="partials/appSidebar.cfm" />

			<!---begin::App Main--->
			<main class="app-main">

				<cfif prc.keyExists("layoutMeta") AND prc.layoutMeta.keyExists("pageTitle") >
					<!---begin::App Content Header--->
					<div class="app-content-header">
						<cfinclude template="partials/pageBreadcrumbBar.cfm" />
					</div><!---end::App Content Header--->
				</cfif>

				<!---begin::App Content--->
				<div class="app-content">
					<div class="container-fluid">
						#view()#
					</div><!--- /.container-fluid --->
				</div><!---end::App Content--->

			</main><!---end::App Main--->

			<cfinclude template="partials/appFooter.cfm" />

		</div><!---end::App Wrapper--->
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
		<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/overlayscrollbars@2.10.1/browser/overlayscrollbars.browser.es6.min.js" integrity="sha256-dghWARbRe2eLlIJ56wNB+b760ywulqK3DzZYEpsg2fQ=" crossorigin="anonymous" ></script>
		<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous" ></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous" ></script>
		<script src="https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@11.9.0/build/highlight.min.js"></script>
		<script src="/includes/js/adminlte.js"></script>
		<script src="/includes/js/CatchingWire.js"></script>
		<script>
			const SELECTOR_SIDEBAR_WRAPPER = '.sidebar-wrapper';
			const Default = {
				"scrollbarTheme" : 'os-theme-light',
				"scrollbarAutoHide" : 'leave',
				"scrollbarClickScroll" : true
			};
			document.addEventListener( "DOMContentLoaded", function () {

				catchingWire = new CatchingWire();
				catchingWire.initToolTips();

				const sidebarWrapper = document.querySelector( SELECTOR_SIDEBAR_WRAPPER );
				if ( sidebarWrapper && typeof OverlayScrollbarsGlobal?.OverlayScrollbars !== 'undefined' ) {
					OverlayScrollbarsGlobal.OverlayScrollbars( 
						sidebarWrapper, {
							"scrollbars" : {
								"theme" : Default.scrollbarTheme,
								"autoHide" : Default.scrollbarAutoHide,
								"clickScroll" : Default.scrollbarClickScroll
							}
						}
					);
				}
				hljs.highlightAll();
			});
		  </script>
	</body>
</html>
</cfoutput>