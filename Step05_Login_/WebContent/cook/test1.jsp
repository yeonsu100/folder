<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 폼 전송되는 문자열 읽어오기
	String msg=request.getParameter("msg");
	if(msg!=null){ 			// 널이 아닐 때 수행
		// 쿠키 객체 생성 : new Cookie(key,value);
		Cookie cookie=new Cookie("savedMsg", msg);
		// 쿠키 유지시간을 초단위로 지정한다.
		cookie.setMaxAge(30);
		// 응답할 때 쿠키도 같이 응답한다.
		response.addCookie(cookie);	
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cook/test1.jsp</title>
</head>
<body>

<h2>cookie test</h2>
<form action="test1.jsp" method="post">
	<label for="msg">type for saving</label>		<!-- (저장할 문자열 입력) -->
	<input type="text" name="msg" id="msg" />
	<button type="submit">Save</button>
</form>
<a href="read1.jsp">Read message from saved cookie</a>	<!-- 저장된 쿠키값 읽어오기 -->
</body>
</html>