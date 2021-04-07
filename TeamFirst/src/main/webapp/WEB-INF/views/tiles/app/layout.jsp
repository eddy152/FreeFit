<%@page language="java" contentType="text/html; charset=UTF-8"%>

<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.80.0">
<title>app</title>

<!-- <link rel="canonical"
	href="https://getbootstrap.com/docs/4.6/examples/pricing/">
 -->


<!-- Bootstrap core CSS -->
<link href="./resources/assets/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>
<link href="./resources/assets/dist/css/dashboard.css" rel="stylesheet">
</head>
<body>


	<tiles:insertAttribute name="header"/>

	<div class="container-fluid">
		<div class="row">
			<tiles:insertAttribute name="side" />
			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
				<div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
					<tiles:insertAttribute name="content" />
				</div>
			</main>
		</div>
	</div>


	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>

	<script src="./resources/assets/dist/js/bootstrap.bundle.min.js"></script>


	<script
		src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"></script>
	<script src="./resources/assets/dist/js/dashboard.js"></script>
</body>
</html>
