<%@page language="java" contentType="text/html; charset=UTF-8"%>

<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>프로그램</title>

<style type="text/css">
#container {
	height: 100%;

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
	padding: 5px;
	margin-right: 5px;
	border: 0px solid #bcbcbc;
}

#sidebar-left {
	height: 100%;
	width: 100px;
	float: left;
	background-color: blue;
	border: 0px solid #bcbcbc;
	font-size: 10px;
}

</style>
</head>
<body>
	<div id="sidebar-left">
		<tiles:insertAttribute name="side" />
	</div>
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
