<%@page import="test.todo.dao.ToDoDao"%>
<%@page import="test.todo.dto.ToDoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 0. 한글 깨지지 않도록 인코딩
	request.setCharacterEncoding("utf-8");
	// 1. 폼 전송되는 파라미터 추출
	String content=request.getParameter("content");	
	// 2. ToDoDao 객체를 이용해서 DB에 저장하고
	boolean isSuccess=ToDoDao.getInstance().insert(content);
	// 3. 응답하기
	
%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/insert.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
 
<div class="container">
	<%if(isSuccess){ %>
	<script>
		alert("Content was Inserted successfully.");
		location.href="${pageContext.request.contextPath }/todo/list.jsp";
	</script>
	<%}else{ %>
		<p class="alert alert-danger">Failure to Insert.</p>
		<a href="insertform.jsp">Please try it again.</a>
	<%} %>
</div>

</body>
</html>