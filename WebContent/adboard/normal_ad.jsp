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
<title>normal_ad.jsp</title>
<body>
	<div class="row">
		<div class="container-fluid">
			<div class="col-lg-12">
				<header>
					<jsp:include page="/template/header.jsp" />
				</header>
			</div>
		</div>
	</div>
<script>
$(function(){
	 $.ajax({
			method:"post",
			url:"<%=request.getContextPath()%>/advertiselist.bt",
			success:function(data) {
				console.log(data);
            if(data != null) {
               var $divObj = $('tbody.adlist');
              $divObj.html(data.trim());
              } 
	        }
		}); 
		return false;
});
</script>	
	<div class="board">
		<div class="row">
			<div class="container">
				<ol class="breadcrumb link-accent separator-arrow">
					<li><a href="<%=root%>/index.jsp" title="Home"><i
							class="fa fa-home"></i></a></li>
					<li><a href="<%=root%>/event/event.jsp">이벤트 소개</a></li>
					<li class="active">배너광고 신청</li>
				</ol>
				<div class="page-header">
					<div class="row">
						<div class=col-lg-12">
							<h1 align="center">
								<b>배너광고 신청</b>
							</h1>
							<p align="center">
								<b>해당 광고신청 시, 로그인할 때 광고가 보여집니다.</b>
							</p>
						</div>
					</div>
				</div>
				<%-- <div class="boardsearch">
					<jsp:include page="adsearch.jsp" />
				</div> --%>
				<!-- <div align="left" class="col-lg-offset-6 col-lg-6"
					style="padding-bottom: 10px">
					<select class="col-lg-3 col-lg-offset-1" id="type"
						style="height: 25px; vertical-align: top;">
						<option value="">검색</option>
						<option value="title">제목</option>
						<option value="detail">내용</option>
					</select> <input type="text" class="col-lg-6">
					<button class="col-lg-2 btn btn-info"
						style="height: 26px; line-height: 26px; padding: 0 15px;">검색</button>
				</div> -->
				<table class="table table-hover table-condensed">
					<thead>
						<tr>
							<th>글번호</th>
							<th>글제목</th>
							<th>작성자</th>
							<th>게시일</th>
						</tr>
					</thead>
					<tbody class="adlist">

					</tbody>
				</table>
				<a class="btn btn-success pull-right"
					href="<%=root%>/adboard/ad_form.jsp">글쓰기</a>
			</div>
			<br>
		</div>
	</div>
	</div>
	</div>
<!-- 	<div class="text-center">
		<ul class="pagination">
			<li class="active"><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
		</ul>
	</div> -->
	<div class="foot">
		<div class="row">
			<div class="container-fluid">
				<div class="col-lg-12">
					<footer>
						<jsp:include page="/template/footer.jsp" />
					</footer>
				</div>
			</div>
		</div>
	</div>
</body>
</html>