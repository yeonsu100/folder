<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/el/test03.jsp</title>
</head>
<body>

<h3>EL (Expression Language) Test Page</h3>

<%
	String myNick=(String)session.getAttribute("myNick");
%>
<p>Nickname (saved on session) : <strong><%=myNick %></strong></p>

<%-- 위의 코드를 EL을 이용하면 다음과 같다 --%>
<p>Nickname (saved on session) : <strong>${sessionScope.myNick }</strong></p>
<p>Nickname (saved on session) : <strong>${myNick }</strong></p>

</body>
</html>