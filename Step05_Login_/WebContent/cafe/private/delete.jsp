<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 1. 삭제할 글번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
		// 하지만 삭제 요청 주소를 입력창에 직접 쳐 이를 악용하여 다른 유저의 글을 삭제할 수가 있으므로
		// 세션의 아이디와 글 작성자를 비교해서 일치할 때에만 삭제한다.
		String id=(String)session.getAttribute("id");
		// 글 작성자
		String writer=CafeDao.getInstance().getData(num).getWriter();
		// 아이디와 글 작성자가 일치하는지 여부 판단
		boolean isEqual=id.equals(writer);
		if(!isEqual){
			// 에러를 응답하고 (금지된 요청(페이지 번호 403) - 정상적인 처리를 막는다(승인 거부))
			response.sendError(HttpServletResponse.SC_FORBIDDEN,
					"DO NOT DELETE OTHER USER'S ARTICLE!");
			// 메소드를 종료한다.
			return;
		}

	// 2. DB에서 삭제한다.
	boolean isSuccess=CafeDao.getInstance().delete(num);
	// 3. 응답한다.
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
	<%if(isSuccess){%>
		<script>
			alert("<%=num%> is deleted.");
			location.href="../list.jsp";
		</script>
	<%}else{ %>
		<h1>Alert</h1>
		<p class="alert alert-danger">
			Failure to delete!
			<a class="alert-link" href="../detail.jsp?num=<%=num%>">Try it again.</a>
		</p>
	<%} %>
</div>

</body>
</html>