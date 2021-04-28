//login 관련 기능
(function () {

    // 로그인 상태에서 loginForm 들어오면 경고창 띄우고 뒤로가기
    
    if (typeof isLogin !== "undefined" && isLogin && isLogin !== '') {
        if (document.location.href.includes('loginform')) {
            alert("로그인하셨습니다.");
            history.go(-1);
        }
    }

    //로그인 상태에서 로그인 버튼 로그아웃으로 변경
    if (typeof loginBtn !== "undefined") {
   		let profile;
        if (isLogin && isLogin !== '') {
            if (typeof loginBtn !== "undefined") { // loginBtn은 object type.  / typeof 를 사용하면 선언하지 않은 변수라도 오류x.
                loginBtn.text = "로그아웃";
                
                if (typeof homepageLogin!== "undefined"){
                profile=document.createElement("a");
                profile.setAttribute("class","btn btn-outline-primary");
                profile.setAttribute("id","profileBtn");
                profile.text = "마이페이지";                
                profile.onclick=function(){
                location.href="/spring/members/profile";
                
                };
                loginBtn.parentNode.prepend(profile);              
                }
            }

        }
        //클릭시 로그인/로그아웃 확인 -> 로그인폼 / 로그아웃
        loginBtn.onclick = function () {
            if (loginBtn.text == "로그인") {
                location.href = "/spring/members/loginform";
            }
            else if (loginBtn.text == "로그아웃") {
                let logoutConfirm = confirm("로그아웃 하시겠습니까?");
                if (logoutConfirm) {
                    fetch("/spring/members/logout").then(response => { alert("로그아웃 성공"); location.reload(); })
                }
            }
        }
        
        

    }

    //회원가입 버튼. 로그인 상태에서는 안보이도록
    if (typeof joinBtn !== "undefined") {
        //클릭시 가입폼으로
        joinBtn.onclick = function () {
            location.href = "/spring/members/joinformH";
        }
        if (isLogin && isLogin !== '') {
            if (typeof joinBtn !== "undefined") { //로그인 상태일때는 회원가입 버튼 안보이도록
                joinBtn.remove();
            }
        }

    }

    //로그인폼 login 버튼 클릭 이벤트
    if (typeof formLogin !== "undefined") {
		
        formLogin.onclick = function () {
        if(document.querySelector("#inputId").value.length>=4 && document.querySelector("#inputPassword").value.length>=4)
        {
        loadingModal(); //모달 추가
            
            $('#Loadingmodal').modal('show'); //부트스트랩 modal 보이기 (로딩)

            fetch(loginForm.action, { //fetch. ajax 와 비슷한 기능. loginForm.action 의 url 받아옴 (/spring/authenticate)
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: new URLSearchParams({
                    userId: loginForm.userId.value,
                    password: loginForm.password.value
                })
            })

                .then(response => response.url)
                .then(response =>{
                
                console.log(response);
                    
                    if (response.includes('error')) {
                    $('#Loadingmodal').modal('hide');
                        console.log(response.url);
                        alert('로그인 실패하였습니다. 아이디와 비밀번호를 확인해주세요.');
                    }
                    else {
                        fetch('log').then(result=>result.text()).then(function(result) {
                        if(result =='owner'){
                            location.href="/spring/members/profile";}
                        
                        else {location.href="/spring/appNoticeList";}
                        })

                    }
                })
                .catch(error => console.error('Error:', error))

        }
        
        else {document.querySelector("#loginForm").className+= ' was-validated';
        }
    }
    }


if (typeof phone_number !== "undefined") {
    $(document).on("keydown", "#phone_number", function() {


$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );

});

$(document).on("focusout", "#phone_number", function() { 


$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );

});
}


})()


//부트스트랩 로딩모달 html
function loadingModal() {

if(!document.getElementById('Loadingmodal')){
let modalNode=document.createElement("div");
modalNode.setAttribute("class", "modal");
modalNode.setAttribute("id","Loadingmodal");
modalNode.setAttribute("tabindex","-1");
modalNode.setAttribute("aria-labelledby","LoadingmodalLabel");
modalNode.setAttribute("aria-hidden","true");
modalNode.setAttribute("style","display:none;");

modalNode.innerHTML = `
<div class="modal-dialog modal-dialog-centered">
<div class="mx-auto my-auto">
<div class="spinner-border" role="status">
<span class="sr-only">Loading...</span></div></div></div>
`;
document.body.prepend(modalNode);
}
}

// $('#Loadingmodal').modal('show'); // 로딩모달 보이기
// $('#Loadingmodal').modal('hide'); // 로딩모달 숨기기


//아이디 중복체크    
if (typeof id !== "undefined") {
    id.addEventListener('focusout', (event) => {
    
    if(event.target.value.length>4){
        console.log(event.target.value);
        let url = "/spring/members/checkId?";
        url += event.target.name + "=" + event.target.value;
        console.log(url);
        fetch(url, { method: 'GET' }).then(response => response.text()
            .then(function (text) {

                if (text == document.querySelector("#id").value) {
                    document.getElementById('id').value = "";
                    alert("이미 존재하는 아이디입니다");
                }

            }))
   }
   
    });
}

//비번 재확인
if (typeof pwConfirm !== "undefined") {
    pwConfirm.addEventListener('focusout', (event) => {

                if (event.target.value !== document.getElementById('password').value) {
                    document.getElementById('pwConfirm').value = "";
                    alert("비밀번호와 다릅니다.");
                }

          
    });
}