<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test4/insert.jsp</title>
</head>
<body>
<%
	// 한글 인코딩을 매 페이지마다 코딩하는 것이 아니라, 필터를 만들어 필터로 처리할 것이다. => [EncodingFilter]
	//request.setCharacterEncoding("UTF-8");
	// post 방식 전송된 파라미터 읽어오기
	String name=request.getParameter("name");
	String addr=request.getParameter("addr");
%>

<p>Name : <strong><%=name %></strong></p>
<p>Adress : <strong><%=addr %></strong></p>

</body>
</html>