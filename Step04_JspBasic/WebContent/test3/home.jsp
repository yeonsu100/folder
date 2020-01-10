<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test3/home.jsp</title>
<style>
	h1{color:skyblue;}
</style>

</head>
<body>
<%
	/*
		jsp에서 기본으로 제공하는 객체 중에서 
		HttpServletRequest, HttpSession, ServletContext type 객체가 있다.
		해당 객체의 참조값은 request, session, application이라는 이름의 지역변수에 들어있다.
		때로는 어떤 data(숫자, 문자, array list 등)를 각각의 객체에 저장하고 읽어낼 필요가 있다.
		(예를들면 로그인 정보 같은 것이 이에 해당한다 - )
	*/
	
	// .setAttribute(key, value) - value는 오브젝트로 받기 때문에 숫자, 문자, list 등 전부 가능
	request.setAttribute("myName", "Winnie");		// 응답하고나면 사라지기 때문에 응답하기 전까지만 갖고있을 일회성 데이터를 주로 담는다.
	session.setAttribute("yourName", "Chloe");		// 임의로 지우지 않는 한, 세션이 종료될 때까지 (=웹 브라우저를 닫기 전까지) - 로그인 정보 등을 담는다.
	application.setAttribute("ourName", "Aloha");	// 서버 re-start 전까지 유효 (사용할 일 거의 없음)
	
%>

<h1>scope test home</h1>
<ul>
	<li><a href="other.jsp">Move to another page!</a></li>
</ul>
</body>
</html>