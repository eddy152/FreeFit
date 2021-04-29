<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>
<title> 수정 페이지</title>

<script>
$(document).ready(function() {
	  $('#summernote').summernote({
 	    	placeholder: 'content',
	        minHeight: 370,
	        maxHeight: null,
	        focus: true, 
	        lang : 'ko-KR'
	  });
	  // Summernote에 글 내용 추가하는 코드
	  $("#summernote").summernote('code',  '${board.content}');
	});

function goModify() {
	var frm=document.querySelector("#updatform");
	var title = frm.title.value;
	var content = frm.content.value;
	
	if (title.trim() == ''){
		alert("제목을 입력해주세요");
		return false;
	}
	if (content.trim() == ''){
		alert("내용을 입력해주세요");
		return false;
	}
	frm.submit();
}
</script>
</head>
<style>

	div#divTag1 {
	right: -390px;
	margin-right: ;
	}

	.button {
  	background-color: #01DFD7;
  	border: none;
  	color: white;
	padding: 10px 20px;
  	text-align: center;
  	text-decoration: none;
  	display: inline-block;
  	font-size: 13px;
  	margin: 3px 1px;
  	cursor: pointer;
	}
	
	table {width: 100%;}
	textarea {width: 100%;}
	#outter {display: block;
		 width: 30%;
		 margin: auto; 	
</style>

<body>
	<div class="container-fluid">
		<div id="divTag1" class="col-lg-6">
				<div style="color:black; background-color:white; padding:20px;">
					<h2 align="center" class="page-header">공지사항 수정</h2>
				</div>
		
			<form method="post" action="updateAdminNoticeBoard" id="updatform">
				<label for="category">카테고리 : </label>
					<select id="category" name="category">
						<option value="공지">공지</option>
						<option value="이벤트">이벤트</option></select><br>
						게시물번호 : <input readonly="readonly" type="text" name="board_no" value="${board.board_no}"><br>
						제목 : <input type="text" name="title" style="width: 30%;" placeholder="제목" value="${board.title}"/>
						<br><br> 
					   <textarea id="summernote" name="content"></textarea>
	  		 </form>																		
		       		   <div>
		       		   <input class="btn btn-primary" id="subBtn" type="button" value="수정완료" style="float: right;" onclick="goModify()"/>
	       		       <input class="btn btn-primary" type="button" value="목록" style="float: right;" onclick="location.href='getAdminNoticeBoardList';">
						</div>
		</div>
	</div>
</body>
</html>