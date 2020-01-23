<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
	
	// EL, JSTL을 활용하기 위해 필요한 모델을 request에 담는다.
	request.setAttribute("isSuccess", isSuccess);
	request.setAttribute("num", num);
	request.setAttribute("title", title);
	request.setAttribute("content", content);
	request.setAttribute("dto", dto);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/private/update.jsp</title>
<jsp:include page="../../include/resource.jsp"></jsp:include>
</head>

<body>
<div class="container">
	<c:choose>
		<c:when test="${isSuccess }">
			<script>
				alert("Successfully Revised!");
				location.href="${pageContext.request.contextPath }/cafe/detail.jsp?num=${num}";
			</script>
		</c:when>
		<c:otherwise>
			<h1>Alert</h1>
			<p class="alert alert-danger">Failure to revision! 
				<a class="alert-link" href="updateform.jsp?num=${num }">Try again</a>
			</p>
		</c:otherwise>
	</c:choose>
</div>
</body>
</html>