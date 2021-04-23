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

<!--               -----------------------------------------                   -->
<body>

	<ul class="nav nav-tabs nav-fill" id="myTab" role="tablist">
		<li class="nav-item" role="presentation"><a
			class="nav-link active" id="user-tab" data-toggle="tab" href="#user"
			role="tab" aria-controls="user" aria-selected="true">회원</a></li>
		<li class="nav-item" role="presentation"><a class="nav-link"
			id="trainer-tab" data-toggle="tab" href="#trainer" role="tab"
			aria-controls="trainer" aria-selected="false">트레이너</a></li>

	</ul>


	<div class="tab-content" id="myTabContent">

		<div class="tab-pane show active" id="user" role="tabpanel"
			aria-labelledby="user-tab">



			<div class="py-3 text-center">
				<img class="d-block mx-auto"
					src="/spring/resources/images/logo.png"
					alt="" width="100" height="100">
			</div>

			<div class="row justify-content-center">

				<!-- novalidate =<form> 태그의 novalidate 속성은 폼 데이터(form data)를 서버로 제출할 때 해당 데이터의 유효성을 검사하지 않음을 명시합니다. -->
				<form class="needs-validation was-validated col-8" method="post" action="/spring/members/joinU" novalidate>
					<!-- action="/members/joinA" -->
					
						<div class="row justify-content-lg-center">
							<div class="col mb-md-4">
								<!-- col 의 margin bottom 을 - midium - 2만큼 -->
								<label for="name">이름</label> <input type="text"
									class="form-control" id="name" name="name"
									placeholder="이름" value="김이박이름입력" required>
								<div class="invalid-feedback">이름을 입력해주세요.</div>
							</div>
						</div>
						<div class="row justify-content-center">
							<div class="col mb-md-4">
								<!-- col 의 margin bottom 을 - midium - 2만큼 -->
								<label for="email">이메일</label> <input type="email"
									class="form-control" id="email" name="email"
									placeholder="이메일" value="test@gmail.com" required>
								<div class="invalid-feedback">이메일을 입력해주세요.</div>
							</div>
						</div>
						<div class="row justify-content-center">
							<div class="col mb-md-4">
								<label for="userId">핸드폰 번호</label> <input type="text"
									class="form-control" id="phone_number" name="phone_number"
									placeholder="핸드폰 번호" maxlength="13" value="010-1111-4444" required>
								<div class="invalid-feedback" style="width: 100%;">핸드폰 번호를
									입력해주세요.</div>
							</div>

						</div>
						<div class="row justify-content-center">

							<div class="col mb-md-2">
								<label for="userId">성별</label>
							</div>

						</div>
						<div class="row justify-content-center">
							<div class="col mb-md-4">
								<div class="btn-group btn-group-toggle btn-block"
									data-toggle="buttons" id="toggle">
									<label class="btn btn-secondary active"> <input
										type="radio" name="options" id="option1" placeholder="성별"  value="1" checked>
										남자
									</label> <label class="btn btn-secondary"> <input type="radio"
										name="options" id="option2" placeholder="성별" value="2"> 여자
									</label>

								</div>
							</div>

						</div>
						<div class="row justify-content-center">
							<div class="col mb-md-4">
								<label for="pwConfirm">나이</label>
								<div class="input-group">

									<input type="number" class="form-control" id="age" name="age"
										placeholder="나이" value="20" required>
									<div class="invalid-feedback" style="width: 100%;">나이를
										입력해주세요.</div>
								</div>
							</div>

						</div>

						<div class="row justify-content-center">
							<div class="col mb-lg-5">
								<input class="btn btn-primary btn-lg btn-block" name="JoinBtn" type="button" value="회원 등록">
							</div>
						</div>
				</form>

			</div>





	</div>

	<div class="tab-pane " id="trainer" role="tabpanel"
		aria-labelledby="trainer-tab">


		<div class="py-3 text-center">
			<img class="d-block mx-auto"
				src="https://images.velog.io/images/heyon26/post/86ff3fdb-758f-48c6-b33b-b3cfb9664078/logo_transparent.png"
				alt="" width="100" height="100">
		</div>

		<div class="row justify-content-center">

			<!-- novalidate =<form> 태그의 novalidate 속성은 폼 데이터(form data)를 서버로 제출할 때 해당 데이터의 유효성을 검사하지 않음을 명시합니다. -->
			<form class="needs-validation was-validated col-8" method="post" action="/spring/members/joinT" novalidate>
				<!-- action="/members/joinA" -->
				
					<div class="row justify-content-center">
							<div class="col mb-md-4">
								<!-- col 의 margin bottom 을 - midium - 2만큼 -->
								<label for="name">이름</label> <input type="text"
									class="form-control" id="name" name="name" value="테스트"
									placeholder="이름" required>
								<div class="invalid-feedback">이름을 입력해주세요.</div>
							</div>
						</div>
					<div class="row justify-content-center">
						<div class="col mb-md-4">
							<!-- col 의 margin bottom 을 - midium - 2만큼 -->
							<label for="email">이메일</label> <input type="email"
								class="form-control" id="email" name="email"
								placeholder="이메일" value="test@gmail.com" required>
							<div class="invalid-feedback">이메일 입력해주세요.</div>
						</div>
					</div>
					<div class="row justify-content-center">
						<div class="col mb-md-4">
							<label for="userId">핸드폰 번호</label> <input type="text"
								class="form-control" id="phone_number" name="phone_number" placeholder="핸드폰 번호" maxlength="13"
								value="010-1111-2222" required>
							<div class="invalid-feedback" style="width: 100%;">핸드폰 번호를
								입력해주세요.</div>
						</div>

					</div>
					
					<div class="row justify-content-center">

						<div class="col mb-md-2">
							<label for="userId">성별</label>
						</div>

					</div>
					<div class="row justify-content-center">
						<div class="col mb-md-4">
							<div class="btn-group btn-group-toggle btn-block"
								data-toggle="buttons" id="toggle">
								<label class="btn btn-secondary active"> <input
									type="radio" name="options" id="option1" value="1" placeholder="성별" checked>
									남자
								</label> <label class="btn btn-secondary"> <input type="radio"
									name="options" id="option2" placeholder="성별" value="2"> 여자
								</label>

							</div>
						</div>

					</div>
					<br>
					
					<div class="row justify-content-center">
						<div class="col mb-lg-5 my-lg-1">
							<input class="btn btn-primary btn-lg btn-block" name="JoinBtn" type="button" value="트레이너 등록">
						</div>
					</div>
			</form>

		</div>



	</div>

	</div>








<script>

const buttons = document.querySelectorAll("input[name='JoinBtn']");
for (const button of buttons) {
  button.addEventListener('click', function(event) {
	  let formGet=event.target.parentNode.parentNode.parentNode;
	  let formElements = formGet.elements;
	  let confirmText= "";
	  for(var i=0; i<formElements.length;i++){
		  if(formElements[i].type!="radio" || formElements[i].checked){
			  
		  
		  confirmText+=formElements[i].placeholder;
		  if(formElements[i].placeholder=="성별"){
			  if(formElements[i].value=="1"){
				  confirmText+="남자";
			  }else confirmText+="여자";
		  }
		  else confirmText+=formElements[i].value;
		  
		  
		  confirmText+="  ";
		  }
	  }
		  
    let con=confirm(confirmText); //나중에 모달창으로
    if(con){formGet.submit();}
  })
}

//buttonElement.addEventListener('click', function () {}

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
