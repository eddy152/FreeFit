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
        if (isLogin && isLogin !== '') {
            if (typeof loginBtn !== "undefined") { // loginBtn은 object type.  / typeof 를 사용하면 선언하지 않은 변수라도 오류x.
                loginBtn.text = "로그아웃";
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
		loadingModal(); //모달 추가
        formLogin.onclick = function () {
            
            $('#Loadingmodal').modal('show'); //부트스트랩 modal 보이기 (로딩)

            fetch(loginForm.action, { //fetch. ajax 와 비슷한 기능. loginForm.action 의 url 받아옴 (/spring/authenticate)
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: new URLSearchParams({
                    userId: loginForm.userId.value,
                    password: loginForm.password.value
                })
            })

                .then(response => {
                console.log(response);
                    $('#Loadingmodal').modal('hide');
                    /*  (modal fade 인 경우 애니메이션 때문에 hide가 씹힐 수 있음) */
                    if (response.url.includes('error')) {
                        console.log(response.url);
                        alert('로그인 실패하였습니다. 아이디와 비밀번호를 확인해주세요.');
                    }
                    else {
                        fetch('log').then(function () {
                            history.go(-1);
                        })
                        alert('로그인 성공');

                    }
                })
                .catch(error => console.error('Error:', error))

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
    document.body.innerHTML += '<div class="modal" id="Loadingmodal" tabindex="-1"'
        + 'aria-labelledby="LoadingmodalLabel" aria-hidden="true" role="dialog">'
        + '<div class="modal-dialog modal-dialog-centered">'
        + '<div class=" col align-self-center ">'
        + '<div class="spinner-border" role="status">'
        + '<span class="sr-only">Loading...</span></div></div></div></div>';
}

// $('#Loadingmodal').modal('show'); // 로딩모달 보이기
// $('#Loadingmodal').modal('hide'); // 로딩모달 숨기기


//아이디 중복체크    
if (typeof id !== "undefined") {
    id.addEventListener('focusout', (event) => {
        console.log(event.target.value);
        let url = "/spring/members/checkId?";
        url += event.target.name + "=" + event.target.value;
        console.log(url);
        fetch(url, { method: 'GET' }).then(response => response.text()
            .then(function (text) {

                if (text == document.querySelector("#id").value) {
                    alert("이미 존재하는 아이디입니다");
                    document.getElementById('id').value = "";
                }

            }))
    });
}

//비번 재확인
if (typeof pwConfirm !== "undefined") {
    pwConfirm.addEventListener('focusout', (event) => {

                if (event.target.value !== document.getElementById('password').value) {
                    alert("비밀번호와 다릅니다.");
                    document.getElementById('pwConfirm').value = "";
                }

          
    });
}