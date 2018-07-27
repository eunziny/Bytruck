<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.board {
	padding-top: 10%;
}
.board .page-header {
	margin-top: 0;
}
</style>
<title>qna.jsp</title>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<div class="row">
		<div class="container-fluid">
			<div class="col-lg-12">
				<header>
					<%@include file="/template/header.jsp"%>
				</header>
			</div>
		</div>
	</div>
<%-- <script>
 $(function(){
	 $.ajax({
			method:"post",
			url:"<%=request.getContextPath()%>/boardlist.bt?type=1",
			success:function(data) {
				console.log(data);
             if(data != null) {
                var $divObj = $('tbody.qnalist');
               $divObj.html(data.trim());
               } 
	        }
		}); 
		return false;
});
</script> --%>
	<div class="board">
		<div class="row">
			<div class="container">
				<!-- BREADCRUMBS -->
				<ol class="breadcrumb link-accent separator-arrow">
					<li><a href="<%=root%>/index.jsp" title="Home"><i
							class="fa fa-home"></i></a></li>
					<li class="active">Q&A</li>
					<li><a href="<%=root%>/board/faq.jsp" title="Home">FAQ</a></li>
					<li><a href="<%=root%>/chatting/chat.jsp" title="Home">타임라인</a></li>
				</ol>
				<!-- END BREADCRUMBS -->
						<div class="page-header">
							<div class="row">
								<div class=col-lg-12">
									<h1 align="center">
										<b>Q&A</b>
									</h1>
									<p align="center">
										<b>BYTRUCK은 여러분의 소리에 귀를 기울이고 있습니다.</b>
									</p>
								</div>
							</div>
						</div>
						<div class="boardsearch">
							<jsp:include page="qnasearch.jsp"/>
						</div>
<!-- 						<div align="left" class="col-lg-offset-6 col-lg-6"
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
							<tbody class="qnalist">

							</tbody>
						</table>
					  <a class="btn btn-success pull-right" href="<%=root%>/board/qna_write.jsp">글쓰기</a>
					</div>
				</div>
			</div>
	<div class="text-center">
		<ul class="pagination">
			<%-- <c:set var="startPage" value="${pb.startPage}"/>
			<c:set var="endPage" value="${pb.endPage}"/>
			<c:if test="${startPage > 1}">
			<a href="#">&laquo;</a>
			</c:if>
			<c:forEach begin="${startPage}" end="${endPage}" var = "i">
				<a href="#">${i}</a>
			</c:forEach>
			<c:if test="${endPage < pb.totalPage}">
				<a href="#">&raquo;</a>
			</c:if>	 --%>
		</ul>
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