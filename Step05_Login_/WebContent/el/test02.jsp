<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/el/test02.jsp</title>
</head>
<body>

<h3>EL (Expression Language) Test Page</h3>

<%
	UsersDto dto=(UsersDto)request.getAttribute("dto");
%>
<p>
	ID : <strong><%=dto.getId() %></strong>
	E-mail : <strong><%=dto.getEmail() %></strong>
	Enrolled Date : <strong><%=dto.getRegdate() %></strong>
</p>
<%-- EL을 이용하면 위의 코드를 더 간단히 작성할 수 있다 --%>
<p>
	ID : <strong>${requestScope.dto.id }</strong>
	E-mail : <strong>${requestScope.dto.email }</strong>
	<%-- 원래는 ${requestScope.dto.getId(); } 이다. --%>
	Enrolled Date : <strong>${requestScope.dto.regdate }</strong>
</p>

</body>
</html>