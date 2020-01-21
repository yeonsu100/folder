<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/el/test01.jsp</title>
</head>
<body>

<h3>EL (Expression Language) Test Page</h3>

<%
	// request에 "myName"이라는 키값으로 담긴 String type 읽어오기
	String myName=(String)request.getAttribute("myName");
%>
<p>myName : <strong><%=myName %></strong></p>
<%-- 위의 코드는 아래의 EL 코드로 대체할 수 있다! --%>
<p>myName : <strong>${requestScope.myName }</strong></p>
			<%-- request영역에 담겨있는 .myName을 찾아 응답하라는 의미, 심지어 requestScope는 생략 가능하다! --%>

</body>
</html>