<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial"
	rel="stylesheet" />
<link href="/resources/default.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="/resources/fonts.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- 
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- <script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
 -->
</head>
<body>
	<div id="header-wrapper">
		<div id="header" class="container">
			<div id="logo">
				<h1>Cha</h1>
			</div>
			<div id="menu">
				<ul>
					<c:choose>
						<c:when test="${empty sessionScope.sessId }">
							<li><a href="/boardList" title="">Board</a></li>
							<li><a href="/account/login" title="">Login</a></li>
							<li><a href="/account/join" title="">Join</a></li>
						</c:when>
						<c:when test="${sessionScope.sessId=='admin'}">
							<li><a href="/boardList" title="">Board</a></li>
							<li><a href="/account/logout" title="">Logout</a></li>
							<li><a href="/eventBoard" title="">Event Board</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="/boardList" title="">Board</a></li>
							<li><a href="/account/logout" title="">Logout</a></li>
							<li><a href="/account/update" title="">Mypage</a></li>
							<li><a href="/book" title="">Event</a></li>
							<p>${sessId}님환영합니다</p>
						</c:otherwise>
			
					</c:choose>
				</ul>
			</div>
			<div id="banner" class="container">
				<img src="/resources/images/banner.jpg" width="1200" height="400"
					alt="" />
			</div>
		</div>

	</div>
</body>
</html>
<!--
	 <div id="banner" class="container">
		<img src="/resources/images/banner.jpg" width="1200" height="400" alt="" />
	</div>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark mb-5">
		<h3>
			<a class="navbar-brand" href="#"> Slang </a>
		</h3>

		<ul class="navbar-nav">
			<c:choose>
				<c:when test="${empty sessionScope.sessId }">

					<li class="nav-item"><a class="nav-link" href="/boardList">게시판</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="/account/login">로그인</a></li>
					<li class="nav-item"><a class="nav-link" href="/account/join">회원가입</a></li>
				</c:when>
				<c:otherwise>
					<li class="nav-item"><a class="nav-link" href="/boardList">게시판</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/account/logout">로그아웃</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/account/update">회원 변경</a></li>
					<li class="nav-item"><a class="nav-link" href="/book">구매하기</a></li>
					
					<p>${sessId}님환영합니다</p>
				</c:otherwise>
			</c:choose>
		</ul>
	</nav>
</body>-->
