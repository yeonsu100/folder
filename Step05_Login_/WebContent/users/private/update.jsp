<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 1. 폼 전송되는 아이디와 이메일주소를 읽어와서
	String id=request.getParameter("id");
	String email=request.getParameter("email");
	UsersDto dto=new UsersDto();
	dto.setId(id);
	dto.setEmail(email);
	// 2. DB에 수정 반영하고
	boolean isSuccess=UsersDao.getInstance().update(dto);
	// 3. 응답한다.
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/update.jsp</title>
</head>
<body>

<div class="container">
	<%if(isSuccess){ %>
		<script>
			alert("Successfully Updated!")
			location.href="info.jsp";
		</script>
	<%}else{ %>
		<h1>Alert</h1>
		<p>Failure to update
		<a href="updateform.jsp">Please try it again.</a>
		</p>
	<%} %>
</div>

</body>
</html>