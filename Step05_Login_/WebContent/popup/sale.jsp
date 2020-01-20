<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/popup/sale.jsp</title>
<style>
	h2{color:#FF8686;}
	body{
		background-color: #FFE1E1;
	}
</style>

</head>
<body>

<h2>Bargain Sale for Spring!!</h2>
<p>Burt's Bee - Lip Barm <del>$6.19</del> $3.99</p>
<p>L'Oreal - Face Oil <del>$20.89</del> $11.99</p>
<p>Victoria Secret - Body Mist <del>$24.25</del> $8.99</p>
<form action="nopopup.jsp" method="post">
	<label>
		<input type="checkbox" name="isPopup" value="no" />
		No showing during 1 min.
	</label>
	<button type="submit">Close</button>
</form>
</body>
</html>