<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<title>Gallery</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/step03_custom.css" />
	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
</head>
<body>
<jsp:include page="../include/navbar.jsp"></jsp:include>

<div class="container">
	<h1>Error!</h1>
	<button id="showBtn" class="btn btn-primary">Sorry!</button></br></br></br></br></br></br></br></br>
	<%-- 
	<button class="btn btn-info"
	data-toggle="modal"
	data-target="#myModal">2</button>
	--%>
</div>

<div class="modal fade" id="myModal">
	<!-- modal-lg  | default | modal-sm -->	
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span>&times;</span><span class="sr-only">Close this message</span></button>
        <h4 class="modal-title">Sorry for error!</h4>
      </div>
      <div class="modal-body">
        <p>This page is NOT available yet.<br>We will prepare it as soon as possible.<br>Thank you for your understanding!</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<script src="js/jquery-3.3.1.js"></script>
<script src="js/bootstrap.js"></script>	
<script>
	$("#showBtn").click(function(){
		$("#myModal").modal("show");
	});

	/*
		Modal 에서 발생하는 이벤트 명

		1. "show.bs.modal"
		2. "shown.bs.modal"
		3. "hide.bs.modal"
		4. "hidden.bs.modal" 
	*/

	//모달이 완전히 보여 졌을때 실행할 함수 등록 
	$("#myModal").on("shown.bs.modal", function(){});
	//모달이 완전히 숨겨 졌을때 실행할 함수 등록 
	$("#myModal").on("hidden.bs.modal", function(){});	
</script>
<jsp:include page="../include/ysfooter.jsp"></jsp:include>	
</body>
</html>