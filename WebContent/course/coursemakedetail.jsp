	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<title>makecourse.jsp</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
</head>
<style>
.board {
	padding-top: 10%;
}

.board .page-header {
	margin-top: 0;
}
</style>
<body>
	<div class="row">
		<div class="container-fluid">
			<div class="col-lg-12">
				<header>
					<%@include file="/template/form.jsp"%>
				</header>
			</div>
		</div>
	</div>
	<script>
	 $(function(){
 			$('form#result').submit(function(){
 				/*var x = $('textarea#xlocation').html();
		        var y = $('textarea#ylocation').html();
		        var xL=x.split('/');//xL[]:위도배열
		        var yL=y.split('/');//yL[]:경도배열
		        
  		        for(var i in xL){
		           console.log(xL[i] + ", " + yL[i] + "\n");
		        }    */
		        console.log("aaa");
				$.ajax({
					url : '<%=request.getContextPath()%>/coursewrite.bt',
					method : 'post',
					data : $('form').serialize(),
					success : function(data) {
						location.href="<%=root%>/courselist.bt"
					}
				});
				return false;
 			});

		});
	</script>
	<div class="board">
		<div class="row">
			<div class="container">
				<ol class="breadcrumb link-accent separator-arrow">
					<li><a href="<%=request.getContextPath()%>/index.jsp"
						title="Home"><i class="fa fa-home"></i></a></li>
					<li><a
						href="<%=request.getContextPath()%>/courselist.bt"
						title="Home">코스소개</a></li>
					<li class="active">코스짜기</li>
					<li><a
						href="<%=request.getContextPath()%>/course/reviewboard.jsp"
						title="Home">코스후기</a></li>
				</ol>
				<div class="page-header">
					<div class="row">
						<div class=col-lg-12>
							<h1 align="center">
								<b>COURCE</b>
							</h1>
							<p align="center">
								<b>나만의 여행코스를 계획하세요.</b>
							</p>
						</div>
					</div>
				</div>
				<form id="result">
					<div class="container">
						<div class="row">
							<div class="col-sm-2 sidenav">
								<div class="trip">
									<h5>출발일을 선택해 주세요</h5>
									<div class="dropdown">
										<span class="input-group-addon"> <i
											class="fa fa-calendar"></i></span> <input type="date"
											class="form-control" name="tripdate" id="tripdate"
											placeholder="Openday(ex.YYYY/MM/DD)">
									</div>
								</div>
								<div class="option">
									<h3>
										<b>세부옵션사항</b>
									</h3>
									<label><input type="radio" name="withradio" value="혼자여행">나만보기</label><br>
									<label><input type="radio" name="withradio" value="참여여행">동행가능</label>
								</div>
							</div>
							<div class="col-sm-10">
								<div class="col-md-9">
									<%@include file="courseselmap.jsp"%><br>
									<label>제목 :</label>&nbsp;&nbsp;<input type="text" class="form-control" name="title" required><br> 
									<label>일정:</label><br>
									<textarea class="form-control" rows="8" name="detail" required></textarea>
									<textarea style="display: none" id="xlocation" name ="xlocation"></textarea>
									<textarea style="display: none" id="ylocation" name ="ylocation"></textarea>
									<a href = "<%=request.getContextPath()%>/courselist.bt">
									<button type="submit" class="btnapply" style="margin: 10px auto 0; display: block; width: 150px; font-weight: bold; 
									padding: 0; line-height: 32px;">일정등록</button></a>
								</div>
								<div class="col-md-3">
									<%@include file="/template/top123.jsp"%>
								</div>
							</div>
						</div>
					</div>
				</form>
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