<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="/spring/resources/assets/dist/css/form-validation.css"
	rel="stylesheet">


<div class="container justify-content-center my-lg-4">
	<div class="py-3 px-3 text-center">
		<h2 class="mb-3">주문/결제</h2>
	</div>
	<form action="kakaoPay" method="post" id="kakaoPayForm">
		<div class="row mx-lg-5 ">
			<div class="col-md-5 order-md-2">
				<label for="paydetail">결제상세</label>

				<ul class="list-group " id="paydetail"> 

					<li class="list-group-item d-flex justify-content-between h-100"><span class="col-md-7 align-self-center text-left">상품금액(원)</span><input
						type="text" class="form-control col-md-5 border-0 text-right pt-lg-2 mt-xl-2"
						id="pre_amount" name="pre_amount"  min="0"></li>
					<li class="list-group-item d-flex justify-content-between h-100"><span class="col-md-7 align-self-center text-left">포인트(원)</span><input
						type="text" class="form-control col-md-5 border-0 text-right pt-lg-2 mt-xl-2"
						id="all_point" name="all_point" value="0" readonly="readonly"
						min="0"></li> 
 
					<li class="list-group-item d-flex justify-content-between h-100"><span class="col-md-7 align-self-center text-left">총액(원)</span><input
						type="text" class="form-control col-md-5 border-0 text-right pt-lg-2 mt-xl-2"
						id="total_amount" name="total_amount" readonly="readonly" min="0"></li>
				</ul>

			</div>
			<div class="col-md-7 order-md-1">


				<div class="form-group">
					<label for="exampleFormControlSelect">피트니스</label> <select 
						class="form-control" id="fitness_id" name="fitness_id">
						<c:if test="${fitnesses ne null }">
							<c:forEach items="${fitnesses}" var="fitness">
								<option value="${fitness.fitness_id}">${fitness.fitness_name}</option>
							</c:forEach>
						</c:if>
					</select>
				<input type="text" id="fitness_name" hidden="hidden">
				</div>
				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="item_name">등급</label> <select
							class="form-control changepay " id="item_name" name="item_name"
							style="overflow: hidden;">

							<option value="gold">골드</option>
							<option value="platinum">플래티넘</option>

						</select>
					</div>
					<div class="form-group col-md-6">
						<label for="quantity">개월</label> <input type="number"
							id="quantity" name="quantity" class="form-control changepay"
							aria-describedby="passwordHelpInline" value="1" min="0">
						<div class="row justify-content-end pr-3">
							<!-- <small id="passwordHelpInline" class="text-muted"> 3개월 이상
								10% 할인 </small> -->
						</div>
					</div>
				</div>

				<hr class="mb-4">


				<div class="row">
					<div class="col-md-6 mb-3">
						<label for="cc-name">현재 포인트</label> <input type="number"
							class="form-control" id="nowPoint" min="0" placeholder=""
							value="${point}" readonly="readonly">

					</div>
					<div class="col-md-6 mb-3 ">
						<label for="all_point">사용 포인트</label>
						<div class="input-group">
							<input type="number" min="0" max="${point }" class="form-control"
								id="usingPoint" placeholder="" value="0">
							<div class="input-group-append">
								<button class="btn btn-outline-secondary" type="button"
									id="pointAllUse">전부사용</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row justify-content-center">
			<hr class="mb-4">
			<button class="btn btn-warning btn-lg btn-block mx-lg-5 col-4" type="button"
				onclick="goSubmit()">카카오 결제</button>
		</div>
	</form>
</div>





<script>


window.onload = function() {
	let price; //가격
	let quantity=1; //양
	let point=0; //포인트
	//해야하는것- grade 값 받아서 초기 grade 설정
	if (window.location.search.split("=")[1] == 'platinum') {
		document.querySelector("#item_name").options[1].selected = true;
	}
	
	if(document.querySelector("#item_name").selectedOptions[0].value=='gold')
		{
	document.querySelector("#pre_amount").value=9999;
	document.querySelector("#total_amount").value=9999;
	price=9999;
		}
	else{document.querySelector("#pre_amount").value=99999;
	document.querySelector("#total_amount").value=99999;
	price=99999;}
	
	

	
	//가격이나 양이 변하면 최종가격변경
	function changeAmount(e){
 		let target = e.target;
	
		if(target.name=="item_name"){
			if(target.selectedOptions[0].value=="gold"){

				price = 9999;
			}		
			else
			{price=99999;}
		}
		else if (target.name="quantity")  {
			quantity = document.querySelector("#quantity").value;
		}
		else {};
		
		
		document.querySelector("#pre_amount").value=price*quantity;
		document.querySelector("#total_amount").value=document.querySelector("#pre_amount").value-point;
		 
	}//////
	//포인트변경
	function changePoint(e){

		
		if(e.target.type=="button"){
			if(parseInt(document.getElementById("nowPoint").value)>parseInt(document.querySelector("#pre_amount").value))
			{
				document.getElementById("usingPoint").value=document.querySelector("#pre_amount").value;
			}
			else {document.getElementById("usingPoint").value=
				document.getElementById("nowPoint").value;	}		
		}
if(parseInt(document.querySelector("#usingPoint").value)>=parseInt(document.querySelector("#nowPoint").value))

{
	document.querySelector("#usingPoint").value=document.querySelector("#nowPoint").value;
}	
	if(parseInt(document.getElementById("usingPoint").value)>parseInt(document.querySelector("#pre_amount").value))
			
			{
				document.getElementById("usingPoint").value=document.querySelector("#pre_amount").value;	
			}
			document.getElementById("all_point").value=
				document.getElementById("usingPoint").value;
		
			
			point=document.getElementById("all_point").value;
			changeAmount(event);



			}
		
	//포인트 값 받아와서 전부사용하기 버튼.
	document.querySelector("#pointAllUse").addEventListener("click",changePoint);
	//포인트 변경될때마다 적용하기
	document.querySelector("#usingPoint").addEventListener("change",changePoint);
	document.querySelector("#fitness_id").addEventListener("change",function(){
		document.getElementById('fitness_name').value=document.querySelector('#fitness_id').selectedOptions[0].innerText;
		
	});
		//등급, 개월 바뀔때 상품금액 변경되도록
		const changepay = document.querySelectorAll('.changepay');
		changepay.forEach(changepay=>{changepay.addEventListener('change', changeAmount)});
	
	
	
	}//window onload
	function goSubmit()
	{
		if (parseInt(document.querySelector("#total_amount").value)>0){
			
	    var gsWin = window.open("about:blank", "kakaoPayStart","top=10, left=10, width=400, height=600, status=no, menubar=no, toolbar=no, resizable=no");
	    var frm = kakaoPayForm;
	    frm.target="kakaoPayStart";
	    frm.submit();
		}
		else {alert('결제할 수 없습니다.');}
	}

	
	
	
</script>