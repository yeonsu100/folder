<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/loginform.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>

<%
	// "url" 이라는 파라미터가 넘어오는지 읽어와 본다.  
	String url=request.getParameter("url");
	if(url==null){				// 만일 없으면 
		// 로그인 성공후에 index.jsp 페이지로 보낼수 있도록 구성한다. 
		url=request.getContextPath()+"/index.jsp";
	}
%>

<div class="container">
	<h1>SIGN IN page</h1>
	<form action="login.jsp" method="post">
		<%-- 폼 제출할때 목적지 정보도 같이 보내준다. --%>
		<input type="hidden" name="url" value="<%=url %>" />
		
		<div>
			<label for="id">ID</label>
			<input type="text" id="id" name="id"/>
		</div>
		<div>
			<label for="pwd">Password</label>
			<input type="password" id="pwd" name="pwd"/>
		</div>
		<button type="submit">Sign In</button>
	</form>
</div>
</body>
</html>