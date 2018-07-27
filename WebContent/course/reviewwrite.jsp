<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<head>
<title>reviewwrite.jsp</title>
<!-- <script
src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"
src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"
src="../js/bootstrap.min.js"></script> -->
<!--  부트스트랩과 제이쿼리 라이브러리를 사용하기 위한 선언  -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link href="<%=request.getContextPath()%>/dist/summernote.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/dist/summernote.js"></script>
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
               <%@include file="/template/form.jsp"%>
            </header>
         </div>
      </div>
   </div>
<script>
	$(function() {
		$('a[id=cancel]').click(function() {
			alert("취소하시면 작성하신 글이 사라지게 됩니다. \n 정말 작성 취소하시겠습니까?");
			location.href="<%=root%>/course/reviewboard.jsp";
	});
		
		$('form#formwrite').submit(function() {
			$.ajax({
				url : "<%=root%>/reviewwrite.bt?id=<%=session.getAttribute("loginInfo") %>",
				method : 'post',
				data : $('form').serialize(),
				success : function(data) {
					data = data.trim();
					if (data == '1') { //글쓰기 성공
						alert("여행후기가 등록되었습니다.");
						location.href="<%=root%>/course/reviewboard.jsp";
						/* var $triggerObj = $("nav>ul li.board");
						$triggerObj.trigger('click'); */
					} else if (data == '-1') { //글쓰기 실패
						alert("후기가 등록되지 않았습니다.");
					}
				}
			});
			return false;
	});

	
		$('.summernote').summernote({ // summernote를 사용하기 위한 선언
            height: 400,
       callbacks: { // 콜백을 사용
                // 이미지를 업로드할 경우 이벤트를 발생
           onImageUpload: function(files, editor, welEditable) {
              sendFile(files[0], this);
          }
       }
    });     
 		function sendFile(file, editor, welEditable) {
            // 파일 전송을 위한 폼생성
          data = new FormData();
           data.append("uploadFile", file);
          // alert(data);
           $.ajax({ // ajax를 통해 파일 업로드 처리
               data : data,
               type : "POST",
               url : "<%=root%>/adboard/summernote_imageUpload.jsp",
               cache : false,
               contentType : false,
               processData : false,
               success : function(data) { // 처리가 성공할 경우
                    // 에디터에 이미지 출력
                    //alert("성공???? >>> " + data.url)   ;
                  $(editor).summernote('editor.insertImage', data.url);
               }, 
               error : function(e) {alert("에러!" + e);}
           });
       }
		
});
</script>   
   <div class="board">
      <div class="row">
         <div class="container">
            <ol class="breadcrumb link-accent separator-arrow">
               <li><a href="<%=root%>/index.jsp" title="Home"><i
                     class="fa fa-home"></i></a></li>
               <li><a href="<%=request.getContextPath()%>/courselist.bt" title="Home">코스소개</a></li>
               <li><a href="<%=request.getContextPath()%>/course/coursemakedetail.jsp" title="Home">코스짜기</a></li>
               <li><a href="<%=root%>/course/reviewboard.jsp" title="Home">코스후기</a></li>
               <li class="active">코스후기 등록</li>
            </ol>
            <div class="page-header">
               <div class="row">
                  <div class=col-lg-12">
                     <h1 align="center">
                        <b>COURCE</b>
                     </h1>
                     <p align="center">
                        <b>특별한 여행후기를 공유하세요.</b>
                     </p>
                  </div>
               </div>
            </div>
            <div class="container">
               <div class="row">
               <form id="formwrite">
                  <div class="col-sm-2 sidenav">
                     <div class="result"></div>
                     <h5>여행날짜를 선택해 주세요</h5>
                     <div class="dropdown">
                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                        <input type="date" class="form-control" name="trip_date"
                           id="trip_date" placeholder="Openday(ex.YYYY/MM/DD)">
                     </div>
                  </div>
                  <div class="col-sm-10">
                   <div class="col-md-9">
						<label>위치</label>
							<%@include file="../foodtruck/truckselmap.jsp"%>
								<textarea style="display: none" id="xlocation"
									name="xlocation"></textarea>
								<textarea style="display: none" id="ylocation"
									name="ylocation"></textarea>
						</br>			
						<label>후기제목 :</label>&nbsp;&nbsp;<input type="text"
                           class="form-control" name="title" required><br> 
                        <label>상세후기:</label><br>
                        <textarea class="summernote" name="detail" rows="10"></textarea>
                        <br> 
                    <div class="button-group col-lg-offset-2 col-lg-8 col-lg-offset-2">
							<button class="btn btn-success col-lg-4 col-lg-offset-1 type="submit">작성</button>
							<a  class="btn btn-danger col-lg-4 col-lg-offset-1" type="button" id="cancel">취소</a>
					</div>
					</form>
					<br>
					<br>
					<br>
                     </div>
                      <div class="col-md-3">
                        <%@include file="/template/top123.jsp"%>
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