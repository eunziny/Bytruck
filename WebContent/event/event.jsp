<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<title>event.jsp</title>
<head>
<style>
.col-lg-12 {
   padding-top: 5%;
}
/* .board {
   padding-top: 10%;
} */
</style>
</head>
<body>
   <div class="menu_bar">
      <div class="row">
         <div class="container-fluid">
            <div class="col-lg-12">
               <header>
                  <%@include file="/template/event_header.jsp"%>
               </header>
            </div>
         </div>
      </div>
   </div>
   <script>
$(function(){
      $.ajax({
         method:"post",
         url:"<%=request.getContextPath()%>/eventlist.bt",
            success : function(data) {
               console.log(data);
               if (data != null) {
                  var $divObj = $('div.portfolio-item-wrapper');
                  $divObj.html(data.trim());
               }
            }
         });
         return false;
      });
   </script>
   <div class="container">
      <div class="page-header">
         <div class="row">
            <div class=col-lg-12">
               <h1 align="center">
                  <b>EVENT</b>
               </h1>
               <p align="center">
                  <b>BYTRUCK의 다양한 EVENT를 확인하세요.</b>
               </p>
            </div>
         </div>
      </div>
      
		<div class="wrapper">
         <div class="portfolio-item-wrapper"></div>
         <div>
            <%
               userInfo = (String) session.getAttribute("loginInfo_type");
               if (userInfo == null)
                  userInfo = "X";
               if (userInfo.equals("TR")||userInfo.equals("AD")) {
            %>
            <a class="btn btn-success pull-right"
               href="<%=root%>/event/eventform.jsp">이벤트 등록</a>
            <%
               }
            %>

         </div>
      </div>
   </div>
   <!-- PAGINATION -->
<!--    <div class="text-center">
      <ul class="pagination">
         <li class="active"><a href="#">1</a></li>
         <li><a href="#">2</a></li>
         <li><a href="#">3</a></li>
         <li><a href="#">4</a></li>
         <li><a href="#">5</a></li>
      </ul>
   </div> -->
   <!-- END WRAPPER -->
   <!-- JAVASCRIPTS -->
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