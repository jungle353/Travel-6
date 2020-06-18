<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<script>

	function myInsert2(myIns2${cl.comment_num}) {

		var z = document.getElementById(myIns2${cl.comment_num});
		if (z.style.display === "none") {
			z.style.display = "block";
		} else {
			z.style.display = "none";
		}
	}
	
/* 	$(document).ready(function() {
	    if ($("#wtype").val() == "build_edit") {
	 
	        $("#myIns2${cl.comment_num}").css("display", "inline");
	 
	        $("#myIns2${cl.comment_num}").css({
	            display: "inline"
	        });
	 
	    };
	})
 */
	
	function myUpdate2(myUp2) {

		var x = document.getElementById(myUp2);
		if (x.style.visibility === "hidden") {
			x.style.visibility = "visible";
		} else {
			x.style.visibility = "hidden";
		}
	}
	
</script>
<title>Insert title here</title>
</head>
<body>

	<div class="jumbotron">
		<div class="container">
<h1>공지사항</h1>
			<p>공지사항입니다.</p>

			<div align="right">
				<c:if test="${login.id == 'adm'}">
					<a class="btn btn-outline-primary btn-sm" href="notice_updateui.do?num=${dto.num}">수정</a>
					<a class="btn btn-outline-primary btn-sm" href="notice_delete.do?num=${dto.num}" onclick="return confirm('삭제하시겠습니까?');">삭제</a>
				</c:if>
				<a class="btn btn-outline-primary btn-sm" href="notice_list.do">목록</a>
			</div>

		</div>
	</div>

	<div class="container">
		<h3>${dto.title}</h3>
		<p>
			<strong>${dto.writer} </strong>&nbsp;&nbsp;&nbsp; ${dto.writeday} &nbsp;&nbsp;&nbsp; 조회수 : ${dto.readcnt}
		</p>


		<p>
			<br>${dto.content}
		<hr>
		</p>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
	</div>

	<c:forEach items="${cList}" var="cl">
		<div class="container">
			<c:forEach begin="1" end="${cl.repIndent}">
				<!-- 들여쓰기 -->
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</c:forEach>
			<strong> ${cl.comment_writer} </strong> <br>
			<c:forEach begin="1" end="${cl.repIndent}">
				<!-- 들여쓰기 -->
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</c:forEach>
			${cl.comment_content} <br>
			<c:forEach begin="1" end="${cl.repIndent}">
				<!-- 들여쓰기 -->
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</c:forEach>
			${cl.comment_day }


			<!--				     -->
			<!-- 		대댓글달기     	 -->
			<!-- 				     -->
		<c:choose>
		
				<c:when test="${empty login}">	
					
				</c:when>
		
				<c:otherwise>
					<a class="btn btn-outline-primary btn-sm" onclick="myInsert2('myIns2${cl.comment_num}')">댓글달기</a>
						<div id="myIns2${cl.comment_num}" style="display: none;">
							<form action="notice_reply.do" method="post">
								<input type="hidden" name="comment_num" value="${cl.comment_num}"> 
								<input type="hidden" name="comment_writer" value="${login.id}"> 
								<input type="hidden" name="comment_day" value="${cl.comment_day}"> 
								<input type="hidden" name="repRoot" value="${cl.repRoot}"> 
								<input type="hidden" name="repIndent" value="${cl.repIndent}"> 
								<input type="hidden" name="repStep" value="${cl.repStep}">
			
								<!-- 댓글입력 -->
								<input name="comment_board" type="hidden" value="${dto.num}">
								<textarea class="form-control" style="width: 30%;" name="comment_content" id="reply"></textarea>
								<input style="float: left" type="submit" value="등록" class="btn btn-outline-primary btn-sm">
							</form>
						</div>
					
				</c:otherwise>
	
		</c:choose>
		
		<c:choose>
		
				<c:when test="${empty login}">	
					
				</c:when>
		
				<c:otherwise>
					<a class="btn btn-outline-primary btn-sm" onclick="myUpdate2('myUp2${cl.comment_num}')">수정</a>
						<div id="myUp2${cl.comment_num}" style="visibility: hidden">
							<form action="notice_cupdate.do" method="get">
								<input type="hidden" name="comment_num" value="${cl.comment_num}"> 
								<input type="hidden" name="comment_writer" value="${login.id}"> 
								<input type="hidden" name="comment_day" value="${cl.comment_day}"> 
								<input type="hidden" name="repRoot" value="${cl.repRoot}"> 
								<input type="hidden" name="repIndent" value="${cl.repIndent}"> 
								<input type="hidden" name="repStep" value="${cl.repStep}">
					
								<!-- 댓글입력 -->
								<input name="comment_board" type="hidden" value="${dto.num}">
								<textarea class="form-control" style="width: 30%;" name="comment_content" id="cupdate">${cl.comment_content}</textarea>
								<button style="float: left" type="submit" class="btn btn-outline-primary btn-sm">수정</button>
							</form>
						</div>
				</c:otherwise>
	
		</c:choose>


		</div>
		<br><br>
	</c:forEach>
	<!--				     -->
	<!-- 		댓글달기     	 -->
	<!-- 				     -->
	
	<c:choose>
	
		<c:when test="${empty login}">
		
		</c:when>
	
		<c:otherwise>
			<form action="notice_cinsert.do" method="get">
			<!-- 댓글입력 -->
			<div class="form-group" align="center">
				<textarea class="form-control" style="width: 30%;" name="comment_content"></textarea>
				<input name="comment_board" type="hidden" value="${dto.num}"> <br> <input type="hidden" name="comment_writer" value="${login.id}">
				<input type="submit" value="등록" class="btn btn-outline-primary btn-sm">
			</div>
			</form>
		</c:otherwise>
	
	</c:choose>

</body>
</html>