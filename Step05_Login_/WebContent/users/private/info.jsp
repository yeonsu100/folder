<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 1. 세션에서 로그인된 아이디의 정보를 얻어온다.
	String id=(String)session.getAttribute("id");

	// 2. DB에서 해당 아이디의 정보를 얻어온다.
	UsersDto dto=UsersDao.getInstance().getData(id);
	
	// 3. 개인 정보를 응답해준다.
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/info.jsp</title>	<!-- 유저의 가입한 정보 출력 -->
<jsp:include page="../../include/resource.jsp"></jsp:include>

<style>
	h1{color:#6D96F3;}
	
	body {
	  padding-top: 40px;
	  padding-bottom: 40px;
	  background-color: #F0F5FF;
	}
	/* 프로필 이미지가 가로 세로 50px인 원형으로 표시될 수 있도록 */
	#profileLink img{
		width: 50px;
		height: 50px;
		border-radius: 50%;
	}
	#profileForm{
		display: none;
	}
</style>
</head>

<body>
<div class="container">
	<h1>Member Information Page</h1>
	<table>
		<tr>
			<th>ID</th>
			<td><%=dto.getId() %></td>
		</tr>
		<tr>
			<th>Profile Image</th>
			<td>
				<a href="javascript:" id="profileLink">
					<!-- 만약 이미지를 저장하지 않았다면 (null)인 경우, 기본 이미지 출력 -->
					<%if(dto.getProfile()==null){ %>
						<img src="${pageContext.request.contextPath }/resources/images/default_user.jpeg"/>
					<%}else{ %>
						<img src="${pageContext.request.contextPath }<%=dto.getProfile() %>"/>
					<%} %>
				</a>
			</td>
		</tr>
		<tr>
			<th>Password</th>
			<td><a href="pwd_updateform.jsp">Revise</a></td>
		</tr>
		<tr>
			<th>E-mail</th>
			<td><%=dto.getEmail() %></td>
		</tr>
		<tr>
			<th>Joined Date</th>
			<td><%=dto.getRegdate() %></td>
		</tr>
	</table>
	<button class="btn btn-md btn-info" ><a href="updateform.jsp">Update Information</a></button>
	<button class="btn btn-md btn-warning" ><a href="javascript:deleteConfirm()">Remove Account</a></button>
</div>

<form action="profile_upload.jsp" method="post" enctype="multipart/form-data" id="profileForm">
	<label for="profileImage">Select an image for profile</label>
	<input type="file" name="profileImage" id="profileImage" accept=".jpg, .jpeg, .png, .JPG, .JPEG" />
</form>

<%-- jquery form 플러그인 javascript 로딩 --%>
<script src="${pageContext.request.contextPath }/resources/js/jquery.form.min.js"></script>

<script>
	// 프로필 이미지를 클릭하면
	$("#profileLink").click(function(){
		// 강제로 <input type="file"/>을 클릭해서 파일 선택창을 띄우고
		$("#profileImage").click();
	});
	// input type="file"에 파일이 선택되면
	$("#profileImage").on("change", function(){
		// 폼을 강제 제출하고
		$("#profileForm").submit();
	});
	
	// jquery form 플러그인의 동작을 이용해서 폼이 ajax로 제출되도록 한다. 
	// * ajax : 페이지 이동(페이지 전환) 없이 비동기로 파일이 전송되도록함
	// 만약 실시간 응답이 필요없으면 $("#profileForm").ajaxForm(); 까지만 작성해도 무방하다.
	$("#profileForm").ajaxForm(function(responseData){
		// responseData 는 plain object 이다.
		// {savedPath:"/upload/저장된이미지파일명"}
		// savedPath 라는 방에 저장된 이미지의 경로가 들어 있다.
		console.log(responseData);
		var src="${pageContext.request.contextPath }"+responseData.savedPath;
		// img 의 src 속성에 반영함으로써 이미지가 업데이트 되도록 한다.
		$("#profileLink img").attr("src", src);
	});

	function deleteConfirm(){
		var isDelete=confirm("<%=id%>, Are you sure delete this account?");
		if(isDelete){
			location.href="delete.jsp";
		}
	}
	
</script>
</body>
</html>