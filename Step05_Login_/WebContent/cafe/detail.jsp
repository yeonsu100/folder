<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 1. GET방식 파라미터로 전달되는 글번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	// 2. DB에서 해당 글 정보를 얻어온다.
	CafeDto dto=CafeDao.getInstance().getData(num);
	// 3. 해당글의 조회수를 1 증가시킨다.
	CafeDao.getInstance().addViewCount(num);
	// 4. 글 정보를 응답한다.
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/detail.jsp</title>
<style>
	.contents{
		width: 100%;
		border: 1px dotted #cecece;
	}
</style>
</head>
<body>

<div class="container">
	<h1>See a detail of article</h1>
	<table>
		<tr>
			<th>No.</th>
			<td><%=dto.getNum() %></td>
		</tr>
		<tr>
			<th>Writer</th>
			<td><%=dto.getWriter() %></td>
		</tr>
		<tr>
			<th>Title</th>
			<td><%=dto.getTitle() %></td>
		</tr>
		<tr>
			<th>Content</th>
			<td><textarea cols="30" rows="10"><%=dto.getContent() %></textarea></td>
		</tr>
		<tr>
			<th>Date</th>
			<td><%=dto.getRegdate() %></td>
		</tr>
	</table>
	<div class="contents"><%=dto.getContent() %></div>
	<a href="list.jsp">Show all contents</a>
	
</div>

</body>
</html>