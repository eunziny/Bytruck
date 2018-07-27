<%@page import="vo.Event"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<title>eventdetail.jsp</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<%
	Event event = (Event) request.getAttribute("event");
	String imgpath = event.getImgpath();

	if (imgpath != null) {
		int lastIndex = imgpath.lastIndexOf("\\");
		imgpath = imgpath.substring(lastIndex + 1);
	}
%>
<style>
.board {
	padding-top: 10%;
}

.board .page-header {
	margin-top: 0;
}

a:hover {
	background-color: pink;
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
	<div class="board">
		<div class="row">
			<div class="container">
				<!-- BREADCRUMBS -->
				<ol class="breadcrumb link-accent separator-arrow">
					<li><a href="<%=root%>/index.jsp" title="Home"><i
							class="fa fa-home"></i></a></li>
					<li><a href="<%=root%>/event/event.jsp">이벤트 소개</a></li>
					<li><a href="<%=root%>/adboard/normal_ad.jsp">배너광고 신청</a></li>
				</ol>
				<br>
				<!-- END BREADCRUMBS -->
				<!-- BASIC INPUT -->
				<div class="page-header">
					<div class="row">
						<div class=col-lg-12>
							<h1 align="center">
								<b>EVENT</b>
							</h1>
							<p align="center">
								<b>EVENT를 자세히 살펴보세요.</b>
							</p>
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h2 class="panel-title section-heading no-margin">
							이벤트 제목 ▶
							<%=event.getTitle()%></h2>
					</div>
					<div class="panel-heading">
						<h2 class="panel-title section-heading no-margin">
							이벤트 기간 ▶
							<%=event.getEvent_date()%></h2>
					</div>
					<div class="panel-body">
						<div class="form-horizontal">
							<div class="form-group">
								<div class="col-md-12" align="center">
									<p>
										<img src="<%=root%>/upload/<%=imgpath%>" class="img-rounded"
											alt="NO IMAGE" height="300" width="300"></img>
									</p>
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-12" align="center">
									<p><%=event.getDetail()%></p>
								</div>
							</div>
						</div>
						<div class="button-group col-lg-offset-4 col-lg-4 col-lg-offset-4"
							align="center">
							<a class="btn btn-success" id="register"
								href="<%=root%>/event/event.jsp">목록</a>
							<%
								loginInfo = (String) session.getAttribute("loginInfo");//ID
								if (loginInfo == null)
									loginInfo = "X";
								if (loginInfo.equals(event.getUser_id())) {
							%>
							<a class="btn btn-warning" id="modify"
								href="<%=root%>/eventupdatedetail.bt?num=<%=event.getNo()%>">수정</a>
							<%
								}
							%>
						</div>
					</div>
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