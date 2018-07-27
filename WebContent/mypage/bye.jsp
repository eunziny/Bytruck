<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>bye.jsp</title>
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
		$('a#bye').click(function(){
			alert("정말 탈퇴하시겠습니까?");
			$.ajax({
				data:{},
	            method:'POST',
	            url:'<%=root%>/userdrop.bt',
				success : function(data) {
					if (data == 1) {
						alert('탈퇴 되었습니다. 감사합니다.');
						location.href="<%=root%>/index.jsp"
					} else {		
						alert('탈퇴 실패!');
						location.href="<%=root%>/mypage/bye.jsp"
					}
				}
			});
		});
	});
	</script>
	<div class="board">
		<div class="container">
			<!-- BREADCRUMBS -->
			<ol class="breadcrumb link-accent separator-arrow">
				<li><a href="<%=root %>/index.jsp" title="Home"><i class="fa fa-home"></i></a></li>
				<li><a href="<%=root %>/mypage/myCoupon.jsp" title="Home">My page</a></li>
				<li class="active">탈퇴</li>
			</ol>
			<!-- END BREADCRUMBS -->
				<div class="page-header">
							<div class="row">
								<div class=col-lg-12">
									<h1 align="center">
										<b>회원 탈퇴</b>
									</h1>
									<p align="center">
										<b>회원 탈퇴 페이지입니다.</b>
									</p>
								</div>
							</div>
						</div>
				<div class="jumbotron">
					<div class="container">
						<div class="col-sm-10 col-sm-offset-1">
							<div>
								<h3><b>탈퇴하시는 이유를 선택해주세요. (다수선택가능)</b></h3>
								<br>
								<div class="section section_find">
									<input type="radio" id="b_1" class="input_bye"
										checked="checked"> <label for="b_1">도움이 되지
										않습니다.</label><br> <input type="radio" id="b_2" class="input_bye">
									<label for="b_2">더 이상 이용하기 싫습니다.</label><br> <input
										type="radio" id="b_3" class="input_bye"> <label
										for="b_3">이유 없습니다.</label><br> <input type="radio"
										id="b_4" class="input_bye"> <label for="b_4">더
										좋은 사이트를 발견했습니다.</label><br> <input type="radio" id="b_5"
										class="input_bye"> <label for="b_5">불건전한 내용이
										많습니다.</label><br><br> <label> 기타사유 : </label><input type="text"
										class="form-control" placeholder="기타 이유를 적어주세요"> <br>
								</div>
								<br>
								<div align="center">
									<span>탈퇴하시면 모든 정보가 사라집니다.<br>정말 탈퇴를 원하신다면 아래의 탈퇴하기
										버튼을 눌러주세요.<br>탈퇴한 아이디는 본인과 타인 모두 복구가 불가하오니,<br> 신중하게
										선택하시기 바랍니다.<br>감사합니다.
									</span><br>
									<hr>
									<a type="button" class="btn btn-danger" align="center" id="bye"> 탈 퇴 하 기 </a>
								</div>
							</div>
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
	</div>
	<!-- /.container -->
</body>
</html>