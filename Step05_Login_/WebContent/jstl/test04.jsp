<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/jstl/test04.jsp</title>
</head>
<body>

<%
	request.setAttribute("size", 123456789);
	request.setAttribute("weight", 1234.56789);
	request.setAttribute("price", 1250000);
%>

<h3>JSTL - test of fmt</h3>

<p>size : <strong>${size }</strong> byte</p>
<p>size : <strong><fmt:formatNumber value="${size }" /> byte</strong></p> </br>

<p>weight : <strong>${weight }</strong> kg</p>
<p>weight : <strong><fmt:formatNumber value="${weight }" pattern="#,###.## kg" /></strong></p> </br> 

<p>price : <strong>${price }</strong></p>
<p>price : <strong><fmt:formatNumber value="${price }" type="currency" /></strong></p>
<%-- currency의 심볼을 별도로 지정할 수도 있다 --%>
<p>price : <strong><fmt:formatNumber value="${price }" type="currency" currencySymbol="$"/></p>

</body>
</html>