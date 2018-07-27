<%@page import="vo.Tripcourse"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String result = (String)request.getAttribute("result");%>
<%List<Tripcourse> list = (List)request.getAttribute("list");%>
<head>
<title>coursesellist.jsp</title>
<head>
<meta charset="utf-8">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
</head>
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
               <li><a href="<%=request.getContextPath()%>/courselist.bt" title="Home"><i class="fa fa-home"></i></a></li>
               <li class="active">코스소개</li>
               <li><a href="<%=request.getContextPath()%>/course/coursemakedetail.jsp" title="Home">코스짜기</a></li>
               <li><a href="<%=request.getContextPath()%>/course/reviewboard.jsp" title="Home">코스후기</a></li>
            </ol>
            <div class="page-header">
               <div class="row">
                  <div class=col-lg-12">
                     <h1 align="center">
                        <b>COURCE</b>
                     </h1>
                     <p align="center">
                        <b>자전거 여행코스를 소개합니다.</b>
                     </p>
                  </div>
               </div>
            </div>
            <div class="container">
               <div class="row">
                  <div class="col-lg-12">
                     <%@include file="/template/top123.jsp"%>
                  </div>
               </div>
            </div>
            <div class="container">
               <div class=col-lg-12">
                  <h3 align="left">
                     <b>더 다양한 COURCE를 만나보세요.</b>
                  </h3>
               </div>
               <br>
                  <div class="col-lg-3">
                     <div class="product-item">
                        <%-- <%@include file="courseviewmap.jsp"%> --%>
                        <div class="info">
                        <a href="<%=request.getContextPath()%>/coursedetail.bt?num=1" title="Colorful Abstract Cushion">
                        <img src="images/map1.PNG" height="220px" width="220px">
                           <h4 class="title">성남시에 자전거 모임 잇나요?~</h4></a>
                           <label>ID : 오재원</label><br>
                           <label>동행 여부 : 참여여행</label>
                        </div>
                     </div>
                  </div>
                  <div class="col-lg-3">
                     <div class="product-item">
                        <%-- <%@include file="courseviewmap.jsp"%> --%>
                        <div class="info">
                        <a href="<%=request.getContextPath()%>/coursedetail.bt?num=2" title="Colorful Abstract Cushion">
                        <img src="images/map2.PNG" height="220px" width="220px">
                           <h4 class="title">날씨도 좋은데 자전거 같이타요</h4></a>
                           <label>ID : 곽빈</label><br>
                           <label>동행 여부 : 참여여행</label>
                        </div>
                     </div>
                  </div>
                  <div class="col-lg-3">
                     <div class="product-item">
                        <%-- <%@include file="courseviewmap.jsp"%> --%>
                        <div class="info">
                        <a href="<%=request.getContextPath()%>/coursedetail.bt?num=3" title="Colorful Abstract Cushion">
                        <img src="images/map3.PNG" height="220px" width="220px">
                           <h4 class="title">한강 끼고 같이 자전거 타실분~</h4></a>
                           <label>ID : 이영하   </label><br>
                           <label>동행 여부 : 참여여행</label>
                        </div>
                     </div>
                  </div>
                                 
               <div class="row">
               <% for(int i=3; list.size() > i; i++){ %>
                  <div class="col-lg-3">
                     <div class="product-item">
                        <%-- <%@include file="courseviewmap.jsp"%> --%>
                        <div class="info">
                           <img src="images/map4.PNG" height="220px" width="220px">
                           <h4 class="title">
                              <a href="<%=request.getContextPath()%>/coursedetail.bt?num=<%=list.get(i).getNo()%>" title="Colorful Abstract Cushion">
                              <%=list.get(i).getTitle() %></a>
                           </h4>
                           <label>ID : <%=list.get(i).getUser()%></label><br>
                           <label>동행 여부 : <%=list.get(i).getWith()%></label>
                        </div>
                     </div>
                  </div>
                  <%} %>
               </div>
            </div>
         </div>
      </div>
   </div>
<!--    <div class="col=lg-2 col-lg-offset-5">
      <ul class="pagination">
         <li><a href="#">1</a></li>
         <li><a href="#">2</a></li>
         <li><a href="#">3</a></li>
         <li><a href="#">4</a></li>
         <li><a href="#">5</a></li>
      </ul>
   </div> -->
   <div class="foot">
      <div class="row">
         <div class="container-fluid">
            <div class="col-lg-12">
               <footer>
                  <%@include file="../template/footer.jsp"%>
               </footer>
            </div>
         </div>
      </div>
   </div>
</body>
</html>