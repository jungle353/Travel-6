<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1" charset="utf-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<form action="notice_insert.do" method="post"  enctype="multipart/form-data">
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
		<div class="container mt-3">
				<p>첨부파일</p>
			<div class="custom-file mb-3">
      			<input type="file" class="custom-file-input" id="customFile" name="filename">
      			<label class="custom-file-label" for="customFile">파일을 선택하세요.</label>
    		</div>
    	</div>	
				<input type="submit" value="등록" class="btn btn-outline-primary btn-sm"  onclick="return formCheck();">
				
		</form>
		
	</div>
	<script>
	
	$(".custom-file-input").on("change", function() {
	  var fileName = $(this).val().split("\\").pop();
	  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
	});
	
	function formCheck (){
		var tit = document.forms[0].tit.value;
		var con = document.forms[0].con.value;
		
		if (tit == null || tit == ""){     
	        alert('제목을 입력하세요');
	        document.forms[0].tit.focus();
	        return false;                 
	    }
	   else if (con == null ||  con == ""){   
	        alert('내용을 입력하세요'); 
	        document.forms[0].con.focus();            
	        return false;               
	    }
		
	}
	
	
	
	
	
</script>
</body>
</html>