<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">

	// 해당 락커의 회원 상세조회
	$(document).ready(function() {
		$('.btn').click(function() { // 다중 값을 넘길 때는 class를 사용한다. 단건이면 id 속성 사용
			$.ajax({
				url : "getLocker",
				type : "get",
				data : { lock_no : $(this).val() },
				dataType : 'json',
				success : userSelect, // 회원 조회
				error : function(){
					alert("실패!");
				}
			}) //ajax
		}); // click
	});// ready

	// 회원 상세보기 응답
	function userSelect(user) {
		console.log(user.name + ", " + user.each_lock_no);
		$('input:text[name="lock_no"]').val(user.lock_no);
		$('input:text[name="each_no"]').val(user.each_lock_no);
		//$('input:text[name="broken_locker"]').val(user.broken_locker);
		$('input[name="first_date"]').val(user.first_date);
		$('input[name="final_date"]').val(user.final_date);
		$('input:text[name="user_id"]').val(user.user_id);
		$('input:text[name="room_no"]').val(user.room_no);
		$('input:text[name="user_name"]').val(user.name);
		if(user.broken_locker == "1") {
			$('input[name="broken_locker"]')[0].checked = false
			$('input[name="broken_locker"]')[1].checked = true
		} else {
			$('input[name="broken_locker"]')[1].checked = false
			$('input[name="broken_locker"]')[0].checked = true
		}
	}

	// 락커 등록
	$(document).ready(function() {
		$('#btnInsert').click(function() {
			if($('input[name="broken_locker"]')[1].checked == true) {
				alert('락커를 사용할 수 없습니다.');
			} else {	
				$.ajax({
					url : 'insertLocker',
					method : 'Post',
					data : $('#form1').serialize(),
					dataType : 'json',
					success : function() {
						alert('등록 성공!!');
						location.reload();
					},
					error : function() {
						alert('등록 실패!!');
					}
				})	
			}
		})
	})

	// 락커 수정
	$(document).ready(function() {
		$('#btnUpdate').click(function() { // 다중 값을 넘길 때는 class를 사용한다. 단건이면 id 속성 사용
			if(window.confirm('정말 수정하시겠습니까?')){
				
			$.ajax({
				url : "updateLocker",
				method : "Post",
				data : $('#form1').serialize(),
				dataType : 'json',
				success : function(response) {				
					alert('수정완료');
					location.reload();

				},
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				}
			}) //ajax
			} else {
				window.alert('취소');
			}
		}); // click
	});// ready

	// 락커 삭제
	$(document).ready(function() {
		$('#btnDelete').click(function() {
			if(window.confirm('정말 삭제하시겠습니까?')){
				
			$.ajax({
				url : 'deleteLocker',
				method : 'post',
				data : {
					lock_no : $('#lock_no').val()
				},
				dataType : 'json',
				success : function(response) {
					alert('삭제완료');
					location.reload();
				},
				error : function(response) {
					alert('ERROR');
					}
				})
			} else {
				window.alert('취소');
			}
		})
	})

	// Modal - 관리팝업창
	$(document).ready(function() {
		$('.btn-primary').click(function(e) {
			e.preventDefault();
			$('#staticBackdrop').modal("show");
		});
	});
	
	// Modal - user
	$(document).ready(function() {
		$('.user_name').click(function(e) {
			e.preventDefault();
			$('#userModal').modal("show");
		});
	});
	
	$(document).ready(function() {
		$('.roomTr').click(function() {
		 $.ajax({
				url: 'getRoom',
				type: 'get',
				data: { room_no : $('.roomNO').eq($(".roomTr").index(this)).val() },
				dataType: 'json',
				success: roomSelect, // 락커룸 조회
				error: function() {
					alert('조회 실패!!');
				} // error
			});// ajax
		}); // click
	}); //ready
	
	// 락커룸 상세보기 응답
	function roomSelect(room) {
		$('input:text[name="room_no"]').val(room.room_no);
		$('input:text[name="gender"]').val(room.gender);
		$('input:text[name="lock_width"]').val(room.lock_width);
		$('input:text[name="lock_sum"]').val(room.lock_sum);
		
		if(room.gender == '1') {
			$('input:text[name="gender"]').val(room.gender);
			$('input[name="radio_gender"]')[0].checked=true;
		} else {
			$('input:text[name="gender"]').val(room.gender);
			$('input[name="radio_gender"]')[1].checked=true;
		}
	}
	
	// 락커룸 삭제하기
	$(document).ready(function() {
		$('input[name="deleteBtn"]').click(function() {
		if(window.confirm('정말 삭제하시겠습니까?')) {	
		$.ajax({
			url: 'deleteRoom',
			type: 'post',
			data: { room_no : $('input:text[name="room_no"]').val() },
			dataType: 'json',
			success: function(data) {
				if(data == 1) {
				alert('삭제 성공!!');
				location.reload();
			}
				else {
					alert('삭제 실패!!');					
					}
			},
			error: function() {
				alert('에러!!');
			}
		});
		} else {
			alert('취소');
		}
	});
});
	
	// 락커갯수 관리하기
	$(document).ready(function() {
		$('input[name="manageBtn"]').click(function() {
			confirm('정말 수정하시겠습니까?');
			$.ajax({
				url: 'manageRoom',
				type: 'post',
				data: { room_no : $('input:text[name="room_no"]').val(),
						lock_sum : $('input:text[name="lock_sum"]').val(),
						lock_width : $('input:text[name="lock_width"]').val()
				},
				dataType: 'json',
				success: function(data) {
					alert('성공!!');
					window.location.reload();
					
				},
				error: function() {
					alert('에러!!');
				}
			})
		})
	})
	
	
	$(document).ready(function() {
		$('.userTr').click(function() {
			console.log($('.id').eq($(".userTr").index(this)).val());
			$.ajax({
				url : 'getUser',
				type: 'get',
				data : { id: $('.id').eq($(".userTr").index(this)).val()},
				dataType : 'json',
				success : function(user) {
					$('input:text[name="user_id"]').val(user.id);
					$('.user_name').val(user.name);
					$('#userModal').modal('hide');
				},
				error: function() {
					alert('실패!');
				}
			})
		});
	});
	
 	function inDate() {

		function dataToMd(date) {
			function pad(num) {
				num = num + '';
				return num.length < 2 ? '0' + num : num;
			} // pad
			return date.getFullYear() + '-' + pad(date.getMonth() + 1)
				   + '-' + pad(date.getDate());
		} // dateToMd
	
		var indate = new Date(first_date.value);
		console.log(indate);
		
		final_date.value = dataToMd(new Date(indate.setMonth(indate.getMonth() + 1)));
	}
	
	// 종료일 추가 (+)
	$(document).ready(function() {
		$('#addDate').click(function() {
			
			function dataToMd(date) {
				function pad(num) {
					num = num + '';
					return num.length < 2 ? '0' + num : num;
				} // pad
				return date.getFullYear() + '-' + pad(date.getMonth() + 1)
					   + '-' + pad(date.getDate());
			} // dateToMd
			
			var addDate = new Date(final_date.value);
			console.log(addDate);
			
			final_date.value = dataToMd(new Date(addDate.setMonth(addDate.getMonth() + 1 )));
			
		})
	})
	
	// 종료일 감소 (-)
	$(document).ready(function() {
		$('#delDate').click(function() {
			
			function dataToMd(date) {
				function pad(num) {
					num = num + '';
					return num.length < 2 ? '0' + num : num;
				} // pad
				return date.getFullYear() + '-' + pad(date.getMonth() + 1)
					   + '-' + pad(date.getDate());
			} // dateToMd
			
			var delDate = new Date(final_date.value);
			console.log(delDate);
			
			if(first_date.value < final_date.value) {				
				final_date.value = dataToMd(new Date(delDate.setMonth(delDate.getMonth() - 1 )));
			} else {
				alert("종료일은 첫 사용일자 보다 커야합니다.");
			}			
		})
	})
	
	
