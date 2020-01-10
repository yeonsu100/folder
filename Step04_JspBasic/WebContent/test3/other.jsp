<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// request에 담긴 String type 얻어내기
	String myName=(String)request.getAttribute("myName");	
				// ▲ 오브젝트 타입으로 리턴되므로 원래 데이터 타입이었던 스트링 타입으로 캐스팅(형변환)해주어야 한다.
	// session에 담긴 String type 얻어내기
	String yourName=(String)session.getAttribute("youyName");
				// ▲ 오브젝트 타입으로 리턴되므로 원래 데이터 타입이었던 스트링 타입으로 캐스팅(형변환)해주어야 한다.
	// application에 담긴 String type 얻어내기
	String ourName=(String)application.getAttribute("ourName");
				// ▲ 오브젝트 타입으로 리턴되므로 원래 데이터 타입이었던 스트링 타입으로 캐스팅(형변환)해주어야 한다.
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test3/other.jsp</title>
</head>
<body>

	<p> 	request | myName 	: <strong><%=myName %></strong></p>
	<p> 	session | yourName  : <strong><%=yourName %></strong></p>
	<p> application | ourName 	: <strong><%=ourName %></strong></p>
	
	<a href="reset.jsp">Reset all scopes</a>	<!-- 모든 영역에 담긴 내용 삭제 -->

</body>
</html>