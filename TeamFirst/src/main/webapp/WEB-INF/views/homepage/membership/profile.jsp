<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<style>
.tab-pane {
	min-height: 600px;
}
</style>
<link rel="stylesheet"
	href="/spring/resources/assets/dist/css/fontawsom-all.min.css">




<div class="container">

	<div class="row ml-lg-4">

		<div class="row justify-content-lg-left w-100">

			<div class="col-2" style="height: 700px;">

				<div>		<div class="row justify-content-center mb-4 text-center">
					<h4 class="page-header">마이페이지</h4>
				</div>
					<div class="bg-white p-2 my-2 border border-white rounded">
						<img class="mb-4" src="/spring/resources/images/gym.png">

						<h6>${admin.name}님</h6>
						<h6>포인트 : ${admin.all_point }</h6>
					</div>


				</div>
				<div>

					<ul class="nav flex-column nav-pills" id="myTab" role="tablist"
						aria-orientation="vertical">
						<li class="nav-item"><a class="nav-link active"
							id="profile-tab" data-toggle="tab" href="#profile" role="tab"
							aria-controls="profile" aria-selected="false">메인</a></li>
						<li class="nav-item"><a class="nav-link" id="home-tab"
							data-toggle="tab" href="#home" role="tab" aria-controls="home"
							aria-selected="true">개인정보</a></li>
						<li class="nav-item"><a class="nav-link" id="fitness-tab"
							data-toggle="tab" href="#fitness" role="tab"
							aria-controls="fitness" aria-selected="true">피트니스정보</a></li>
						<li class="nav-item"><a class="nav-link" id="membership-tab"
							data-toggle="tab" href="#membership" role="tab"
							aria-controls="membership" aria-selected="false">멤버십내역</a></li>
						<li class="nav-item"><a class="nav-link" id="resume-tab"
							data-toggle="tab" href="#resume" role="tab"
							aria-controls="resume" aria-selected="false">결제내역</a></li>
					</ul>
				</div>
			</div>
			<div class="col-10 mt-xl-5"> 

				<div class="tab-content border rounded" id="myTabContent">
					<div class="tab-pane fade exp-cover show active" id="profile"
						role="tabpanel" aria-labelledby="profile-tab">
						<div class="row justify-content-center border-bottom mb-xl-5 ">
							<h4 class="ltitle">메인</h4>
						</div>

						<div class="data-box">


							<div class="row justify-content-center">
								<c:if test="${not empty fitList}">
									<div class="row"">
										<c:forEach var="fitness" items="${fitList}" varStatus="status">
											<div class="card col-4">
												<div class="card-header">${fitness.fitness_name}</div>
												<div class="card-body">
													<c:choose>
														<c:when test="${fitness.active eq '1'}">
															<a
																href="/spring/fitnessHome?fitness_id=${fitness.fitness_id}"
																class="btn btn-success d-flex">피트니스 관리페이지로</a>
														</c:when>
														<c:when test="${fitness.active eq '0'}">
															<a href="/spring/membership/pricing"
																class="btn btn-dark d-flex">멤버십 등록</a>
														</c:when>
													</c:choose>

													<!--  -->
												</div>
											</div>
										</c:forEach>
									</div>
								</c:if>
								<c:if test="${empty fitList}"> 피트니스정보에서 피트니스를 등록해주세요. </c:if>
							</div>

						</div>
					</div>



					<div class="tab-pane fade exp-cover" id="home" role="tabpanel"
						aria-labelledby="home-tab">

						<form method="post" action="/spring/members/updateOwner">
							<div class="row justify-content-center   border-bottom mb-xl-5 ">
								<h4 class="ltitle">개인정보</h4>
							</div>
							<div
								class="row no-margin fitness-det justify-content-center align-items-center"
								style="min-height: 550px;">
								<!-- action="/members/joinA" -->

								<div class="col-8 md-8">

									<div class="form-group row justify-content-between ">
										<label for="name" class="col-form-label text-left">이름</label>
										<div class="col-8 mb-md-2">

											<input type="text" class="form-control" id="name" name="name"
												placeholder="이름" value="${admin.name}" disabled="disabled">
											<div class="invalid-feedback">이름을 입력해주세요.</div>
										</div>
									</div>
									<div class="form-group row justify-content-between">
										<label for="email" class="col-form-label text-left">이메일</label>
										<div class="col-8 mb-md-2">
											<!-- col 의 margin bottom 을 - midium - 2만큼 -->
											<input type="email" class="form-control" id="email"
												name="email" placeholder="이메일" value="${admin.email}">
											<div class="invalid-feedback">이메일을 입력해주세요.</div>
										</div>
									</div>
									<div class="form-group row justify-content-between">
										<label for="phone_number" class="col-form-label text-left">핸드폰
											번호</label>
										<div class="col-8 mb-md-2">
											<!-- col 의 margin bottom 을 - midium - 2만큼 -->
											<input type="text" class="form-control" id="phone_number"
												name="phone_number" placeholder="핸드폰 번호" minlength="13"
												maxlength="13" value="${admin.phone_number}">
											<div class="invalid-feedback">핸드폰 번호를 입력해주세요.</div>
										</div>
									</div>
									<div class="form-group row justify-content-between">
										<label for="password" class="col-form-label text-left">현재
											비밀번호</label>
										<div class="col-8 mb-md-2">
											<!-- col 의 margin bottom 을 - midium - 2만큼 -->
											<input type="password" class="form-control" id="password"
												name="password" placeholder="현재 비밀번호" autocomplete="off">
											<div class="invalid-feedback">현재 비밀번호를 입력해주세요.</div>
										</div>
									</div>
									<div class="form-group row justify-content-between">
										<label for="newPW" class="col-form-label text-left">새
											비밀번호</label>
										<div class="col-8 mb-0 pb-0">
											<!-- col 의 margin bottom 을 - midium - 2만큼 -->
											<input type="password" class="form-control" id="newPW"
												name="newPW" placeholder="새 비밀번호" autocomplete="off">
											<div class="invalid-feedback">새 비밀번호를 입력해주세요.</div>
											<input type="password" class="form-control" id="pwCon"
												name="pwCon" placeholder="비밀번호 확인" autocomplete="off">
											<div class="invalid-feedback">동일한 비밀번호를 입력해주세요.</div>
										</div>
									</div>


								</div>



							</div>
							<div class="row justify-content-center">

								<div class="col-6 mt-5">
									<button class="btn btn-dark btn-lg btn-block postFormBtn"
										type="button">수정</button>
								</div>
							</div>
						</form>

					</div>


					<div class="tab-pane fade exp-cover" id="fitness" role="tabpanel"
						aria-labelledby="fitness-tab">
						<div class="row justify-content-center   border-bottom mb-xl-5 ">
							<h4 class="ltitle">피트니스정보</h4>
						</div>

						<ul class="nav nav-pills justify-content-between exp-row"
							id="pills-tab" role="tablist">
							<li class="nav-item" role="presentation"><a
								class="nav-link active" id="pills-home-tab" data-toggle="pill"
								href="#pills-home" role="tab" aria-controls="pills-home"
								aria-selected="true">피트니스 목록</a></li>
							<li class="nav-item" role="presentation"><a class="nav-link"
								id="fit-profile-tab" data-toggle="pill" href="#pills-profile"
								role="tab" aria-controls="pills-profile" aria-selected="false">피트니스
									등록</a></li>
							<li class="nav-item" role="presentation" hidden="hidden"><a
								class="nav-link" id="fit-contact-tab" data-toggle="pill"
								href="#pills-contact" role="tab" aria-controls="pills-contact"
								aria-selected="false">피트니스 상세</a></li>

						</ul>

						<div class="tab-content" id="pills-tabContent">
							<div class="tab-pane fade show active" id="pills-home"
								role="tabpanel" aria-labelledby="pills-home-tab">
								<div class="row justify-content-center">
									<h4 class="ltitle">피트니스 등록</h4>

								</div>
								<c:if test="${fitList ne null}">
									<div class="row">
										<c:forEach var="fitness" items="${fitList}" varStatus="status">
											<c:choose>
												<c:when test="${fitness.active eq '1'}">
													<div class="card border-success col-4">
														<div class="card-header">${fitness.fitness_name}</div>
														<div class="card-body">
															<p
																class="btn btn-outline-success d-flex py-2 px-5 mb-2 text-align-center ">멤버십
																적용중</p>
															<a name="${status.index}"
																class="btn btn-outline-dark d-flex py-2 px-5 mb-2 text-align-center toFitnessDetail">상세페이지</a>
														</div>
													</div>
												</c:when>

												<c:when test="${fitness.active eq '0'}">
													<div class="card col-4">
														<div class="card-header">${fitness.fitness_name}</div>
														<div class="card-body">
															<a href="/spring/membership/pricing"
																class="btn btn-outline-secondary d-flex py-2 px-5 mb-2 text-align-center ">멤버십
																등록</a> <a name="${status.index}"
																class="btn btn-outline-dark d-flex py-2 px-5 mb-2 text-align-center toFitnessDetail">상세페이지</a>
														</div>
													</div>
												</c:when>
											</c:choose>

										</c:forEach>
									</div>
								</c:if>
								<c:if test="${fitList eq null}"> 피트니스를 등록해주세요. </c:if>
							</div>
							<div class="tab-pane fade" id="pills-profile" role="tabpanel"
								aria-labelledby="pills-profile-tab">

								<form method="post" action="/spring/members/addFitness">
									<div class="row justify-content-center">
										<h4 class="ltitle">피트니스 등록</h4>

									</div>
									<div
										class="row no-margin fitness-det justify-content-center align-items-center fitnessAdd"
										style="min-height: 550px;"></div>
									<div class="row justify-content-center">

										<div class="col-6 mt-5">
											<button class="btn btn-dark btn-lg btn-block postFormBtn"
												type="button">등록</button>
										</div>


									</div>
								</form>
							</div>
							<div class="tab-pane fade" id="pills-contact" role="tabpanel"
								aria-labelledby="pills-contact-tab">

								<form method="post" action="/spring/members/addFitness">
									<div class="row justify-content-center">
										<h4 class="ltitle">피트니스 수정</h4>

									</div>
									<div
										class="row no-margin fitness-det justify-content-center align-items-center fitnessUpdate"
										style="min-height: 550px;"></div>
									<div class="row justify-content-center">

										<div class="col-6 mt-5">
											<button class="btn btn-dark btn-lg btn-block postFormBtn"
												type="button">등록</button>
										</div>


									</div>
								</form>
							</div>
						</div>




					</div>



					<div class="tab-pane fade exp-cover" id="membership"
						role="tabpanel" aria-labelledby="membership-tab">
						<div class="row justify-content-center   border-bottom mb-xl-5 ">

							<h4 class="ltitle">멤버십내역</h4>
						</div>
						<div class="data-box">
							<c:if test="${memList ne null }">
								<table
									class="table justify-content-center text-center border border-bottom">
									<tr>
										<th>no</th>
										<th>등급</th>
										<th>피트니스 번호</th>
										<th>피트니스 이름</th>
										<th>시작일</th>
										<th>종료일</th>
										<th>남은날짜</th>
									</tr>
									<c:forEach var="mem" items="${memList}" varStatus="status">
										<tr>
											<td>${fn:length(memList) - status.index}</td>
											<td>${mem.membership_name }</td>
											<td>${mem.fitness_id}</td>
											<td>${mem.fitness_name}</td>
											<td>${mem.membership_start }</td>
											<td>${mem.membership_end }</td>
											<td>${mem.dday }일</td>
										</tr>
									</c:forEach>
								</table>
							</c:if>
						</div>
					</div>

					<div class="tab-pane fade exp-cover" id="resume" role="tabpanel"
						aria-labelledby="contact-tab">
						<div class="row justify-content-center   border-bottom mb-xl-5 ">

							<h4 class="ltitle">결제내역</h4>
						</div>
						<div class="data-box">

							<c:if test="${memList ne null }">
								<table
									class="table justify-content-center text-center  border border-bottom">
									<tr>

										<th>no</th>
										<th style="text-align: right !important;">결제금액(원)</th>
										<th>결제일</th>
									</tr>
									<c:forEach var="payment" items="${payments}" varStatus="status">
										<tr>
											<td>${fn:length(payments) - status.index}</td>
											<td align="right"><fmt:formatNumber
													value="${payment.amount}" pattern="#,###" /></td>
											<td>${payment.payment_date}</td>
										</tr>
									</c:forEach>
								</table>
							</c:if>

						</div>

					</div>

				</div>
			</div>
		</div>
	</div>
