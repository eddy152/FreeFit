<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>layout.jsp</title>

<style type="text/css">
#container {
	width: 100%;
	margin: 0px auto;
	text-align: center;
	border: 0px solid #bcbcbc;
}

#header {
	padding: 5px;
	margin-bottom: 5px;
	border: 0px solid #bcbcbc;
	background-color: gray;
}


#content {
	width: 75%;
	padding: 5px;
	margin-right: 5px;
	float: left;
	border: 0px solid #bcbcbc;
}



</style>
</head>
<body>
<div id="container">
	<div id="header">
		<tiles:insertAttribute name="header" />
	</div>
	
	<div id="content">
		<tiles:insertAttribute name="content" />
	</div>

	
</div>
	
</body>
</html>
