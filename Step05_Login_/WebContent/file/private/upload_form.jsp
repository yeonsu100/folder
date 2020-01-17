<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/private/upload_form.jsp</title>
<jsp:include page="../../include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../../include/navbar.jsp">
	<jsp:param value="file" name="category" />
</jsp:include>
<div class="container">
	<h1>File upload Form</h1>
	<form action="upload.jsp" method="post" enctype="multipart/form-data">
		<div>
			<label for="myFile">Attachment</label>
			<input type="file" name="myFile" id="myFile" />
		</div>
	</form>
</div>
</body>
</html>