<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>getGym.jsp</title>

<script type="text/javascript">
	
	
	/* function search() {
		window.open("http://map.naver.com", "프리핏헬스장검색",
                    "width=700,height=500");
	} */

	/* function openMap(){  
	    window.open("https://map.naver.com/", "네이버지도", "width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
		}  */ 

</script>

<style>

	div#divTag1 {
    right: -520px;
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
	
</style>
<title>getGym</title>
</head>
<body>
<body>
<div class="page-wrapper">
	<div align="center" class="container-fluid">
		<div id="divTag1" class="col-lg-5">
			<!--게시판 넓이 -->
			<div class="col-lg-15" style="color:black; background-color:white; padding:20px;">
				<h1 class="page-header">헬스장 상세조회</h1>
			</div>
			<div class="row"></div>
			<div class="panel panel-default">
				<div class="panel-heading" style="background-color:gray">Free Fit</div>
				<div align="center" class="panel-body">
					<table class="table table-hover">
						<thead>
						<tr>
							<th>이름</th>
							<td>${gym.name}</td>
						</tr>
						<tr>
							<th>사업자번호</th>
							<td>${gym.business_number}</td>
						</tr>
						<tr>
							<th>매장주소</th>
							<td>${gym.address.concat(' ').concat(gym.address_detail)}&nbsp;<input type="button" value="지도검색" onClick="window.open('http://naver.me/FLB1z7Rg','헬스장찾기', 'width=1000, height=700')"></td> 
							<!-- <input type=button value="위치찾기" onclick="javascript:openMap();"> -->
						</tr>
						<tr>
							<th>연락처</th>
							<td>${gym.tel_number}</td>
						</tr>
						<tr>
							<th>멤버십등급</th>
							<td>${gym.membership_name}</td>
						</tr>
						<tr>
							<th>영업시간</th>
							<td>변동</td>
						</tr>
						<tr>
							<th>기타</th>
							<td>기타내용</td>
						</tr>
					</table>
				</div>
				<input class="btn btn-primary" type="button" value="목록" style="float: right;" onclick="location.href='getGymList';">
			</div>
		</div>
	</div>
</div>
</body>
</html>

