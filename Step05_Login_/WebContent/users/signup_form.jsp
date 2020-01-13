<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form.jsp</title>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>

<style>
	h1{color:skyblue;}
	h3{color:#A566FF;}
</style>

</head>
<body>
<div class="container">
	<h1>SIGN IN page</h1>
	<h3>Join our membership :)</h3>
	<form action="signup.jsp" method="post" id="signupForm">
		<div>
			<label for="id">User ID</label>
			<input type="text" id="id" name="id"/>
			<button id="checkBtn">Valid Check</button>
			<span id="checkResult"></span>
		</div>
		<div>
			<label for="pwd">Password</label>
			<input type="password" id="pwd" name="pwd"/>
		</div>
		<div>
			<label for="pwd2">Check Password</label>
			<input type="password" id="pwd2" name="pwd2"/>
		</div>
		<div>
			<label for="email">E-mail</label>
			<input type="email" id="email" name="email" />
		</div>
		<button type="submit">Create</button>
		<button type="reset">Reset all</button>
	</form>
</div>

<script>
	// 아이디 유효성 여부
	var isIdValid=false;

	// 중복확인 버튼(Valid Check)을 눌렀을 때 실행할 함수 등록
	$("#checkBtn").on("click", function(){
		// 1. 입력한 아이디를 읽어온다.
		var inputId=$("#id").val();
		// 2. 서버에 보내서 사용가능 여부를 응답받는다.
		$.ajax({
			url:"${pageContext.request.contextPath }/users/checkid.jsp",
			method:"GET",
			data:{inputId:inputId},
			success:function(responseData){
				console.log(responseData);
				if(responseData.isExist){		// 아이디가 이미 존재하는 경우 (사용 불가)
					$("#checkResult")
					.text("You can NOT use this ID. Already it has taken.")
					.css("color","red");
					isIdValid=false;
				}else{							// 아닌 경우 (사용 가능)
					$("#checkResult")
					.text("You can use this ID.")
					.css("color","blue");
					isIdValid=true;isIdValid=true;
				}
			}
		});
		
		return false;		// 폼 전송 막기
	});
	
	// 폼에 제출 이벤트가 발생했을 때 실행할 함수 등록
	$("#signupForm").on("submit", function(){
		// 폼의 유효성 검증을하고 만일 통과를 못했으면 폼 제출을 막는다.
		
		// 1. 아이디 유효성 검증
		if(!isIdValid){
			// 잘못된 메세지를 띄우고
			alert("Please check ID Valid button first!");
			// 잘못된 곳을 바로 입력할 수 있도록 포커스 주기
			$("#id").focus();
			return false;		// 폼 제출 막기
		}	
		// 2. 비밀번호 유효성 검증
		var pwd=$("#pwd").val();
		var pwd2=$("#pwd2").val();
		if(pwd != pwd2){
			alert("Please check password again!");
			$("#pwd").focus();
			return false;		// 폼 제출 막기
		}
		// 3. 이메일 유효성 검증 (@가 포함되었는지 여부 확인)
		var email=$("#email").val();
		// @가 포함되어있는지 확인한다. 만일 포함되어있지 않으면 null이 리턴된다.
		var emailValid=email.match("@");
		if(emailValid==null){
			alert("Please confirm email format.");
			$("#email").focus();
			return false();
		}
	});
	
</script>

</body>
</html>