<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form.jsp</title>
<style>
	h1{color:skyblue;}
	h3{color:#A566FF;}
</style>
<script src="/Step05_Login/resources/js/jquery-3.3.1.js"></script>
<script src="/Step05_Login/resources/js/bootstrap.js"></script>
</head>
<body>
<div class="container">
	<h1>SIGN IN page</h1>
	<h3>Join </h3>
	<form action="signup.jsp" method="post">
		<div>
			<label for="id">ID</label>
			<input type="text" id="id" name="id"/>
		</div>
		<div>
			<label for="pwd">Password</label>
			<input type="password" id="pwd" name="pwd"/>
		</div>
		<div>
			<label for="email">E-mail</label>
			<input type="email" id="email" name="email" />
		</div>
		<button type="submit">Create</button>
		<button type="reset">Reset all</button>
	</form>
</div>
</body>
</html>