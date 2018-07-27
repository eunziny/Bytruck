<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>findId.jsp</title>
<head>
<style>
.board {
	padding-top: 0;
}

.board .page-header {
	margin-top: 0;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
	<script type="text/javascript">
	$(function() {
		$('div>div>input[type=radio]').click(function() {
			if ($('div>div>input[id=r_pn1]').prop('checked')) {
				$('div>div[id=div_phone]').css('display', 'block');
				$('div>div[id=div_email]').css('display', 'none');
				$("div>div[id=findid]").css('display', 'none');
				$("button[id=find]").css('display', 'block');
				$("a[id=home]").css('display', 'none');
			} else if ($('div>div>input[id=r_pn2]').prop('checked')) {
				$('div>div[id=div_phone]').css('display', 'none');
				$('div>div[id=div_email]').css('display', 'block');
				$("div>div[id=findid]").css('display', 'none');
				$("button[id=find]").css('display', 'block');
				$("a[id=home]").css('display', 'none');
			}
		});
		
		$("button#find").click(function(){
			if($('div>div>input[id=r_pn1]').prop('checked')){//전화번호로찾기 구현
				if($('input[type=tel]').val().length==0||$('input#name1').val().length==0){
					alert("모두 입력해주시기 바랍니다.");
					$("div>div#findid").css('display', 'none');
					$("button#find").css('display', 'block');
					$("a#home").css('display', 'none');
					return false;
				}
				if($('input[type=tel]').val().length!=13){
					alert("전화번호를 양식에 맞춰 입력해주세요");
					$("div>div#findid").css('display', 'none');
					$("button#find").css('display', 'block');
					$("a#home").css('display', 'none');
					return false;
				}else{
					$.ajax({
						method:'POST',
						data:{
							'name':$('input#name1').val(),
							'tel':$('input#tel').val()
							},
						url:'<%=root%>/findid.bt',
						success:function(data){
							data = data.trim();
							if(data!="-1"){//data아이디 받아오기
								var result = "고객님의 아이디는 " + data + " 입니다.";
								$('span#resultdata').html(result).css('color', 'blue').show();
							}else if(data == "-1"){
								var result = '위 정보에 맞는 아이디를 찾을 수 없습니다. 다시시도해주세요'
								$('span#resultdata').html(result).css('color', 'red').show();
							}
						}
					});
					$("div>div#findid").css('display', 'block');
					$("button#find").css('display', 'none');
					$("a#home").css('display', 'block');
					return false;
				}
			}else if($('div>div>input[id=r_pn2]').prop('checked')){//이메일로찾기 구현
				if($('input#email').val().length==0||$('input#name2').val().length==0){
					alert("모두 입력해주시기 바랍니다.");
					$("div>div#findid").css('display', 'none');
					$("button#find").css('display', 'block');
					$("a#home").css('display', 'none');
					return false;
				}else{
					$.ajax({
						method:'POST',
						data:{
							'name':$('input#name2').val(),
							'email':$('input#email').val()
							},
						url:'<%=root%>/findid.bt',
						success:function(data){
							data = data.trim();
							if(data!="-1"){//data아이디 받아오기
								var result = "고객님의 아이디는 " + data + " 입니다.";
								$('span#resultdata').html(result).css('color', 'blue').show();
							}else if(data == "-1"){
								var result = '위 정보에 맞는 아이디를 찾을 수 없습니다. 다시시도해주세요'
								$('span#resultdata').html(result).css('color', 'red').show();
							}
						}
					});
					$("div>div#findid").css('display', 'block');
					$("button#find").css('display', 'none');
					$("a#home").css('display', 'block');
					return false;
				}
			}
		});
	});
</script>
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
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	<!-- /.carousel -->
	<div class="board">
		<div class="row">
			<div class="container">
				<!-- BREADCRUMBS -->
				<ol class="breadcrumb link-accent separator-arrow">
					<li><a href="<%=root%>/index.jsp" title="Home"><i
							class="fa fa-home"></i></a></li>
					<li class="active">아이디 찾기</li>
				</ol>
				<!-- END BREADCRUMBS -->
				<!-- CONTENTS -->
				<div class="col-lg-12">
					<div class="page-header">
						<div class="row">
							<div class=col-lg-12">
								<h1 align="center">
									<b>아이디 찾기</b>
								</h1>
								<p align="center">
									<b>아이디 찾는 방법을 선택해 주세요.</b>
								</p>
							</div>
						</div>
					</div>
					<div class="section section_find">
						<!-- [D] 선택시 selected 클래스 추가 -->
						<div class="col-md-6" align="center">
							<input type="radio" id="r_pn1" class="input_rd"
								name="certification" checked="checked" value="phone"> <label
								for="r_pn1" class="label_rd">휴대폰 번호로 찾기</label>
						</div>
						<div class="col-md-6" align="center">
							<input type="radio" id="r_pn2" class="input_rd"
								name="certification" value="email"> <label for="r_pn2"
								class="label_rd">이메일로 찾기</label>
						</div>
						<br> <br>
						<!-- 휴대전화 영역 -->
						<div id="div_phone" class="box_inn jumbotron">
							<div class="box_inn_sub">
								<form class="form-horizontal" role="form">
									<div class="form-group">
										<label for="username" class="control-label sr-only">Username</label>
										<div class="col-sm-8 col-sm-offset-2">
											<div class="input-group">
												<span class="input-group-addon"><i class="fa fa-user"></i></span>
												<input type="text" class="form-control" id="name1" required
													placeholder="Username">
											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="tel" class="control-label sr-only">Tel</label>
										<div class="col-sm-8 col-sm-offset-2">
											<div class="input-group">
												<span class="input-group-addon"><i
													class="fa fa-phone"></i></span> <input type="tel"
													class="form-control" id="tel" required
													placeholder="Tel(ex.000-0000-0000)">
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
						<!-- 이메일 영역 -->
						<div id="div_email" class="box_inn jumbotron"
							style="display: none;">
							<div class="box_inn_sub">
								<form class="form-horizontal" role="form">
									<div class="form-group">
										<label for="username" class="control-label sr-only">Username</label>
										<div class="col-sm-8 col-sm-offset-2">
											<div class="input-group">
												<span class="input-group-addon"><i class="fa fa-user"></i></span>
												<input type="text" class="form-control" id="name2" required
													placeholder="Username">
											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="email" class="control-label sr-only">Email</label>
										<div class="col-sm-8 col-sm-offset-2">
											<div class="input-group">
												<span class="input-group-addon"><i
													class="fa fa-envelope"></i></span> <input type="email"
													class="form-control" id="email" required placeholder="Email">
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
						<!-- 이메일 영역 -->
					</div>
					<br>
					<div class=jumbotron id="findid" style="display: none;">
						<div align="center" id=result>
							<strong><span id="resultdata"></span></strong>
							</span>
						</div>
					</div>
					<div align="center">
						<button id="find" class="btn btn-success col-sm-4 col-sm-offset-4">아이디
							찾기</button> <a id="home" class="btn btn-success col-sm-4 col-sm-offset-4"
							style="display: none;" href="<%=root%>/index.jsp">홈으로 가기</a>
					</div>
				</div>
			</div>
			<br> <br>
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