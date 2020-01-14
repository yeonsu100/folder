<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/private/insertform.jsp</title>
</head>
<body>

<%
	// 로그인된 회원의 아이디 읽어오기
	String id=(String)session.getAttribute("id");
%>

<div class="container">
	<h1>Create a new content page</h1>
	<form action="insert.jsp" method="post">
		<div>
			<label for="writer">Writer</label>
			<input type="text" value="<%=id %>" disabled />
		</div>
		<div>
			<label for="title">Title</label>
			<input type="text" value="title" id="title" />
		</div>
		<div>
			<label for="content">Content</label>
			<textarea name="content" id="content" cols="30" rows="10"></textarea>
		</div>
		<button type="submit">Save</button>
		<button type="reset">Clear</button>
	</form>
</div>

</body>
</html>