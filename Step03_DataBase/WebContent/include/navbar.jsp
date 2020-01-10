<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// category라는 파라미터명으로 전달된 문자열이 있는지 읽어와본다.
	String category=request.getParameter("category");
	if(category==null){		// 만일 전달된 내용이 없으면
		category="";		// 빈 문자열을 대입한다 (Null Pointer Exception 방지)	
	}
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
		<ul class="nav navbar-nav">
			<li <%if(category.equals("member")){%>class="active"<%}%>><a href="${pageContext.request.contextPath }/member/list.jsp">Member Page</a></li>
			<li <%if(category.equals("todo")){%>class="active"<%}%>><a href="${pageContext.request.contextPath }/todo/list.jsp">To Do List</a></li>
			<li <%if(category.equals("borad")){%>class="active"<%}%>><a href="${pageContext.request.contextPath }/board/list.jsp">Bulletin board</a></li>
			<li <%if(category.equals("product")){%>class="active"<%}%>><a href="${pageContext.request.contextPath }/shoppingmall/list.jsp">Product Management</a></li>
			<li><a href="#">Memo</a></li>
			<li><a href="https://www.youtube.com">YouTube</a></li>
			<li><a href="https://www.instagram.com/yunstagram_100/">Yunstagram</a></li>
		</ul>
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