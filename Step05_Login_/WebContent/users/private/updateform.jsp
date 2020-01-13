<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/updateform.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
</head>
<body>

<%
	// Session 영역에서 id 읽어오기
	String id=(String)session.getAttribute("id");
	// id를 이용해서 가입정보 얻어오기
	UsersDto dto=UsersDao.getInstance().getData(id);
%>

<div class="container">
	<h1>Revision of Member's Info</h1>
	<form action="update.jsp" method="post">
		<input type="hidden" name="id" value="<%=id %>" />
		<div>
			<label for="id">ID</label>
			<input type="text" id="id" value="<%=id %>" disabled/>
		</div>
		<div>
			<label for="email">E-mail</label>
			<input type="text" id="email" name="email" value="<%=dto.getEmail() %>"/>
		</div>
		<button type="submit">Revision</button>
		<button type="reset">Reset all</button>
	</form>
</div>

</body>
</html>