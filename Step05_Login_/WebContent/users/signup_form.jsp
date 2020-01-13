<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form.jsp</title>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<style>
	/* 페이지 로딩 시점에 도움말(ID 사용 불가)과 피드백 아이콘은 일단 숨기기 */
	.help-block, .form-control-feedback{display:none;}
</style>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>

<style>
	h1{color:skyblue;}
	h3{color:#A566FF;}
</style>

</head>
<body>
<div class="container">
	<h1>Create an account page</h1>
	<blockquote><h3>Join our membership :)</h3></blockquote>
	<form action="signup.jsp" method="post" id="signupForm">
		<div class="form-group has-feedback">
			<label class="control-label" for="id">User ID</label>
			<input class="form-control" type="text" id="id" name="id"/>
			<p class="help-block" id="msg_notuse">You can NOT use this ID. Already it has taken.</p>
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
			<span class="glyphicon glyphicon-ok form-control-feedback"></span>
			
			
		</div>
		
		<div class="form-group">
			<label for="pwd">Password</label>
			<input class="form-control" type="password" id="pwd" name="pwd"/>
		</div>
		<div class="form-group">
			<label for="pwd2">Check Password</label>
			<input class="form-control" type="password" id="pwd2" name="pwd2"/>
		</div>
		<div class="form-group">
			<label for="email">E-mail</label>
			<input class="form-control" type="email" id="email" name="email" />
		</div>
		<button type="submit" class="btn btn-primary">Create</button>
		<button type="reset" class="btn btn-default">Reset all</button>
	</form>
</div>

<script>
	// 아이디 유효성 여부
	var isIdValid=false;

	// 아이디를 입력할 때 실행할 함수 등록
	$("#id").on("input", function(){
		// 1. 입력한 아이디를 읽어온다.
		var inputId=$("#id").val();
		// 2. 서버에 보내서 사용가능 여부를 응답받는다.
		$.ajax({
			url:"${pageContext.request.contextPath }/users/checkid.jsp",
			method:"GET",
			data:{inputId:inputId},
			success:function(responseData){
				// 일단 초기화시켜놓고
				$("#id").parent()
				.removeClass("has-success has-error")
				.find(".form-control-feedback")
				.hide();
				
				if(responseData.isExist){		// 아이디가 이미 존재하는 경우 (사용 불가)
					// 색상을 빨간색(error)으로 
					$("#id")					// id의
					.parent()   				// (id의) 부모요소를 선택하여
					.addClass("has-error")		// "has-error" 클래스를 제거하고
					.find(".glyphicon-remove")	// 자손 요소중에서 클래스명이 ".glyphicon-remove"인 것을 찾아
					.show();					// 조건부로 보이게 한다
					// 에러 메세지 보이도록
					$("#msg_notuse").show();
					// 상태 바꾸기
					isIdValid=false;
				}else{					// 아닌 경우 (사용 가능) - 초록색(success)으로 바뀜
					$("#id")					// id의
					.parent()  					// (id의) 부모요소를 선택하여
					.addClass("has-success")	// "has-success" 클래스를 제거하고
					.find(".glyphicon-ok") 		// 자손 요소중에서 클래스명이 ".glyphicon-ok"인 것을 찾아
					.show();					// 조건부로 보이게 한다
					$("#msg_notuse").hide();
					isIdValid=true;
				}
			}
		});
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