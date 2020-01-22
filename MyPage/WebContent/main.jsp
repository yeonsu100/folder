<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<title>Main Page</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/step03_custom.css" />
	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
	<style>
		body{padding-top: 80px;}
	
	</style>
</head>

<body>
<jsp:include page="include/navbar.jsp"></jsp:include>

<div class="container">
	<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="5000">
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
			<li data-target="#myCarousel" data-slide-to="3"></li>
			<li data-target="#myCarousel" data-slide-to="4"></li>
			<li data-target="#myCarousel" data-slide-to="5"></li>
			<li data-target="#myCarousel" data-slide-to="6"></li>
			<li data-target="#myCarousel" data-slide-to="7"></li>
			<li data-target="#myCarousel" data-slide-to="8"></li>
		</ol>
		<div class="carousel-inner">
			<div class="item active">
				<img src="resources/images/basic_castle.jpg"/>
				<div class="carousel-caption"></div>
			</div>
			<div class="item">
				<img src="resources/images/night.jpg"/>
				<div class="carousel-caption"></div>
			</div>
			<div class="item">
				<img src="resources/images/grass_park.jpg"/>
				<div class="carousel-caption"></div>
			</div>
			<div class="item">
				<img src="resources/images/untitled.png"/>
				<div class="carousel-caption"></div>
			</div>
			<div class="item">
				<img src="resources/images/dayCastle.jpg"/>
				<div class="carousel-caption"></div>
			</div>
			<div class="item">
				<img src="resources/images/firewalk.jpg"/>
				<div class="carousel-caption"></div>
			</div>
			<div class="item">
				<img src="resources/images/halloween_mickey.jpg"/>
				<div class="carousel-caption"></div>
			</div>
			<div class="item">
				<img src="resources/images/christmas_street.jpg"/>
				<div class="carousel-caption"></div>
			</div>
			<div class="item">
				<img src="resources/images/mickey_candle.jpg"/>
				<div class="carousel-caption"></div>
			</div>
		</div>
		<!-- 이전, 다음 control UI -->
		<a href="#myCarousel" class="left carousel-control" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left"></span>
			<span class="sr-only">Prev</span>
		</a>
		<a href="#myCarousel" class="right carousel-control" data-slide="next">
			<span class="glyphicon glyphicon-chevron-right"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>	</br></br></br>
</div>

<jsp:include page="include/ysfooter.jsp"></jsp:include>	
</body>

</html>