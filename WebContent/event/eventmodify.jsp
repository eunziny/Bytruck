<%@page import="vo.Event"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String root = request.getContextPath();
%>
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
<%
	Event event = (Event) request.getAttribute("event");
	String imgpath = event.getImgpath();

	if (imgpath != null) {
		int lastIndex = imgpath.lastIndexOf("\\");
		imgpath = imgpath.substring(lastIndex + 1);
	}
%>
</head>
<style>
.board {
	padding-top: 10%;
}

.board .page-header {
	margin-top: 0;
}

#cancel, #register {
	margin-right: 10px;
}

.result {
	display: none;
}
</style>
<title>eventform.jsp</title>
</head>
<body>
	<div class="row">
		<div class="container-fluid">
			<div class="col-lg-12">
				<header>
					<jsp:include page="/template/form.jsp" />
				</header>
			</div>
		</div>
	</div>
	<!-- <script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
	<script>
	$(function() {
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
		$('button#cancel').click(function() {
				alert("취소하시면 작성하신 글이 사라지게 됩니다. \n 정말 작성 취소하시겠습니까?");
				location.href="<%=root%>/event/event.jsp";
			});
		});
	</script>
	<div class="board">
		<div class="row">
			<div class="container">
				<!-- BREADCRUMBS -->
				<ol class="breadcrumb link-accent separator-arrow">
					<li><a href="<%=root%>/index.jsp" title="Home"><i
							class="fa fa-home"></i></a></li>
					<li><a href="<%=root%>/event/event.jsp">이벤트 소개</a></li>
					<li class="active">이벤트 수정</li>
				</ol>
				<br>
				<!-- END BREADCRUMBS -->
				<!-- BASIC INPUT -->
				<div class="page-header">
					<div class="row">
						<div class=col-lg-12">
							<h1 align="center">
								<b>EVENT</b>
							</h1>
							<p align="center">
								<b>수정할 EVENT 내용을 작성해주세요.</b>
							</p>
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h2 class="panel-title section-heading no-margin">이벤트 수정</h2>
					</div>
					<div class="panel-body">
						<form class="formwrite" action="<%=root%>/eventupdate.bt?id=<%=session.getAttribute("loginInfo") %>&num=<%=event.getNo()%>"
							method="post" enctype="multipart/form-data">
							<div class="form-horizontal">
								<div class="form-group">
									<label class="col-md-2 control-label">제목</label>
									<div class="col-md-10">
										<input type="text" class="form-control" name="title"
											placeholder="제목을 입력하세요." value="<%= event.getTitle()%>">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label">날짜</label>
									<div class="col-md-10">
										<span class="input-group-addon"><i
											class="fa fa-calendar"></i></span> <input type="date"
											class="form-control" name="event_date" id="event_date"
											placeholder="Openday(ex.YYYY/MM/DD)" value="<%=event.getEvent_date()%>">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label">상세설명</label>
									<div class="col-md-10">
										<textarea class="summernote" name="detail"
											placeholder="내용을 입력하세요." rows="10"><%=event.getDetail() %></textarea>
									</div>
								</div>
							<div class="form-group">
                        <label class="col-md-2 control-label">기존첨부파일</label>
                        <div class="col-md-10">
                            <text name="oldfile" type="file"><%if(event.getImgpath()!=null){%><%=event.getImgpath()%><%}else{%>첨부파일 없음<%} %></text><br>
                         </div>
                         </div>
                         <div class="form-group">
                         <label class="col-md-2 control-label">새첨부파일</label>
                        	<div class="col-md-10">
                           <input type="file" name="newfile" value="filefile"><br>
                        </div>
                     </div>
							</div>
							<div
								class="button-group col-lg-offset-2 col-lg-8 col-lg-offset-2">
								<button class="btn btn-success col-lg-4 col-lg-offset-1"
									id="eventregister" type="submit">수정</button>
								<button class="btn btn-danger col-lg-4 col-lg-offset-1"
									type="button" id="cancel">취소</button>
							</div>
						</form>
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