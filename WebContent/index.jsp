<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<body>
   <header>
      <%@include file="template/header.jsp"%>
   </header>
   <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
         <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
         <li data-target="#myCarousel" data-slide-to="1"></li>
         <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
         <div class="item active">
            <img src="images/main_illu.jpg" alt="First slide">
            <div class="container"></div>
         </div>
         <div class="item">
            <img src="images/main_bike.jpg" alt="Second slide">
            <div class="container"></div>
         </div>
         <div class="item">
            <img src="images/main_truck.jpg" alt="Third slide">
         </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" role="button"
         data-slide="prev"
         style="top: 50%; margin-top: -25px; background: none"> <span
         class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span
         class="sr-only">Previous</span>
      </a> <a class="right carousel-control" href="#myCarousel" role="button"
         data-slide="next"
         style="top: 50%; margin-top: -25px; background: none"> <span
         class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
         <span class="sr-only">Next</span>
      </a>
   </div>
   <div class="container marketing">
      <div class="row">
         <div class="col-lg-4">
            <img class="img-circle" src="<%=root%>/images/20dae.gif"
               alt="Generic placeholder image"
               style="width: 230px; height: 230px;">
            <h2>힘내라 청춘</h2>
             <!-- <p>
             20대를 위한 특별한 이벤트가 준비되어 있습니다.<br>구매시 신분증 꼭 보여주세요 ^^
            </p> -->
            <p>
               <a class="btn btn-default" href="<%=root%>/eventdetail.bt?num=4"
                  role="button">자세히 보기 &raquo;</a>
            </p>
         </div>
         <!-- /.col-lg-4 -->
         <div class="col-lg-4">
            <img class="img-circle" src="<%=root%>/images/insta.gif"
               alt="Generic placeholder image"
               style="width: 230px; height: 230px;">
            <h2>인스타그램 공유</h2>
            <!-- <p>
           	 인스타그램에 음식사진을 찍어서 올리신 후 보여주시면 다음에 방문했을 때 사용가능한 10% 쿠폰을 드립니다.
            </p> -->
            <p>
               <a class="btn btn-default" href="<%=root%>/eventdetail.bt?num=11"
                  role="button">자세히 보기 &raquo;</a>
            </p>
         </div>
         <!-- /.col-lg-4 -->
         <div class="col-lg-4">
            <img class="img-circle" src="<%=root%>/images/vote.gif"
               alt="Generic placeholder image"
               style="width: 230px; height: 230px;">
            <h2>지방선거 투표 인증</h2>
            <!-- <p>
                          여러분의 소중한 한표를 선사하세요!<br>
                          투표 하시고 투표확인서 또는 손등에 도장을 찍어오시면 전메뉴 30%할인해드립니다.
            </p> -->
            <p>
               <a class="btn btn-default" href="<%=root%>/eventdetail.bt?num=8"
                  role="button">자세히 보기 &raquo;</a>
            </p>
         </div>
         <!-- /.col-lg-4 -->
      </div>
      <!-- <hr class="featurette-divider"> -->
      <br><hr><br>
      <div class="row featurette">
         <div class="col-md-7">
            <h2 class="featurette-heading">
               TOP1 COURSE REVIEW
               <h3>
                  <span class="text-muted">'한강여행 갔다왔어요~'</span>
               </h3>
               <br>
            </h2>
            <span class="lead">'자전거타고 한강 전체 돌고왔습니다. 굿이네요^0^' 자전거를 사랑하는
               서울인이라면 누구나 한번쯤 가봤을 코스~ 한강자전거 여행후기 게시물이 이달 TOP1로 선정 되었습니다^^ 아직 안가보신
               분들! 서울 외곽에 거주하시는 회원님들! )이번 주말은 한강자전거 여행 어떠신가요~? 강추합니다^^ (더욱 자세한
               후기글은 옆의 사진을 클릭해주세요)</span>
         </div>
         <div class="col-md-5">
            <br>
            <br>
            <br>
            <br>
            <br>
            <br> <a href="<%=request.getContextPath()%>/reviewdetail.bt?num=0"><img class="featurette-image img-responsive"
               data-src="holder.js/500x500/auto" alt="Generic placeholder image" src="<%=root%>/images/TOP11.PNG" /></a>
         </div>
      </div>
      <!-- <hr class="featurette-divider"> --><br><hr><br>
      <div class="row featurette">
         <div class="col-md-5">
            <br>
            <br>
            <br>
            <br>
            <br>
            <br> <a href="<%=request.getContextPath()%>/reviewdetail.bt?num=4"><img class="featurette-image img-responsive"
               data-src="holder.js/500x500/auto" alt="Generic placeholder image"
               href="#" src="<%=root%>/images/TOP2.PNG"></a>
         </div>
         <div class="col-md-7">
            <h2 class="featurette-heading">
               TOP2 COURSE REVIEW
               <h3>
                  <span class="text-muted">'아침고요수목원코스 (커플여행 강추!!)'</span>
               </h3>
               <br>
            </h2>
            <span class="lead">'자전거를 좋아하신다면 이코스 추천해드려요!!!! 야경도 이쁘고,
               너무좋았어요~~' 커플자전거 여행 후기가 이달의 TOP2 코스로 선정되었네요^^해외에 나갈 시간은 없고, 여행은 가고싶을
               때~ 가까운 근교로 여행가는건 어떨까요? 여행을 사랑하시는분, 자전거를 사랑하시는분 이 코스를 추천해드립니다^^(더욱
               자세한 후기글은 옆의 사진을 클릭해주세요)</span>
         </div>
      </div>
      <!-- <hr class="featurette-divider"> --><br><hr><br>
      <div class="row featurette">
         <div class="col-md-7">
            <h2 class="featurette-heading">
               TOP3 COURSE REVIEW
               <h3>
                  <span class="text-muted">'부산맛집기행(먹방여행)'</span>
               </h3>
               <br>
            </h2>
            <span class="lead">'제휴 되어 있는 푸드트럭들을 돌아다니며 비용은 싸게! 배는 부르게~ 먹고
               자전거로 운동하니 살은 빠지네요^^ 즐겁네요ㅎㅎ'이 달의 TOP3 코스는 부산맛집기행이네요^^ 회원님이 제휴된 푸드트럭을
               애용해주셨네요^^ 다른곳보다 가격도 저렴하고 파격적인 이벤트도 한번씩 진행하오니 많은 관심 부탁드립니다^^(더욱 자세한
               후기글은 옆의 사진을 클릭해주세요)</span>
         </div>
         <div class="col-md-5">
            <br>
            <br>
            <br>
            <br>
            <br>
            <br> <a href="<%=request.getContextPath()%>/reviewdetail.bt?num=2"><img class="featurette-image img-responsive"
               data-src="holder.js/500x500/auto" alt="Generic placeholder image"
               href="#" src="<%=root%>/images/TOP3.PNG" ></a>
         </div>
      </div>
      <br><hr><br>
      <h3>
         <strong>Developer</strong>
      </h3>
      <p>바이트럭을 위해 힘쓰고 있는 개발자들을 소개합니다.</p>
      <div class="row">
         <div class="col-lg-1" align="center"></div>
         <div class="col-lg-2" align="center">
            <img class="img-circle" src="<%=root%>/images/kms.jpg"
               alt="Generic placeholder image"
               style="width: 200px; height: 200px; padding: 10px">
            <h4>Kim MinSu</h4>
            <h5>DEVELOPER</h5>
         </div>
         <div class="col-lg-2" align="center">
            <img class="img-circle" src="<%=root%>/images/ssb.jpg"
               alt="Generic placeholder image"
               style="width: 200px; height: 200px; padding: 10px">
            <h4>Shin SolBi</h4>
            <h5>DEVELOPER</h5>
         </div>
         <div class="col-lg-2" align="center">
            <img class="img-circle" src="<%=root%>/images/lej.png"
               alt="Generic placeholder image"
               style="width: 200px; height: 200px; padding: 10px">
            <h4>Lee EunJin</h4>
            <h5>DEVELOPER</h5>
         </div>
         <div class="col-lg-2" align="center">
            <img class="img-circle" src="<%=root%>/images/ljm.jpg"
               alt="Generic placeholder image"
               style="width: 200px; height: 200px; padding: 10px">
            <h4>Lee JongMin</h4>
            <h5>DEVELOPER</h5>
         </div>
         <div class="col-lg-2" align="center">
            <img class="img-circle" src="<%=root%>/images/hcl.jpg"
               alt="Generic placeholder image"
               style="width: 200px; height: 200px; padding: 10px">
            <h4>Hwang ChaeLin</h4>
            <h5>DEVELOPER</h5>

         </div>
      </div>
      <hr>
   </div>
   <!-- /END THE FEATURETTES -->
   <!-- FOOTER -->
   <div class="foot">
      <div class="row">
         <div class="container-fluid">
            <div class="col-lg-12">
               <footer>
                  <%@include file="template/footer.jsp"%>
               </footer>
            </div>
         </div>
      </div>
   </div>
   <!-- /.container -->
</body>
</html>