<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signup.jsp</title>
</head>
<body>
<%
	// 한글 인코딩 설정
	request.setCharacterEncoding("utf-8");

	// 이메일 주소
	String email=request.getParameter("email");
	// 비밀번호
	String pwd=request.getParameter("pwd");
	// 성별
	String gender=request.getParameter("gender");
	// 취미 (여러개 선택이므로 스트링 배열로 밸류값을 가져온다)
	// .getParameterValues() 메소드는 String[]을 리턴한다.
	// 리턴된 배열에는 선택한 checkbox의 value가 순서대로 들어있다.
	// 단, 아무것도 선택하지 않았을 때는 null이 리턴된다. (따라서 null을 대비해야 한다)
	String[] hobby=request.getParameterValues("hobby");
	// 좋아하는 것
	String like=request.getParameter("like");
	// 하고 싶은 말 (읽어온 것 : "하나\r\n두울")
	String comment=request.getParameter("comment");
	
	// 정보 출력
	System.out.println("email: "+email);
	System.out.println("prd: "+pwd);
	System.out.println("gender: "+gender);
	System.out.println("[hobby]");			// if문 돌면서 출력
		if(hobby!=null){					// 아무것도 선택하지 않으면 null이므로
			// null이 아닐때 반복문이 수행되도록 한다.
			for(String tmp:hobby){
				System.out.println(tmp);
			}
		}
	System.out.println("like: "+like);
	System.out.println("comment: "+comment);
%>

<script>
	alert("<%=email %> 님 가입 완료되었습니다!")
</script>

</body>
</html>