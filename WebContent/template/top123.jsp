<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<html>
<head>
<%
   String root1 = request.getContextPath();
%>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<%-- <link rel="icon" href="<%=root1%>/images/favicon.ico">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="<%=root1%>/css/bootstrap.min.css" rel="stylesheet"> --%>

<%-- <link href="<%=root1%>/css/carousel.css" rel="stylesheet"> --%>

<%-- <link href="<%=root1%>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=root1%>/css/carousel.css" rel="stylesheet">
<!-- <script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<script src="<%=root1%>/js/ie-emulation-modes-warning.js"></script>
<!-- <script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
<script src="<%=root1%>/js/bootstrap.min.js"></script>
<script src="<%=root1%>/js/docs.min.js"></script> --%>

<script src="<%=root1%>/js/ie10-viewport-bug-workaround.js"></script>
<title>index.jsp</title>
</head>
<body>
   <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
         <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
         <li data-target="#myCarousel" data-slide-to="1"></li>
         <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
      <!-- Wrapper for slides -->
      <div class="carousel-inner">
         <div class="item active">
            <a href="../course/reviewdetail.jsp" ><img src="<%=root1 %>/images/with1.jpg" style='height:100%; width:100%;'  alt="top1"></a>
            <div class="carousel-caption">
               <h3>TOP1</h3>
               <p>여기 좋음!!</p>
            </div>
         </div>
         <div class="item">
            <a href="../course/reviewdetail.jsp" ><img src="<%=root1 %>/images/with2.jpg" style='height:100%; width:100%;'  alt="top2"></a>
            <div class="carousel-caption">
               <h3>TOP2</h3>
               <p>여기 더 좋음!!</p>
            </div>
         </div>
         <div class="item">
            <img src="<%=root1 %>/images/with3.jpg" alt="top3">
            <div class="carousel-caption">
               <h3>TOP3</h3>
               <p>여기는 더더더 좋음</p>
            </div>
         </div>
      </div>
      <!-- Left and right controls -->
      <a class="left carousel-control" href="#myCarousel" data-slide="prev"
         style="top: 50%; margin-top: -22px;"> <span
         class="glyphicon glyphicon-chevron-left"></span> <span
         class="sr-only">Previous</span>
      </a> <a class="right carousel-control" href="#myCarousel"
         data-slide="next" style="top: 50%; margin-top: -22px;"> <span
         class="glyphicon glyphicon-chevron-right"></span> <span
         class="sr-only">Next</span>
      </a>
   </div>
</body>
</html>