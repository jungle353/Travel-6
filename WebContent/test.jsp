<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<c:if test="${login.id == ${cl.comment_writer}">
	<button class="btn btn-outline-primary btn-sm" id="myUpdateBtn${cl.comment_num}" onclick="myUpdate2('myUp2${cl.comment_num}', 'myInserBtn${cl.comment_num}')">수정</button>
	<a class="btn btn-outline-primary btn-sm" href="notice_cdelete.do?comment_board=${cl.comment_board}&comment_num=${cl.comment_num}" onclick="return confirm('삭제하시겠습니까?');">삭제</a>
</c:if>
</body>
</html>