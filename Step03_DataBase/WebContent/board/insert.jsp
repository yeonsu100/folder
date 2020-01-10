<%@page import="test.board.dto.BoardDto"%>
<%@page import="test.board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// 한글 인코딩
	request.setCharacterEncoding("UTF-8");
	// 폼 전송되는 새 글 정보 읽어와서 (파라미터 추출)
	String writer=request.getParameter("writer");
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	String pwd=request.getParameter("pwd");
	// BoardDao 객체를 이용해서 DB에 저장 및 응답
	BoardDto dto=new BoardDto();
	dto.setWriter(writer);
	dto.setTitle(title);
	dto.setContent(content);
	dto.setPwd(pwd);
	boolean isSuccess=BoardDao.getInstance().insert(dto);
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Page</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/step03_custom.css" />
</head>
<body>

<div class="container">
	<%if(isSuccess){%>
	<script>
		alert("<%=writer%>'s article is successfully saved!");
		location.href="${pageContext.request.contextPath }/board/list.jsp";
	</script>
		<%}else{ %>
		<p class="alert alert-danger">Failure to saved.</p>
		<a href="insertform.jsp">Please try it again.</a>
	<%} %>
</div>



</body>
</html>