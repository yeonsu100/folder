<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/loginform.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>

<style>
	/* stylelint-disable selector-no-qualifying-type, property-no-vendor-prefix */
	
	body {
	  padding-top: 40px;
	  padding-bottom: 40px;
	  background-color: #FFE1E1;
	}
	
	.form-signin {
	  max-width: 330px;
	  padding: 15px;
	  margin: 0 auto;
	}
	.form-signin .form-signin-heading,
	.form-signin .checkbox {
	  margin-bottom: 10px;
	}
	.form-signin .checkbox {
	  font-weight: 400;
	}
	.form-signin .form-control {
	  position: relative;
	  -webkit-box-sizing: border-box;
	  -moz-box-sizing: border-box;
	  box-sizing: border-box;
	  height: auto;
	  padding: 10px;
	  font-size: 16px;
	}
	.form-signin .form-control:focus {
	  z-index: 2;
	}
	.form-signin input[type="email"] {
	  margin-bottom: -1px;
	  border-bottom-right-radius: 0;
	  border-bottom-left-radius: 0;
	}
	.form-signin input[type="password"] {
	  margin-bottom: 10px;
	  border-top-left-radius: 0;
	  border-top-right-radius: 0;
	}
</style>

</head>
<body>

<%
	// "url" 이라는 파라미터가 넘어오는지 읽어와 본다.  
	String url=request.getParameter("url");
	if(url==null){				// 만일 없으면 
		// 로그인 성공후에 index.jsp 페이지로 보낼수 있도록 구성한다. 
		url=request.getContextPath()+"/index.jsp";
	}
	
	// 아이디, 비밀번호가 쿠키에 저장되었는지 확인해서 저장되었으면 폼에 출력된다.
	Cookie[] cookies=request.getCookies();
	// 저장된 아이디와 비밀번호를 담을 변수 선언하고 초기값으로 빈 문자열 대입 (안그러면 null이라고 출력되므로)
	String savedId="";
	String savedPwd="";
	if(cookies!=null){
		for(Cookie tmp:cookies){
			if(tmp.getName().equals("savedId")){
				savedId=tmp.getValue();
			}else if(tmp.getName().equals("savedPwd")){
				savedPwd=tmp.getValue();
			}
		}
	}
%>

<div class="container">
	<h1>SIGN IN page</h1>
	<form class="form-signin" action="login.jsp" method="post">
		<%-- 폼 제출할때 목적지 정보도 같이 보내준다. --%>
		<input type="hidden" name="url" value="<%=url %>" />
		<h2 class="form-signin-heading">Sign In</h2>
		<label for="id" class="sr-only">ID</label>
		<input type="text" id="id" name="id" class="form-control" placeholder="User ID..." value="<%=savedId%>" />
		<label for="pwd" class="sr-only">Password</label>
		<input type="password" id="pwd" name="pwd" class="form-control" placeholder="Password..." value="<%=savedPwd%>">
	
		<div class="checkbox">
			<label>
				<input type="checkbox" name="isSave" value="yes" />Save ID, Password
			</label>
		</div>
	
		<button class="btn btn-lg btn-primary btn-block" type="submit">Sign In</button>
	</form>
</div>
</body>
</html>