<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
<title>로그인</title>



<!-- Bootstrap core CSS -->
<link href="/spring/resources/assets/dist/css/bootstrap.min.css"
	rel="stylesheet">


<!-- Custom styles for this template -->
<link href="/spring/resources/assets/dist/css/signin.css"
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



</head>

<body class="text-center">
<div class="container">
	<form class="form-signin" method="post" id="loginForm"
		action="/spring/authenticate">
<a href="/spring/"><img class="mb-4" src="/spring/resources/images/logo.png" alt=""
			width="172" height="172"></a> <label for="inputId" class="sr-only">ID</label>
		<input type="text" id="inputId" class="form-control" placeholder="ID"
			name="userId" required autofocus> <label for="inputPassword"
			class="sr-only">Password</label> <input type="password"
			id="inputPassword" class="form-control" placeholder="Password"
			name="password" required>

		<button class="btn btn-lg btn-primary btn-block" type="button"
			id="formLogin">로그인</button>
	</form>
	<div class="bd">
<a href="rememberForm" class="badge badge-primary">ID/비밀번호 찾기</a>
	</div>
 
</div>

	<!-- Modal -->




</body>





<script>
let isLogin<%=session.getAttribute("id") != null ? ("='" + session.getAttribute("id") + "';") : "=null;"%>
      

</script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>

<script src="/spring/resources/assets/dist/js/bootstrap.bundle.min.js"></script>
<script src="/spring/resources/assets/dist/js/loginout.js"></script>
</html>
