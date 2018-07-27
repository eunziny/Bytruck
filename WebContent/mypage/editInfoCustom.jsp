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
<title>editInfoCustom.jsp</title>
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
	
	<script>
	$(function(){
		$('a#modifyok').click(function(){
			if($('input[name=pwd]').val()==$('#password2').val()){
				var result = '비밀번호가 일치합니다.';
				$('div#pwdcheck').html(result).css('color', 'blue').show();	
			}else{
				var result = '비밀번호가 일치하지 않습니다.';
				$('div#pwdcheck').html(result).css('color', 'red').show();
				return false;
			}
			$.ajax({
				url : '<%=root%>/userinfoupdate.bt',
				method : 'post',
				data : {
					'id':'<%=loginInfo%>',
					'name':'<%=users.getName() %>',
					'pwd':$('input#password').val(),
					'email':$('input#email').val(),
					'birthday':'<%=users.getBirthday() %>',
					'tel':$('input#tel').val()
						},
				success : function(data) {
					data = data.trim();
					if (data == 1) { //수정 성공
						alert('개인정보수정 성공');
					location.href="<%=root%>/userInfoview.bt?id=<%=loginInfo%>";
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
					<li><a href="<%=root %>/index.jsp" title="Home"><i
							class="fa fa-home"></i></a></li>
					<li><a href="<%=root %>/mypage/myCoupon.jsp" title="Home">My
							page</a></li>
					<li class="active">정보 수정</li>
				</ol>
				<!-- END BREADCRUMBS -->
				<div class="page-header">
					<div class="row">
						<div class=col-lg-12">
							<h1 align="center">
								<b>회원 정보 수정</b>
							</h1>
							<p align="center">
								<b>회원님의 정보를 수정하실 수 있습니다.<br>(비밀번호/이메일/휴대번호)
								</b>
							</p>
						</div>
					</div>
				</div>
				<form class="form-horizontal" role="form">
					<div class="form-group">
						<label for="id" class="control-label sr-only">ID</label>
						<div class="col-sm-8 col-sm-offset-2">
							<div class="input-group">
								<span class="input-group-addon" type="readonly"><i
									class="fa fa-globe"></i></span>
								<text type="text" class="form-control" id="id"
									readonly="readonly"><%=users.getUser_id() %></text>
							</div>
						</div>

					</div>
					<div class="form-group">
						<label for="username" class="control-label sr-only">Username</label>
						<div class="col-sm-8 col-sm-offset-2">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user"></i></span>
								<text type="text" class="form-control" id="username"
									readonly="readonly"><%=users.getName() %></text>
							</div>
						</div>
					</div>
					<%if(userInfo.equals("TR")){ %>
					<div class="form-group">
						<label for="username" class="control-label sr-only">사업자번호</label>
						<div class="col-sm-8 col-sm-offset-2">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user"></i></span>
								<text type="text" id="bussiness_number" readonly="readonly">
								<span id="name"><%=users.getBussiness_number() %></span></text>
							</div>
						</div>
					</div>
					<%} %>
					<div class="form-group">
						<label for="password" class="control-label sr-only">Password</label>
						<div class="col-sm-8 col-sm-offset-2">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-lock"></i></span>
								<input type="password" class="form-control" id="password" name="pwd"
									required placeholder="Password">
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="password2" class="control-label sr-only">Repeat
							Password</label>
						<div class="col-sm-8 col-sm-offset-2">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-lock"></i></span>
								<input type="password" class="form-control" id="password2"
									required placeholder="Repeat Password">
							</div>
						</div>
						<div class='col-sm-8 col-sm-offset-2' id="pwdcheck"></div>
					</div>
					<div class="form-group">
						<label for="email" class="control-label sr-only">Email</label>
						<div class="col-sm-8 col-sm-offset-2">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-envelope"></i></span>
								<input type="email" class="form-control" id="email"
									placeholder="Email" value="<%=users.getEmail()%>">
								<!-- null값이면 원래 이메일 넣기 -->
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="birthday" class="control-label sr-only">Birthday</label>
						<div class="col-sm-8 col-sm-offset-2">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
								<text type="date" class="form-control" id="birthday"
									readonly="readonly"><%=users.getBirthday() %></text>
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="tel" class="control-label sr-only">Tel</label>
						<div class="col-sm-8 col-sm-offset-2">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-phone"></i></span>
								<input type="tel" class="form-control" id="tel"
									placeholder="Tel(ex.000-0000-0000)" value="<%=users.getPhone_number()%>">
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-8 col-sm-offset-2">
							<a type="submit" class="btn btn-success btn-block" id="modifyok"> <i
								class="fa fa-check-circle"></i> 수정완료
							</a>
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
	<!-- /.container -->
</body>
</html>