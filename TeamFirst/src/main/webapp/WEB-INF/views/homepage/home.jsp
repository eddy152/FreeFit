<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>



	<div id="carouselExampleInterval"
		class="carousel slide d-flex flex-row bg-dark" data-ride="carousel"
		style="position: relative;">

		<div class="carousel-inner">

			<div class="carousel-item active text-center" data-interval="2000"
				style="font-size: 70px; font-weight: bold; color: white;">
				
					<a href="/spring/fitnessHome"> <img
						src="https://i.imgur.com/Zc84gUJ.jpg"
						style="width: 2000px; height:500px; object-fit: none; padding: 0px;">
					</a>
				<h2 class="px-5 py-3">운동을 합시다</h2>
				<h4 class="px-5 pb-5">건강을 합시다</h4>
			</div>
 
			<c:forEach items="${fitnesses }" var="fit">
				<div class="carousel-item" data-interval="8000"
					style="font-size: 70px; font-weight: bold; color: white;">
					<a href="/spring/fitnessHome"> <img
						src="https://i.imgur.com/Zc84gUJ.jpg"
						style="width: 2000px; height: 500px; object-fit: none; padding: 0px;">
					</a>
					<h2 class="px-5 py-3">${fit.fitness_name }</h2>
					<h4 class="px-5 pb-5">${fit.address }</h4>

				</div>




			</c:forEach>


		</div>

	</div>

