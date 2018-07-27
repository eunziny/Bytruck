<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String root = request.getContextPath();
%>
<title>qna_write.jsp</title>
<head>
<!--  부트스트랩과 제이쿼리 라이브러리를 사용하기 위한 선언  -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- include summernote-ko-KR -->
<%-- <script src="<%=root%>/dist/lang/summernote-ko-KR.js"></script> --%>
<!-- include summernote css/js-->
<link href="<%=root%>/dist/summernote.css" rel="stylesheet">
<script src="<%=root%>/dist/summernote.js"></script>
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
<script>
          $(function() {
         		$('a[id=cancel]').click(function() {
    				alert("취소하시면 작성하신 글이 사라지게 됩니다. \n 정말 작성 취소하시겠습니까?");
    				location.href="<%=root%>/board/qna.jsp";
    			});
           		
        		$('form#formwrite').submit(function() {
        			console.log("작성할거야");
        			$.ajax({
        				url : '<%=root%>/boardwrite.bt?id=<%=session.getAttribute("loginInfo") %>&type=1',
        				method : 'post',
        				data : $('form').serialize(),
        				success : function(data) {
        					data = data.trim();
        					if (data == '1') { //글쓰기 성공
        						alert("글이 등록되었습니다.");
        						location.href="<%=root%>/board/qna.jsp";
        						/* var $triggerObj = $("nav>ul li.board");
        						$triggerObj.trigger('click'); */
        					} else if (data == '-1') { //글쓰기 실패
        						alert("글이 등록되지 않았습니다.");
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
      		function sendFile(file, editor,welEditable) {
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
	<div class="row">
		<div class="container-fluid">
			<div class="col-lg-12">
				<header>
					<jsp:include page="/template/form.jsp" />
				</header>
			</div>
		</div>
	</div>
	<div class="board">
		<div class="row">
			<div class="container">
			<div class="col-lg-12">
				<!-- BREADCRUMBS -->
				<ol class="breadcrumb link-accent separator-arrow">
					<li><a href="<%=root%>/index.jsp" title="Home"><i
							class="fa fa-home"></i></a></li>
					<li class="active">Q&A</li>
					<li><a href="<%=root%>/board/faq.jsp" title="Home">FAQ</a></li>
					<li><a href="<%=root%>/chatting/chat.jsp" title="Home">타임라인</a></li>
				</ol>
				<div class="page-header">
					<div class="row">
						<div class=col-lg-12">
							<h1 align="center">
								<b>Q&A</b>
							</h1>
							<p align="center">
								<b>Q&A를 작성하세요.</b>
							</p>
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h2 class="panel-title section-heading no-margin">Q&A 작성</h2>
					</div>
					<div class="panel-body">
						<form id="formwrite">
							<div class="form-horizontal">
								<div class="form-group">
									<label class="col-md-1 control-label">제목</label>
									<div class="col-md-11">
										<input type="text" class="form-control" name="title"
											placeholder="제목을 입력하세요">
									</div>
								</div>
<!-- 								<div class="form-group">
									<label class="col-md-1 control-label">날짜</label>
									<div class="col-md-11">
										<span class="input-group-addon"><i
											class="fa fa-calendar"></i></span> <input type="date"
											class="form-control" name="posted" id="posted"
											placeholder="Openday(ex.YYYY/MM/DD)">
									</div>
								</div> -->
								<div class="form-group">
									<label class="col-md-1 control-label">내용</label>
									<div class="col-md-11">
										<textarea class="summernote" name="detail"
											placeholder="내용을 입력하세요" rows="15"></textarea>
									</div>
								</div>
							</div>
							<div class="button-group col-lg-offset-2 col-lg-8 col-lg-offset-2">
									<button class="btn btn-success col-lg-4 col-lg-offset-1 type="submit">작성</button>
									<a class="btn btn-danger col-lg-4 col-lg-offset-1"
										type="button" id="cancel">취소</a>
							</div>
						</form>
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