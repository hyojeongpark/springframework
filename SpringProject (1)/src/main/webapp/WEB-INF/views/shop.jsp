<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="./includes/header.jsp"%>
<!DOCTYPE html>
<html>
<style>
form {text-align: center}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>구매내역 확인</h3>
	<a href="book">이전</a>
	<hr>
	<form action="/shop" method="post" id="shopaccount">
		<div class="panel-body m-5">
	
			<div class="form-group">
				<img src="/resources/images/gallery.jpg"  height="300px"/>
				<h5>갤러리 참가신청</h5>
				<h6>가격: 작품당 0원</h6>
				<br>
				
					수량: <input type=button id="minus" value="-"
						onClick="javascript:this.form.amount.value--;"> <input
						type=text id=amount name="amount" value=1> <input type=button id="plus"
						value="+" onClick="javascript:this.form.amount.value++;">
				
			</div>

			<div>
				<p>개인정보입력</p>
				Name: <input type="text" name="name"><br> id (로그인 필수):
				<c:out value="${sessId} " />
				<!-- 연결해줄필요없이 controller에 login할때 만들어줬던 sessId 가져오면됨 -->
				<br>
				<!-- account에서 id 가져오기 -->
				Email: <input type="email" name="email"><br> <input
					type="submit" id="buybtn" value="응모하기">
			</div>

		</div>
	</form>
</body>
</html>
<script>
	var amount = parseInt($("#amount").val());
	$("#minus").on("click", function() {
		amount = amount - 1
		if ((amount) < 1) {
			$("#amount").val(1);
			alert("1이상 선택해야합니다");
		} else {

			$("#amount").val(amount);
		}
	})
	$("#plus").on("click", function() {
		amount = amount + 1
		if ((amount) > 3) {
			$("#amount").val(3);
			alert("최대갯수입니다");
		} else {
			$("#amount").val(amount);
		}
	})
	$("#buybtn").on("click", function() {
		alert("응모되었습니다");
	})
</script>