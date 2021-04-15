<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ page session="false" %>


            <link href="/spring/resources/assets/dist/css/form-validation.css" rel="stylesheet">

            <!--               -----------------------------------------                   -->


            <div class="container">
                <div class="py-3 text-center">
                    <img class="d-block mx-auto mb-sm-1"
                        src="https://images.velog.io/images/heyon26/post/86ff3fdb-758f-48c6-b33b-b3cfb9664078/logo_transparent.png"
                        alt="" width="172" height="172">


                </div>

                <div class="row justify-content-center">

                    <!-- novalidate =<form> 태그의 novalidate 속성은 폼 데이터(form data)를 서버로 제출할 때 해당 데이터의 유효성을 검사하지 않음을 명시합니다. -->
                    <form class="needs-validation was-validated" method="post" action="/spring/members/joinO" novalidate>
                        <!-- action="/members/joinA" -->

                        <div class="row justify-content-center">
                            <div class="col mb-md-2">
                                <!-- col 의 margin bottom 을 - midium - 2만큼 -->
                                <label for="name">이름</label> <input type="text" class="form-control" id="name"
                                    name="name" placeholder="이름" required>
                                <div class="invalid-feedback">이름을 입력해주세요.</div>
                            </div>
                        </div>
                        <div class="row justify-content-center">
                            <div class="col mb-md-2">
                                <!-- col 의 margin bottom 을 - midium - 2만큼 -->
                                <label for="email">이메일</label> <input type="email" class="form-control" id="email"
                                    name="email" placeholder="이름" required>
                                <div class="invalid-feedback">이메일을 입력해주세요.</div>
                            </div>
                        </div>
                        <div class="row justify-content-center">
                        <div class="col mb-md-2">
                                <!-- col 의 margin bottom 을 - midium - 2만큼 -->
                                <label for="phone_number">핸드폰 번호</label> <input type="text"
									class="form-control" id="phone_number" name="phone_number"
									placeholder="핸드폰 번호" minlength="13" maxlength="13" required>
                                <div class="invalid-feedback">핸드폰 번호를 입력해주세요.</div>
                            </div>
                        </div>
                        <br>
                        <div class="row justify-content-center">
                            <div class="col mb-md-2">
                                <label for="userId">ID</label> <input type="text" class="form-control" id="id"
                                    name="id" placeholder="ID" minlength="5" required>
                                <div class="invalid-feedback" style="width: 100%;">아이디를 입력해주세요.</div>
                            </div>

                        </div>
                        <div class="row justify-content-center">

                            <div class="col mb-md-2">
                                <label for="password">비밀번호</label>
                                <div class="input-group">

                                    <input type="password" class="form-control" id="password" name="password"
                                        placeholder="비밀번호" required minlength="6">
                                    <div class="invalid-feedback" style="width: 100%;">비밀번호를 입력해주세요.</div>
                                </div>
                            </div>

                        </div>
                        <div class="row justify-content-center">
                            <div class="col mb-md-2">
                                <label for="pwConfirm">비밀번호 재확인</label>
                                <div class="input-group">

                                    <input type="password" class="form-control" id="pwConfirm" name="pwConfirm"
                                        placeholder="비밀번호 재확인" required>
                                    <div class="invalid-feedback" style="width: 100%;">비밀번호 확인이 필요합니다.</div>
                                </div>
                            </div>

                        </div>
                        <br>
                        <div class="row justify-content-center">
                            <div class="col mb-md-2">
                                <label for="address_detail">헬스클럽명</label>
                                <input type="text" class="form-control" id="fitness_name" name="fitness_name"
                                    placeholder="헬스클럽명" value="" required>
                            </div>
                        </div>

                        <div class="row justify-content-center">
                            <div class="col mb-md-2">
                                <label for="zipcode">우편번호</label>
                                <div class="input-group">
                                    <input type="number" class="form-control" id="zipcode" name="zipcode" placeholder="우편번호" required>
                                    <div class="input-group-append">
                                        <input class="btn btn-primary" type="button" id="execPostCode" value="우편번호 찾기">
                                    </div>
                                </div>
                                <div class="invalid-feedback">우편번호를 입력해주세요.</div>
                            </div>




                        </div>
                        <div class="row justify-content-center">
                            <div class="col mb-md-2">
                                <label for="address">주소</label> <input type="text" class="form-control" id="address"
                                    name="address" placeholder="헬스클럽 주소" required>
                                <div class="invalid-feedback">헬스클럽 주소를 입력해주세요.</div>
                            </div>
                        </div>
                        <div class="row justify-content-center">
                            <div class="col mb-md-2">
                                <label for="address_detail">주소 상세<span class="text-muted">(Optional)</span></label>
                                <input type="text" class="form-control" id="address_detail" name="address_detail"
                                    placeholder="주소 상세">
                            </div>
                        </div>

                        <div class="row justify-content-center">
                            <div class="col mb-lg-5">
                                <button class="btn btn-primary btn-lg btn-block" type="submit">회원가입</button>
                            </div>
                        </div>
                    </form>

                </div>

            </div>





  
  <script>
  
  </script>
  
  
  <!-- 주소 찾기 -->
            <script>
                function getPostcode() {
                    new daum.Postcode({
                        oncomplete: function (data) {

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
            </script>
            
            
            <script src="/spring/resources/assets/dist/js/form-validation.js"></script>
            <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

  <!-- iamport.payment.js -->