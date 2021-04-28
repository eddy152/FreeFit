<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="container">
<div class="row justify-content-center">
	<a href="/spring/appmain"><img class="mb-4"
			src="/spring/resources/images/logo.png" alt="" width="172"
			height="172"></a>
</div>
	<form class="form-signin" method="post" id="reservForm"
		action="insertReserv">
		 
			<label for="inputId" class="sr-only">트레이너 선택</label> <select
			 id="selectTrainer" class="form-control mb-0" name="trainer_id" required autofocus>

			<c:forEach items="${train}" var="trainer">
				<option value="${trainer.id}">${trainer.name}</option>
			</c:forEach>
		</select> 
		
		<label for="inputPassword" class="sr-only">예약일</label> <input
			type="date" id="inputPassword" class="form-control mt-0"
			name="reservation_date" required>

		<button class="btn btn-lg btn-dark btn-block" type="submit"
			id="ReservNow">예약</button>
	</form>

</div>

