<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
		<!--<jsp:include page=""/>-->
		<div><h1>공지사항 작성</h1></div>
	<div>
		<table border="1"> 
			<tr>
				<th width="70">글번호</th>
				<td align="center" width="50">
					<input type="text" id="boardNo" name="boardNo">
				</td>
				<th width="70">작성자</th>
				<td align="center" width="150">
					<input type="text" id="writer" name="writer">
				</td>	
				<th width="70">작성일자</th>
				<td align="center" width="150">
					<input type="date" id="creationDate" name="creationDate">
				</td>
			</tr>
			<tr>
				<th width="70">제목</th>
				<td colspan="7">
				<input type="text" id="title" name="title" size="90">
				</td>
			</tr>
			<tr>
				<th width="70">내용</th>
				<td colspan="5"><textarea id="content" name="content" rows="7" cols="90"></textarea></td>
			</tr>
		</table><br/>
		<button type="submit">저장</button> &nbsp;&nbsp;&nbsp; <button type="reset">취소</button>
	</div><br>
</div><br/>
<div>
</div>
</body>
</html>