<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>loginform.jsp</title>
<style>
.board {
	padding-top: 0;
}

.board .page-header {
	margin-top: 0;
}

@media ( min-width : 768px) {
	.omb_row-sm-offset-3 div:first-child[class*="col-"] {
		margin-left: 25%;
	}
}

.omb_login .omb_authTitle {
	text-align: center;
	line-height: 300%;
}

.omb_login .omb_socialButtons a {
	color: white;
	//
	In
	yourUse
	@body-bg
	opacity
	:
	0.9;
}

.omb_login .omb_socialButtons a:hover {
	color: white;
	opacity: 1;
}

.omb_login .omb_socialButtons .omb_btn-facebook {
	background: #3b5998;
}

.omb_login .omb_socialButtons .omb_btn-twitter {
	background: #00aced;
}

.omb_login .omb_socialButtons .omb_btn-google {
	background: #c32f10;
}

.omb_login .omb_loginOr {
	position: relative;
	font-size: 1.5em;
	color: #aaa;
	margin-top: 1em;
	margin-bottom: 1em;
	padding-top: 0.5em;
	padding-bottom: 0.5em;
}

.omb_login .omb_loginOr .omb_hrOr {
	background-color: #cdcdcd;
	height: 1px;
	margin-top: 0px !important;
	margin-bottom: 0px !important;
}

.omb_login .omb_loginOr .omb_spanOr {
	display: block;
	position: absolute;
	left: 50%;
	top: -0.6em;
	margin-left: -1.5em;
	background-color: white;
	width: 3em;
	text-align: center;
}

.omb_login .omb_loginForm .input-group.i {
	width: 2em;
}

.omb_login .omb_loginForm  .help-block {
	color: red;
}

@media ( min-width : 768px) {
	.omb_login .omb_forgotPwd {
		text-align: right;
		margin-top: 10px;
	}
}
</style>

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
	$(function() {
		$("a.ad").click(function() {
			window.open("http://dunkindonuts.co.kr/");
		});
	
		 var $idObj = $('input[type=text]'); //type속성이 text인 input객체를 dom트리에서 찾기
	      var $btObj = $('button'); //button객체찾기
	      var $chkObj = $('input[type=checkbox]');//type속성이 checkbox인 input객체찾기
	      
	      var itemValue = localStorage.getItem('id');
	      
	      if(itemValue != null){
	         $chkObj.prop('checked', true);
	      }else{
	         $chkObj.prop('checked', false);
	      }

	      $idObj.val(itemValue);
	      $("form").submit(function(){
	         var idValue = $idObj.val();
	         
	         if($chkObj.prop('checked')){//chkObj가 체크된 경우()
	           localStorage.setItem('id', idValue);      
	         }else{//chkObj가 체크안된 경우
	           localStorage.removeItem('id');
	         }      
	         $.ajax({
	            data:
	                {
	                'id':$('input[name=id]').val(),
	                'pwd':$('input[name=pwd]').val()
	               },
	            method:'POST',
	            url:'<%=root%>/login.bt',
				success : function(data) {
					if (data == 1) {
						alert('로그인 성공');
						location.href="<%=root%>/index.jsp"
					} else {		
						alert('로그인 실패');
						location.href="<%=root%>/base/loginform.jsp"
					}
				}
			});
			return false; //기본이벤트처리 막기
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
	<!-- MAIN -->
	<div class="login">
		<div class="container">
			<!-- BREADCRUMBS -->
			<ol class="breadcrumb link-accent separator-arrow">
				<li><a href="<%=root%>/index.jsp" title="Home"><i
						class="fa fa-home"></i></a></li>
				<li class="active">로그인</li>
			</ol>
			<!-- END BREADCRUMBS -->

			<!-- LOGIN BOX -->
			<div class="row">
				<form class="form-horizontal" id="form1">
					<div class="col-sm-5 col-sm-offset-1 col-lg-4 col-lg-offset-2">
						<br> <br>
						<!-- <form class="login" role="loginform" id="form2"> -->
							<div class="omb_login">
								<div class="form-group">
									<label for="inputId" class="control-label sr-only">Id</label>
									<div class="col-sm-12">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-user"></i></span>
											<input type="text" class="form-control" id="inputId"
												name="id" required placeholder="아이디를 입력해주세요">
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="inputPwd" class="control-label sr-only">Password</label>
									<div class="col-sm-12">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-lock"></i></span>
											<input type="password" class="form-control" name="pwd"
												required id="inputPassword" placeholder="비밀번호를 입력해주세요">
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-12">
										<label class="fancy-checkbox"> <input type="checkbox">
											<span>아이디 저장</span>
										</label>
									</div>
									<div class="col-sm-12">
										<button class="btn btn-success btn-block fa fa-sign-in">Login
										</button>
									</div>
								</div>
							</div>
						<!-- </form> -->
						<div style="text-align: center">
							<a href="<%=root%>/base/findId.jsp">아이디 찾기
						</div>
						<p>
							<em>회원이 아니신가요?</em> <a href="<%=root%>/base/signupcover.jsp">&nbsp;<strong>회원가입</strong></a>
						</p>
					</div>
				</form>
				<div>
					<a class="ad" href="#"><img src="<%=root%>/images/ad.png"></a>
				</div>
			</div>
		</div>
	</div>
	<!-- END LOGIN BOX -->
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