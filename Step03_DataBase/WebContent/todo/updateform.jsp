<%@page import="test.todo.dao.ToDoDao"%>
<%@page import="test.todo.dto.ToDoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/updateform.jsp</title>
</head>
<body>
<%
	// 1. GET 방식 파라미터로 전달되는 수정할 To Do 번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	// 2. ToDoDao 객체를 이용하여 DB에서 해당 정보를 읽어온다.
	ToDoDto dto=ToDoDao.getInstance().getData(num);
	// 3. 수정된 폼을 응답한다.
%>
<h1>Update Page</h1>
<p>No.: <strong><%=dto.getNum() %></strong></p>
<p>Date: <strong><%=dto.getRegdate() %></strong></p>
<form action="update.jsp" method="post">
	<!-- 웹 브라우저의 주석 모양 (웹 브라우저가 해석하지 않는다) -->
	<%-- jsp 페이지의 주석 (클라이언트에게 출력되지 않으며, 서버가 해석하지 않는다) --%>
	<%-- 할 일 수정할 때 필요한 번호를 폼 전송할 때 같이 전송되도록 --%>
	<input type="hidden" name="num" value="<%=dto.getNum()%>" />
	<label for="conent">Assignment</label>
	<input type="text" id="content" name="content" value="<%=dto.getContent()%>" />
	<button type="submit">Submit</button>
</form>
</body>
</html>