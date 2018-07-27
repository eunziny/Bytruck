<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- adsearch.jsp --%>
<%String root = request.getContextPath(); %>
<% request.setCharacterEncoding("UTF-8"); %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
	/* return false; */
	
	<% String value = request.getParameter("searchValue");
	   if(value != null){
		   //input객체의 value에 대입
	%>   $("input[name=searchValue]").val("<%=value%>"); 
	<% }
	   String item = request.getParameter("searchItem");
	   if(item != null){
	%>   $("select").val("<%=item%>");	   
	<% }
	%> 
	
	$("input[name=searchValue]").keypress(function(e){
		if(e.which == 13){ //enter	
		  $('form>button').trigger('click');
		}
	   });
	
	$("form").submit(function(){
		console.log("글 검색하기!!!");
		$.ajax({
			method:"post",
			data:$("form").serialize(),
			url:"<%=request.getContextPath()%>/advertiselist.bt",
			success:function(data){
				console.log("검색이벤트 -------->" + data);
                if(data != null) {
                   var $divObj = $('tbody.adlist');
                  $divObj.empty(); 
                  $divObj.html(data.trim());
                } 
	        }
			
		}); 
		return false; //기본이벤트 막기
	});
});
</script>

<div align="left" class="col-lg-offset-6 col-lg-6"
	style="padding-bottom: 10px">
	<form method="post">
	<select class="col-lg-3 col-lg-offset-1" name="searchItem"
		style="height: 25px; vertical-align: top;">
		<option value="">검색</option>
		<option value="title">제목</option>
		<option value="detail">내용</option>
	</select>
	<input type="text" class="col-lg-6" name="searchValue" placeholder="검색어를 입력하세요.">
	<button class="col-lg-2 btn btn-info"
		style="height: 26px; line-height: 26px; padding: 0 15px;">검색</button>
	</form>
</div>