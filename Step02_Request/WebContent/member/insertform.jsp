<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/insertform.jsp</title>
<!-- bootstrap css 로딩하기 -->
<link rel="stylesheet" href="/Step02_Request/resources/css/bootstrap.css" />
</head>
<body>
<div class="container">
	<h1>Form of the Membership</h1>
		<form action="insert.jsp" methods="post">
			<div class="form-group">
				<label for="name">NAME</label>
				<input class="form-control" type="text" id="name" name="name" />
			</div>
		<div class="form-group">
			<label for="addr">ADDRESS</label>
			<input class="form-control" type="text" id="addr" name="addr"/>
		</div>
		<button class="btn btn-primary" type="submit">INSERT</button>
		<button class="btn btn-warning">CANCEL</button>
		</form>
</div>
</body>
</html>