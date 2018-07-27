<%@page import="vo.Foodtruck_Location"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<title>foodtruck.jsp</title>

<style>
.board {
	padding-top: 10%;
}

.board .page-header {
	margin-top: 0;
}
</style>
</head>
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
	<script>
$(function(){
	$.ajax({
			method:"post",
			data:{
				foodtype:"main"
			},
			url:"<%=request.getContextPath()%>/foodtrucklist.bt",
			/* dataType:'json', */
			success:function(data){
				console.log(data);
                if(data != null) {
                   var $divObj = $('div.foodlist');
                  $divObj.html(data.trim());
                } 
	        }			
			}); 
		/* return false; */	
});
</script>
	<div class="board">
		<div class="row">
			<div class="container">
				<ol class="breadcrumb link-accent separator-arrow">
					<li><a href="<%=root%>/index.jsp" title="Home"><i
							class="fa fa-home"></i></a></li>
					<li class="active">푸드트럭 소개</li>
					<li><a href="<%=root %>/foodtruck/foodboard.jsp">푸드트럭 등록</a></li>
				</ol>
				<div class="page-header">
					<div class="row">
						<div class=col-lg-12">
							<h1 align="center">
								<b>FOOD TRUCK</b>
							</h1>
							<p align="center">
								<b>이런 푸드트럭은 어때요?</b>
							</p>
						</div>
					</div>
				</div>
				<!-- Wrapper for slides -->
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner">
						<div class="item active">
							<img src="<%=root%>/images/foodtruck1.PNG">
							<%-- <div class="carousel-caption">
								<a href="<%=root%>/foodtruck/foodtruckdetail.jsp"><h3>덕복희</h3></a>
							</div> --%>
						</div>
						<div class="item">
							<img src="<%=root%>/images/foodtruck2.PNG">
							<%-- <div class="carousel-caption">
								<a href="<%=root%>/foodtruck/foodtruckdetail.jsp"><h3>돈까쑤</h3></a>
							</div> --%>
						</div>
						<div class="item">
							<img src="<%=root%>/images/foodtruck3.PNG">
							<%-- <div class="carousel-caption">
								<a href="<%=root%>/foodtruck/foodtruckdetail.jsp"><h3>핏짜아</h3></a>
							</div> --%>
						</div>
					</div>
				</div>
				<!-- tab Header -->
				<div class="foodsearch">
					<jsp:include page="foodsearch.jsp"/>
				</div>
				<br>
				<div class="foodlist">
				</div>
			</div>
		</div>
	</div>
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