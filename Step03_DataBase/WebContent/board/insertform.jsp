<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert form Page</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<style>
	h1{color:pink;}
</style>
</head>
<body>

<div class="container">
<h1>Write down on your article</h1>
	<form action="insert.jsp" method="post">
		<div>
			<label for="writer">Creator</label></br>
			<input type="text" name="writer" placeholder="User Name" />
		</div>
		<div>
			<label for="title">Title</label></br>
			<input type="text" name="title" placeholder="Title" />
		</div>
		<div>	
			<label for="content">Content of article</label></br>
			<textarea name="content" placeholder="Content" id="content" cols="30" rows="10"></textarea>
		</div>
		<div>
			<label for="pwd">Password</label></br>
			<input type="text" name="pwd" placeholder="Password" />
		</div>
		
		<button class="btn btn-primary" type="submit">Write an article</button>
		<button class="btn btn-default" type="reset">Clear All</button>
	</form>
</div>

</body>
</html>