</div>


<script>
			let fitness_name = [];
			let tel_number = [];
			let zipcode = [];
			let address = [];
			let address_detail = [];
			let fitness_id = [];
			<c:if test="${not empty fitList}">
				<c:forEach var="fitness" items="${fitList}" varStatus="status">
					fitness_name.push('${fitness.fitness_name}');
tel_number.push('${fitness.tel_number}');
zipcode.push('${fitness.zipcode}');
address.push('${fitness.address}');
address_detail.push('${fitness.address_detail}');
fitness_id.push('${fitness.fitness_id}');
</c:forEach>
			</c:if>



			window.onload = function () {



				//피트니스 등록수정폼
				var fitform = '<div class="form-group row justify-content-between"><label for="fitness_name"class="col-form-label text-left">피트니스명</label><div class="col-8 mb-md-2"><input type="text"class="form-control"id="fitness_name"name="fitness_name"placeholder="피트니스명"required="required"></div></div><div class="form-group row justify-content-between"><label for="tel_number"class="col-form-label text-left">전화번호</label><div class="col-8 mb-md-2"><input type="text"class="form-control"id="tel_number"name="tel_number"placeholder="전화번호"required="required"></div></div><div class="form-group row justify-content-between"><label for="zipcode"class="col-form-label text-left">우편번호</label><div class="col-8 mb-md-2"><div class="input-group"style="margin-bottom: 20px;"><input type="number"class="form-control"id="zipcode"name="zipcode"placeholder="우편번호"required="required"><div class="input-group-append"><input class="btn btn-dark"type="button"id="execPostCode"value="우편번호 찾기"></div></div><div class="invalid-feedback">우편번호를입력해주세요.</div></div></div><div class="form-group row justify-content-between"><label for="address"class="col-form-label text-left">주소</label><div class="col-8 mb-md-2"><input type="text"class="form-control"id="address"name="address"placeholder="헬스클럽 주소"required="required"><div class="invalid-feedback">헬스클럽주소를입력해주세요.</div></div></div><div class="form-group row justify-content-between"><label for="address_detail"class="col-form-label text-left">주소상세<span class="text-muted">(Optional)</span></label><div class="col-8 mb-md-2"><input type="text"class="form-control"id="address_detail"name="address_detail"placeholder="주소 상세"></div></div><input type="text" name="fitness_id" id="fitness_id" hidden="hidden">';

 

				//피트니스등록수정폼에인덱스넘기기 펑션
				function gotoupdate(index) {
					var indexNo = index;
					//피트니스수정탭에 폼넣기
					document.getElementById("fit-contact-tab").addEventListener('click', function () {


						document.querySelector(".fitnessUpdate").innerHTML = "";
						document.querySelector(".fitnessAdd").innerHTML = "";
						let aform = document.createElement("div");
						aform.setAttribute("class", "col-8");
						aform.innerHTML = fitform;
						document.querySelector(".fitnessUpdate").append(aform);
						document.querySelector("#fitness_name").value = fitness_name[indexNo];
						document.querySelector("#tel_number").value = tel_number[indexNo];
						document.querySelector("#zipcode").value = zipcode[indexNo];
						document.querySelector("#address").value = address[indexNo];
						document.querySelector("#address_detail").value = address_detail[indexNo];
						document.querySelector("#fitness_id").value = fitness_id[indexNo];
						postCodeBtn();
					});

					document.getElementById("fit-contact-tab").click();
				}
				//상세 페이지 클릭해서 피트니스 등록수정폼에 인덱스넘기기

				document.querySelectorAll('.toFitnessDetail').forEach(function (e) {
					e.addEventListener('click', function () {
						gotoupdate(this.name);
					});
				});



				//피트니스등록탭에 폼넣기
				document.getElementById("fit-profile-tab").addEventListener('click', function () {
					document.querySelector(".fitnessUpdate").innerHTML = "";
					document.querySelector(".fitnessAdd").innerHTML = "";
					let fform = document.createElement('div');
					fform.setAttribute("class", "col-8");
					fform.innerHTML = fitform;
					document.querySelector(".fitnessAdd").append(fform);
					postCodeBtn();
				});



				const formbtns = document.querySelectorAll('.postFormBtn');
				if (typeof formbtns != null) {

					formbtns.forEach(formbtn => { formbtn.addEventListener('click', formClick) });

					function formClick() {
						console.log(this.parentNode.parentNode.parentNode);

						if (document.querySelector("#newPW").value != "" && document.querySelector("#newPW").value.length >= 4) {
							if (document.querySelector("#password").value == "") {
								alert('비밀번호를 입력해주세요');
								document.querySelector("#password").focus();
								return;
							}

							if (document.querySelector("#pwCon").value != document.querySelector("#newPW").value) {
								alert('새 비밀번호가 동일하지 않습니다.');
								document.querySelector("#pwCon").value = "";
								document.querySelector("#newPW").value = "";
								document.querySelector("#newPW").focus();
								return;
							}

						}
						else if (document.querySelector("#newPW").value == "") { }
						else {
							alert('비밀번호는 4글자 이상 입력해주세요.');
							return;
						}




						let con = confirm('등록하시겠습니까?');
						if (con) {
							let updateForm = this.parentNode.parentNode.parentNode;
							let params = new FormData(updateForm).params;
							fetch(updateForm.action, { //fetch. ajax 와 비슷한 기능. loginForm.action 의 url 받아옴 (/spring/authenticate)
								method: 'POST',
								headers: { 'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8' },
								body: new URLSearchParams(new FormData(updateForm))
							})

								.then(response => response.text())
								.then(result => {
									if (result.length > 1) { alert(result); location.reload(); }
									else location.reload();
								})

								.catch(error => console.error('Error:', error));
						}


					}



					function getPostcode() {
						new daum.Postcode({
							oncomplete: function (data) {

								var roadAddr = data.roadAddress; // 도로명 주소 변수

								document.getElementById('zipcode').value = data.zonecode;
								document.getElementById("address").value = roadAddr;

							}
						}).open();
					}
function postCodeBtn(){

					if
						(typeof execPostCode !== "undefined" && typeof execPostCode !== "zipcode" && typeof address !== "undefined") {
						console.log('포스트코드발견');
						document.getElementById('execPostCode').addEventListener("click",
							getPostcode);
						document.getElementById('zipcode').addEventListener("click", getPostcode);
						document.getElementById('address').addEventListener("click", getPostcode);
					}
					else console.log('포스트코드발견못함');

				}
};

				$(document).ready(function () {
					
					if (window.location.hash == '#fitness') {
						document.getElementById('fitness-tab').click();
						document.getElementById('fitness-tab').click();
						document.getElementById('fitness-tab').click();

						
					}
				
				
				
				
				
				});

			}
</script>
<script src="/spring/resources/assets/dist/js/form-validation.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script src="/spring/resources/assets/dist/js/popper.min.js"></script>

<script src="/spring/resources/assets/dist/js/script.js"></script>