<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<style>

.board {
   padding-top: 10%;
}

.board .page-header {
   margin-top: 0;
}
</style>
<title>faq.jsp</title>
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
               <li><a href="<%=root%>/board/qna.jsp" title="Home">Q&A</a></li>
               <li class="active">FAQ</li>
               <li><a href="<%=root%>/chatting/chat.jsp" title="Home">타임라인</a></li>
            </ol>
            <div class="page-header">
               <div class="row">
                  <div class=col-lg-12">
                     <h1 align="center">
                        <b>FAQ</b>
                     </h1>
                     <p align="center">
                        <b>자주 묻는 질문입니다.</b>
                     </p>
                  </div>
               </div>
            </div>
            <!-- TOP FAQs -->
            <h3>
               <strong>TOP 5 질문</strong>
            </h3>
            <div class="panel-group panel-group-faq top-faq">
               <div class="panel panel-minimal">
                  <div class="panel-heading">
                     <h4 class="panel-title" style="font-size: 20px;">
                        <a data-toggle="collapse" data-parent="#accordion"
                           href="#top-faq1" class="collapsed">Q. 바이트럭 이용가이드 # 자전거 코스 및
                           일정 짜기</a>
                     </h4>
                  </div>
                  <div id="top-faq1" class="panel-collapse collapse"
                     style="height: 0px;">
                     <div class="panel-body">
                        <p>A. 자전거 코스 및 일정 짜기</p>
                        <p>1. 하루 이동거리 초보 라이더의 경우 한시간에 12~15km/시 속도로 한시간에 10km이동하면
                           여유롭게 이동 할 수 있다.</p>
                        <p>2. 1시간을 기준으로 10km이동하면서 45분 라이딩, 15분 쉬었다 가면 좋습니다.</p>
                        <p>3. 자전거 여행중 가볼만한 관광지를 지도에 표시하고 하루에 3~4개 정도를 관람하시면 적당합니다.</p>

                     </div>
                  </div>
               </div>
               <div class="panel panel-minimal">
                  <div class="panel-heading">
                     <h4 class="panel-title" style="font-size: 20px;">
                        <a data-toggle="collapse" data-parent="#accordion"
                           href="#top-faq2" class="collapsed">Q. 바이트럭 이용가이드 # 푸드트럭
                           등록방법</a>
                     </h4>
                  </div>
                  <div id="top-faq2" class="panel-collapse collapse"
                     style="height: 0px;">
                     <div class="panel-body">
                        <p>A. FOODTRUCK게시판 - 푸드트럭 등록 에 들어가시면 등록 방법이 나와있습니다.</p>

                     </div>
                  </div>
               </div>
               <div class="panel panel-minimal">
                  <div class="panel-heading">
                     <h4 class="panel-title" style="font-size: 20px;">
                        <a data-toggle="collapse" data-parent="#accordion"
                           href="#top-faq3" class="collapsed">Q. 바이트럭 이용가이드 # 랭킹은 어떻게
                           정해지나요?</a>
                     </h4>
                  </div>
                  <div id="top-faq3" class="panel-collapse collapse"
                     style="height: 0px;">
                     <div class="panel-body">
                        <p>A. 좋아요 순위가 가장 높게 나온 순서대로 랭킹이 정해집니다.</p>

                     </div>
                  </div>
               </div>
               <div class="panel panel-minimal">
                  <div class="panel-heading">
                     <h4 class="panel-title" style="font-size: 20px;">
                        <a data-toggle="collapse" data-parent="#accordion"
                           href="#top-faq4" class="collapsed">Q. 바이트럭 이용가이드 # 배너광고를
                           하려면 어떻게 해야 하죠?</a>
                     </h4>
                  </div>
                  <div id="top-faq4" class="panel-collapse collapse"
                     style="height: 0px;">
                     <div class="panel-body">
                        <p>A. EVENT게시판 - 배너광고신청을 들어가시면 신청 할 수 있는 페이지가 나옵니다.</p>

                     </div>
                  </div>
               </div>
               <div class="panel panel-minimal">
                  <div class="panel-heading">
                     <h4 class="panel-title" style="font-size: 20px;">
                        <a data-toggle="collapse" data-parent="#accordion"
                           href="#top-faq5" class="collapsed">Q. 바이트럭 이용가이드 # 자전거 여행
                           준비물</a>
                     </h4>
                  </div>
                  <div id="top-faq5" class="panel-collapse collapse"
                     style="height: 0px;">
                     <div class="panel-body">
                        <p>A. 날씨를 고려하여 바람막이, 펌프, 자전거 응급 수리 도구, 비상식량, 식수, 전조등, 상비약 등을
                           챙기시면 좋습니다. 추가로 햇볓이 뜨거운 날에는 선크림을 발라주시는 게 도움이 됩니다.
                        <p>여행 짐 꾸리는 방법</p>
                        <p>1. 져지나 기능성 티셔츠 같이 빨리 마르는 기능성 소재의 옷을 입으면 긴 여행에서도 옷이 많이
                           필요하지 않습니다.</p>
                        <p>2. 카메라, 수첩, 지도, 선크림 등의 자주 사용하는 물건들을 꺼내기 쉽도록 별도로 넣느다.</p>
                        <p>3. 옷은 배낭에 넣을 때 돌돌 말아서 넣는다.</p>
                        <p>4. 비밀봉투나 지퍼백을 몇 개 챙겨두면 여러 모로 유용하다.</p>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <!-- END MAIN -->
   <!-- FOOTER -->
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
   <!-- /.container -->
</body>
</html>