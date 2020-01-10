<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/step03_custom.css" />

<!-- jquery+bootstrap javascript 로딩 -->
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>

</head>
<body>
<%-- include/navbar.jsp 페이지 포함시키기--%>
<jsp:include page="include/navbar.jsp"></jsp:include>


<div class="container">
	<h1>INDEX PAGE</h1>
	<p>context path : ${pageContext.request.contextPath }</p>
	<ul>
		<li><a href="member/list.jsp">Show a member list (member table)</a></li>
		<li><a href="todo/list.jsp">Show a to do list (schedule table)</a></li>
		<li><a href="board/list.jsp">Show a Free Board (board_free table)</a></li>
	</ul>
	<script src="https://gist.github.com/yeonsu100/745beec3bdc6adecb51cc7fc9b4de830.js"></script>
</div>

    <!----------- Footer ------------>
    <%-- 
    	[ /include/footer.jsp를 포함시키기 ]
    	 - page="포함시킬 jsp 페이지의 상대경로" 
    	 - 절대경로는 동작하지 않는다. (무조건 상대경로로 작성해야 한다)
    	 - jsp 페이지만 가능하다.
    	 - 포함시킨 jsp 페이지와 포함된 jsp 페이지가 공동 응답하는 구조로 클라이언트에게 응답하는 원리이다.	
    --%>
<jsp:include page="include/footer.jsp"></jsp:include>

</body>
</html>