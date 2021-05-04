<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="./includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading m-3">
				<h3>글 상세보기</h3>
			</div>
			<!-- /.panel-heading -->
			<form action="/boardUpdate" method="post" id="frm">
			<div class="panel-body m-5">
	
				<div class="form-group">
					<label>번호</label> <span id="bno">${board.num }</span> <input
						class="form-control" name='num' id="num" readonly="readonly"
						value='<c:out value="${board.num }"/>'>
				</div>

				<div class="form-group">
					<label>제목</label> <input class="form-control" name='title'
						value='<c:out value="${board.title }"/>'>
				</div>

				<div class="form-group">
					<label>내용</label>
					<textarea class="form-control" rows="3" name='content'><c:out
							value="${board.content}" /></textarea>
				</div>

				<div class="form-group">
					<label>작성자</label> <input class="form-control" name='writer'
						value='<c:out value="${board.writer }"/>'>
				</div>
				
			</div>
			<!-- 작성자만 가능하도록 -->
			<c:when test="${sessionScope.sessId}">
			<button type="submit" name="updateBtn" id="updateBtn"
							class="btn btn-sm btn-outline-info">수정하기</button>
			</c:when>
			<a href="/boardList">
				<button data-oper='list' class="btn btn-info">리스트</button>
			</a>

			<button id="btnDelete" class="btn btn-info">삭제</button>
			</form>
			<br> <br>
			<!--<div align="center">
				<textarea rows="3" cols="50" id="msg"></textarea>
				<input type="button" value="댓글쓰기" id="replyBtn">
			</div> -->
			<hr>
			 <c:choose>
				<c:when test="${empty sessionScope.sessId}">
					<textarea rows="3" cols="50" id="msg" placeholder="로그인 후 이용가능 합니다"
						style="backgroundColor: gray" readonly></textarea>
				</c:when>
				<c:otherwise>
					<textarea rows="3" cols="50" id="msg"></textarea>
					<input type="button" value="댓글쓰기" id="replyBtn">
				</c:otherwise>
			</c:choose>
			<div id="area"></div>
		</div>
	</div>
</div>
<!-- script넣기 -->
<script>
	//댓글쓰기
	$("#replyBtn").on("click", function() {
		var data = {
			"bnum" : $("#num").val(),
			"content" : $("#msg").val()
		}
		$.ajax({
			type : "post",
			url : "/reply/replyInsert",
			contentType : 'application/json;charset=utf-8',
			data : JSON.stringify(data)
		}) //ajax
		.done(function() {
			alert("댓글이 입력되었습니다");
			init();
		}).fail(function() {
			alert("댓글달기에 실패했습니다")
		})
	});

	//댓글 리스트
	var init = function() {
		//alert("~~~~~~~~~~~~~~~~~~~")
		$.ajax({
			type : "get",
			url : "/reply/replyList",
			data : {
				"num" : $("#num").val()
			}
		}).done(function(resp) {
			var htmlStr = "";
			$.each(resp, function(key, val) {
				htmlStr += "답글: <br>"
				htmlStr += val.content + "<br>"
				htmlStr += "작성일: " + val.regdate + "<br>"
				htmlStr += "<a data-rnum="+val.rnum+">삭제</a><hr>";
				//htmlStr+="<a href='javascript:fdel("+val.num+")'>삭제<hr>"//둘중하나만
			}) //each
			$("#area").html(htmlStr);
			$("#area").on("click", "a", function() {
				var rnum = $(this).data("rnum"); //data-rnum
				//alert(rnum);
				fdel(rnum);
			})
		}).fail(function(e) {
			alert("error : " + e);
		})
	}
	init();
	//댓글삭제 (ReplyController에서)
	function fdel(rnum) {
		$.ajax({
			type : "DELETE",
			url : "/reply/del/" + rnum
		}).done(function(resp) {
			alert("글 삭제 완료");
			init();
		}).fail(function(error) {
			alert("글 삭제 실패");
		})
	}

	//글삭제 (HOMEcontroller)
	$("#btnDelete").click(function() {
		alert("글번호" + $("#bno").text()+"가 삭제되었습니다")
		//alert($("#num").val())
		$.ajax({
			type : "post",
			url : "/delete1/" + $("#num").val(),
			success : function(resp) {
				if (resp == "success") {
					alert("삭제성공");
					//location.href = "/boardList";
				} //if
			}//success
		}) //ajax
	})//btnDelete

	
</script>
