<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String root = request.getContextPath();
%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){
	$("div.row a").click(function(){
		console.log("푸드 선택!");
		$.ajax({
			method:"post",
			data:{
				foodtype:$(this).prop('id')
			},
			url:"<%=request.getContextPath()%>/foodtrucklist.bt",
				/* dataType:'json', */
				success : function(data) {
					console.log(data);
					if (data != null) {
						var $divObj = $('div.foodlist');
						$divObj.html(data.trim());
					}
				}

			});
			/* return false; */
		});
	});
</script>
<div class="row">
	<div class="container-fluid">
		<div class="foodtype">
			<ul class="nav nav-tabs" role="tablist">
				<li class="active"><a href="#main" id="main" role="tab"
					data-toggle="tab">식사류</a></li>
				<li><a href="#desert" id="desert" role="tab" data-toggle="tab">간식류</a></li>
				<li><a href="#drink" id="drink" role="tab" data-toggle="tab">음료류</a></li>
				<div>
					<%
						String userInfo = (String) session.getAttribute("loginInfo_type");
						if (userInfo == null)
							userInfo = "X";
						if (userInfo.equals("TR")||userInfo.equals("AD")) {
					%>
					<a class="btn btn-success pull-right"
						href="<%=root%>/foodtruck/foodform.jsp">푸드트럭 등록</a>
					<%
						}
					%>
				</div>
			</ul>
		</div>
	</div>
</div>