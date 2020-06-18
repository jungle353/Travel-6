<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<h1>글 수정</h1>
	
	<form action="notice_update.do" method="post">
		<input name="num" readonly value="${dto.num}" type="hidden">
		
			<div class="form-group">
				<label for="write">작성자</label> 
				<input value="${dto.writer}" name="writer" id="write" class="form-control" readonly="readonly"><br>
			</div>
		
			<div class="form-group">
				<label for="tit">제목</label> 
				<input value="${dto.title}" name="title" id="tit" class="form-control"><br>			
			</div>
			
			<div class="form-group">
				<label for="con">내용</label>
				<textarea rows="5" name="content" id="con" class="form-control">${dto.content}</textarea>
			</div>
			
			
			<br>
			<input type="submit" value="등록">
		
	</form>
</div>
</body>
</html>