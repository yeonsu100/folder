<%@page import="test.todo.dao.ToDoDao"%>
<%@page import="test.todo.dto.ToDoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/update.jsp</title>
</head>
<body>
<%
	// 0. 한글 인코딩 먼저 하고 (필터를 이용해 처리하는 방법 추후 배울 예정)
	request.setCharacterEncoding("utf-8");
	// 1. 폼 전송되는 수정할 To Do 번호와 내용을 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	String content=request.getParameter("content");
	//String regdate=request.getParameter("regdate");
	// 2. DB에 수정 반영 (num과 content를 같이 묶어서 전송해야 한다)
	ToDoDto dto=new ToDoDto();
	dto.setNum(num);
	dto.setContent(content);
	boolean isSuccess=ToDoDao.getInstance().update(dto);

%>

<div class="container">
<%if(isSuccess){ %>
	<script>
		alert("No.<%=num%> content was updated successfully.");
		location.href="list.jsp";
	</script>
<%}else{ %>
	<script>
		alert("Failure to update.");
		location.href="list.jsp";
	</script>
<%} %>
</div>

</body>
</html>