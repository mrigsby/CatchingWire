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
	</head>
	<body class="login-page bg-body-secondary">
		<div class="login-box">
			<div class="card card-outline card-primary">
				<div class="card-header">
					<h2 class="mb-0 text-center">
						<img src="/includes/assets/img/cbWire-Icon.png" alt="Catching Wire" class="img-fluid" style="width: 50px; height: 50px;" />
						<b>Catching</b> 🔥Wire
					</h2>
				</div>
				<div class="card-body login-card-body">
					#renderView()#
				</div><!--- /.login-card-body --->
			</div>
		  </div><!--- /.login-box --->
		  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
		  <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
		  <script src="https://cdn.jsdelivr.net/npm/overlayscrollbars@2.10.1/browser/overlayscrollbars.browser.es6.min.js" integrity="sha256-dghWARbRe2eLlIJ56wNB+b760ywulqK3DzZYEpsg2fQ=" crossorigin="anonymous" ></script>
		  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous" ></script>
		  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous" ></script>
		  <script src="/includes/js/adminlte.js"></script>
		  #prc.htmlUtilities.hanldeFlashToastr()#
	</body>
</html>
</cfoutput>