<%@page import="test.todo.dao.ToDoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 1. GET 방식 파라미터로 전달되는 삭제할 To Do 번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	// 2. ToDoDao를 이용해서 DB에서 삭제
	ToDoDao.getInstance().delete(num);
	// 3. 리 다이렉트 응답 (요청을 다시하라고 클라이언트에게 경로를 알려줌)
	response.sendRedirect("list.jsp");
%>



<!-- 리 다이렉트 응답(sendRedirect) 덕분에 아래 코드가 필요 없어졌다. -->
<!-- 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/delete.jsp</title>
</head>
<body>
<script>
	location.href="list.jsp";
</script>
</body>
</html>

-->