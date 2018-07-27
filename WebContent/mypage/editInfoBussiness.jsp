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
<title>editInfoBussiness.jsp</title>
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
	<script>
		$(function() {
			$('a#modifyok').click(function(){
				$.ajax({
					url : '<%=root%>/userbusiinfoupdate.bt',
					method : 'post',
					data : $('form#form2').serialize(),
					success : function(data) {
						data = data.trim();
						if (data == 1) { //수정 성공
							alert('개인정보수정 성공');
						location.href="<%=root%>/userinfoviewbusi.bt?id=<%=loginInfo%>";
						} else if (data == -1) { //수정 실패
							alert('개인정보수정 실패');
						}
					}
				});
			});
		});
	</script>
	<div class="board">
		<div class="row">
			<div class="container">
				<!-- BREADCRUMBS -->
				<ol class="breadcrumb link-accent separator-arrow">
					<li><a href="<%=root%>/index.jsp" title="Home"><i
							class="fa fa-home"></i></a></li>
					<li><a href="<%=root%>/mypage/mypage_bussiness.jsp"
						title="Home">My page</a></li>
					<li class="active">회원 정보 수정</li>
				</ol>
				<!-- END BREADCRUMBS -->
				<div class="page-header">
					<div class="row">
						<div class=col-lg-12">
							<h1 align="center">
								<b>회원 정보 수정</b>
							</h1>
							<p align="center">
								<b>회원님의 정보를 수정하실 수 있습니다.<br>(푸드트럭정보)
								</b>
							</p>
						</div>
					</div>
				</div>
				<div class="section section_find">
					<br> <br>
					<!-- 푸드트럭 정보 영역 -->
					<div id="div_foodtruck" class="box_inn jumbotron">
						<div class="box_inn_sub">
							<form class="form-horizontal" id="form2">
								<div class="form-group">
									<label for="storename" class="control-label sr-only">상호명</label>
									<div class="col-sm-8 col-sm-offset-2">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-group"></i></span>
											<input type="text" class="form-control" id="storename" name="storename" value="<%=ft.getBussiness_name()%>">
										</div>
									</div>
								</div>
								<div class="form-group">
								<label for="ptype" class="control-label sr-only">상품종류</label>
								<div class="col-sm-8 col-sm-offset-2">
									<div class="input-group">
										<span class="input-group-addon"><i class="fa fa-cloud"></i></span>
										<select class="form-control" name="ptype" value="<%=ft.getMenu_type()%>">
											<option value="main" name="main">main</option>
											<option value="desert" name="desert">desert</option>
											<option value="drink" name="drink">drink</option>
										</select>
									</div>
								</div>
							</div>
								<div class="form-group">
									<label for="product" class="control-label sr-only">대표상품명</label>
									<div class="col-sm-8 col-sm-offset-2">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa fa-bullhorn"></i></span> <input type="text"
												class="form-control" id="product" name="product" placeholder="덕복희" value="<%=ft.getMenu_name()%>"
												>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="price" class="control-label sr-only">상품가격</label>
									<div class="col-sm-8 col-sm-offset-2">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa fa-barcode"></i></span> <input type="number"
												class="form-control" id="price" name="price" placeholder="3,000원대" value="<%=ft.getPrice()%>"
												>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="detail" class="control-label sr-only">상세설명</label>
									<div class="col-sm-8 col-sm-offset-2">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-edit"></i></span>
											<textarea type="text" class="form-control" id="detail" name="detail"
												placeholder="푸드트럭의 간단한 소개말이나 상세 메뉴 설명을 기입해주세요."><%=ft.getDetail()%></textarea>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-8 col-sm-offset-2">
										<a type="submit" class="btn btn-success btn-block"
											id="modifyok"> <i class="fa fa-check-circle"></i> 수정완료
										</a>
									</div>
								</div>
								<br>
							</form>
						</div>
					</div>
					<!-- 푸드트럭 정보 영역 -->
				</div>
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
	<!-- /.container -->
</body>
</html>