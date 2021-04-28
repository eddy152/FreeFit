<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<script src="/resources/js/summernote-ko-KR.js"></script>


<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			placeholder : 'content',
			minHeight : 370,
			maxHeight : null,
			focus : true,
			lang : 'ko-KR'
		});
		
		$("#summernote").summernote('code',  '${board.content}');
		$('#summernote').next().find(".note-editable").attr("contenteditable", false);
});
</script>
<script>
	function del(board_no) {
		var check = confirm("정말 삭제하시겠습니까?");
		if (check) {
			location.href='deleteAdminNoticeBoard?board_no='+board_no;
		}
	}	
</script>
</head>
<style>

/* 	div#divTag1 {
    right: -500px;
    margin-right: ;
	}
	
	div#divTag2 {
    right: -350px;
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
	}
	 */
</style>


	<div class="row justify-content-center">

    <div class="col-8">
    <!-- <h2 class="text-center">게시글상세보기</h2><p>&nbsp;</p> -->
    <div class="table table-responsive">
        <table class="table" style="color:white; background-color:#01DFD7; padding:20px;">
  
        <tbody>
         <tr>
           	 <th>글번호</th>
             <td>${board.board_no}
             <th>조회수</th>
             <td>${board.hit }</td>
        </tr>
        <tr>
              <th>제목</th>
              <td>${board.title}</td>
              <th>카테고리</th>
              <td>${board.category}</td>
        </tr>
        </tbody>
    </table>
    </div>
    </div>
    </div>
    <div class="row justify-content-center">
		<div id="divTag1" class=col-lg-6>
		<form method="post" action="updateAdminNoticeBoard" >
		<div class="row" style="height: 600px; padding: 20PX;">${board.content}</div> 
		<div class="input-group mb-3">
		<input class="btn btn-primary" type="button" value="수정하기" style="float: right;" 
			   onclick="location.href='updateAdminNoticeBoard?board_no=${board.board_no}';"/><!--"goModify(this.form)"  -->
	
		<input type="button" value="목록" style="float: right;"
			   class="btn btn-primary"
			   onclick="location.href='getAdminNoticeBoardList';">
	
		<input class="btn btn-primary" type="button" value="삭제" style="float: right;" onclick="del(${board.board_no})">
		</div>
		</form>
    </div>
		</div>
