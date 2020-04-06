<!doctype html>
<html class="no-js" lang="en">
<style>
.account-container {
    width: 360px;
    margin: 0 auto;
    padding: 40px 0 70px;
}

.account-signup {
    width: 380px;
}

.ridi-input-wrapper {
    display: block;
    position: relative;
    width: 100%;
    margin-bottom: -1px;
}

.account-signup .account-form .account-form-wrapper {
    padding: 10px 10px 15px;
}
</style>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Shards Demo - A free and modern UI toolkit for web makers</title>
<meta name="description"
	content="A free and modern UI toolkit for web makers based on the popular Bootstrap 4 framework.">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/shards.min.css?v=3.0.0">
<link rel="stylesheet" href="css/shards-demo.min.css?v=3.0.0">
</head>

<body>

	<!-- Form Controls -->
	<div id="forms" class="container">
		<div class="section-title col-lg-8 col-md-10 ml-auto mr-auto"></div>

		<!-- Form Controls - Simple Forms: Default / Using Icons (Seamless) -->
		<div class="example col-md-10 ml-auto mr-auto">
			<h5>Simple Forms</h5>


			<!-- Form Controls: Using Icons -->
			<h5 class="mb-4">Using Icons</h5>

			<!-- Form Controls: Using Icons - Seamless -->
			<div class="row">
				<div class="col-12">
					<h6 class="text-muted">Seamless</h6>
					<form>
						<div class="row">
							<div class="form-group col-md-6">
								<div class="input-group input-group-seamless">
									<span class="input-group-prepend"> <span
										class="input-group-text"> <i class="fa fa-user"></i>
									</span>
									</span> <input type="text" class="form-control" id="form1-username"
										placeholder="Username">
								</div>
							</div>
							<div class="form-group col-md-6">
								<div class="input-group input-group-seamless">
									<span class="input-group-append"> <span
										class="input-group-text"> <i class="fa fa-lock"></i>
									</span>
									</span> <input type="password" class="form-control"
										id="form2-password" placeholder="Password">
								</div>
							</div>
						</div>
							<div class="row">
							<div class="form-group col-md-6">
								<div class="input-group input-group-seamless">
									<span class="input-group-prepend"> <span
										class="input-group-text"> <i class="fa fa-user"></i>
									</span>
									</span> <input type="text" class="form-control" id="form1-username"
										placeholder="Username">
								</div>
							</div>
							<div class="form-group col-md-6">
								<div class="input-group input-group-seamless">
									<span class="input-group-append"> <span
										class="input-group-text"> <i class="fa fa-lock"></i>
									</span>
									</span> <input type="password" class="form-control"
										id="form2-password" placeholder="Password">
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>


		<div class="row">
			<div class="col-12">
				<h5 class="mb-4">Validation</h5>
				<p class="mb-4">Form validation is also improved to match the
					new overall form feel, while following the same interaction
					principles for consistency.</p>
				<form class="was-validated">
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="form-2-first-name">First name</label> <input
								type="text" class="form-control is-valid" id="form-2-first-name"
								placeholder="First name" value="Catalin" required>
						</div>
						<div class="col-md-6 mb-3">
							<label for="form-2-last-name">Last name</label> <input
								type="text" class="form-control is-valid" id="form-2-last-name"
								placeholder="Last name" value="Vasile" required>
						</div>
					</div>

					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="form-2-city">City</label> <input type="text"
								class="form-control is-invalid" id="form-2-city"
								placeholder="City" required>
							<div class="invalid-feedback">Invalid city</div>
						</div>
						<div class="col-md-3 mb-3">
							<label for="form-2-state">State</label> <input type="text"
								class="form-control is-invalid" id="form-2-state"
								placeholder="State" required>
							<div class="invalid-feedback">Invalid state</div>
						</div>
						<div class="col-md-3 mb-3">
							<label for="form-2-zip">Zip</label> <input type="text"
								class="form-control is-invalid" id="form-2-zip"
								placeholder="Zip" required>
							<div class="invalid-feedback">Invalid ZIP code</div>
						</div>
					</div>

					<div class="row mb-2">
						<div class="col-md-6 mb-3">
							<label for="form-file-4">Photo ID Scan</label>
							<div class="custom-file w-100">
								<input type="file" class="custom-file-input" id="customFile2"
									required> <label class="custom-file-label"
									for="customFile2">Choose file...</label>
							</div>
						</div>
						<div class="col-md-6 mb-3">
							<label class="d-block" for="form-3-select">Favourite
								Number</label> <select class="custom-select w-100" id="form-3-select"
								required>
								<option value="">Invalid select menu</option>
								<option value="1">One</option>
								<option value="2">Two</option>
								<option value="3">Three</option>
							</select>
						</div>
					</div>

					<div class="row">
						<div class="col-md-6">
							<div class="custom-control custom-checkbox mb-3">
								<input type="checkbox" class="custom-control-input"
									id="form-3-terms" required> <label
									class="custom-control-label" for="form-3-terms">Do you
									agree to our terms & conditions?</label>
							</div>
						</div>

						<div class="col-md-6">
							<div class="custom-controls-stacked d-block">
								<div class="custom-control custom-radio mb-1">
									<input type="radio" id="radioStacked1" name="radio-stacked"
										class="custom-control-input" required> <label
										class="custom-control-label" for="radioStacked1">Subscribe
										me</label>
								</div>
								<div class="custom-control custom-radio">
									<input type="radio" id="customRadio5" name="radio-stacked"
										class="custom-control-input" required> <label
										class="custom-control-label" for="customRadio5">Don't
										subscribe me</label>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	</div>

	<!-- Sliders -->


	<footer class="main-footer py-5">
		<p class="text-muted text-center small p-0 mb-4">&copy; Copyright
			2018 — DesignRevision</p>
		<div class="social d-table mx-auto">
			<a class="twitter mx-3 h4 d-inline-block text-secondary"
				href="https://twitter.com/DesignRevision" target="_blank"> <i
				class="fa fa-twitter"></i> <span class="sr-only">View our
					Twitter Profile</span>
			</a> <a class="facebook mx-3 h4 d-inline-block text-secondary"
				href="https://www.facebook.com/designrevision" target="_blank">
				<i class="fa fa-facebook"></i> <span class="sr-only">View our
					Facebook Profile <span>
			</a> <a class="github mx-3 h4 d-inline-block text-secondary"
				href="https://github.com/designrevision" target="_blank"> <i
				class="fa fa-github"></i> <span class="sr-only">View our
					GitHub Profile</span>
			</a>
		</div>
	</footer>
	</div>

	<!-- JavaScript -->
	<div id="fb-root"></div>
	<script async defer src="https://buttons.github.io/buttons.js"></script>
	<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
		integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
	<script src="js/shards.min.js"></script>
	<script src="js/demo.min.js"></script>

</body>

</html>
