<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form.jsp</title>
<link rel="stylesheet" href="/Step02_Request/resources/css/bootstrap.css" />
<style>
	fieldset{
		margin-bottom: 15px;
	}
	legend{
		font-size: 14px;
		margin-bottom: 5px;
		font-weight: bold;
	}
</style>
</head>
<body>
<div class="container">
	<h1>Create an account page</h1>
	<form action="signup.jsp" method="post">
		<div class="form-group">
			<label for="email">E-mail</label>
			<input class="form-control" type="text" name="email" id="email"/>
		</div>
		<div class="form-group">
			<label for="pwd">Password</label>
			<input class="form-control" type="password" name="pwd" id="pwd"/>
		</div>
		<fieldset>
			<legend>Gender</legend>
			<label class="radio-inline"><input type="radio" name="gender" value="man" checked/>Male</label>
			<label class="radio-inline"><input type="radio" name="gender" value="woman"/>Female</label>		
		</fieldset>
		<fieldset>
			<legend>Favorite Disney Character</legend>
			<label class="checkbox-inline"><input type="checkbox" name="char" value="mouse"/>Mickey & Mini</label>
			<label class="checkbox-inline"><input type="checkbox" name="char" value="duck"/>Donald & Daisy</label>
			<label class="checkbox-inline"><input type="checkbox" name="char" value="stitch"/>Lilo & Stitch</label>
			<label class="checkbox-inline"><input type="checkbox" name="char" value="squirrel"/>Chip & Dale</label>
		</fieldset>
		<div class="form-group">
			<label for="like">What do you like?</label>
			<select class="form-control" name="like" id="like">
				<option>Choose 1</option>
				<option value="java">JAVA</option>
				<option value="python">Python</option>
				<option value="C">C</option>
				<option value="ruby">Ruby</option>
			</select>
		</div>
		<div class="form-group">
			<label for="comment">comments</label>
			<textarea class="form-control" name="comment" id="comment" cols="30" rows="10"></textarea>
		</div>
		<button class="btn btn-primary" type="submit">Submit</button>
		<button class="btn btn-warning" type="reset">Reset</button>
	</form>
</div>
</body>
</html>
