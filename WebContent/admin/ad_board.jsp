<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="vo.Advertisement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%
String root = request.getContextPath();
%>
<c:set var="advertise" value="${requestScope.advertise}"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
<script src="<%= root%>/js/bootstrap.min.js"></script>
<script>
 $(function(){
	$.ajax({
		method:'POST',
		async: false,
		url:'<%=root%>/adminadvertiselist.bt',
		data:'advertise',
		success: function(data){
				$('.board').html(data);
		}
	});
	$('#checkAll').click(function(){ //만약 전체 선택 체크박스가 체크된상태일경우 
		if($('#checkAll').prop("checked")) {  
			$("input[name=checkRow]").prop("checked",true); 
		}else { //해당화면에 모든 checkbox들의 체크를해제시킨다. 
			$("input[name=checkRow]").prop("checked",false); 
		} 
	});
});
</script>
<style>
.board {
	padding-top: 1%;
}
.board .container{
	padding-left: 90px;
	width: 60%;
	float: center;
}
table {
  border-spacing: 0; 
  border-collapse: collapse;
}
td {
 	text-align: left;
 	border-spacing: 0px;
 	border-collapse: collapse;
} 
</style>
<body>
	<div class="aside">
		<jsp:include page ="/template/admin_aside.jsp"/>
	</div>
	<div class="board">
		<div class="row">
			<div class="container">
				<!-- Start Page Content -->
				<div class="row">
					 <div class="checkbox">
                        <label><input type="checkbox" id="checkAll">전체선택</label>
                           <button class="btn btn-success" id = "accept" onclick="alert('승인되었습니다.');">승인</button>
                     </div>
					<div class="col-6">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">일반광고</h4>
								<table class="table table-hover">
									<tr>
										<th>선택</th>
										<th>글번호</th>
										<th>글제목</th>
										<th>아이디</th>

									</tr>
									<c:forEach var="ad" items="${advertise}" varStatus="status">
										<tr id = "content">
												<td>
													<div class="checkbox">
														<label><input type="checkbox" name="checkRow"></label>
													</div>
												</td>
												<td><c:out value="${ad.no}"/></td>
												<td><c:out value="${ad.user_id}"/></td>
												<td><c:out value="${ad.title}"/></td>
											</tr>
										</c:forEach>	
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- <div class="text-center">
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