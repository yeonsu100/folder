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
	.help-block, .form-control-feedback {display:none;}
	h1 {color:skyblue;}
	h3 {color:#A566FF;}
</style>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
</head>

<body>
<div class="container">
	<h1>Create an account page</h1>
	<blockquote><h3>Join our membership :)</h3></blockquote>
	<form action="signup.jsp" method="post" id="signupForm">
		<!-- 아이디 -->
		<div class="form-group has-feedback">
			<label class="control-label" for="id">User ID</label>
			<input class="form-control" type="text" id="id" name="id"/>
			<p class="help-block" id="id_notusable">You can NOT use this ID. Already it has taken.</p>
			<p class="help-block" id="id_required">ID is required.</p>
			<!-- 페이지가 로딩되는 시점에서는 아래의 span요소들은 보이지 않다가 특정 조건일 때 노출되도록 한다. -->
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
			<span class="glyphicon glyphicon-ok form-control-feedback"></span>
		</div>
		
		<!-- 비밀번호 -->
		<div class="form-group has-feedback">
			<label class="control-label" for="pwd">Password</label>
			<input class="form-control" type="password" id="pwd" name="pwd"/>
			<p class="help-block" id="pwd_required">Password is required.</p>
			<p class="help-block" id="pwd_notequal">Please confirm for matching with below password.</p>
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
			<span class="glyphicon glyphicon-ok form-control-feedback"></span>
		</div>
		<div class="form-group has-feedback">
			<label class="control-label" for="pwd2">Check Password</label>
			<input class="form-control" type="password" id="pwd2" name="pwd2"/>
			<p class="help-block" id="msg_notsame">Please check your password correctly!</p>
		</div>
		
		<!-- 이메일 -->
		<div class="form-group has-feedback">
			<label class="control-label" for="email">E-mail</label>
			<input class="form-control" type="email" id="email" name="email" />
			<p class="help-block" id="email_notmatch">Please confirm email format correctly.</p>
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
			<span class="glyphicon glyphicon-ok form-control-feedback"></span>
		</div>
		
		<!-- 버튼 -->
		<div class="row">
			<div class="col-xs-6">
				<button disabled="disabled" type="submit" class="btn btn-info">Create</button>
			</div>
			<div class="col-xs-6">
				<button type="reset" class="btn btn-default">Reset all</button>
			</div>
		</div>
	</form>
</div>

