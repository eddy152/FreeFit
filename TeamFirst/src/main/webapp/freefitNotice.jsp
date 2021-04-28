<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style>

.wrap{ width:700px; } 
.content{ position:relative; padding-top:56%; width:100%; } 
 iframe{ position:absolute; top:0; left:0; width:100%; height:100%; }

div#divTag1 {
    right: -630px;
    margin-right: ;
	}

h1 { text-align: center; 
	 color : skyblue;
	}

</style>
</head>
<body>
	<img src="resources/images/FreefFit1.png" width="1800" height="900">
	<br>
	<br>
	<br>
	<br>
	<h1>Free Fit 소개영상</h1>
	<div class="wrap">
		<div id="divTag1" class="content"> 
			
			<iframe src="https://www.youtube.com/embed/c7Nl8slNVWc" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
		</div> 
	</div>
	<br>
	<br>
	<img src="resources/images/FreeFit2.png" width="2000" height="900">
	<img src="resources/images/FreeFit3.png" width="1900" height="900">
</body>
</html>



