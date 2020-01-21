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

<%-- include/resource.jsp를 include하기 --%>
<jsp:include page="include/resource.jsp"></jsp:include>

<style>
	h1{color:skyblue;}
	h3{color:#A566FF;}
	button{background-color:#FFD8D8;}
</style>

</head>
<body>

<%-- include/navbar.jsp를 include하기 (서버 내에서의 상대경로를 작성해야 한다.) --%>
<jsp:include page="include/navbar.jsp"></jsp:include>

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
	<ul>
		<h3>Bulletin Board</h3>
		<li><a href="${pageContext.request.contextPath }/cafe/list.jsp">Go to Bulletin Board</a></li>
		<li><a href="file/list.jsp">Show a list of file</a></li>	<!-- 파일 목록보기 (자료실) -->
	</ul>
	<ul>
		<h3>Cookie Test</h3>
		<li><a href="cook/test1.jsp">Cookie Test - 1</a></li>
		<li><a href="cook/test2.jsp">Cookie Test - 2</a></li>
		<li><a href="popup/parent.html">Pop up Test - 1</a></li>
		<li><a href="popup/main.jsp">Pop up Test - 2</a></li> 	<!-- 쿠키 관련된 작업을 할 때에는 html파일이 아닌 jsp파일을 사용한다 -->
	</ul>
	<ul>
		<h3>EL Test</h3>
		<li><a href="el01">EL Test - 1</a></li>
		<li><a href="el02">EL Test - 2</a></li>
		<li><a href="el03">EL Test - 3</a></li>
		<li><a href="el/test04.jsp">EL Test - 4</a></li>
	</ul>
	<ul>
		<h3>JSTL Test</h3>
		<li><a href="jstl/test01.jsp">JSTL Test - 1</a></li>
		<li><a href="jstl/test02.jsp">JSTL Test - 2</a></li>
		<li><a href="jstl/test03.jsp">JSTL Test - 3</a></li>
	</ul>
</div>

</body>
</html> 