<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 업로드 설정
	final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;   // 3MB
	final int MAX_FILE_SIZE      = 1024 * 1024 * 40;  // 40MB (최대 파일 사이즈를 지정하지 않으면 서버에 용량이 차기때문에 반드시 지정해야 한다)
	final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50;  // 50MB
	
	// request 객체를 이용해서 실제로 업로드한 파일이 있는지 체크 한다.
	if (!ServletFileUpload.isMultipartContent(request)) {
		// 만약 첨부한 파일이 없다면 처리하지 않겠다는 에러페이지가 응답되면서
	    response.sendError(HttpServletResponse.SC_NO_CONTENT,
	    		"You didn't attach any file.");
	    return; // 메소드 끝내기
	}
	
	// configures upload settings
	DiskFileItemFactory factory = new DiskFileItemFactory();
	// sets memory threshold - beyond which files are stored in disk
	factory.setSizeThreshold(MEMORY_THRESHOLD);
	// sets temporary location to store files
	factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
	ServletFileUpload upload = new ServletFileUpload(factory);
	// sets maximum size of upload file
	upload.setFileSizeMax(MAX_FILE_SIZE);
	// sets maximum size of request (include file + form data)
	upload.setSizeMax(MAX_REQUEST_SIZE);
	
	// 업로드된 파일을 저장할 절대경로 (서버의 파일시스템에서의) 얻어오기
	String uploadPath=application.getRealPath("/upload");
	System.out.println("Path of file saved: "+uploadPath);
	// 전송된 파라미터의 한글 인코딩 설정
	upload.setHeaderEncoding("utf-8");
	
	// 작업 성공여부를 저장할 지역변수
	boolean isSuccess=false;
	// 파일의 정보를 담을 FileDto 객체 생성
	FileDto dto=new FileDto();
	try{
		List<FileItem> formItems=upload.parseRequest(request);
		if(formItems != null && formItems.size()>0){
			// 반복문을 돌면서 전송된 아이템을 불러온다.
			for(FileItem item:formItems){
				if(!item.isFormField()){		// input type="file"로 전송된 파일이라면
					// 원본 파일명과
					String orgFileName=new File(item.getName()).getName();
					// 파일의 사이즈를 얻어내	
					long fileSize=item.getSize();
					// 저장할 파일명을 겹치지않게 지정한다.
					// (예를들면 원본 파일명이 winnie.png라고 할 때 이 앞에 숫자를 붙여 1283278490653winnie.png으로 저장됨)
					String saveFileName=System.currentTimeMillis()+orgFileName;
					// 파일 시스템에 저장할 전체 경로를 구성한다.
					String filePath=uploadPath+File.separator+saveFileName;
					// 파일을 위의 경로에 실제로 저장한다.
					File storeFile=new File(filePath);
					item.write(storeFile);
					// FileDto 에 정보 담기
					dto.setOrgFileName(orgFileName);
					dto.setSaveFileName(saveFileName);
					dto.setFileSize(fileSize);
					
				}else{		// input type="file"이 아닌 일반 input 요소라면 (예를들면 text같은) (title)
					if(item.getFieldName().equals("title")){
						// 제목 읽어오기
						String title=item.getString("utf-8");
						// FileDto에 제목 담기
						dto.setTitle(title);
					}
				}	// if
			}	// for
			// 작성자
			String id=(String)session.getAttribute("id");
			dto.setWriter(id);
			// DB에 파일정보 저장하기
			isSuccess=FileDao.getInstance().insert(dto);
		}	// if()
	}catch(Exception e){
		// 예외가 발생하면 에러 페이지를 응답한다.
		response.sendError(500,e.getMessage());
		return;
	}
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/private/upload.jsp</title>
<jsp:include page="../../include/resource.jsp"></jsp:include>
</head>
<body>

<div class="container">
	<h1>Alert</h1>
	<%if(isSuccess){ %>
		<p class="alert alert-success">
			Successfully Saved file!</br>
			File name : <strong><%=dto.getOrgFileName() %></strong>
		<a class="alert-link" href="../list.jsp">Show File list</a>
		</p>
	<%}else{ %>
		<p class="alert alert-danger">Failure to save!</br>
			<a class="alert-link" href="upload_form.jsp">Try it again.</a>
		</p>
	<%} %>
</div>

</body>
</html>