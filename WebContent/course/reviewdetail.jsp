<%@page import="vo.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<head>
<title>reviewdetail.jsp</title>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
</head>
<%
Review review = (Review)request.getAttribute("review");
%>
<style>
.board {
   padding-top: 10%;
}

.board .page-header {
   margin-top: 0;
}
</style>
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
            <ol class="breadcrumb link-accent separator-arrow">
               <li><a href="<%=root%>/index.jsp" title="Home"><i
                     class="fa fa-home"></i></a></li>
               <li><a href="<%=root%>/course/viewcourse.jsp" title="Home">코스소개</a></li>
               <li class="active">코스짜기</li>
               <li><a href="<%=root%>/course/reviewboard.jsp" title="Home">코스후기</a></li>
            </ol>
            <div class="page-header">
               <div class="row">
                  <div class=col-lg-12>
                     <h1 align="center">
                        <b>COURCE</b>
                     </h1>
                     <p align="center">
                        <b>다른 사람들과 여행을 공유하세요</b>
                     </p>
                  </div>
               </div>
            </div>
            <div class="container">
               <div class="row">
                  <div class="col-sm-2 sidenav">
                  </div>
                  <div class="col-sm-10">
                     <div class="col-md-9">
                        <%@include file="reviewviewmap.jsp"%><br>
                        <label>제목</label>&nbsp;&nbsp;<input type="text"
                           class="form-control" required readonly value=<%=review.getTitle()%>><br>
                        <label>게시일</label>&nbsp;&nbsp;<input type="text"
                           class="form-control" required readonly value=<%=review.getPosted()%>><br>
                        <label>여행일자</label>&nbsp;&nbsp;<input type="text"
                           class="form-control" required readonly value=<%=review.getTrip_date()%>><br>      
                        <label>일정</label><br>
                         <div class="form-group">
                        <div class="col-md-12" align="left">
                           <p><%=review.getDetail()%></p>
                        </div>
                     </div>
                      <%--   <textarea class="form-control" rows="8" readonly><%=review.getDetail()%></textarea> --%><br> 
                        <a href="<%=root%>/course/reviewboard.jsp"><button type="submit" class="btn btn-default"
                           style="margin: 10px auto 0; display: block; width: 150px; font-weight: bold; padding: 0; line-height: 32px;">뒤로가기</button></a>   
                     </div>
                     <div class="col-md-3 col-md-9" >
                        <%@include file="/template/top123.jsp"%>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <br>
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