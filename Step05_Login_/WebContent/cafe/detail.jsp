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