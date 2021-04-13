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
<div class="container">
  <div class="row justify-content-center">

	<ul class="nav nav-tabs nav-fill" id="myTab" role="tablist">
		<li class="nav-item" role="presentation"><a
			class="nav-link active" id="getId-tab" data-toggle="tab" href="#getId"
			role="tab" aria-controls="getId" aria-selected="true">아이디 찾기</a></li>
		<li class="nav-item" role="presentation"><a class="nav-link"
			id="getPw-tab" data-toggle="tab" href="#getPw" role="tab"
			aria-controls="getPw" aria-selected="false">비밀번호 찾기</a></li>

	</ul>
</div>
 <div class="row justify-content-center">
	<div class="tab-content" id="myTabContent">

		<div class="tab-pane fade show active" id="getId" role="tabpanel"
			aria-labelledby="getId-tab">



			<div class="py-3 text-center">
				<img class="d-block mx-auto"
					src="https://images.velog.io/images/heyon26/post/86ff3fdb-758f-48c6-b33b-b3cfb9664078/logo_transparent.png"
					alt="" width="100" height="100">
			</div>
			<!-- novalidate =<form> 태그의 novalidate 속성은 폼 데이터(form data)를 서버로 제출할 때 해당 데이터의 유효성을 검사하지 않음을 명시합니다. -->
						<form class="needs-validation" method="post"
							action="/spring/members/rememberId" novalidate>
							<!-- action="/members/joinA" -->

							<div class="row justify-content-center">
								<div class="col mb-md-4">
									<!-- col 의 margin bottom 을 - midium - 2만큼 -->
									<label for="firstName">이름</label> <input type="text"
										class="form-control" id="name" name="name" placeholder="이름" value="관장"
										required>
									<div class="invalid-feedback">이름을 입력해주세요.</div>
								</div>
							</div>
							<div class="row justify-content-center">
								<div class="col mb-md-4">
									<label for="userId">핸드폰 번호</label> <input type="text"
										class="form-control" id="phone_number" name="phone_number"
										placeholder="핸드폰 번호" maxlength="13" value="01084848484" required>
									<div class="invalid-feedback" style="width: 100%;">핸드폰 번호를 입력해주세요.</div>
								</div>

							</div>

							<div class="row justify-content-center">
								<div class="col mb-lg-5">
									<button 
									class="btn btn-primary btn-lg btn-block" 
									type="button" id="rememberId">아이디 찾기</button>
								</div>
							</div>
						</form>







					</div>

					<div class="tab-pane fade" id="getPw" role="tabpanel"
		aria-labelledby="getPw-tab">


		<div class="py-3 text-center">
			<img class="d-block mx-auto"
				src="https://images.velog.io/images/heyon26/post/86ff3fdb-758f-48c6-b33b-b3cfb9664078/logo_transparent.png"
				alt="" width="100" height="100">
		</div>

		<div class="row justify-content-center">

<!-- 버튼 2개 -->
<!-- 사업자 회원 => 클릭하면 modal form 떠서  -->
<!-- 트레이너, 유저 회원 => modal.  id 값으로 mem_reg_id 찾아서, 헬스장이름, 헬스장owner 폰번호 불러오기. -->

		</div>

	</div>

	</div>

</div>


</div>
<script>
let getResult;
document.getElementById('rememberId').addEventListener('click', function(event) {
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
  if(con){
	loadingModal(); //모달 추가
	fetch(formGet.action, { //fetch. ajax 와 비슷한 기능. loginForm.action 의 url 받아옴 (/spring/authenticate)
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: new URLSearchParams({
                    name: formGet.name.value,
                    phone_number: formGet.phone_number.value
                })
            })

                .then(response => {
                    $('#Loadingmodal').modal('hide');
					let promise=response.text();
					promise.then((value)=>getResult=value);
                    
                })
                .catch(error => console.error('Error:', error))
	  
	  
	  }
})

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
