<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>/member/insertform.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<style>
	/* navbar가 상단에 고정되어 있기 때문에 제목 (List of Member)이 가려져 공간이 남는 문제 해결 */
	body{
		padding-top: 50px;
		}
</style>
</head>
<body>
<div class="navbar navbar-default navbar-fixed-top">		
	<div class="container">
		<a class="navbar-brand" href="${pageContext.request.contextPath }/index.jsp">HOME</a>	<!-- 최상위 경로(index 페이지)로 올라오겠다는 의미 -->
		<ul class="nav navbar-nav">
			<li class="active"><a href="${pageContext.request.contextPath }/member/list.jsp">Member Page</a></li>
					<!-- active : 현재 보고있는 페이지임을 알수 있도록 버튼 활성화 -->
			<li><a href="https://www.youtube.com">YouTube</a></li>
			<li><a href="https://www.instagram.com/yunstagram_100/">Yunstagram</a></li>
		</ul>
	</div>
</div>
<h2>Form of Membership</h2>
<form action="insert.jsp" method="post">
		<!-- 입력한 내용이 서버에 전송되도록 하는 것이 목적이기 때문에 post 방식 요청-->
	<div class="form-group">
	<label for="name">NAME</label>
	<input type="form-control" name="name" id="name"/></br>
	</div>
	<div class="form-group">
	<label for="addr">ADDRESS</label>
	<input type="form-control" name="addr" id="addr"/></br>
	</div>
	<button class="btn btn-primary" type="submit">Submit</button>
	<button class="btn btn-primary" type="reset">Reset Form</button>
</form>
</body>
</html>