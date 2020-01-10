<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<link rel="stylesheet" href="/Step02_Request/resources/css/bootstrap.css" />
</head>
<body>
<div class="container">
	<h1>This is an Index page.</h1>
	<ul>
		<!-- Servlet -->
		<li><a href="/Step02_Request/detail?num=1">Show details 1...(Servlet)</a></li>
		<li><a href="/Step02_Request/detail?num=2">Show details 2...(Servlet)</a></li>
		<li><a href="/Step02_Request/detail?num=3">Show details 3...(Servlet)</a></li>
		
		<!-- jsp -->
		<li><a href="/Step02_Request/detail.jsp?num=1">Show details 1...(jsp)</a></li>
		<li><a href="/Step02_Request/detail.jsp?num=2">Show details 2...(jsp)</a></li>
		<li><a href="/Step02_Request/detail.jsp?num=3">Show details 3...(jsp)</a></li>
		
		<!-- GET 방식 전송 파라미터가 여러개이면 &로 구분해서 작성한다. -->
		<li><a href="/Step02_Request/sub/view.jsp?num=1&name=Winnie&addr=honolulu">Click</a></li>
		<li><a href="users/loginform.jsp">Sign In</a></li>
		<li><a href="member/insertform.jsp">Add to member</a></li>
		<li><a href="users/signup_form.jsp">Create an account</a></li>
	</ul>
</div>
</body>
</html>