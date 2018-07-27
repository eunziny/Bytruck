<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%String root = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="favicon.ico">
<link
   href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css"
   rel="stylesheet" id="bootstrap-css">
<link
   href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css"
   rel="stylesheet">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="<%=root %>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=root %>/css/carousel.css" rel="stylesheet">
<link href="<%=root %>/css/main-one-page.css" rel="stylesheet" type="text/css">
<link href="<%=root %>/css/bootstrap.css" rel="stylesheet" type="text/css">
<script
   src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="<%=root %>/js/ie-emulation-modes-warning.js"></script>
<%-- <script src="<%=root %>/js/bootstrap.min.js"></script> --%>
<script src="<%=root %>/js/docs.min.js"></script>
<script src="<%=root %>/js/ie10-viewport-bug-workaround.js"></script>
</head>
<body>
<div class="navbar-wrapper">
	<div class="container">

		<nav class="navbar navbar-inverse navbar-static-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar" aria-expanded="false"
						aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="<%=root %>/index.jsp">BYTRUCK</a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false">BRAND
								<span class="caret"></span>
						</a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="<%=root %>/brand/summary.jsp">개요</a></li>
								<li><a href="<%=root %>/brand/notice.jsp">공지사항</a></li>

							</ul></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false">COURCE<span
								class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
						<li><a href="<%=request.getContextPath()%>/courselist.bt">코스소개</a></li>
						<li><a href="<%=request.getContextPath()%>/course/coursemakedetail.jsp">코스짜기</a></li>
						<li><a href="<%=request.getContextPath()%>/course/reviewboard.jsp">코스후기</a></li>
							</ul></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false">FOODTRUCK<span
								class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="<%=root%>/foodtruck/foodtruck.jsp">푸드트럭 소개</a></li>
							</ul></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false">EVENT<span
								class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="<%=root %>/event/event.jsp">이벤트</a></li>
								<%String userInfo = (String) session.getAttribute("loginInfo_type");
								if(userInfo==null) userInfo="X";
								if(userInfo.equals("TR")){ %>
								<li><a href="<%=root%>/adboard/normal_ad.jsp">배너광고신청</a></li>
								<%}%>
							</ul></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false">BOARD<span
								class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="<%=root%>/board/qna.jsp">Q&A</a></li>
								<li><a href="<%=root%>/board/faq.jsp">FAQ</a></li>
								<li><a href="<%=root%>/chatting/chat.jsp">타임라인</a></li>
							</ul></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
							<%String loginInfo = (String) session.getAttribute("loginInfo");
							if (loginInfo == null) {//로그인 안했을 때%>
							<li id="nav-signup-btn"><a
								href="<%=root%>/base/signupcover.jsp">SignUp</a></li>
							<li class='login' id="nav-login-btn"><a
								href="<%=root%>/base/loginform.jsp">Login</a></li>
							<%} else {//로그인 했을 때
							userInfo = (String) session.getAttribute("loginInfo_type");
							if (userInfo.equals("AD")) {//관리자분류번호%>
							<li class="admin"><a href="<%=root%>/admin/admin_main.jsp">ADMIN</a></li>
							<li class='logout' id="nav-logout-btn"><a
								href="<%=root%>/logout.bt">Logout</a></li>
							<%} else if(userInfo.equals("TR")){//사업자분류번호%>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-expanded="false">Mypage<span
									class="caret"></span>
							</a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="<%=root %>/userInfoview.bt?id=<%=loginInfo%>&type=<%=userInfo%>">마이페이지(개인정보)</a></li>
									<li><a href="<%=root %>/userinfoviewbusi.bt?id=<%=loginInfo%>">마이페이지(푸드트럭)</a></li>
									<li><a href="<%=root %>/mypage/bye.jsp">탈퇴</a></li>
								</ul></li>
							<li class='logout' id="nav-logout-btn"><a
								href="<%=root%>/logout.bt">Logout</a></li>
							<%}else if(userInfo.equals("BK")){//일반회원일 때%>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false">Mypage<span
								class="caret"></span>
						</a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="<%=root %>/userInfoview.bt?id=<%=loginInfo%>">마이페이지</a></li>
								<li><a href="<%=root %>/mypage/bye.jsp">탈퇴</a></li>
							</ul></li>
							<li class='logout' id="nav-logout-btn"><a
								href="<%=root%>/logout.bt">Logout</a></li>
							<%}}%>
						</ul>
				</div>
			</div>
		</nav>
	</div>
</div>