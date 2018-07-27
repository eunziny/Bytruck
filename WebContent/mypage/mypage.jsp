<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="vo.Users"%>
<style>
.board {
	padding-top: 10%;
}

.board .page-header {
	margin-top: 0;
}
</style>
<title>mypage.jsp</title>

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
	<%loginInfo = (String) session.getAttribute("loginInfo");
	userInfo = (String) session.getAttribute("loginInfo_type");
	Users users = (Users)request.getAttribute("users");%>

	<div class="board">
		<div class="row">
			<div class="container">
				<!-- BREADCRUMBS -->
				<ol class="breadcrumb link-accent separator-arrow">
					<li><a href="<%=root %>/index.jsp" title="Home"><i
							class="fa fa-home"></i></a></li>
					<li class="active">My page</li>
				</ol>
				<!-- END BREADCRUMBS -->
				<div class="page-header">
					<div class="row">
						<div class=col-lg-12">
							<h1 align="center">
								<b>MY PAGE</b>
							</h1>
							<p align="center">
								<b>회원님의 기본정보를 볼 수 있습니다.<br>(개인정보)</b> 
							</p>
						</div>
					</div>
				</div>
				<h4>
					<strong>내 정보</strong>
				</h4>
				<form class="form-horizontal" role="form">
					<br>
					<div class="form-group">
						<label for="username" class="control-label sr-only">아이디</label>
						<div class="col-sm-8 col-sm-offset-2">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user"></i></span>
								<text type="text" class="form-control" id="id"
									readonly="readonly"><span id="id"><%=users.getUser_id()%></span></text>
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="username" class="control-label sr-only">이름</label>
						<div class="col-sm-8 col-sm-offset-2">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user"></i></span>
								<text type="text" class="form-control" id="username"
									readonly="readonly"><span id="name"><%=users.getName()%></span></text>
							</div>
						</div>
					</div>
					<%if(userInfo.equals("TR")){ %>
					<div class="form-group">
						<label for="username" class="control-label sr-only">사업자번호</label>
						<div class="col-sm-8 col-sm-offset-2">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user"></i></span>
								<text type="text" class="form-control" id="bussiness_number" readonly="readonly">
								<span id="name"><%=users.getBussiness_number() %></span></text>
							</div>
						</div>
					</div>
					<%} %>
					<div class="form-group">
						<label for="email" class="control-label sr-only">이메일</label>
						<div class="col-sm-8 col-sm-offset-2">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-envelope"></i></span>
								<text type="email" class="form-control" id="email"
									readonly="readonly"><span id="email"><%=users.getEmail() %></span></text>

							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="birthday" class="control-label sr-only">생년월일</label>
						<div class="col-sm-8 col-sm-offset-2">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
								<text type="date" class="form-control" id="birthday"
									readonly="readonly"><span id="bitrh"><%=users.getBirthday() %></span></text>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="tel" class="control-label sr-only">전화번호</label>
						<div class="col-sm-8 col-sm-offset-2">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-phone"></i></span>
								<text type="tel" class="form-control" id="tel"
									readonly="readonly"><span id="tel"><%=users.getPhone_number()%></span></text>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-8 col-sm-offset-2">
							<a type="submit" class="btn btn-warning btn-block" href="<%=root%>/userinfoupdatedetail.bt?id=<%=users.getUser_id()%>">수정</a>
						</div>
					</div>
					<br>
				</form>
			</div>
		</div>
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
</body>
</html>