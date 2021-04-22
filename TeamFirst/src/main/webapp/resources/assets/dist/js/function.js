/**
 * 
 */
///////////////////////////////////////////////////////////////////////////
//부트스트랩 로딩모달 html
function loadingModal() {

if(!document.getElementById('Loadingmodal')){ //로딩모달이 없으면 추가한다
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
/*

loadingModal(); //모달 추가
$('#Loadingmodal').modal('show'); //모달 보이기
$('#Loadingmodal').modal('hide'); //모달 숨기기

*/
//////////////////////////////////////////////////////////////////////////