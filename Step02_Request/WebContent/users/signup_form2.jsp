<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signup_form.jsp</title>
</head>
<body>
<h1>Membership Join Form</h1>
<form action="signup.jsp" method="post">
	<label for="email">E-Mail</label>
	<input type="text" name="email" id="email"/>
	<br/>
	<label for="pwd">Password</label>
	<input type="password" name="pwd" id="pwd"/>
	<br/>
	<fieldset>
		<legend>Gender</legend>
		<label><input type="radio" name="gender" value="man" checked/>Male</label>
		<label><input type="radio" name="gender" value="woman"/>Female</label>		
	</fieldset>
	<fieldset>
		<legend>Hobby</legend>
		<label><input type="checkbox" name="hobby" value="piano"/>Play the Piano</label>
		<label><input type="checkbox" name="hobby" value="game"/>Play a Game</label>
		<label><input type="checkbox" name="hobby" value="movie"/>Watch a Movie</label>
		<label><input type="checkbox" name="hobby" value="etc"/>etc...</label>
	</fieldset>
	<label for="like">Things to Like</label>
	<select name="like" id="like">
		<option>Choose 1</option>
		<option value="java">JAVA</option>
		<option value="python">Python</option>
		<option value="android">Android</option>
		<option value="ios">IOS</option>
	</select>
	<br/>
	<label for="comment">Comments...</label>
	<br/>
	<textarea name="comment" id="comment" cols="30" rows="10"></textarea>
	<br/>
	<button type="submit">JOIN</button>
</form>
</body>
</html>