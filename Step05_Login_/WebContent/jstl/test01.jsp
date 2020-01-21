<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- JSTL core 라이브러리를 C라는 접두어로 사용할 준비하기 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/jstl/test01.jsp</title>
</head>
<body>
<h3>JSTL (Java Standard Tag Library)</h3>

<c:forEach var="i" begin="1" end="5">
	<p>${i }</p>
</c:forEach>

<c:if test="${sessionScope.id == null }">
	<p>You didn't sign in.</p>
</c:if>

<c:if test="${sessionScope.id != null }">
	<p>You are signed in as <strong>${sessionScope.id }</strong>! - JSTL ver.</p>
</c:if>

<%-- 위의 코드를 java 코드로 작업하면 --%>
<%
	String id=(String)session.getAttribute("id");
%>
<%if(id!=null){ %>
	<p>You are signed in as <strong><%=id %></strong>! - Java ver.</p>
<%} %>

</body>
</html>
