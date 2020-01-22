<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/jstl/test03.jsp</title>
</head>

<body>

<h3>JSTL - forTokens</h3>
<% 
	String hobby="Coding (programming)/Dancing a hula/Traveling abroad/Reading a book/Playing the ukulele"; 
	request.setAttribute("hobby", hobby);
%>
<ul>
	<%-- forTokens : 순서대로 문자열을 빼내고 싶을 때 사용 --%>
	<%-- delims : "" 안에 들어있는 기호로 구분된 것을 하나씩 출력 --%>
	<c:forTokens var="tmp" items="${hobby }" delims="/">
		<li>${tmp }</li>
	</c:forTokens>
</ul>
<% 
	String character="Mickey & Minnie/Donald & Daisy/Pluto & Goofy/Lilo & Stitch/Chip & Dale/Elsa & Anna/Arial & Eric"; 
	request.setAttribute("character", character);
%>
<ul>
	<c:forTokens var="tmpp" items="${character }" delims="/">
		<li>${tmpp }</li>
	</c:forTokens>
</ul>


<%
	request.setAttribute("num", 999);
%>
<h3>make a if~else using a choose</h3>		<%-- choose문을 이용해서 if~else문 구조 만들기 --%>
<c:choose>
	<c:when test="${num%2 eq 0 }">
		<p>${num } is <strong>Even</strong> number.</p>
	</c:when>
	<c:otherwise>
		<p>${num } is <strong>Odd</strong> number.</p>
	</c:otherwise>
</c:choose>

<%
	request.setAttribute("score", 90);
%>
<h3>make a multi if using a choose</h3>		<%-- choose문을 이용해서 다중 if문 구성하기 --%>
<p>
	Your score is <strong>${score }</strong>, 
	and your grade is 
	<c:choose>
		<c:when test="${score >= 90 }">
			<strong>'A'</strong>
		</c:when>
		<c:when test="${score >= 80 }">
			<strong>'B'</strong>
		</c:when>
		<c:when test="${score ge 70 }">
			<strong>'C'</strong>
		</c:when>
		<c:when test="${score ge 60 }">
			<strong>'D'</strong>
		</c:when>
		<c:otherwise>
			<strong>'F'</strong>
		</c:otherwise>
	</c:choose>
	.
</p>

</body>
</html>