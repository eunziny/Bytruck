<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="vo.Foodtruck"%>
<style>
.board {
	padding-top: 10%;
}

.board .page-header {
	margin-top: 0;
}
</style>
<title>mypageBussiness.jsp</title>
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
	<%
		loginInfo = (String) session.getAttribute("loginInfo");
		Foodtruck ft = (Foodtruck) request.getAttribute("foodtruck");
	%>
	<div class="board">
		<div class="row">
			<div class="container">
				<!-- BREADCRUMBS -->
				<ol class="breadcrumb link-accent separator-arrow">
					<li><a href="<%=root%>/index.jsp" title="Home"><i
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
								<b>회원님의 기본정보를 볼 수 있습니다.<br>(푸드트럭정보)
								</b>
							</p>
						</div>
					</div>
				</div>
				<!-- 푸드트럭 정보 영역 -->
				<h4>
					<strong>푸드트럭 정보</strong>
				</h4>
				<form class="form-horizontal" role="form">
					<br>
					<div class="form-group">
						<label for="storename" class="control-label sr-only">상호명</label>
						<div class="col-sm-8 col-sm-offset-2">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-group"></i></span>
								<text class="form-control" id="storename" readonly="readonly"><%=ft.getBussiness_name()%></text>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="ptype" class="control-label sr-only">상품종류</label>
						<div class="col-sm-8 col-sm-offset-2">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-cloud"></i></span>
								<text class="form-control" id="menu" readonly="readonly"><%=ft.getMenu_type()%></text>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="product" class="control-label sr-only">대표상품명</label>
						<div class="col-sm-8 col-sm-offset-2">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-bullhorn"></i></span>
								<text type="text" class="form-control" id="product"
									readonly="readonly"> <%=ft.getMenu_name()%></text>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="price" class="control-label sr-only">상품가격</label>
						<div class="col-sm-8 col-sm-offset-2">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-barcode"></i></span>
								<text type="number" class="form-control" id="price"
									readonly="readonly"><%=ft.getPrice()%></text>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="detail" class="control-label sr-only">상세설명</label>
						<div class="col-sm-8 col-sm-offset-2">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-edit"></i></span>
								<textarea type="text" class="form-control" id="detail"
									readonly="readonly"
									placeholder="푸드트럭의 간단한 소개말이나 상세 메뉴 설명을 기입해주세요."><%=ft.getDetail()%></textarea>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-8 col-sm-offset-2">
							<a type="submit" class="btn btn-warning btn-block"
								href="<%=root%>/userbusiinfoupdatedetail.bt?id=<%=ft.getUser_id()%>">수정</a>
						</div>
					</div>
					<br>
				</form>
			</div>
		</div>
		<!-- 푸드트럭 정보 영역 -->
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
	<!-- /.container -->
</body>
</html>