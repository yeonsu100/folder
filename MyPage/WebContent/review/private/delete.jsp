<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	int num=Integer.parseInt(request.getParameter("num"));
		String id=(String)session.getAttribute("id");
		String writer=CafeDao.getInstance().getData(num).getWriter();
		boolean isEqual=id.equals(writer);
		if(!isEqual){
			response.sendError(HttpServletResponse.SC_FORBIDDEN,
					"DO NOT DELETE OTHER USER'S ARTICLE!");
			return;
		}

	boolean isSuccess=CafeDao.getInstance().delete(num);
	
	request.setAttribute("isSuccess", isSuccess);
	request.setAttribute("num", num);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/private/delete.jsp</title>
<jsp:include page="../../include/resource.jsp"></jsp:include>

</head>
<body>

<div class="container">
	<c:choose>
		<c:when test="${isSuccess }">
			<script>
				alert("The article No.${num } is deleted.");
				location.href="../list.jsp";
			</script>
		</c:when>
		<c:otherwise>
			<h1>Alert</h1>
			<p class="alert alert-danger">
				Failure to delete!
				<a class="alert-link" href="../detail.jsp?num=${num }">Try it again.</a>
			</p>
		</c:otherwise>
	</c:choose>
</div>
</body>
</html>