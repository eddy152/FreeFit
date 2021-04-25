<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="/spring/resources/assets/dist/css/form-validation.css"
	rel="stylesheet">



<div class="container">
	<div class="py-3 text-center">
		<img class="d-block mx-auto mb-sm-1"
			src="https://images.velog.io/images/heyon26/post/86ff3fdb-758f-48c6-b33b-b3cfb9664078/logo_transparent.png"
			alt="" width="172" height="172">
	</div>

	<div class="row">
		<div class="col-md-4 order-md-2 mb-4">
			<h4 class="d-flex justify-content-between align-items-center mb-3">
				<span class="text-muted">결제상세</span> <span
					class="badge badge-secondary badge-pill">3</span>
			</h4>
			<ul class="list-group mb-3">
				<li
					class="list-group-item d-flex justify-content-between lh-condensed">
					<div>
						<h6 class="my-0">상품금액</h6>
						<small class="text-muted"></small>
					</div> <span class="text-muted"></span>
				</li>
				<li
					class="list-group-item d-flex justify-content-between lh-condensed">
					<div>
						<h6 class="my-0">포인트</h6>
						<small class="text-muted"></small>
					</div> <span class="text-muted"></span>
				</li>

				<li class="list-group-item d-flex justify-content-between"
					id="total_amount" name="total_amount"><span>총액(원)</span> <strong></strong></li>
			</ul>


		</div>
		<div class="col-md-8 order-md-1">
			<h4 class="mb-3">주문/결제</h4>
			<form class="needs-validation" novalidate>
				<div class="form-group">
					<label for="exampleFormControlSelect">피트니스</label> <select multiple
						class="form-control" id="exampleFormControlSelect"
						style="overflow: hidden;">
						<c:if test="${fitnesses ne null }">
							<c:forEach items="${fitnesses}" var="fitness">
								<option>${fitness.fitness_name}</option>
							</c:forEach>
						</c:if>
					</select>
				</div>
				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="exampleFormControlSelect2">등급</label> <select multiple
							class="form-control" id="exampleFormControlSelect2"
							name="membership_no" style="overflow: hidden;">

							<option value="2">골드</option>
							<option value="3">플래티넘</option>

						</select>
					</div>
					<div class="form-group col-md-6">
						<label for="inputPassword6">개월</label> <input type="number"
							id="inputPassword6" class="form-control"
							aria-describedby="passwordHelpInline" value="1">
					<div class="row justify-content-end pr-3"><small
							id="passwordHelpInline" class="text-muted">
							3개월 이상 10% 할인 </small></div>
					</div>
				</div>


				<hr class="mb-4">
				<div class="custom-control custom-checkbox">
					<input type="checkbox" class="custom-control-input"
						id="same-address"> <label class="custom-control-label"
						for="same-address">Shipping address is the same as my
						billing address</label>
				</div>
				<div class="custom-control custom-checkbox">
					<input type="checkbox" class="custom-control-input" id="save-info">
					<label class="custom-control-label" for="save-info">Save
						this information for next time</label>
				</div>
				<hr class="mb-4">

				<h4 class="mb-3">Payment</h4>

				<div class="d-block my-3">
					<div class="custom-control custom-radio">
						<input id="credit" name="paymentMethod" type="radio"
							class="custom-control-input" checked required> <label
							class="custom-control-label" for="credit">Credit card</label>
					</div>
					<div class="custom-control custom-radio">
						<input id="debit" name="paymentMethod" type="radio"
							class="custom-control-input" required> <label
							class="custom-control-label" for="debit">Debit card</label>
					</div>
					<div class="custom-control custom-radio">
						<input id="paypal" name="paymentMethod" type="radio"
							class="custom-control-input" required> <label
							class="custom-control-label" for="paypal">PayPal</label>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 mb-3">
						<label for="cc-name">Name on card</label> <input type="text"
							class="form-control" id="cc-name" placeholder="" required>
						<small class="text-muted">Full name as displayed on card</small>
						<div class="invalid-feedback">Name on card is required</div>
					</div>
					<div class="col-md-6 mb-3">
						<label for="cc-number">Credit card number</label> <input
							type="text" class="form-control" id="cc-number" placeholder=""
							required>
						<div class="invalid-feedback">Credit card number is required
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3 mb-3">
						<label for="cc-expiration">Expiration</label> <input type="text"
							class="form-control" id="cc-expiration" placeholder="" required>
						<div class="invalid-feedback">Expiration date required</div>
					</div>
					<div class="col-md-3 mb-3">
						<label for="cc-cvv">CVV</label> <input type="text"
							class="form-control" id="cc-cvv" placeholder="" required>
						<div class="invalid-feedback">Security code required</div>
					</div>
				</div>
				<hr class="mb-4">
				<button class="btn btn-primary btn-lg btn-block" type="submit">Continue
					to checkout</button>
			</form>
		</div>
	</div>

</div>



<link href="/spring/resources/assets/dist/js/form-validation.css"
	rel="stylesheet">




<script>
	//해야하는것- grade 값 받아서 초기 grade 설정
	//등급, 개월 바뀔때 상품금액 변경되도록
	//포인트 값 받아와서 전부사용하기 버튼.
	//포인트 변경될때마다 적용하기
	
	
</script>