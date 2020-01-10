<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test3/reset.jsp</title>
</head>
<body>
<%
	// request에 특정 키값으로 저장된 data 삭제하기
	request.removeAttribute("myName"); 
	// session에 특정 키값으로 저장된 data 삭제하기
	//>session.removeAttribute("yourName");
	// 만일 여러개를 한번에 다 지우고 싶다면
		session.invalidate();		// session 초기화
	// application에 특정 키값으로 저장된 data 삭제하기
	application.removeAttribute("ourName");
	
%>

<p>Reset all contents in scope</p>
<a href="other.jsp">Back to the 'other.jsp' page</a>
</body>
</html>