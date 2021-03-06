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
<title>등록</title>


<link href="/spring/resources/assets/dist/css/bootstrap.min.css"
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
<link href="/spring/resources/assets/dist/css/dashboard.css"
	rel="stylesheet">
</head>


<link href="/spring/resources/assets/dist/css/form-validation.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="/spring/resources/assets/dist/css/style.css" />
<!--               -----------------------------------------                   -->

<body>
	<div class="container">
		<div class="row justify-content-center">

			<ul class="nav nav-tabs nav-fill" id="myTab" role="tablist">
				<li class="nav-item" role="presentation"><a
					class="nav-link active" id="getId-tab" data-toggle="tab"
					href="#getId" role="tab" aria-controls="getId" aria-selected="true">아이디
						찾기</a></li>
				<li class="nav-item" role="presentation"><a class="nav-link"
					id="getPw-tab" data-toggle="tab" href="#getPw" role="tab"
					aria-controls="getPw" aria-selected="false">비밀번호 찾기</a></li>

			</ul>
		</div>
		<div class="row justify-content-center">
			<div class="tab-content" id="myTabContent">

				<div class="tab-pane show active" id="getId" role="tabpanel"
					aria-labelledby="getId-tab">



					<div class="py-3 text-center">
						<a href="/spring/"><img class="mb-4"
							src="/spring/resources/images/logo.png" alt="" width="100"
							height="100"></a>
					</div>
					<!-- novalidate =<form> 태그의 novalidate 속성은 폼 데이터(form data)를 서버로 제출할 때 해당 데이터의 유효성을 검사하지 않음을 명시합니다. -->
					<form class="needs-validation" method="post"
						action="/spring/members/rememberId" novalidate>
						<!-- action="/members/joinA" -->

						<div class="row justify-content-center">
							<div class="col mb-md-4">
								<!-- col 의 margin bottom 을 - midium - 2만큼 -->
								<label for="firstName">이름</label> <input type="text"
									class="form-control" id="name" name="name" placeholder="이름"
									value="관장" required>
								<div class="invalid-feedback">이름을 입력해주세요.</div>
							</div>
						</div>
						<div class="row justify-content-center">
							<div class="col mb-md-4">
								<label for="userId">핸드폰 번호</label> <input type="text"
									class="form-control" id="phone_number" name="phone_number"
									placeholder="핸드폰 번호" maxlength="13" value="01084848484"
									required>
								<div class="invalid-feedback" style="width: 100%;">핸드폰 번호를
									입력해주세요.</div>
							</div>

						</div>

						<div class="row justify-content-center">
							<div class="col mb-lg-5">
								<button class="btn btn-dark btn-lg btn-block" type="button"
									id="rememberId">아이디 찾기</button>
							</div>
						</div>
					</form>







				</div>

				<div class="tab-pane" id="getPw" role="tabpanel"
					aria-labelledby="getPw-tab">

					<div class="py-3 text-center">
						<a href="/spring/"><img class="mb-4"
							src="/spring/resources/images/logo.png" alt="" width="100"
							height="100"></a>
					</div>

					<form class="needs-validation" method="post"
						action="/spring/members/newPassword" novalidate>
						<!-- action="/members/joinA" -->

						<div class="row justify-content-center">
							<div class="col mb-md-4">
								<!-- col 의 margin bottom 을 - midium - 2만큼 -->
								<label for="id">아이디</label> <input type="text"
									class="form-control" id="id" name="id" placeholder="아이디"
									required>
								<div class="invalid-feedback">아이디를 입력해주세요.</div>
							</div>
						</div>
						<div class="row justify-content-center">
							<div class="col mb-md-4">
								<label for="userId">핸드폰 번호</label> <input type="text"
									class="form-control" id="phone_number2" name="phone_number"
									placeholder="핸드폰 번호" maxlength="13" required>
								<div class="invalid-feedback" style="width: 100%;">핸드폰 번호를
									입력해주세요.</div>
							</div>

						</div>

						<div class="row justify-content-center">
							<div class="col mb-sm-1">
								<button class="btn btn-dark btn-lg btn-block" type="button"
									id="newPw">비밀번호 찾기</button>
							</div>
						</div>
						<div class="row justify-content-center">
							<div class="col mb-sm-1">
								<a class="btn btn-dark btn-lg btn-block" href="loginform"
									id="loginform">로그인</a>
								</button>
							</div>
						</div>
					</form>

				</div>

			</div>

		</div>


	</div>
	<script>
		let getResult;
		document.getElementById('rememberId').addEventListener('click', function (event) {
			loadingModal(); //모달 추가
			let formGet = event.target.parentNode.parentNode.parentNode;
			let formElements = formGet.elements;
			let confirmText = "";
			for (var i = 0; i < formElements.length; i++) {
				if (formElements[i].type != "radio" || formElements[i].checked) {


					confirmText += formElements[i].placeholder;
					if (formElements[i].placeholder == "성별") {
						if (formElements[i].value == "1") {
							confirmText += "남자";
						} else confirmText += "여자";
					}
					else confirmText += formElements[i].value;


					confirmText += "  ";
				}
			}

			let con = confirm(confirmText); //나중에 모달창으로
			if (con) {
				 $('#Loadingmodal').modal('show');
				
				fetch(formGet.action, { //fetch. ajax 와 비슷한 기능. loginForm.action 의 url 받아옴 (/spring/authenticate)
					method: 'POST',
					headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
					body: new URLSearchParams({
						name: formGet.name.value,
						phone_number: formGet.phone_number.value
					})
				})

					.then(response => response.text())
										
					.then(result => {
						
						getResult=result;
						document.querySelector("#id").value=getResult;
						document.querySelector("#phone_number2").value=document.querySelector("#phone_number").value;
						
					}
					).then(function(){
					$('#Loadingmodal').modal('hide');
					$('#getPw-tab').tab('show');
					alert('ID는 '+getResult+' 입니다.');
					
					
					})										
					.catch(error => console.error('Error:', error));
				

			}
		});


		document.getElementById('newPw').addEventListener('click', function (event) {
				loadingModal(); //모달 추가
			let formGet = event.target.parentNode.parentNode.parentNode;
			console.log(formGet);

 			let con = confirm("확인을 누르시면 이메일로 비밀번호가 전송됩니다."); //나중에 모달창으로
			if (con) {
				$('#Loadingmodal').modal('show');
				fetch(formGet.action, { //fetch. ajax 와 비슷한 기능. loginForm.action 의 url 받아옴 (/spring/authenticate)
					method: 'POST',
					headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
					body: new URLSearchParams({
						id: formGet.id.value,
						phone_number: formGet.phone_number.value
					})
				})

					.then(response => response.text())
					.then(result=>{
						$('#Loadingmodal').modal('hide');
						alert(result+' 에서 비밀번호를 확인해주세요.');
					
						
					})
					.catch(error => console.error('Error:', error));


			} 
		});

	</script>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>

	<script src="/spring/resources/assets/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/spring/resources/assets/dist/js/util.js"></script>
	<script src="/spring/resources/assets/dist/js/form-validation.js"></script>

	<script src="/spring/resources/assets/dist/js/loginout.js"></script>
</body>

</html>