<%@page import="vo.Advertisement"%>
<%@page import="vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
   String root = request.getContextPath();
%>   
<head>
<title>ad_detail.jsp</title>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<%=root%>/js/bootstrap.min.js"></script>
<%
   Advertisement ad = (Advertisement)request.getAttribute("ad");
%>
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
<body>
   <div class="row">
      <div class="container-fluid">
         <div class="col-lg-12">
            <header>
               <jsp:include page ="/template/header.jsp"/>
            </header>
         </div>
      </div>
   </div>
   <div class="table table-hover table-condensed">
   <div class="board">
      <div class="row">
         <div class="container">
            <!-- BREADCRUMBS -->
            <ol class="breadcrumb link-accent separator-arrow">
               <li><a href="<%=root%>/index.jsp" title="Home"><i
                     class="fa fa-home"></i></a></li>
               <li><a href="<%=root%>/event/event.jsp">이벤트소개</a></li>
               <li><a href="<%=root%>/adboard/normal_ad.jsp">배너광고신청</a></li>
            </ol>
            <br>
            <!-- END BREADCRUMBS -->
            <!-- BASIC INPUT -->
            <div class="page-header">
               <div class="row">
                  <div class=col-lg-12>
                     <h1 align="center">
                        <b>배너광고 신청</b>
                     </h1>
                     <p align="center">
                        <b>해당 광고신청 시, 로그인할 때 광고가 보여집니다.</b>
                     </p>
                  </div>
               </div>
            </div>
            <div id="content">
            <div class="panel panel-default" >
               <div class="panel-heading">      
                  <h2 class="panel-title section-heading no-margin">글번호: <%=ad.getNo()%></h2>
                  
               </div>
               <div class="panel-heading">
                  <h2 class="panel-title section-heading no-margin"> 제목:<%=ad.getTitle()%></h2> 
               </div>
               <div class="panel-heading">
                <h2 class="panel-title section-heading no-margin">아이디: <%=ad.getUser_id()%></h2>
               </div>
               <div class="panel-body">
                  <div class="form-horizontal">
                     <div class="form-group">
                        <div class="col-md-12" align="center">
                           <p><%=ad.getDetail() %></p>
                        </div>
                     </div>
                  </div>
                  <div class="button-group col-lg-offset-4 col-lg-4 col-lg-offset-4"
                     align="center">
                     <a class="btn btn-success" id="register"
                        href="<%=root%>/adboard/normal_ad.jsp">목록</a>
                  </div>
               </div>
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