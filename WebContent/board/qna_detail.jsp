<%@page import="vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%String root = request.getContextPath();%>
<%
Board board = (Board)request.getAttribute("board");
%>
<html>
<title>qna_detail</title>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<%=root%>/js/bootstrap.min.js"></script>
<header>
   <jsp:include page = "/template/header.jsp"/>
</header>

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
.button-group {
   padding-top: 10%;
}
#list, #update, #delete {
   margin-right: 10%;
}
</style>
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
               <li><a href="<%=root%>/board/qna.jsp">Q&A</a></li>
            </ol>
            <br>
            <!-- END BREADCRUMBS -->
            <!-- BASIC INPUT -->
            <div class="page-header">
               <div class="row">
                  <div class=col-lg-12>
                     <h1 align="center">
                        <b>Q&A</b>
                     </h1>
                     <p align="center">
                        <b>BYTRUCK에 대한 궁금한 점을 문의 하세요.</b>
                     </p>
                  </div>
               </div>
            </div>
            <div id="content">
            <div class="panel panel-default" >
               <div class="panel-heading">
                  <h2 class="panel-title section-heading no-margin" id="no">글번호: <%=board.getNo()%></h2>
                  
               </div>
               <div class="panel-heading">
                  <h2 class="panel-title section-heading no-margin">날짜: <%=board.getPosted()%></h2> 
               </div>
               <div class="panel-heading">
                <h2 class="panel-title section-heading no-margin">제목: <%=board.getTitle()%></h2>
               </div>
               <div class="panel-body">
                  <div class="form-horizontal">
                     <div class="form-group">
                        <div class="col-md-12" align="center">
                           <p><%=board.getDetail() %></p>
                        </div>
                     </div>
                  </div>
                  <div class="button-group col-lg-offset-4 col-lg-4 col-lg-offset-4"
                     align="center">
                     <a class="btn btn-success" id="list"
                        href="<%=root%>/board/qna.jsp">목록</a>
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