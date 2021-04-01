<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>
<a href="getAdminNoticeBoardList">어드민 공지 이벤트 게시판</a><br>
<a href="getUserNoticeBoardList">유저 공지 홍보게시판</a><br>
<a href="getAdminQnaBoardList">어드민 문의게시판</a><br>
<a href="getUserQnaBoardList">유저 문의게시판</a><br>

<P>  The time on the server is ${serverTime}.</P>
</body>
</html>
