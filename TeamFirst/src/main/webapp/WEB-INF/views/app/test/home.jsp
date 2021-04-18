<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">

	<div class="py-5 text-center">
		<h2>게시판</h2>
	</div>


	<div style="margin: 10% 10% 10% 10%;">
		<!--  파일첨부 -->
		<form method="post" id="myForm">
			<input type="file" name="image" id="imageF" /> <input
				class="btn btn-primary btn-sm" type="button" value="업로드" id="upbtn" />
		</form>
	</div>
	<div>
		<img src="" id="img">
	</div>
</div>

<script>
window.onload=function(){
	let jslink;
	let jsid;
	let json;
upbtn.addEventListener('click', onClick);

function onClick(){
var imgSize=imageF.files[0];
if (imgSize.size<10000000){
	
	var myHeaders = new Headers();
	myHeaders.append("Authorization", "Client-ID 52d00d8257f11ed");

	var formdata = new FormData();
	formdata.append("image", imgSize, "[PROXY]");

	var requestOptions = {
			  method: 'POST',
			  headers: myHeaders,
			  body: formdata,
			  redirect: 'follow'
			};

fetch("https://api.imgur.com/3/image", requestOptions)
  .then(response => response.json())
  .then(result => {
	  
	  var formdata=new FormData();
	  formdata.append("fileName", result.data.id);
	  formdata.append("pathName", result.data.link);
	  fetch("/spring/files/upload", {method:'POST', body: formdata})
	  .then(response=>response.text())
	  .then(result=>console.log(result))
	  .catch(error=>console.log('error',error));

	  document.getElementById("img").src=result.data.link;
  })
  .catch(error => console.log('error', error));
}
else { alert('파일 용량이 10MB를 초과합니다.');
location.reload();}

}

}


<c:if test="${file ne null and file ne 'error'}">
	var link = '${file}';
	document.getElementById("img").src = link;
	</c:if>
</script>