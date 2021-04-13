<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">

	<div class="py-5 text-center">
		<h2>게시판</h2>
	</div>


	<div style="margin: 10% 10% 10% 10%;">
		<!--  파일첨부 -->
		<form action="/spring/files/upload" method="post"
			enctype="multipart/form-data">
			<input type="file" name="file" /> <input
				class="btn btn-primary btn-sm" type="submit" value="업로드" />
		</form>
	</div>
	<div>
		<img src="" id="img">
	</div>
</div>

<script>
<c:if test="${file ne null and file ne 'error'}">
	var link = '${file}';
	document.getElementById("img").src = link;
	</c:if>
</script>