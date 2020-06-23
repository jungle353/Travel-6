<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fm"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="jumbotron jumbotron-fluid">
<div class="container">
<h1>공지사항</h1>


	<c:choose>

		<c:when test="${empty login}">
			<a href="notice_loginui.do">로그인</a>
		</c:when>

		<c:otherwise>
			<a href="notice_logout.do">로그아웃</a>
		</c:otherwise>

	</c:choose>
	
		<c:if test="${login.id == 'adm'}">
			<a href="notice_insertui.do">글쓰기</a>
		</c:if>
		 
	<table border="1" class="table">
		<thead class="thead-dark">
			<tr>
				
				<th>제목</th>
				<th>작성자</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach items="${list}" var="no_dto">
				<tr>
					
					<td width="300px">
						<a href="notice_read.do?num=${no_dto.num}">${no_dto.title}</a>
					</td>

					<td>${no_dto.writer}</td>
					<td>${no_dto.writeday}</td>
					<td>${no_dto.readcnt}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div align="center">
	<a href="notice_list.do?curPage=${(to.curPage-1) > 0 ? (to.curPage-1) : 1}">&laquo;</a>
	&nbsp;&nbsp;

	<c:forEach begin="${to.beginPageNum}" end="${to.stopPageNum}" var="idx">

		<c:if test="${to.curPage == idx}">
			<a style="font-size: 30px;" href="notice_list.do?curPage=${idx}">${idx}</a>&nbsp;&nbsp;
	</c:if>
		<c:if test="${to.curPage != idx}">
			<a href="notice_list.do?curPage=${idx}">${idx}</a>&nbsp;&nbsp;
	</c:if>

	</c:forEach>

	<a href="notice_list.do?curPage=${(to.curPage+1) < to.totalPage ? (to.curPage+1) : to.totalPage }">&raquo;</a>
	</div>


</div>
</div>
</body>
</html>