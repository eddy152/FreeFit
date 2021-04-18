<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="/spring/resources/assets/dist/css/fontawsom-all.min.css">
<link rel="stylesheet" type="text/css"
	href="/spring/resources/assets/dist/css/style.css" />



<div class="container">
	<div class="row ml-lg-4">

		<div class="row justify-content-lg-left w-100">

			<div class="col-2">

				<div>
					<img class="mb-2" src="/spring/resources/images/gym.png">

					<div class="mb-4">${vo.id} 님</div>


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
			<div class="col-10">

				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade exp-cover show active" id="profile"
						role="tabpanel" aria-labelledby="profile-tab">
						<div class="data-box">
							<div class="sec-title">
								<h2>${vo.membership_name}D-day${vo.dday }일</h2>
							</div>
							<div class="row exp-row">
								<h6>잔여 포인트 : ${vo.all_point }</h6>

							</div>
							<div class="row exp-row">
								<button type="button" id="gotoProgram"
									class="btn btn-primary btn-lg btn-block"
									onclick="location.href='/spring/tilesTestProgram'">
									헬스클럽 관리 페이지로</button>
							</div>

						</div>
					</div>



					<div class="tab-pane fade exp-cover" id="home" role="tabpanel"
						aria-labelledby="home-tab">



						<form method="post"
							action="/spring/members/updateOwner">
									<div class="row justify-content-center">
										<h4 class="ltitle">개인정보</h4>
									</div>
							<div class="row no-margin fitness-det justify-content-center align-items-center" style="min-height: 550px;">
								<!-- action="/members/joinA" -->
								
								<div class="col-8 md-8">
									
									<div class="form-group row justify-content-between ">
									<label for="name" class="col-form-label text-left">이름</label>
										<div class="col-8 mb-md-2">
											
											 <input type="text"
												class="form-control" id="name" name="name" placeholder="이름"
												value="${vo.name}" disabled="disabled">
											<div class="invalid-feedback">이름을 입력해주세요.</div>
										</div>
									</div>
									<div class="form-group row justify-content-between">
											<label for="email" class="col-form-label text-left">이메일</label> 
										<div class="col-8 mb-md-2">
											<!-- col 의 margin bottom 을 - midium - 2만큼 -->
											<input type="email"
												class="form-control" id="email" name="email"
												placeholder="이메일" value="${vo.email}">
											<div class="invalid-feedback">이메일을 입력해주세요.</div>
										</div>
									</div>
									<div class="form-group row justify-content-between">
											<label for="phone_number" class="col-form-label text-left">핸드폰 번호</label> 
										<div class="col-8 mb-md-2">
											<!-- col 의 margin bottom 을 - midium - 2만큼 -->
											<input type="text"
												class="form-control" id="phone_number" name="phone_number"
												placeholder="핸드폰 번호" minlength="13" maxlength="13"
												value="${vo.phone_number}">
											<div class="invalid-feedback">핸드폰 번호를 입력해주세요.</div>
										</div>
									</div>
									<div class="form-group row justify-content-between">
											<label for="password" class="col-form-label text-left">현재 비밀번호</label>
										<div class="col-8 mb-md-2">
											<!-- col 의 margin bottom 을 - midium - 2만큼 -->
											 <input type="password"
												class="form-control" id="password" name="password"
												placeholder="현재 비밀번호">
											<div class="invalid-feedback">현재 비밀번호를 입력해주세요.</div>
										</div>
									</div>
									<div class="form-group row justify-content-between">
											<label for="newPW" class="col-form-label text-left">새 비밀번호</label>
										<div class="col-8 mb-0 pb-0">
											<!-- col 의 margin bottom 을 - midium - 2만큼 -->
											 <input type="password"
												class="form-control" id="newPW" name="newPW"
												placeholder="새 비밀번호">
											<div class="invalid-feedback">새 비밀번호를 입력해주세요.</div>
											<input type="pwCon" class="form-control" id="pwCon"
												name="pwCon" placeholder="비밀번호 확인">
											<div class="invalid-feedback">동일한 비밀번호를 입력해주세요.</div>
										</div>
									</div>


								</div>
								


							</div>
							<div class="row justify-content-center">

								<div class="col-6 mt-5">
									<button class="btn btn-primary btn-lg btn-block" type="submit">수정</button>
								</div>
							</div>
						</form>

					</div>


					<div class="tab-pane fade exp-cover" id="fitness" role="tabpanel"
						aria-labelledby="fitness-tab">
						<form method="post"
							action="/spring/members/updateFitness">
									<div class="row justify-content-center">
										<h4 class="ltitle">피트니스정보</h4>

									</div>
							<div class="row no-margin fitness-det justify-content-center align-items-center"  style="min-height: 550px;">
								<div class="col-8">
									
									<div class="form-group row justify-content-between">
											<label for="address_detail" class="col-form-label text-left">피트니스명</label>
										<div class="col-8 mb-md-2">
											 <input type="text"
												class="form-control" id="fitness_name" name="fitness_name"
												placeholder="피트니스명" value="${vo.fitness_name}"
												required="required">
										</div>
									</div>

									<div class="form-group row justify-content-between">
											<label for="zipcode" class="col-form-label text-left">우편번호</label>
										<div class="col-8 mb-md-2">
											<div class="input-group" style="margin-bottom: 20px;">
												<input type="number" class="form-control" id="zipcode"
													name="zipcode" placeholder="우편번호" value="${zipcode}"
													required="required">
												<div class="input-group-append">
													<input class="btn btn-primary" type="button"
														id="execPostCode" value="우편번호 찾기">
												</div>
											</div>
											<div class="invalid-feedback">우편번호를 입력해주세요.</div>
										</div>


									</div>
									<div class="form-group row justify-content-between">
											<label for="address" class="col-form-label text-left">주소</label>
										<div class="col-8 mb-md-2">
											 <input type="text"
												class="form-control" id="address" name="address"
												placeholder="헬스클럽 주소" value="${address}" required="required">
											<div class="invalid-feedback">헬스클럽 주소를 입력해주세요.</div>
										</div>
									</div>
									<div class="form-group row justify-content-between">
											<label for="address_detail" class="col-form-label text-left">주소 상세<span
												class="text-muted">(Optional)</span></label>
										<div class="col-8 mb-md-2"> 
												 <input type="text"
												class="form-control" id="address_detail"
												name="address_detail" value="${address_detail}"
												placeholder="주소 상세">
										</div>
									</div>


								</div>

							</div>
								<div class="row justify-content-center">

									<div class="col-6 mt-5">
										<button class="btn btn-primary btn-lg btn-block" type="submit">수정</button>
									</div>


								</div>
						</form>
					</div>



					<div class="tab-pane fade exp-cover" id="membership"
						role="tabpanel" aria-labelledby="membership-tab">
						<div class="data-box">
							<div class="sec-title">
								<h2>My Profile</h2>
							</div>
							<div class="row exp-row">
								<h6>Business Development</h6>
								<span>Microsoft</span> <i>Apiral 2011 - Present</i>

								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
									Aenean a urna posuere, aliquet elit in, fermentum ligula. Sed
									est augue, molestie sed tortor sed, posuere commodo lectus.</p>
							</div>
							<div class="row exp-row">
								<h6>Business Development</h6>
								<span>Microsoft</span> <i>Apiral 2011 - Present</i>

								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
									Aenean a urna posuere, aliquet elit in, fermentum ligula. Sed
									est augue, molestie sed tortor sed, posuere commodo lectus.</p>
							</div>
							<div class="row exp-row last">
								<h6>Business Development</h6>
								<span>Microsoft</span> <i>Apiral 2011 - Present</i>

								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
									Aenean a urna posuere, aliquet elit in, fermentum ligula. Sed
									est augue, molestie sed tortor sed, posuere commodo lectus.</p>
							</div>
						</div>
					</div>

					<div class="tab-pane fade exp-cover" id="resume" role="tabpanel"
						aria-labelledby="contact-tab">
						<div class="sec-title">
							<h2>Education Details</h2>
						</div>
						<div class="service no-margin row">
							<div class="col-sm-3 resume-dat serv-logo">
								<h6>2013-2015</h6>
								<p>Master Degree</p>
							</div>
							<div class="col-sm-9 rgbf">
								<h5>Cambridg University</h5>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
									sed do eiusmod tempor incididunt ut labore et dolore magna
									aliqua.</p>
							</div>
						</div>
						<div class="service no-margin row">
							<div class="col-sm-3 resume-dat serv-logo">
								<h6>2013-2015</h6>
								<p>Bacholers Degree</p>
							</div>
							<div class="col-sm-9 rgbf">
								<h5>Anna University</h5>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
									sed do eiusmod tempor incididunt ut labore et dolore magna
									aliqua.</p>
							</div>
						</div>
						<div class="service no-margin row">
							<div class="col-sm-3 resume-dat serv-logo">
								<h6>2013-2015</h6>
								<p>High School</p>
							</div>
							<div class="col-sm-9 rgbf">
								<h5>A.M.H.S.S</h5>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
									sed do eiusmod tempor incididunt ut labore et dolore magna
									aliqua.</p>
							</div>
						</div>
						<div class="service no-margin row">
							<div class="col-sm-3 resume-dat serv-logo">
								<h6>2013-2015</h6>
								<p>School</p>
							</div>
							<div class="col-sm-9 rgbf">
								<h5>Anna University</h5>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
									sed do eiusmod tempor incididunt ut labore et dolore magna
									aliqua.</p>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>
<script>
	function getPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {

				var roadAddr = data.roadAddress; // 도로명 주소 변수

				document.getElementById('zipcode').value = data.zonecode;
				document.getElementById("address").value = roadAddr;

			}
		}).open();
	}

	document.getElementById('execPostCode').addEventListener("click",
			getPostcode);

	document.getElementById('zipcode').addEventListener("click", getPostcode);

	document.getElementById('address').addEventListener("click", getPostcode);

	<c:if test="${vo.membership_name eq null}">
	//살아있는 멤버십이 없다면
	document.querySelector("#gotoProgram").setAttribute("disabled", "disabled");

	</c:if>
</script>

<script src="/spring/resources/assets/dist/js/form-validation.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script src="/spring/resources/assets/dist/js/popper.min.js"></script>

<script src="/spring/resources/assets/dist/js/script.js"></script>