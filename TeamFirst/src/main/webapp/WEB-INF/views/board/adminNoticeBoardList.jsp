<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminNoticeBoardList</title>
</head>
<!--<jsp:include page="" /> -->
<body>

<div align="center">
	<h1>공지사항 목록</h1>              
	<div>                       
		<table border="1">
			<tr>
				<a href="getAdminNoticeBoard">board2</a><br>
				<th width="100">글번호</th>
				
				<th width="200">제목</th>
				
				<th width="100">작성일자</th>
			</tr>
			<c:forEach var="vo" items="${list }">             
				<tr class="row">
					<td align="center"></td>
				    <td>&nbsp;</td>
				    <td align="center"></td>
				</tr>
			</c:forEach> 
		</table>
		<button type="button" onclick="location.href='views/board/insertAdminNoticeBoard.jsp'">글쓰기</button>
		

	</div>
</div>
</body>
</html>