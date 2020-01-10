<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
</head>
<body>
<%
	// POST 방식 전송되는 파라미터 추출하기
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	// 아이디, 비밀번호가 유효한 정보인지 DB에서 확인해본다.
	boolean isValid=false;
	if(id.equals("Winnie") && pwd.equals("1234")){
		// 아이디 : "Winnie", 비번 : "1234"가 유효한 정보라고 가정하자. (아직 DB 연동 전이므로)
		isValid=true;
	}
%>

<!-- if문을 이용하여 결과를 조건부로 달리한다. -->
<h1>로그인을 시도한 결과 페이지 입니다.</h1>
<%if(isValid){	%>
	<p>	<strong><%=id %></strong> 회원님 로그인 되었습니다.</p>
<%}else{ %>
	<p>아이디 또는 비밀번호가 일치하지 않습니다.</p>
	<a href="loginform.jsp">다시 로그인하러 가기</a>
<%} %>
</body>
</html>