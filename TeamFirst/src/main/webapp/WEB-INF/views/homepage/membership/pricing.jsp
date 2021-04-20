<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

      <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
    <h1 class="display-4 mb-2">요금제</h1>
    <p class="lead">편리한 피트니스 관리 도구</p>
  </div>

  <div class="container">
    <div class="card-deck mb-3 text-center">
      <div class="card mb-4 shadow-sm">
        <div class="card-header">
          <h4 class="my-0 font-weight-normal">실버</h4>
        </div>
        <div class="card-body">
          <h1 class="card-title pricing-card-title">0 원<small class="text-muted">/ 월</small></h1>
          <ul class="list-unstyled mt-3 mb-4">
            
            <li>평생 무료</li>
            <li>트레이너 3명</li>
            <li>회원 50명</li>
            <li>피트니스 관리</li>
          </ul>
          <button type="button" id="silver" class="btn btn-lg btn-block btn-outline-primary priceGoBtn">무료 체험</button>
        </div>
      </div>
      <div class="card mb-4 shadow-sm">
        <div class="card-header">
          <h4 class="my-0 font-weight-normal">골드</h4>
        </div>
        <div class="card-body">
          <h1 class="card-title pricing-card-title">15,000 원<small class="text-muted">/ 월</small></h1>
          <ul class="list-unstyled mt-3 mb-4">
            
            <li>트레이너 10명</li>
            <li>회원 500명</li>
            <li>피트니스 관리</li>
            <li>회원&트레이너용 앱</li>
          </ul>
          <button type="button" id="gold" class="btn btn-lg btn-block btn-primary priceGoBtn">시작하기</button>
        </div>
      </div>
      <div class="card mb-4 shadow-sm">
        <div class="card-header">
          <h4 class="my-0 font-weight-normal">플래티넘</h4>
        </div>
        <div class="card-body">
          <h1 class="card-title pricing-card-title">150,000 원<small class="text-muted">/ 월</small></h1>
          <ul class="list-unstyled mt-3 mb-4">
            <li>트레이너 무제한</li>
            <li>회원 무제한</li>
            <li>피트니스 관리</li>
            <li>회원&트레이너용 앱</li>
          </ul>
          <button type="button" id="platinum" class="btn btn-lg btn-block btn-primary priceGoBtn">시작하기</button>
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