<%@page import="test.board.dao.BoardDao"%>
<%@page import="test.board.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/list.jsp</title>
<link rel="stylesheet" href="/Step03_DataBase/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/step03_custom.css" />


<style>
	h1{color:#FF6C6C;}
	th{background-color : #FFB4B4;}
</style>

</head>
<body>
<jsp:include page="../include/navbar.jsp"></jsp:include>
<div class="container">
	<h1>List of Board Content</h1>
	<table class="table table-striped table-condensed">
		<colgroup>
			<col class="col-xs-1"/>
			<col class="col-xs-2"/>
			<col class="col-xs-7"/>
			<col class="col-xs-3"/>
		</colgroup>
		<thead>
			<tr>
				<th class="text-center">No.</th>
				<th class="text-center">Creator</th>
				<th class="text-center">Title</th>
				<th class="text-center">Date</th>
			</tr>
		</thead>
		
		<%
			// BoardDto 객체를 이용해서 글 목록을 얻어온다.
			List<BoardDto> list=BoardDao.getInstance().getList();
		%>
		<tbody>
		<%for(BoardDto tmp: list){%>
			<tr>
				<td><%=tmp.getNum() %></td>
				<td><%=tmp.getWriter() %></td>
				<td><a href="detail.jsp?num=<%=tmp.getNum() %>"><%=tmp.getTitle() %></a></td>
				<td><%=tmp.getRegdate() %></td>
			</tr>
		<%} %>
		</tbody>
	</table>
	<button><a href="insertform.jsp">Create a new article</a></button>
</div>

<marquee width="500" height="50" bgcolor="#FFC6C6" >Welcome to Winnie World!</marquee>
<jsp:include page="../include/ysfooter.jsp"></jsp:include>

</body>
</html>