<script>
	// 아이디 유효성 여부
	// var isIdValid=false;
	// 아이디를 사용할 수 있는지 여부
	var isIdUsable=false;
	// 아이디를 입력했는지 여부
	var isIdInput=false;
		// 위 두가지 조건 중 어느하나라도 false이면 false가 리턴되어야 한다.

	// 비밀번호를 확인칸과 같게 입력했는지 여부
	var isPwdEqual=false;
	// 비밀번호를 입력했는지 여부
	var isPwdInput=false;
	
	// 이메일을 형식에 맞게 (@ 포함되도록) 입력했는지 여부
	var isEmailMatch=false;
	// 이메일을 입력했는지 여부
	var isEmailInput=false;
	
	// 이메일을 입력했을 때 실행할 함수 등록
	$("#email").on("input", function(){
		var email=$("#email").val();
		
		// @가 포함되었는지 여부를 판단
		if(email.match("@")){			// 만약 이메일 형식에 맞게 입력했다면
			isEmailMatch=true;
		}else{							// 그렇지 않다면 (=@가 없다면)
			isEmailMatch=false;
		}
		
		if(email.length==0){			// 만약 이메일을 입력하지 않았다면
			isEmailInput=false;			// email input은 false
		}else{							// 이메일을 입력했다면
			isEmailInput=true;			// true를 리턴
		}
		
		setEmailState();
		
		
	});
	
	// 비밀번호를 입력할 때 실행할 함수 등록
	$("#pwd, #pwd2").on("input", function(){
		// 입력한 비밀번호를 읽어온다.
		var pwd=$("#pwd").val();
		var pwd2=$("#pwd2").val();
		
		if(pwd!=pwd2){			// 만약 두 비밀번호를 동일하게 입력하지 않았다면
			isPwdEqual=false;
		}else{
			isPwdEqual=true;
		}
			// 위의 조건문을 한줄로 표현하면 다음과 같다 (3항 연산자) : isPwdEqual = pwd != pwd2 ? false : true;
		
		if(pwd.length==0){
			isPwdInput=false;
		}else{
			isPwdInput=true;
		}
		setPwdState();
	});
		
		
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
				// 사용할 수 있는 아이디인지 검증
				if(responseData.isExist){		// 아이디가 이미 존재하는 경우 (사용 불가)
					isIdUsable=false;
				}else{
					isIdUsable=true;
				}
				// 화면에 없데이트 해주어야 하는 내용
				setIdState();
			}
		});
		
		// 아이디를 입력했는지 검증
		if(inputId.length==0){			// 만일 아이디인풋값이 0이면 (=아무것도 입력하지 않았다면)
			isIdInput=false;
		}else{
			isIdInput=true;
		}
		// 화면에 없데이트 해주어야 하는 내용 (isIdUsable에서의 내용과 같으므로 함수 만들어서 선언하는 것이 효율적이다)
		setIdState();
	});
	
	// 이메일 입력칸의 상태를 바꾸는 함수
	function setEmailState(){
		$("#email")
		.parent()
		.removeClass("has-success has-error")
		.find(".help-block, .form-control-feedback")
		.hide();			// 위에 두개를 처음에는 숨겨놓는다.
		
		// 비밀번호 입력칸의 색상과 아이콘을 바꿔주는 작업
		if(isEmailInput && !isEailMatch){ 
			$("#email")
			.parent()
			.addClass("has-error")
			.find(".glyphicon-remove")
			.show();
		}else{
			$("#email")
			.parent()
			.addClass("has-success")
			.find(".glyphicon-ok")
			.show();
		}
		// 에러가 있다면 에러 메세지 띄우기
		if(isEmailInput && !isEmailMatch){
			$("#email_notmatch").show();
		}
	}
	
	// 비밀번호 입력칸의 상태를 바꾸는 함수
	function setPwdState(){
		// 일단 UI를 초기상태로 바꾸어 준다.
		$("#pwd")
		.parent()
		.removeClass("has-success has-error")
		.find(".help-block, .form-control-feedback")
		.hide();			// 위에 두개를 처음에는 숨겨놓는다.
		
		// 비밀번호 입력칸의 색상과 아이콘을 바꿔주는 작업
		if(!isPwdEqual || !isPwdInput){ 
			// 비밀번호 입력칸이 error인 상태
			$("#pwd")
			.parent()
			.addClass("has-error")
			.find(".glyphicon-remove")
			.show();
		}else{
			// 비밀번호 입력칸이 success인 상태
			$("#pwd")
			.parent()
			.addClass("has-success")
			.find(".glyphicon-ok")
			.show();
		}
		
		// 만약 에러가 있다면 에러 메세지 띄우기
		if(!isPwdEqual){
			$("#pwd_notequal").show();
		}
		if(!isPwdInput){
			$("#pwd_required").show();
		}
	}
	
	
	// 아이디 입력칸의 상태를 바꾸는 함수 (error상태인지 success상태인지)
	function setIdState(){
		// 일단 UI를 초기상태로 바꾸어 준다.
		$("#id")
		.parent()
		.removeClass("has-success has-error")
		.find(".help-block, .form-control-feedback")
		.hide();			// 위에 두개를 처음에는 숨겨놓는다.
		
		if(!isIdUsable || !isIdInput){   // if(isIdUsable==false || isIdInput==false)와 같다
			// 아이디 입력칸이 error인 상태
			$("#id")
			.parent()
			.addClass("has-error")
			.find(".glyphicon-remove")
			.show();
		}else{
			// 아이디 입력칸이 success인 상태
			$("#id")
			.parent()
			.addClass("has-success")
			.find(".glyphicon-ok")
			.show();
		}
		
		// 만약 에러가 있다면 에러 메세지 띄우기
		if(!isIdUsable){
			$("#id_notusable").show();
		}
		if(!isIdInput){
			$("#id_required").show();
		}
	}
		

	
	
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
			alert("Please confirm email format correctly.");
			$("#email").focus();
			return false();
		}
	
	
	
	});
	
	
	

	
</script>

</body>
</html>