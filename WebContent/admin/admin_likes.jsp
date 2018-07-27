<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String root = request.getContextPath();%>
<style>
.ranking {
	padding-top: 5%;
}

.ranking .container {
	padding-left: 90px;
	width: 60%;
	float: center; 
}
</style>
<body>
	<div class="aside">
		<jsp:include page="/template/admin_aside.jsp" />
	</div>
	<div class="ranking">
		<div class="container">
			<!-- Start Page Content -->
			<div class="row">
				<div class="card">
					<div class="card-title">
						<h4>여행후기 순위</h4>
					</div>
					<div class="card-body">
						<div class="text-left">
							<button type="button" class="btn btn-success m-b-10 m-l-5"
								id="toastr-success-top-center">메인에 올리기</button>
							<table class="table table-hover table-condensed">
								<thead>
									<tr>
										<th>#</th>
										<th>글제목</th>
										<th>아이디</th>
										<th>게시일</th>
										<th>좋아요 수</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">1</th>
										<td>Kolor Tea Shirt For Man</td>
										<td><span class="badge badge-primary">solbi0802</span></td>
										<td>January 22</td>
										<td class="color-primary">50</td>
									</tr>
									<tr>
										<th scope="row">2</th>
										<td>Kolor Tea Shirt For Women</td>
										<td><span class="badge badge-success">trksdfk</span></td>
										<td>January 30</td>
										<td class="color-success">25</td>
									</tr>
									<tr>
										<th scope="row">3</th>
										<td>Blue Backpack For Baby</td>
										<td><span class="badge badge-danger">ezxfe</span></td>
										<td>January 25</td>
										<td class="color-danger">14</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- /# card -->
				</div>
				<!-- /# column -->
			</div>
		</div>
	</div>
</body>
</html>