<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// session 에서 "id" 라는 키값으로 저장된 문자열이 있는지 읽어와 본다.
	// 있으면 로그인 된 상태, null 이면 로그인이 안된 상태 
	String id=(String)session.getAttribute("id");
%> 
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1" >  <!-- 반응형 웹에 사용하는 메타태그 -->
<title>Index.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/step03_custom.css" />

<!-- jquery+bootstrap javascript 로딩 -->
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>

<style>
	h1{color:skyblue;}
	h3{color:#A566FF;}
	button{background-color:#FFD8D8;}
</style>

</head>
<body>
<div class="container">

	<%if(id == null){ %>
		<button><a href="users/signup_form.jsp">Create an account</a></button>
		<button><a href="users/loginform.jsp">Sign In</a></button>
	<%}else{ %>
		<p> 
			Hi, <a href="${pageContext.request.contextPath }/users/private/info.jsp">
			<strong><%=id %></strong></a> Welcome to our Web Site!</br>
			<a href="users/logout.jsp">Sign out</a>
		</p>
	<%} %>

	<h1>INDEX PAGE</h1>

	<ul>
		<h3>Product list</h3>
		<li><a href="shop/buy.jsp?num=1&name=lipbarm">Lip Barm - BURT'S BEE</a></li>
		<li><a href="shop/buy.jsp?num=2&name=oil">Face Oil - L’Oreal</a></li>
		<li><a href="shop/buy.jsp?num=3&name=mist">Body Mist - Victoria Secret</a></li>
		<li><a href="shop/buy.jsp?num=4&name=sun">Sun Screen - Banana Boat</a></li>
		<li><a href="shop/buy.jsp?num=5&name=lotion">Lotion - Cetaphil</a></li>
		<li><a href="shop/buy.jsp?num=6&name=ampule">Facial Ampule - Estee Lauder</a></li>
		<li><a href="shop/buy.jsp?num=7&name=shadow">Color Shadow - Avon</a></li>
	</ul>

</div>

</body>
</html> 