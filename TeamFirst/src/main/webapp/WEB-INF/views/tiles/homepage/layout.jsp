<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
<title>homepage</title>

<!-- <link rel="canonical"
	href="https://getbootstrap.com/docs/4.6/examples/pricing/">
 -->


<!-- Bootstrap core CSS -->
<link href="./resources/assets/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="./resources/assets/dist/css/pricing.css" rel="stylesheet">

<!-- Custom styles for this template -->
<!-- <link href="pricing.css" rel="stylesheet"> -->
</head>
<body>

			<tiles:insertAttribute name="header" />

	<div class="container">
			<tiles:insertAttribute name="content" />
	</div>

			<tiles:insertAttribute name="footer" />



</body>
</html>
