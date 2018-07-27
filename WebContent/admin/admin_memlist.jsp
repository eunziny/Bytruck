<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<%
   String root = request.getContextPath();
%>
</head>
<style>
.board {
	padding-top: 5%;
}

.board .container {
	padding-left: 90px;
	width: 60%;
	float: center;
}
</style>
<body>
	<div class="aside">
		<jsp:include page="/template/admin_aside.jsp" />
	</div>
	<script>
	$(function(){
		function ajaxCall(){
			$.ajax({
				url: '<%=root%>/memlist.bt',	
				data:{},
				dataType:'json', 
				success:function(data){
					console.log(data);
			         if(data!=null){
			        	var id = $('tbody#info');
				        html="";
				        for (var i=0;i<data.users.length;i++){
				        	console.log('for()');
				        	console.log(data.users[i].user_id+'\n');
				            html += '<tr><td><div class="checkbox"><label><input type="checkbox" value=""></label></div></td><td>'
				            + data.users[i].user_id + '</td><td>'
				            + data.users[i].name + '</td><td>'
				            + data.users[i].birthday + '</td><td>'
				            + data.users[i].phone_number + '</td><td>'
				            + data.users[i].email + '</td><td>'
				            + data.users[i].bussiness_number + '</td><td>'
				            + data.users[i].type + '</td></tr>'; 
				        }		
				        id.html(html).show();
			        }else{
			        	cosole.log('data null,,,,');
			        } 
				}
			});
		}
		setInterval(ajaxCall(), 3000);	
	});
   </script>
	<div class="board">
		<div class="row">
			<div class="container">
				<!-- Start Page Content -->
				<div class="row">
					<div class="col-6">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">회원목록</h4>
								<table
									class="table table-hover table-condensed text-align=center; ">
									<thead>
										<tr>
											<th></th>
											<th>아이디</th>
											<th>이름</th>
											<th>생년월일</th>
											<th>휴대번호</th>
											<th>이메일</th>
											<th>사업자번호</th>
											<th>분류</th>
										</tr>
									</thead>
									<tbody id="info">
									
									</tbody>
								</table>
							</div>
						</div>
					</div>
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
</body>
</html>