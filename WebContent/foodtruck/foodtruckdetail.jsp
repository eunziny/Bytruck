<%@page import="vo.Foodtruck_Location"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<head>
<title>foodtruckdetail.jsp</title>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<style>
.board {
   padding-top: 10%;
}

.board .page-header {
   margin-top: 0;
}

a:hover {
   background-color: pink;
}
</style>
</head>
<%
Foodtruck_Location fl = (Foodtruck_Location)request.getAttribute("fl");
String imgpath = fl.getImgpath();

if(imgpath != null){
    int lastIndex = imgpath.lastIndexOf("\\");
    imgpath = imgpath.substring(lastIndex+1);
}
System.out.println("푸드트럭 board : " +fl);
%>
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
   <div class="board">
      <div class="row">
         <div class="container">
            <!-- BREADCRUMBS -->
            <ol class="breadcrumb link-accent separator-arrow">
               <li><a href="<%=root%>/index.jsp" title="Home"><i
                     class="fa fa-home"></i></a></li>
               <li><a href="<%=root%>/foodtruck/foodtruck.jsp">푸드트럭 소개</a></li>
               <li><a href="<%=root%>/foodtruck/foodboard.jsp">푸드트럭 등록</a></li>
            </ol>
            <br>
            <!-- END BREADCRUMBS -->
            <!-- BASIC INPUT -->
            <div class="page-header">
               <div class="row">
                  <div class=col-lg-12">
                     <h1 align="center">
                        <b>FOOD TRUCK</b>
                     </h1>
                     <p align="center">
                        <b>FOOD TRUCK을 자세히 살펴보세요.</b>
                     </p>
                  </div>
               </div>
            </div>
            <div class="panel panel-default">
               <div class="panel-heading">
                  <h2 class="panel-title section-heading no-margin">푸드트럭 제목  ▶  <%=fl.getTitle()%></h2>
               </div>
               <div class="panel-heading">
                  <h2 class="panel-title section-heading no-margin">푸드트럭 날짜  ▶  <%=fl.getOpendate()%></h2>
               </div>
               <div class="panel-body">
                  <div class="form-horizontal">
                     <div class="form-group">
                        <div class="col-md-12" align="center">
                        </div>
                     </div>
                     <div class="form-group">
                        <div class="col-md-12" align="center">
                           <p><img src="<%=root%>/upload/<%=imgpath%>" class="img-rounded"
				alt="NO IMAGE" height="300" width="300"></img></p>
                        </div>
                     </div>
                     <div class="form-group">
                        <div class="col-md-12" align="center">
                           <p><%=fl.getDetail()%></p>
                        </div>
                     </div>
                     <div class="form-group">
                        <div class="col-md-12" align="center">
                           <h2>
                              <a href="<%=root%>/foodtruck/truckviewmap.jsp?no=<%=fl.getNo()%>">위치가
                                 궁금하신가요?</a>
                           </h2>
                        </div>
                     </div>
                  </div>
                  <div class="button-group col-lg-offset-4 col-lg-4 col-lg-offset-4"
                     align="center">
                     <a class="btn btn-success" id="register"
                        href="<%=root%>/foodtruck/foodtruck.jsp">목록</a>
                        <%if(fl.getUser_id().equals(session.getAttribute("loginInfo"))) { %>
                        <a class="btn btn-warning" id="modify" href="<%=root%>/foodtruckupdatedetail.bt?no=<%=fl.getNo()%>">수정</a>
                        <% }%>
                  </div>
               </div>
            </div>
         </div>
      </div>
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