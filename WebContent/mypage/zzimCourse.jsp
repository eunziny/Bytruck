<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.board {
	padding-top: 10%;
}

.board .page-header {
	margin-top: 0;
}
</style>
<title>zzimCourse.jsp</title>
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
	<div class="board">
		<div class="row">
			<div class="container">
				<!-- BREADCRUMBS -->
				<ol class="breadcrumb link-accent separator-arrow">
					<li><a href="<%=root %>/index.jsp" title="Home"><i
							class="fa fa-home"></i></a></li>
					<li><a href="<%=root %>/mypage/mypage.jsp" title="Home">My
							page</a></li>
					<li class="active">관심 코스</li>
				</ol>
				<!-- END BREADCRUMBS -->
				<div class="page-header">
					<div class="row">
						<div class=col-lg-12">
							<h1 align="center">
								<b>관심 코스</b>
							</h1>
							<p align="center">
								<b>내가 찜한 코스목록을 볼 수 있습니다.</b>
							</p>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-4">
						<div class="product-item">
							<a href="#"><img src="<%=root%>/images/top1.png" class="img-rounded"
								alt="Product Item" height="220" width="220"></a>
							<div class="info">
								<h4 class="title">
									<a href="#" title="Colorful Abstract Cushion">제주도 꽃길2박3일</a> <img
										src="<%=root%>/images/good.jpg" height="20" width="20"> <label>31</label>
								</h4>
							</div>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="product-item">
							<a href="#"><img src="<%=root%>/images/top2.jpg" class="img-rounded"
								alt="Product Item" height="220" width="220"></a>
							<div class="info">
								<h4 class="title">
									<a href="single-product-page.html" title="Reading Table Sets">경복궁길</a>
									<img src="<%=root%>/images/good.jpg" height="20" width="20"> <label>27</label>
								</h4>

							</div>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="product-item">
							<a href="#"><img src="<%=root%>/images/top3.jpg" class="img-rounded"
								alt="Product Item" height="220" width="220"></a>
							<div class="info">
								<h4 class="title">
									<a href="single-product-page.html" title="Wooden Working Desk">단풍길</a>
									<img src="<%=root%>/images/good.jpg" height="20" width="20"> <label>23</label>
								</h4>

							</div>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="product-item">
							<a href="#"><img src="<%=root%>/images/top3.jpg" class="img-rounded"
								alt="Product Item" height="220" width="220"></a>
							<div class="info">
								<h4 class="title">
									<a href="single-product-page.html" title="Elegant Sofa (White)">설악산어딘가</a>
									<img src="<%=root%>/images/good.jpg" height="20" width="20"> <label>19</label>
								</h4>

							</div>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="product-item">
							<a href="#"><img src="<%=root%>/images/top1.png" class="img-rounded"
								alt="Product Item" height="220" width="220"></a>
							<div class="info">
								<h4 class="title">
									<a href="single-product-page.html" title="Elegant Sofa (White)">외국느낌가는곳1</a>
									<img src="<%=root%>/images/good.jpg" height="20" width="20"> <label>16</label>
								</h4>
							</div>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="product-item">
							<a href="#"><img src="<%=root%>/images/top1.png" class="img-rounded"
								alt="Product Item" height="220" width="220"></a>
							<div class="info">
								<h4 class="title">
									<a href="single-product-page.html" title="Elegant Sofa (White)">외국느낌가는곳2</a>
									<img src="<%=root%>/images/good.jpg" height="20" width="20"> <label>14</label>
								</h4>
							</div>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="product-item">
							<a href="#"><img src="<%=root%>/images/top2.jpg" class="img-rounded"
								alt="Product Item" height="220" width="220"></a>
							<div class="info">
								<h4 class="title">
									<a href="single-product-page.html" title="Elegant Sofa (White)">자전거여행대표코스</a>
									<img src="<%=root%>/images/good.jpg" height="20" width="20"> <label>9</label>
								</h4>
							</div>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="product-item">
							<a href="#"><img src="<%=root%>/images/top3.jpg" class="img-rounded"
								alt="Product Item" height="220" width="220"></a>
							<div class="info">
								<h4 class="title">
									<a href="single-product-page.html" title="Elegant Sofa (White)">단풍놀이행사코스</a>
									<img src="<%=root%>/images/good.jpg" height="20" width="20"> <label>3</label>
								</h4>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br>
		<div class="text-center">
			<ul class="pagination">
				<li class="active"><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
			</ul>
		</div>
		<!-- END MAIN -->
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
	</div>
	<!-- /.container -->
</body>
</html>