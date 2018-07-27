<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>signup.jsp</title>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
.board {
	padding-top: 0;
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
		$("a.tos").click(function() {
			window.open("http://localhost:8080/bytruck/base/tos.jsp",
					"바이트럭 이용약관",
					"width=700, height=600, scrollbars=yes");
		});
		
		$('button[name=dupcheck]').click(function(){
			$.ajax({
				method:'POST',
				data:{'id':$('input[name=id]').val()},
				url:'<%=root%>/dupchk.bt',
				success:function(data){
					data = data.trim();
					if(data == '1'){
						var result = '사용가능한 ID입니다.'
						$('div#dup').html(result).css('color', 'blue').show();
					}else if(data == '-1'){
						var result = '이미사용중인ID입니다.'
						$('div#dup').html(result).css('color', 'red').show();
					}
				}
			});
			return false;
		});
		
		$('input[name=id]').change(function(){
			$('input#id').html('').hide();
		});
		
		$('button[name=join]').click(function(){	
			if(!$('input#checkbox').is(":checked")){
				alert('약관에 동의해 주세요.');
	            return false;
			}
			if($('input[name=pwd]').val()==$('#password2').val()){
				var result = '비밀번호가 일치합니다.';
				$('div#pwdcheck').html(result).css('color', 'blue').show();	
			}else{
				var result = '비밀번호가 일치하지 않습니다.';
				$('div#pwdcheck').html(result).css('color', 'red').show();
				return false;
			}
			$.ajax({
				url: '<%=root%>/signup.bt',
				method: 'POST',			
				data: $('form#form1').serialize(),
				success:function(data){
					var jsonObj = JSON.parse(data.trim());
					if(jsonObj.status == '1'){ //가입성공
						alert('가입 성공하셨습니다.\r\n 로그인 후 사용바랍니다.');
						location.href="<%=root%>/base/loginform.jsp"
					}else if(jsonObj.status == '-1'){
						alert('가입 실패하셨습니다. 새로 회원가입 해주시기 바랍니다.');
						location.href="<%=root%>/base/signupcover.jsp"
					}
				}
			});
			return false;
		});
		
		$('#password2').change(function(){
			$('div#pwdcheck').html('').hide();
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
			data-slide="prev"
			style="top: 50%; margin-top: -25px; background: none"> <span
			class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"
			style="top: 50%; margin-top: -25px; background: none"> <span
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
				<li><a href="<%=root%>/base/signupcover.jsp" title="Home">회원가입</a></li>
				<li class="active">개인 회원가입</li>
			</ol>
			<!-- END BREADCRUMBS -->
			<!-- REGISTER BOX -->
				<div class="account-box register-box">
						<div class="page-header">
							<div class="row">
								<div class=col-lg-12">
									<h1 align="center">
										<b>개인 회원가입</b>
									</h1>
									<p align="center">
										<b>회원정보를 입력해주세요. 모두 입력하셔야 가입이 가능해집니다.</b>
									</p>
								</div>
							</div>
						</div>
					<form class="form-horizontal" role="form" id="form1">
						<div class="form-group">
							<label for="id" class="control-label sr-only">ID</label>
							<div class="col-sm-8 col-sm-offset-2">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-globe"></i></span>
									<input type="text" class="form-control" name="id" required
										placeholder="ID">
								</div>
							</div>
							<button name="dupcheck" style="align-content: left;">아이디중복확인</button>
							 <div class='col-sm-8 col-sm-offset-2' id="dup"></div>
						</div>
						<div class="form-group">
							<label for="username" class="control-label sr-only">Username</label>
							<div class="col-sm-8 col-sm-offset-2">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user"></i></span>
									<input type="text" class="form-control" id="name" name="name" required
										placeholder="Username">
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="control-label sr-only">Password</label>
							<div class="col-sm-8 col-sm-offset-2">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock"></i></span>
									<input type="password" class="form-control" id="password" name="pwd" required
										placeholder="Password">
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="password2" class="control-label sr-only">Repeat
								Password</label>
							<div class="col-sm-8 col-sm-offset-2">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock"></i></span>
									<input type="password" class="form-control" id="password2" required
										placeholder="Repeat Password">
								</div>
								<div class='col-sm-8 col-sm-offset-2' id="pwdcheck"></div>
							</div>
						</div>
						<div class="form-group">
							<label for="email" class="control-label sr-only">Email</label>
							<div class="col-sm-8 col-sm-offset-2">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="fa fa-envelope"></i></span> <input type="email"
										class="form-control" id="email" name="email" required placeholder="Email">
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="birthday" class="control-label sr-only">Birthday</label>
							<div class="col-sm-8 col-sm-offset-2">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="fa fa-calendar"></i></span> <input type="date"
										class="form-control" id="bitrhday" name="birthday" required
										placeholder="Birthday(ex.YYYY-MM-DD)">
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="tel" class="control-label sr-only">Tel</label>
							<div class="col-sm-8 col-sm-offset-2">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-phone"></i></span>
									<input type="tel" class="form-control" id="tel" name="tel" required
										placeholder="Tel(ex.000-0000-0000)">
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-8 col-sm-offset-2">
								<label class="fancy-checkbox"> <input type="checkbox" id="checkbox">
									<span>본인은 <a class="tos" href="#">이용약관</a></span>에 동의 합니다.
								</label>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-8 col-sm-offset-2">
								<button name="join" class="btn btn-success btn-block"> 
								<i class="fa fa-check-circle"></i> Create Account
								</button>
							</div>
						</div>
					</form>
					<br>
					<div align="center">
					<p>
						<em>이미 회원이신가요?</em> <a href="<%=root%>/base/loginform.jsp"><b>로그인</b></a>
					</p>
					</div>
					<br>
				</div>
			
			<!-- END REGISTER BOX -->
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