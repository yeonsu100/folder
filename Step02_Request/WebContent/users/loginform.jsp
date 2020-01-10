<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/loginform.jsp</title>
</head>
<body>
<h3>Sign Up Now!</h3>
<form action="login.jsp" method="get">
	<label for="id">ID</label>
	<input type="text" id="id" name="id"/><br/>
	<label for="pwd">Pass Word</label>
	<input type="text" id="pwd" name="pwd"/><br/>
	<button type="submit">Sign In</button>
	<button type="reset">Cancel</button>
</form>
</body>
</html>