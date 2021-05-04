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
	<h2>갤러리 참가신청</h2>

	<hr>
	<form action="/shop" method="get" id="frm">
		<div class="panel-body m-5">
			<div class="form-group">
				<img src="/resources/images/gallery.jpg"  height="300px"/>
				<h4>참가신청</h4>
				<input type="checkbox">찜하기 <input type="submit" value="신청하기">
				<hr>
			</div>
			<div class="select-group"></div>
		</div>

	</form>
	<br>






</body>
</html>