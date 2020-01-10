<%@page import="test.board.dao.BoardDao"%>
<%@page import="test.board.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// 1. 파라미터로 넘어오는 글번호를 얻어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	
	// 2. DB에서 글번호에 해당하는 글정보를 얻어온다.
	BoardDto dto=BoardDao.getInstance().getData(num);	
	// 3. 글 자세히보기 페이지를 응답한다.
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detail content Page</title>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/step03_custom.css" />
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>

</head>
<body>

<div class="container">
	<table>
		<tr>
			<th>No.</th>
			<td><%=dto.getNum() %></td>
		</tr>
		<tr>
			<th>Creator</th>
			<td><%=dto.getWriter() %></td>
		</tr>
		<tr>
			<th>Title</th>
			<td><%=dto.getTitle() %></td>
		</tr>
		<tr>
			<th>Content</th>
			<td><textarea cols="30" rows="10" disabled><%=dto.getContent() %></textarea></td>
		</tr>
		<tr>
			<th>Date</th>
			<td><%=dto.getRegdate() %></td>
		</tr>
	</table>
	
	<!-- delete 기능을 수행할 폼 -->
	<form action="delete.jsp" method="post">
		<input type="hidden" name="num" value="<%=dto.getNum() %>" />
		<input type="password" name="pwd" placeholder="Password" />
		<button class="btn btn-danger btn-sm" type="submit">Delete</button>
	</form>
	<form action="update.jsp" method="post">
		<input type="hidden" name="num" value="<%=dto.getNum() %>" />
		<input type="password" name="pwd" placeholder="Password" />
		<button class="btn btn-warning btn-sm" type="submit">Revise</button>
	</form>

	
</div>

<marquee width="500" height="50" bgcolor="#FFC6C6" >Welcome to Winnie World!</marquee>
<jsp:include page="../include/ysfooter.jsp"></jsp:include>

</body>
</html>