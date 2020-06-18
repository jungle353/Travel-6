<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
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
	
		<form action="notice_login.do" method="post">
		
		 <div class="form-group">
      		<label for="usr">ID:</label>
			<input style="width: 30%" name="id" type="text" id="usr" class="form-control">
		</div>
		<div class="form-group">
			     <label for="pwd">Password:</label>
				 <input style="width: 30%" name="pw" type="password" id="pwd" class="form-control"> <br> 
		</div>
				 <input type="submit" class="btn btn-outline-primary btn-sm" value="로그인">
		</form>
	</div>
</body>
</html>