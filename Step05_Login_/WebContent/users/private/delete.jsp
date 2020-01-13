<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/delete.jsp</title>
</head>
<body>

<%
	// 1. 세션에 있는 아이디를 읽어와서
	String id=(String)session.getAttribute("id");
	// 2. DB에서 삭제하고
	UsersDao.getInstance().delete(id);
	// 3. 로그아웃처리하고
	session.invalidate();
	// 4. 응답
%>

<script>
	alert("Removed this account safely.");
	location.href="${pageContext.request.contextPath }/";
</script>

</body>
</html>