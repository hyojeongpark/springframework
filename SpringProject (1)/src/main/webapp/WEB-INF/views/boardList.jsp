<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="./includes/header.jsp" %> 
<html>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<div class="row">
	<div class="col-lg-12" >
		<div class="panel panel-default">
			<div class="panel-heading m-3">
				<h3>게시판 (${count})</h3>
			</div>

			<!-- /.panel-heading -->
			<div class="panel-body m-5">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
							<th>답변수</th>
						</tr>
					</thead>

					<c:forEach items="${listResult }" var="board" varStatus="st">
						<tr>
							<td><c:out value="${board.num } " />
							</td>
							<td>
							<a href='/view/${board.num}'>
							<c:out value="${board.title }" /> </a> 
							</td>
							
							<td><c:out value="${board.writer}" /></td>
							<td> ${board.regdate}</td>
							<td><c:out value="${board.hitcount }" /></td>
							<td><c:out value="${board.replyCnt }" /></td>
						</tr>
					</c:forEach>
				</table>
			</div>
				<ul class="pagination">
    <li class="page-item">
    <c:if test="${ pageDto.startPage gt pageDto.pageBlock }">
			<a class="page-link" href="/boardList?strPageNum=${ pageDto.startPage - pageDto.pageBlock }">[이전]</a>
		</c:if>
    </li>
    
    <c:forEach var="i" begin="${ pageDto.startPage }" end="${ pageDto.endPage }" step="1">
	<li class="page-item">		
			<a class="page-link" href="/boardList?strPageNum=${i}">		
				${ i }
			</a>
	</li>
		</c:forEach>
    
    <li class="page-item">
    <c:if test="${ pageDto.endPage lt pageDto.pageCount }">
			<a class="page-link" href="/boardList?strPageNum=${ pageDto.startPage + pageDto.pageBlock }">[다음]</a>
		</c:if>
    </li>
  </ul>

			<div class='row'>
				<div class="col-lg-12">
					<form action="/boardList" method='get'>
						<select name='field'>
							<option value="writer">작성자</option>
							<option value="content">내용</option>
						</select><input type='text' name='word'>
						<button type="submit" class='btn btn-info'>Search</button>
					</form>
					<a href="/boardInsert"><button class='btn btn-info'>글쓰기</button></a>
<!-- 비회우너이면 로그인  -->
				</div>
			</div>
		</div>
		</div>
		</div>
		<%@ include file="./includes/footer.jsp"%>