</script>

<div>
	<div>
		<h3>락커관리</h3>
		<button type="button" class="btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">관리</button>
		<button onclick="location.href='http://192.168.0.171/spring/getSearchLocker?gender=1'">남자</button>&nbsp;
		<button onclick="location.href='http://192.168.0.171/spring/getSearchLocker?gender=2'">여자</button>
	</div>

	<hr>
	<!-- start 락카버튼 -->
	<form id="form2">
	<table>
		<tr>
			<c:set var="j" value="${list[0].lock_width}" />
			<c:forEach var="locker" items="${list }">
				<c:if test='${locker.user_id ne null && locker.broken_locker eq "0"}'>
					<td style="background-color: gray;"><button type="button" class="btn" value="${locker.lock_no }">${locker.each_lock_no }</button></td>
				</c:if>
				<c:if test="${locker.broken_locker eq '1'}">
					<td style="background-color: red;"><button class="btn"  type="button" value="${locker.lock_no }">${locker.each_lock_no }</button></td>
				</c:if>
				<c:if test="${locker.user_id eq null && locker.broken_locker eq '0'}">
					<td><button class="btn"  type="button" value="${locker.lock_no }">${locker.each_lock_no }</button></td>
				</c:if>
				<c:if test="${locker.each_lock_no % j == 0}">			
					</tr>
					<tr>
				</c:if>
			</c:forEach>
	</table>
	</form>
	<!-- end 락카버튼 -->

	<h3>락커 상세보기</h3>
	<br>
	<div>
		<form id="form1">
			<table border="1">
				<tr>
					<td>락커 번호</td>
					<td><input type="text" id="lock_no" name="lock_no" readonly="readonly" hidden="hidden">
						<input type="text" name="each_no" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td>고장 여부</td>
					<td>
						<input type="radio" name="broken_locker" value="0">고장안남
						<input type="radio" name="broken_locker" value="1">고장&nbsp;
					</td>
				</tr>
				<tr>
					<td>첫사용일자</td>
					<td><input type="date" name="first_date" id="first_date" oninput="inDate()"></td>
				</tr>
				<tr>
					<td>종료일</td>
					<td><input type="date" name="final_date" id="final_date">
						<button type="button" id="addDate" onclick="">+</button>
						<button type="button" id="delDate" onclick="">-</button>
					</td>
				</tr>
				<tr>
					<td>회원이름</td>
					<td>
						<input type="text" name="user_name" class="user_name">
						<input type="text" name="user_id" class="user_id" hidden="hidden">
					</td>
				</tr>
				<tr>
					<td>락커룸 번호</td>
					<td><input type="text" name="room_no" readonly="readonly"></td>
				</tr>
			</table>
		</form>
		<div>
			<input type="button" id="btnInsert" value="추가">&nbsp; 
			<input type="button" value="수정" id="btnUpdate">&nbsp; 
			<input type="button" value="삭제" id="btnDelete">&nbsp;
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
					 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
				</div>
				<div class="modal-body">
					<h1>수정하기</h1>

					<table border="1">
						<tr>
							<td>락커룸번호</td>
							<td>성별</td>
							<td>가로락카수</td>
							<td>락카수</td>
						</tr>
						<c:forEach items="${room }" var="room">
							<tr class="roomTr">
								<td>${room.room_no }<input class="roomNO" type="hidden" value="${room.room_no }">
								</td>
								<c:if test="${room.gender eq '1'}">
									<td>남</td>
								</c:if>
								<c:if test="${room.gender eq '2'}">
									<td>여</td>
								</c:if>
								<td>${room.lock_width }</td>
								<td>${room.lock_sum }</td>
							</tr>
						</c:forEach>
					</table>
					<br>
					<table border="1">
						<tr>
							<td>락커룸번호</td>
							<td><input type="text" name="room_no"></td>
						</tr>
						<tr>
							<td>성별</td>
							<td>
								<input type="text" name="gender" hidden="hidden">
								<input type="radio" name="radio_gender">남자&nbsp;
								<input type="radio" name="radio_gender">여자
							</td> 
						</tr>
						<tr>
							<td>가로락카수</td>
							<td><input type="text" name="lock_width"></td>
						</tr>
						<tr>
							<td>락카 수</td>
							<td><input type="text" name="lock_sum"></td>
						</tr>
					</table>

				</div>
				<div class="modal-footer">
					<input type="button" name="manageBtn" value="등록하기">
					<!-- <input type="button" name="deleteBtn" value="삭제하기"> -->
				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal - user -->
	<div class="modal fade" id="userModal" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close">X</button>
				</div>
				<div class="modal-body">
					
						<table border="1">
							<tr>
								<td>회원이름</td>
								<td>나이</td>
								<td>성별</td>
								<td>핸드폰번호</td>
							</tr>
					<c:forEach var="user" items="${user}" >
							<tr class="userTr">
								<td><input type="hidden" class="id" value="${user.id }">${user.name }</td>
								<td>${user.age }</td>
								<td>${user.gender }</td>
								<td>${user.phone_number }</td>
							</tr>
					</c:forEach>
						</table>
					
				</div>
				<div class="modal-footer">
				</div>
			</div>
		</div>
	</div>

</div>