<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<title>Schedule</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/step03_custom.css" />
	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
	<style>
		body{
			position: relative;}
		embed{margin:0px 0px 10px;}
		/* scroll 을 감시할 요소의 position 속성의 value 를 relative 라고 지정한다. 
		.spacer{
			width: 1024;
			height: 772px;
		}
		 */
		#navbar-example{
			position: fixed;
			top: 50;
			left: 0;
			right: 0;
			background-color: #C0DAFF;
			opacity: 0.8;
		}
		h1{padding-top: 50px;
			color : #6799FF;
		}
		h4{color : #3162C7;}

	</style>	
</head>
<!-- scroll 을 감시할 요소에 data-xxx 속성을 추가한다.  -->
<body data-target="#navbar-example" data-spy="scroll" data-offset="60">
<jsp:include page="../include/navbar.jsp"></jsp:include>

<div id="navbar-example">
	<!-- ul 에 nav 클래스 추가 -->
	<ul id="myNav" class="nav nav-pills">
		<li class="active"><a href="#one">JANUARY</a></li>
		<li><a href="#two">FEBRUARY</a></li>
		<li><a href="#three">MARCH</a></li>
		<li><a href="#four">APRIL</a></li>
		<li><a href="#five">MAY</a></li>
		<li><a href="#six">JUNE</a></li>
		<li><a href="#seven">JULY</a></li>
		<li><a href="#eight">AUGUST</a></li>
		<li><a href="#nine">SEPTEMBER</a></li>
		<li><a href="#ten">OCTOBER</a></li>
		<li><a href="#eleven">NOVEMBER</a></li>
		<li><a href="#twelve">DECEMBER</a></li>
	</ul>	
</div>
<div class="container">
	<h1>Monthly Schedule of Winnie World</h1>
	<h4>Please check our FABULOUS SPECIAL EVENTS - PARADE, FIREWALK, MUSICAL SHOW and so on! </h4> </br></br>
	
	<div id="one"> 
		JANUARY</br>
		<img src="${pageContext.request.contextPath }/resources/images/jan_schedule.jpg" />
		<div class="spacer" ></div>
	</div>
	<div id="two">
		FEBRUARY</br>
		<img src="${pageContext.request.contextPath }/resources/images/feb_schedule.jpg" />
		<div class="spacer"></div>
	</div>
	<div id="three">
		MARCH</br>
		<img src="${pageContext.request.contextPath }/resources/images/mar_schedule.jpg" />
		<div class="spacer"></div>
	</div>
	<div id="four">
		APRIL</br>
		<img src="${pageContext.request.contextPath }/resources/images/apr_schedule.jpg" />
		<div class="spacer"></div>
	</div>
	<div id="five">
		MAY</br>
		<img src="${pageContext.request.contextPath }/resources/images/may_schedule.jpg" />
		<div class="spacer"></div>
	</div>
	<div id="six">
		JUNE</br>
		<img src="${pageContext.request.contextPath }/resources/images/june_schedule.jpg" />
		<div class="spacer"></div>
	</div>
	<div id="seven">
		JULY</br>
		<img src="${pageContext.request.contextPath }/resources/images/july_schedule.jpg" />
		<div class="spacer"></div>
	</div>
	<div id="eight">
		AUGUST</br>
		<img src="${pageContext.request.contextPath }/resources/images/august_schedule.jpg" />
		<div class="spacer"></div>
	</div>
	<div id="nine">
		SEPTEMBER</br>
		<img src="${pageContext.request.contextPath }/resources/images/sep_schedule.jpg" />
		<div class="spacer"></div>
	</div>
	<div id="ten">
		OCTOBER</br>
		<img src="${pageContext.request.contextPath }/resources/images/oct_schedule.jpg" />
		<div class="spacer"></div>
	</div>
	<div id="eleven">
		NOVEMBER</br>
		<img src="${pageContext.request.contextPath }/resources/images/nov_schedule.jpg" />
		<div class="spacer"></div>
	</div>
	<div id="twelve">
		DECEMBER</br>
		<img src="${pageContext.request.contextPath }/resources/images/dec_schedule.jpg" />
		<div class="spacer"></div>
	</div>
</div>
<script src="js/jquery-3.3.1.js"></script>
<script src="js/bootstrap.js"></script>	
<script src="js/jquery.smooth-scroll.js"></script>
<script>
	$("#myNav a").smoothScroll({
		offset:-60
	});
</script>

<jsp:include page="../include/ysfooter.jsp"></jsp:include>	
<embed src="${pageContext.request.contextPath }/resources/music/parade.mp3" loop="true" autoplay="true" align="bottom" ></embed>

</body>
</html>