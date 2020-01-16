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
<jsp:include page="../include/resource.jsp"></jsp:include>
<style>
	/* 글 내용을 출력할 div에 적용할 css */
	.contents, table{
		width: 100%;
		border: 1px dotted #cecece;
		box-shadow: 3px 3px 5px 6px #ccc;
	}
</style>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="cafe" name="category" />
</jsp:include>
<div class="container">
	<ol class="breadcrumb">
		<li><a href="list.jsp">Show all contents (List)</a></li>
		<li>Show detail of content</li>
	</ol>
	<h1>See a detail of article</h1>
	<table class="table table-bordered table-condensed">
		<colgroup>			<!-- 값을 다 더했을 때 12가 되도록 -->
			<col class="col-xs-3"/>
			<col class="col-xs-9"/>
		</colgroup>
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
				<th>Date</th>
				<td><%=dto.getRegdate() %></td>
			</tr>
		</table>
	<div class="contents"><%=dto.getContent() %></div>
	<a href="list.jsp">Show all contents</a>
	
	<!-- 본인이 쓴 글일때만 수정기능이 작동하도록 이 링크를 조건부로 출력한다 (세션이용) -->
	<%
		// 세션영역의 아이디를 읽어와본다. 만약 로그인을 하지 않았으면 null이다.
		String id=(String)session.getAttribute("id");
	%>
	<%-- 글 작성자와 로그인된 아이디가 일치할 때에만 기능을 제공한다.
		 즉, 본인이 작성한 글만 수정할 수 있도록 하기 위해 --%>
	<%if(dto.getWriter().equals(id)){ %>
		<a href="private/updateform.jsp?num=<%=dto.getNum() %>">Revision</a>
	<%} %>
	
	
</div>

</body>
</html>