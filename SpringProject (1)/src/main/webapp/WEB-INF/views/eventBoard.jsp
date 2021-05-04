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
				<h3>응모회원</h3>
			</div>

			<!-- /.panel-heading -->
			<form action="/eventBoard" method='get'>
			<div class="panel-body m-5">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>수량</th>
							<th>이름</th>
							<th>이메일</th>
							
						</tr>
					</thead>

					<c:forEach items="${listResult }" var="shop" varStatus="st">
						<tr>
							<td><c:out value="${shop.num } " /></td>
							<td><c:out value="${shop.amount } " /></td>
							<td><c:out value="${shop.name}"/><td>
							<c:out value="${shop.email }" /> </a> 
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
				
			<div class='row'>
				<div class="col-lg-12">
					
						<select name='field'>
							<option value="writer">작성자</option>
							<option value="content">내용</option>
						</select><input type='text' name='word'>
						<button type="submit" class='btn btn-info'>Search</button>
					
					
				</div>
			</div>
			</form>
		</div>
		</div>
		</div>
		<%@ include file="./includes/footer.jsp"%>