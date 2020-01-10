<%@page import="test.board.dto.BoardDto"%>
<%@page import="test.board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	// 1. 폼 전송되는 수정 반영할 글정보를 얻어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	String writer=request.getParameter("writer");
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	String pwd=request.getParameter("pwd");
	// 2. 저장된 비밀번호를 읽어온다.
	String savedPwd=BoardDao.getInstance().getData(num).getPwd();
	// 3. 저장된 비밀번호와 전송된 비밀번호가 일치하면 수정반영한다.
	boolean isSuccess=false;
	if(savedPwd.equals(pwd)){
		// BoardDto 객체에 수정할 글의 정보를 담아서
		BoardDto dto=new BoardDto();
		dto.setNum(num);
		dto.setWriter(writer);
		dto.setTitle(title);
		dto.setContent(content);
		// DB에 수정 반영하기
		isSuccess=BoardDao.getInstance().update(dto);
	}
	// 4. 결과를 응답한다.
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="container">
	<%if(isSuccess){%>
	<script>
		alert("No.<%=num%> article is successfully updated!");
		location.href="${pageContext.request.contextPath }/board/list.jsp";
	</script>
		<%}else{ %>
		<p class="alert alert-danger">Failure to updated. Please confirm your password</p>
		<a href="updateform.jsp">Try it again.</a>
	<%} %>
</div>

</body>
</html>