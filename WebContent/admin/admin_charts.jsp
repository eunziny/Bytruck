<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String root = request.getContextPath();
%>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
<script src="<%=root%>/js/Chart.min.js"></script>
<script src="<%= root%>/js/bootstrap.min.js"></script>
</head>
<style>
body {
	padding-top: 5%;
}

#bo-container.container {
	padding-left: 90px;
	width: 60%;
	float: center; 
}

#title, .mem, .likes, .profit {
	margin-bottom: 5%;
	padding-botton: 10%;
}
</style>
	<div class="aside">
		<jsp:include page="/template/admin_aside.jsp" />
	</div>
	<div class="container" id="bo-container">
		<div class="row">
			<div class="col-lg-offset-2 col-lg-8 col-lg-offset-2" id = "title">
			<h1>CHART</h1>
			</div>
		</div>
		<div class="row">
			<div class="mem">
					<h4 class="card-title">회원 수</h4>
					<jsp:include page="/admin/memChart.jsp"/>
			</div>
		</div>	
		<div class="row">
			<div class="likes">
				<div class="card-block">
					<h4 class="card-title">좋아요 순위</h4>
					<jsp:include page="/admin/likeChart.jsp"/>
				</div>
			</div>
		</div>
	</div>
</html>