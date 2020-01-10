<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/insertform.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
<div class="container">
<h1>Insert To Do Content page</h1>
	<form action="insert.jsp" method="post">
		<input type="text" name="content" placeholder="Insert an assignments..." />
		<button class="btn btn-primary" type="submit">Add a content</button>
		<button class="btn btn-default" type="reset">Reset</button>
	</form>
</div>
</body>
</html>