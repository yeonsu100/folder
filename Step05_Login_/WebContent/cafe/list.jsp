<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/list.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/step03_custom.css" />
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
</head>
<body>
<%
	// 1. DB에서 글 목록을 얻어온다.
	List<CafeDto> list=CafeDao.getInstance().getList();
	// 2. 글 목록을 응답한다.
%>

<div class="container">
	<a href="private/insertform.jsp">Create a new content</a>
	<h1>Board List</h1>
	<table>
		<thead>
			<tr>
				<th>No.</th>
				<th>Writer</th>
				<th>Title</th>
				<th>View</th>
				<th>Date</th>
			</tr>
		</thead>
		<tbody>
		<%for(CafeDto tmp:list){ %>
			<tr>
				<td><%=tmp.getNum() %></td>
				<td><%=tmp.getWriter() %></td>
				<td><%=tmp.getTitle() %></td>
				<td><%=tmp.getViewCount() %></td>
				<td><%=tmp.getRegdate() %></td>
			</tr>
		<%} %>
		</tbody>
		
	</table>

</div>

</body>
</html>