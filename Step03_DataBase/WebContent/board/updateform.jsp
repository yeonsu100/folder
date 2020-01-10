<%@page import="test.board.dao.BoardDao"%>
<%@page import="test.board.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// 1. 수정할 글 번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	// 2. 수정할 글 정보를 얻어온다.
	BoardDto dto=BoardDao.getInstance().getData(num);
	// 3. 글 수정 폼을 응답한다.

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="container">
	<h1>Update form Page</h1>
	<p>Content No.: <strong><%=dto.getNum() %></strong></p>
	<form action="update.jsp" method="post">
		<input type="hidden" name="num" value="<%=dto.getNum() %>" />
		<div>
			<label for="writer">Creator</label>
			<input type="text" name="writer" id="writer" value="<%=dto.getWriter()%>" />
		</div>
		
		<div>
			<label for="title">Title</label>
			<input type="text" name="title" id="title" value="<%=dto.getTitle()%>" />
		</div>
		
		<div>
			<label for="content">Content</label>
			<textarea name="content" id="content" cols="30" rows="10"><%=dto.getContent() %></textarea>
		</div>
		
		<div>
			<label for="pwd">Password</label>
			<input type="text" name="pwd" id="pwd" value="<%=dto.getPwd()%>" placeholder="Password..." />
		</div>
		
		<button  type="submit">Revise</button>
		<button  type="reset">Reset</button>
		
	</form>
</div>

</body>
</html>