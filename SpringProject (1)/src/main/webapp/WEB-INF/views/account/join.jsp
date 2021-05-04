<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
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
<div class="container" >

  <form action="join" method="post" id="frm">
    <div class="row">
	    <div class="col">
	      <label for="userid">id:</label>
	      <input type="text" class="form-control" id="id" placeholder="Enter id" name="id" readonly="readonly">
	    </div>
      <div class="col align-self-end" >
          <button  type="button"  id="idcheckBtn"  class="btn btn-primary">중복확인</button>
    </div>
    </div>
    <div class="form-group">
      <label for="name">Name:</label>
      <input type="text" class="form-control" id="name" placeholder="Enter name" name="name">

    </div>

    <div class="form-group">
      <label for="pass">Password:</label>
      <input type="password" class="form-control" id="pass" placeholder="Enter password" name="pass">
    </div>
    <div class="form-group">
      <label for="pwd_check">Password Confirm:</label>
      <input type="password" class="form-control" id="pass_check" placeholder="Enter password Confirm" name="pass_check">
    </div>
    <div class="form-group">
      <label for="addr">Email:</label>
      <input type="text" class="form-control" id="email" placeholder="Enter email" name="email">
    </div>

    
<br/>
 <button  type="button"  id="send"  class="btn btn-primary">Submit</button>
  </form>
</div>
<script>
$("#idcheckBtn").on("click",function(){
	window.open("idCheck","","width=700 height=250");
});

$("#send").click(function(){
   if($("#id").val()==""){
		alert("아이디를 입력하세요");
		 return false;
	 }	
	 if($("#pass").val()==""){
		 alert("비밀번호를 입력하세요");
		 return false;
	 }
	 if($("#pass").val()!=$("#pass_check").val()){
		 alert("비밀번호가 일치하지 않습니다.");
		 return false;
	 }
	 $("#frm").submit();
})


</script>
