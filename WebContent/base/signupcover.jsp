<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>signupcover.jsp</title>
</head>
<style>
.board {
	padding-top: 0;
}

.board .page-header {
	margin-top: 0;
}
</style>
<body>
	<div class="row">
		<div class="container-fluid">
			<div class="col-lg-12">
				<header>
					<%@include file="/template/header.jsp"%>
				</header>
			</div>
		</div>
	</div>
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img src="<%=root%>/images/main_illu.jpg" alt="First slide">
				<div class="container"></div>
			</div>
			<div class="item">
				<img src="<%=root%>/images/main_bike.jpg" alt="Second slide">
				<div class="container"></div>
			</div>
			<div class="item">
				<img src="<%=root%>/images/main_truck.jpg" alt="Third slide">
				<div class="container"></div>
			</div>
		</div>
		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"
			style="top: 50%; margin-top: -25px; background: none"> <span
			class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"
			style="top: 50%; margin-top: -25px; background: none"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	<!-- /.carousel -->
	<!-- MAIN -->
	<div class="board">
		<div class="row">
			<div class="container">
				<!-- BREADCRUMBS -->
				<ol class="breadcrumb link-accent separator-arrow">
					<li><a href="<%=root%>/index.jsp" title="Home"><i
							class="fa fa-home"></i></a></li>
					<li class="active">회원가입</li>
				</ol>
				<section id="portfolio">
					<div class="container">
						<div class="page-header">
							<div class="row">
								<div class=col-lg-12">
									<h1 align="center">
										<b>BYTRUCK 회원가입</b>
									</h1>
									<p align="center">
										<b>회원 가입 후 바이트럭의 다양한 서비스를 만나보세요.</b>
									</p>
								</div>
							</div>
						</div>
						<div class="portfolio-static">
							<div class="row">
							<div class="col-lg-12">
								<div class="col-lg-offset-2 col-lg-2 col-lg-offset-2">
									<div class="portfolio-item">
										<div class="overlay"></div>
										<div class="info">
											<h4 class="title">일반 회원</h4>
											<p class="brief-description">여행자용 회원가입</p>
											<a href="<%=root%>/base/signup.jsp" class="btn">일반회원용
												회원가입</a>
										</div>
										<div class="media-wrapper" align="middle">
											<img src="<%=root%>/images/customer1.gif" alt="" />
										</div>
									</div>
								</div>
								<div class="col-lg-offset-2 col-lg-2 col-lg-offset-2">
									<div class="portfolio-item">
										<div class="overlay"></div>
										<div class="info">
											<h4 class="title">사업자 회원</h4>
											<p class="brief-description">사업자(푸드트럭)용 회원가입입니다.</p>
											<a href="<%=root%>/base/signup21.jsp" class="btn">사업자용
												회원가입</a>
										</div>
										<div class="media-wrapper" align="middle">
											<img src="<%=root%>/images/customer2.gif" alt="" />
										</div>
									</div>
								</div>
								</div>
							</div>
						</div>
						<!-- END MAIN -->
					</div>
				</section>
			</div>
		</div>
	</div>
	<!-- /.container -->
	<!-- FOOTER -->
	<div class="foot">
		<div class="row">
			<div class="container-fluid">
				<div class="col-lg-12">
					<footer>
						<%@include file="/template/footer.jsp"%>
					</footer>
				</div>
			</div>
		</div>
	</div>
</body>
</html>