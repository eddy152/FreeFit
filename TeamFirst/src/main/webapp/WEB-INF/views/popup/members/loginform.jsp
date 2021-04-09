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

<script>
var session = <%=request.getSession().getAttribute("mem_reg_id")%>;

	if(session!=null){
		alert("로그인 성공");
	location.replace("/spring/");
} 


window.onload=function(){


	
	login.onclick=function(){
		
		let form=loginForm;
      
      fetch(loginForm.action, {
        method: 'POST',
        headers: {'Content-Type' : 'application/x-www-form-urlencoded'},
        body: new URLSearchParams({
        	userId:loginForm.userId.value,
        	password:loginForm.password.value})
    	  })
        
		.then(response => response)
		.catch(error => console.error('Error:', error))
        .then(function(response){ 
    	  if (response.url.includes('error')){
    	  	alert('로그인 실패하였습니다. 아이디와 비밀번호를 확인해주세요.');
    	  	
    	  }
    	  	else {location.replace('log'); }})
	}
      
}      
      </script>


</head>

<body class="text-center">

	<form class="form-signin" method="post" id="loginForm"
		action="/spring/authenticate">
		<img class="mb-4" src="/spring/resources/images/logo.png" alt=""
			width="172" height="172"> <label for="inputId" class="sr-only">ID</label>
		<input type="text" id="inputId" class="form-control" placeholder="ID"
			name="userId" required autofocus> <label for="inputPassword"
			class="sr-only">Password</label> <input type="password"
			id="inputPassword" class="form-control" placeholder="Password"
			name="password" required>

		<button class="btn btn-lg btn-primary btn-block" type="button"
			id="login">로그인</button>
			<button class="btn btn-lg btn-primary btn-block" type="button"
			id="login">회원가입</button>
		<p class="mt-5 mb-3 text-muted">&copy; 2021-2021</p>
	</form>

</body>
</html>











