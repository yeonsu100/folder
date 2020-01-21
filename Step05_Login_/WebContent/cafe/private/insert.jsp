<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	// 1. 폼 전송되는 파라미터 읽어오기 (글 제목, 내용)
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	// 글 작성자 (로그인한 사람만 글을 작성할 수 있으므로 세션에서 값을 얻어와야 한다)
	String writer=(String)session.getAttribute("id");
	// CafeDto 객체에 작성자, 제목, 내용을 담고
	CafeDto dto=new CafeDto();
	dto.setWriter(writer);
	dto.setTitle(title);
	dto.setContent(content);
	// 2. DB에 글 정보를 저장하고
	boolean isSuccess=CafeDao.getInstance().insert(dto);
	// 3. 응답하기
	
	// EL, JSTL을 활용하기 위해 필요한 모델을 request에 담는다.
	request.setAttribute("isSuccess", isSuccess);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/private/insert.jsp</title>
<jsp:include page="../../include/resource.jsp"></jsp:include>

</head>
<body>

<div class="container">
	<c:choose>
		<c:when test="${requestScope.isSuccess}">
			<script>
				alert("Successfully Saved!");
				location.href="${pageContext.request.contextPath }/cafe/list.jsp";
			</script>
		</c:when>
		<c:otherwise>
			<h1>Alert</h1>
			<p class="alert alert-danger">
				Failure to saved!
				<a class="alert-link" href="insertform.jsp">Please try it again.</a>
			</p>
		</c:otherwise>
	</c:choose>
	
</div>


</body>
</html>