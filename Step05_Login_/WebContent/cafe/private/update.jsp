<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 1. 폼 전송되는 수정할 글 번호를 파라미터에서 추출한다.
	int num=Integer.parseInt(request.getParameter("num"));
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	// 2. DB에 수정 반영하고
	CafeDto dto=new CafeDto();
	dto.setNum(num);
	dto.setTitle(title);
	dto.setContent(content);
	boolean isSuccess=CafeDao.getInstance().update(dto);
	// 3. 응답한다
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/private/update.jsp</title>
</head>
<body>

<div class="container">
	<%if(isSuccess){ %>
		<script>
			alert("Successfully Revised!");
			location.href="${pageContext.request.contextPath }/cafe/detail.jsp?num=<%=num%>";
		</script>
	<%}else{ %>
		<h1>Alert</h1>
		<p>Failure to revision! <a href="updateform.jsp?num=<%=num %>">Try again</a></p>
	<%} %>
</div>

</body>
</html>