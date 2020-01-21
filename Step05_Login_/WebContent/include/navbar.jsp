<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// category라는 파라미터명으로 전달된 문자열이 있는지 읽어와본다.
	String category=request.getParameter("category");
	if(category==null){		// 만일 전달된 내용이 없으면
		category="";		// 빈 문자열을 대입한다 (Null Pointer Exception 방지)	
	}
	
	// 로그인된 아이디 읽어오기 (세션영역에서 id라는 키값으로 로그인 된 것이 있는지 확인)
	String id=(String)session.getAttribute("id");
%>
    
<div class="navbar navbar-inverse navbar-fixed-top">		
				<!--navbar-inverse 또는 navbar-default--> <!-- inverse(검은색) 대신 default를 입력하면 회색 -->
	<div class="container">
	<!-- 홈페이지(인덱스) 링크와 버튼을 넣어둘 div -->
	<div class="navbar-header">
		<a class="navbar-brand" href="${pageContext.request.contextPath }/index.jsp">HOME</a>
									<!-- ▲ 최상위 경로(index 페이지)로 올라오겠다는 의미 -->
		<button class="navbar-toggle"
				data-toggle="collapse"
				data-target="#one">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
	</div>
	
	<!-- xs 영역에서는 숨겨졌다가 버튼을 누르면 나오게 할 컨텐츠를 넣을 div -->
	<div class="collapse navbar-collapse" id="one">
		<!-- 네비 바 목록 (절대경로를 쓰는 것이 좋다) -->
		<ul class="nav navbar-nav">
			<li <%if(category.equals("cafe")){%>class="active"<%} %>><a href="${pageContext.request.contextPath }/cafe/list.jsp">Cafe</a></li>
			<li <%if(category.equals("file")){%>class="active"<%} %>><a href="${pageContext.request.contextPath }/file/list.jsp">Web hard</a></li>
			<li><a href="https://www.youtube.com">YouTube</a></li>
			<li><a href="https://www.instagram.com/yunstagram_100/">Yunstagram</a></li>
		</ul>
		
		<%if(id==null){ %>
			<div class="pull-right">
				<a class="btn btn-primary navbar-btn btn-xs" href="${pageContext.request.contextPath }/users/loginform.jsp">Sign In</a>
				<a class="btn btn-info navbar-btn btn-xs" href="${pageContext.request.contextPath }/users/signup_form.jsp">Create an account</a>
			</div>
		<%}else{ %>
			<p class="navbar-text pull-right">
				Signed as <strong><a class="navbar-link" href="${pageContext.request.contextPath }/users/private/info.jsp"><%=id %></a></strong>
				<a class="navbar-link" href="${pageContext.request.contextPath }/users/logout.jsp">Signed Out</a>
			</p>
		<%} %>
		
	</div>
	
	</div>
</div>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>