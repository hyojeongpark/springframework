<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %> <!-- header의 연장선~~ -->

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
<form action="login" method="post">
  <div class="form-group">
    <label for="userid">ID : </label>
    <input type="text" class="form-control" placeholder="Enter id" id="id" name="id">
  </div>
  <div class="form-group">
    <label for="pwd">Password : </label>
    <input type="password" class="form-control" placeholder="Enter password" id="pass" name="pass">
  </div>
  <div class="form-group form-check">
    <label class="form-check-label">
      <input class="form-check-input" type="checkbox"> Remember me
    </label>
  </div>
  <button type="button" class="btn btn-primary" id="loginBtn">Submit</button>
</form>
</div>
<script>
$("#loginBtn").click(function(){
	if($("#id").val()==""){
		alert("아이디를 입력하세요");
		 return false;
	}
	if($("#pass").val()==""){
		alert("비밀번호를 입력하세요");
		 return false;
	}
	$.ajax({
		type:"post",
		url : "loginCheck", //accountController에 로그인체크 postMapping
		data :{"id" : $("#id").val(), "pass":$("#pass").val()}
	})
	 .done(function(resp){
			//alert(resp);
		if(resp=="success"){// 로그인성공
				alert("로그인 성공");
	            location.href="/boardList";
			}else if(resp=="fail"){  // 아이디 오류 --->회원가입으로
               alert("회원이 아닙니다. 회원가입 하세요");
               location.href="/account/join";
			}else{// 아이디는 맞지만 비번 오류
				alert("비밀번호를 확인하세요");
				$("#pass").val("");
			}

	  })
	 .fail(function(e){
		alert("실패 : " + e)
	 })
	
	
})

</script>
</html>






