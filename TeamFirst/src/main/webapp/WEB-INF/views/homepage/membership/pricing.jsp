<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
@font-face {
    font-family: 'HSDookubi';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_eight@1.0/DOSGothic.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

.priceanima{
background-color: black;
}
.goldanima {
font-family: "HSDookubi", Arial, Helvetica, sans-serif;
	background: linear-gradient(272deg, #ffe558, #ffe558, #ffe558, #ffe558, #ffed5e,
		#ffe476, #ffffff, #ffd85f, #fffc58, #ffe558, #ffe86f, #ffe86f, #ffc96f
		, #ffffff, #ffe558, #ffe558, #ffe558, #ffe558, #ffe558, #ffe558);
	background-size: 500% 500%;
	animation: gold 3s infinite;
	  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;	
}

@keyframes gold {
	from {background-position: 0%
}

to {
	background-position: 100%
}

}
.silveranima {
font-family: "HSDookubi", Arial, Helvetica, sans-serif;
	background: linear-gradient(272deg, #c6d0cf, #c6d0cf, #c6d0cf, #c6d0cf, #e3eae9,
		#d3dbdd, #ffffff, #cdd5d5, #b9c5c6, #dee6e5, #d3dddc, #c6d0cf, #e1e1e1
		, #ffffff, #c6d0cf, #c6d0cf, #c6d0cf, #c6d0cf, #c6d0cf, #c6d0cf);
	background-size: 500% 500%;
	animation: silver 3s infinite;
	  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;	
}

@keyframes silver {
	from {background-position: 0%
}

to {
	background-position: 100%
}

}
.platinumanima {
font-family: "HSDookubi", Arial, Helvetica, sans-serif;
	background: linear-gradient(272deg, #ccffed, #ccffed, #ccffed, #ccffed, #62ffbb,
		#81fff5, #5fffba, #8fffec, #ffffff, #72ffce, #67fff3, #67ffcb,#67fff3
		, #ffffff, #ccffed, #ccffed, #ccffed, #ccffed, #ccffed, #ccffed);
	background-size: 500% 500%;  
	animation: platinum 3s infinite;
	  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;	
} 

@keyframes platinum {
	from {background-position: 0%
}

to {
	background-position: 100%
}
}
</style>


<div
	class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mb-lg-5 mx-auto text-center">
	<h1 class="mb-2">요금제</h1>
	<p class="lead">편리한 피트니스 관리 도구</p>
</div>

<div class="container">
	<div class="card-deck mb-3 text-center">
		<div class="card mb-4 shadow-sm">
			<div class="card-header priceanima p-0">
				<h1 class="my-0 font-weight-normal  silveranima font-weight-bold">실-버</h1>
			</div> 
			<div class="card-body py-lg-5">
				<h1 class="card-title pricing-card-title">
					0 원<small class="text-muted">/ 월</small>
				</h1>
				<ul class="list-unstyled mt-3 mb-4">

					<li>평생 무료</li>
					<li>트레이너 0명</li>
					<li>회원 0명</li>
					<li>피트니스 등록</li>
				</ul> 

				<a class="btn btn-lg btn-block btn-outline-dark priceGoBtn"
					href="/spring/members/profile#fitness">무료 등록</a>
			</div>
		</div>
		<div class="card mb-4 shadow-sm">
			<div class="card-header priceanima p-0">
				<h1 class="my-0 font-weight-normal goldanima font-weight-bold ">골-드</h1>
			</div>
			<div class="card-body py-lg-5">
				<h1 class="card-title pricing-card-title">
					9,999 원<small class="text-muted">/ 월</small>
				</h1>
				<ul class="list-unstyled mt-3 mb-4">

					<li>트레이너 10명</li>
					<li>회원 500명</li>
					<li>피트니스 관리</li>
					<li>회원&트레이너용 앱</li>
				</ul>
				<button type="button" id="gold"
					class="btn btn-lg btn-block btn-dark priceGoBtn">시작하기</button>
			</div>
		</div>
		<div class="card mb-4 shadow-sm">
			<div class="card-header priceanima p-0">
				<h1 class="my-0 font-weight-normal platinumanima font-weight-bold ">플래티넘</h1>
			</div>
			<div class="card-body py-lg-5">
				<h1 class="card-title pricing-card-title">
					99,999 원<small class="text-muted">/ 월</small>
				</h1>
				<ul class="list-unstyled mt-3 mb-4">
					<li>트레이너 무제한</li>
					<li>회원 무제한</li>
					<li>피트니스 관리</li>
					<li>회원&트레이너용 앱</li>
				</ul>
				<button type="button" id="platinum"
					class="btn btn-lg btn-block btn-dark priceGoBtn">시작하기</button>
			</div>
		</div>
	</div>
</div>

<script>
window.onload=function(){
	
  const formbtns = document.querySelectorAll('.priceGoBtn');
formbtns.forEach(formbtn=>{formbtn.addEventListener('click', PriceClick);
});

function PriceClick(){
let PriceUrl="/spring/membership/msRegister?grade="+this.id;
	console.log(this.id);
	location.href=PriceUrl;
	
	
}
  
}
  </script>