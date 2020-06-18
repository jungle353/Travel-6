<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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
		<form action="notice_insert.do" method="post">
			<div class="form-group">
				<input name="writer" type="hidden" value="${login.id}">
				<input name="writeday" type="hidden">
				<p> 작성자 <br> <strong>${login.id}</strong></p> 
				<label for="tit">제목</label> 
				<input name="title" type="text" id="tit" class="form-control"><br>
			</div>
			<div class="form-group">
				<label for="con">내용</label>
				<textarea rows="5" name="content" id="con" class="form-control"></textarea>
			</div>
				<input type="submit" value="등록" class="btn btn-outline-primary btn-sm">
		</form>
	</div>
</body>
</html>