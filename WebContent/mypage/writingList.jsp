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
<title>writingList.jsp</title>
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
		$.ajax({
			url: '<%=root%>/mywriteview.bt',	
			dataType:'json',
			success:function(data){
				console.log(data);
				var id=[]; var posted=[]; var msg=[];
				for(var i=0;i<data.chatting.length;i++){
					id[i]=data.chatting[i].user_id;
					posted[i]=data.chatting[i].posted;
					msg[i]=data.chatting[i].message;
				}
		         if(data!=null){
		        	var id = $('ul#list');
			        html="";
			        for (var i=0;i<data.chatting.length;i++) {
			            html += ''; 
			        }		
			        id.html(html).show();
		        } 
			}
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
					<li><a href="<%=root %>/mypage/mypage.jsp" title="Home">My
							page</a></li>
					<li class="active">내가 쓴 글</li>
				</ol>
				<!-- END BREADCRUMBS -->
				<div class="page-header">
					<div class="row">
						<div class=col-lg-12">
							<h1 align="center">
								<b>내가 쓴 글</b>
							</h1>
							<p align="center">
								<b>내가 쓴 게시글을 모두 볼 수 있습니다.</b>
							</p>
						</div>
					</div>
				</div>
				<div align="left" class="col-lg-offset-6 col-lg-6"
					style="padding-bottom: 10px">
					<select class="col-lg-3 col-lg-offset-1" id="type"
						style="height: 25px; vertical-align: top;">
						<!-- 이부분 사업자/일반if문 써서 구분시키기(게시판종류 다름) -->
						<% userInfo = (String) session.getAttribute("loginInfo_type");
						if(userInfo.equals("BK")){//일반회원일 때%>
						<option value="">검색</option>
						<option value="title">코스짜기</option>
						<option value="detail">후기</option>
						<%}else if(userInfo.equals("TR")){ %>
						<option value="">검색</option>
						<option value="title">등록</option>
						<%} %>
					</select> <input type="text" class="col-lg-6">
					<button class="col-lg-2 btn btn-info"
						style="height: 26px; line-height: 26px; padding: 0 15px;">검색</button>
				</div>
				<table class="table table-hover table-condensed">
					<thead>
						<tr>
							<th>게시판분류</th>
							<th>글번호</th>
							<th>글제목</th>
							<th>아이디</th>
							<th>게시일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>코스짜기</td>
							<td>250</td>
							<td><a href="#">서울 중심지 당일치기 코스</a></td>
							<td>kitri1</td>
							<td>2018.05.11</td>
							<td>1</td>
						</tr>
						<tr>
							<td>코스짜기</td>
							<td>9</td>
							<td><a href="#">코스 한번 봐주세요(대구)</a></td>
							<td>kitri1</td>
							<td>2018.05.10</td>
							<td>11</td>
						</tr>
						<tr>
							<td>코스짜기</td>
							<td>31</td>
							<td><a href="#">당일치기 코스 짜봤습니다.구경오세요~</a></td>
							<td>kitri1</td>
							<td>2018.05.09</td>
							<td>29</td>
						</tr>
						<tr>
							<td>후기</td>
							<td>84</td>
							<td><a href="#">Best여행코스 제가 한번 가봤습니다!</a></td>
							<td>kitri1</td>
							<td>2018.05.08</td>
							<td>18</td>
						</tr>
						<tr>
							<td>코스짜기</td>
							<td>2</td>
							<td><a href="#">Best여행코스 제가 한번 가보도록 할까 생각중입니다.</a></td>
							<td>kitri1</td>
							<td>2018.05.05</td>
							<td>52</td>
						</tr>
						<tr>
							<td>후기</td>
							<td>9</td>
							<td><a href="#">Best여행코스 감 코스 </a></td>
							<td>kitri1</td>
							<td>2018.05.04</td>
							<td>58</td>
						</tr>
						<tr>
							<td>후기</td>
							<td>8</td>
							<td><a href="#">부산 좋구여~~~~~~~</a></td>
							<td>kitri1</td>
							<td>2018.05.03</td>
							<td>32</td>
						</tr>
						<tr>
							<td>후기</td>
							<td>111</td>
							<td><a href="#">서울 낙산공원 둘레길 후기입니다.(스압주의)</a></td>
							<td>kitri1</td>
							<td>2018.05.02</td>
							<td>67</td>
						</tr>
						<tr>
							<td>코스짜기</td>
							<td>212</td>
							<td><a href="#">제가 짠 코스입니다.</a></td>
							<td>kitri1</td>
							<td>2018.05.02</td>
							<td>180</td>
						</tr>
						<tr>
							<td>후기</td>
							<td>119</td>
							<td><a href="#">경주 2박3일 후기입니다.</a></td>
							<td>kitri1</td>
							<td>2018.05.01</td>
							<td>152</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="text-center">
		<ul class="pagination">
			<li class="active"><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
		</ul>
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