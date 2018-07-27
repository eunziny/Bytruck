<%@page import="vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String root = request.getContextPath();
%>
<style>
.board {
	padding-top: 10%;
}

.board .page-header {
	margin-top: 0;
}
</style>

<title>notice_modify.jsp</title>
</head>
<body>
	<%
		Board board = (Board) request.getAttribute("board");
		System.out.println("modify의 board : " + board);
	%>
	<div class="row">
		<div class="container-fluid">
			<div class="col-lg-12">
				<header>
					<jsp:include page ="/template/header.jsp"/>
				</header>
			</div>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script>
	 $(function() {
		 console.log('function()');
	 	$('a[id=mcancel]').click(function() {
			alert("취소하시면 작성하신 글이 사라지게 됩니다. \n 정말 작성을 취소하시겠습니까?");
			location.href="<%=root%>/boarddetail.bt?num=<%=board.getNo()%>&type=0";
		});  
		
		$('#modifyok').click(function() {
			console.log("modifyok클릭");
			alert('수정하시겠습니까?');
			$.ajax({
				async: false,
				url : '<%=root%>/boardupdate.bt',
				method : 'post',
				data : {
						'title':$('input[name=title]').val(),
						'detail':$('textarea[name=detail]').val(),
						'num':<%=board.getNo()%>,
						'type':'0'},
				success : function(data) {
					data = data.trim();
					if (data == '1') { //수정 성공
						alert('글수정 성공');
					location.href="<%=root%>/boarddetail.bt?num=<%=board.getNo()%>&type=0";
					} else if (data == '-1') { //수정 실패
						alert('글수정 실패');
					}
				}
			});
			return false;
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
					<li><a href="<%=root%>/brand/summary.jsp" title="Home">브랜드</a></li>
					<li><a href="<%=root%>/brand/notice.jsp" title="Home">공지사항</a></li>
					<li class="active">공지사항 수정</li>
				</ol>
				<br>
				<!-- END BREADCRUMBS -->
				<!-- BASIC INPUT -->
				<div class="page-header">
					<div class="row">
						<div class="col-lg-12">
							<h1 align="center">
								<b>공지사항</b>
							</h1>
							<p align="center">
								<b>BYTRUCK의 공지사항을 수정하세요.</b>
							</p>
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h2 class="panel-title section-heading no-margin">공지사항 수정</h2>
					</div>
					<div class="panel-body">
						<form id="formwrite">
							<div class="form-horizontal">
								<div class="form-group">
									<label class="col-md-1 control-label">제목</label>
									<div class="col-md-11">
										<input type="text" class="form-control" name="title"
											placeholder="제목을 입력하세요" value="<%=board.getTitle()%>">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-1 control-label">내용</label>
									<div class="col-md-11">
										<textarea class="form-control" name="detail"
											placeholder="내용을 입력하세요" rows="15"><%=board.getDetail()%></textarea>
									</div>
								</div>
							</div>
							<div
								class="button-group col-lg-offset-2 col-lg-8 col-lg-offset-2">
								<a class="btn btn-success col-lg-4 col-lg-offset-1"
									type="button" id="modifyok">수정</a> 
								<a class="btn btn-danger col-lg-4 col-lg-offset-1" type="button"
									id="mcancel">취소</a>
							</div>
						</form>
					</div>
				</div>
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