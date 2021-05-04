<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<!DOCTYPE html>
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
<body>
	<div class="container">
	  <h2>회원정보 수정하기</h2>
	  <form action="update" id="frm">
	  	<div class="form-group">
	      <label for="userid">ID:</label>
	      <input type="text" class="form-control" id="id" name="id" readonly="readonly" value="${account.id }">
	    </div>
	    <div class="form-group">
	      <label for="name">Name:</label>
	      <input type="text" class="form-control" id="name" placeholder="Enter your name:" name="name" value="${account.name }">
	    </div>
	    <div class="form-group">
	      <label for="pass">Password:</label>
	      <input type="password" class="form-control" id="pass" placeholder="Enter your password" name="pass" value="${account.pass }">
	    </div>
	    <div class="form-group">
	      <label for="pass_check">Confirm Password:</label>
	      <input type="password" class="form-control" id="pass_check" placeholder="Enter your password" name="pass_check" value="${account.pass }">
	    </div>
	    <div class="form-group">
	      <label for="email">Email:</label>
	      <input type="text" class="form-control" id="email" placeholder="Enter your email:" name="email" value="${account.email }">
	    </div>
	    
	    <button type="button" id="send" class="btn btn-primary">변경하기</button>
	    <button type="button" id="btnDel" class="btn btn-info">회원탈퇴</button>
	    <button type="button" onclick="location.href='../boardList'" class="btn btn-primary">취소</button>
	  </form>
	</div>
	
<script>

$("#send").click(function() { // 이름을 submit으로 할시 충돌문제로 다른이름지정
	if($("#id").val()=="") {
		alert("아이디를 입력하세요");
		return false;
	}
	if($("#pass").val()=="") {
		alert("비밀번호를 입력하세요");
		return false;
	}
	if($("#pass").val()!=$("#pass_check").val()) {
		alert("비밀번호가 일치하지 않습니다");
		return false;
	}
	var data ={
				"id":$("#id").val(),
				"name":$("#name").val(),
				"pass":$("#pass").val(),
				"addr":$("#addr").val(),
				"memo":$("#memo").val()
			}
	$.ajax({
		type:"PUT",
		url:"update",
		contentType:'application/json;charset=utf-8',
		data:JSON.stringify(data)
		})
		.done(function(resp){
			alert(resp);
			if(resp=="success"){
				alert("변경완료");
				location.href="login";
			} else {
				alert("변경실패");
			}
		})
		.fail(function(e){
			alert("에러발생");
		})
	$("#frm").submit();
})

// 회원탈퇴
$("#btnDel").click(function(){
	if(confirm("정말 탈퇴하시겠습니까? 이 작업은 되돌릴 수 없습니다.")) {
		location.href="delete";
	}
})//btnDelete

</script>
</body>
</html>