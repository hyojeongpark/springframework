<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ include file="./includes/header.jsp"%>

<div class="container m-5">
		<div class="card my-5">
			<form action="boardInsert" method="post" id="frm">
				<div class="card-body">
					<div class="form-group">
						<label for="title">제목</label> <input type="text" name="title"
							id="title" class="form-control" placeholder="제목을 입력해 주세요">
					</div>
					<div class="form-group">
						<label for="writer">글쓴이</label> <input type="text" name="writer"
							value="${sessId }" readonly="readonly" id="writer" class="form-control">
					</div>
					<div class="form-group">
						<label for="content">내용</label>
						<textarea id="content" name="content" class="form-control"></textarea>
					</div>
				
					<div class="form-group text-right">
						<button type="submit" name="writeBtn" id="writeBtn"
							class="btn btn-sm btn-outline-info">글쓰기</button>
						<a href="boardList" class="btn btn-sm btn-outline-secondary">목록으로</a>
					</div>
				</div>
			</form>
		</div>
</div>