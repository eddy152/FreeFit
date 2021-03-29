<%@page language="java" contentType="text/html; charset=UTF-8" %>

<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>layout.jsp</title>

<style type="text/css">

#header{

	width : 100%;
	height : 50px;
	text-align: center;
	background-color: green;
}

#menu {
	float : left;
	width : 15%;
	background-color: purple;
}
#content{
	float: left;
	width : 85%;
	background-color:  green;
}

#footer{
	width:100%;
	height: 50px;
	text-align: center;
	background-color:  red;
	clear : both;
}

#menu, #content {
	min-height: 600px;
}
</style>
</head>
<body>
<div style="width: 100%; height: 100%;">
	<div id="content"><tiles:insertAttribute name="content" /></div>
</div>
</body>
</html>
