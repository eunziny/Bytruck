<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String root = request.getContextPath();%>
<!DOCTYPE html>
  <header>
 	<jsp:include page = "/template/header.jsp"/>
  </header>
<body>
<br>
<br>
<br>
<br>
<br>
<div class="container" style="margin-left: 20%;margin-top: 5%;">
	<div style="margin-bottom: 3%;">
		<h2>자주 묻는 질문 작성</h2>
	</div>
	<table class="table table-bordered">
	<form>	
	<div class="col-xs-8">
	<div class="form-group">
      <label for="inputsm" >제목</label>
      <input class="form-control input-sm" id="inputsm" type="text" >
    </div>
    </div>
    <div class="col-xs-8">
    <label for="sel1">문의 사항 종류</label>
      <select class="form-control" id="sel1" style="width:auto;">
        <option>길을 잃었습니다.</option>
        <option>감사합니다.</option>
        <option>새우푸드트럭이 맛있어요</option>
        <option>짱짱</option>
      </select>
      </div>
      <div class="col-xs-8" style="margin-top: 2%;">
      <div class="checkbox">
      <label><input type="checkbox" value="" >공개</label>
      <label><input type="checkbox" value="">비공개</label>
    </div>
    </div>
    <div>
     <div class="col-xs-8">
     	<div class="form-group" style="margin-top: 5%;">
     		<label for="inputsm" >내용</label>
     			<textarea class="form-control" rows="5" id="comment" style="height:350px"></textarea>			
      	</div>
     </div>
    </div>
       
    </form>
    </table>
    <div style="margin-left: 30%;">
    	<button type="button" class="btn btn-default"><a href="<%=root %>/board/faq.jsp">저장</a></button>  
    	<button type="button" class="btn btn-default" style="margin-left: 2%;"><a href="<%=root %>/board/faq.jsp">취소</a></button>
	</div>
	
    </div>
    <!-- FOOTER -->
	<div style="margin-top: 5%;">
      <footer>
      		<jsp:include page = "/template/footer.jsp"/>
      </footer>
     </div>
</body>



