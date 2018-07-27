<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.board {
	padding-top: 10%;
}

.board .page-header {
	margin-top: 0;
}

.posted {
	padding-top: 10%;
}

.form-group {
	width: 40%;
}

.content {
	width: 60%;
}

.bt {
	padding-top: 2%;
}

@media ( max-width : 768px) {
	.chat_list .list-group-item {
		min-height: inherit;
	}
}

.chat_list .list-group-item-text {
	word-wrap: break-word;
	display: flex;
	overflow: auto;
}

.chat_list .pull-left {
	/* width: 55px; */
	text-align: center;
}

.chat_list {
	/* padding-top : 10%; */
	margin-top: 10%;
	width: 500px;
	height: 200px;
	overflow: auto;
}

.page {
	margin-top: 10%;
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
	<script>
	$(function(){
		function ajaxCall(){
			$.ajax({
				url: '<%=root%>/timelineview.bt',	
				dataType:'json',
				success:function(data){
					console.log(data);
					var id=[]; var posted=[]; var msg=[];
					for(var i=0;i<data.chatting.length;i++){
						id[i]=data.chatting[i].user_id;
						posted[i]=data.chatting[i].posted;
						msg[i]=data.chatting[i].message;
					}
			         if(data!=null){
			        	var id = $('ul#list');
				        html="";
				        for (var i=0;i<data.chatting.length;i++) {
				            html += '<li class="list-group-item"><div><label>' + data.chatting[i].user_id
				            + '</label></div><small class="text">' + data.chatting[i].posted
				            + '</small> <div><p class="list-group-item-text">' + data.chatting[i].message
				            +'</p></div></li>'; 
				        }		
				        id.html(html).show();
			        } 
				}
			});
	}
	
	setInterval(ajaxCall(), 3000);	
		  
	  $('a#okbtn').click(function(){
		  $.ajax({
				url: '<%=root%>/timelinewrite.bt',
				method: 'POST',			
				data: $('form#timeline').serialize(),
				success:function(data){
					var jsonObj = JSON.parse(data.trim());
					if(jsonObj.status == '1'){
						alert('등록 성공!');
						$('textarea[name=content]').html("").show();
						location.href="<%=root%>/chatting/chat.jsp"
					}else if(jsonObj.status == '-1'){
						alert('등록 실패하셨습니다.');
						$('textarea[name=content]').html("").show();
					}
				}
			});
	  });
	});
   </script>
	<div class="board">
		<div class="row">
			<div class="container">
				<ol class="breadcrumb link-accent separator-arrow">
					<li><a href="<%=root%>/index.jsp" title="Home"><i
							class="fa fa-home"></i></a></li>
					<li><a href="<%=root%>/board/qna.jsp" title="Home">Q&A</a></li>
					<li><a href="<%=root%>/board/faq.jsp" title="Home">FAQ</a></li>
					<li class="active">타임라인</li>
				</ol>
				<div class="page-header">
					<div class="row">
						<div class=col-lg-12">
							<h1 align="center">
								<b>타임라인</b>
							</h1>
							<p align="center">
								<b>자유롭게 이야기를 나누는 공간입니다.</b>
							</p>
						</div>
					</div>
				</div>
				<div class="col-lg-offset-3 col-lg-6 col-lg-offset-3">
					<form id="timeline">
						<div class="id">
							<div class="form-group">
								<label>아이디</label>
								<text type="text" class="form-control" name="id" readonly><%=session.getAttribute("loginInfo")%></text>
							</div>
						</div>
						<div class="content">
							<textarea cols="20" placeholder="내용을 입력하세요. " name="content"
								class="form-control"></textarea>
						</div>
						<div class="bt">
							<a class="btn btn-primary pull-left" id="okBtn">등록</a>
							<a class="btn btn-success pull-left" href="<%=root%>/chatting/chat.jsp">새로고침</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-offset-3 col-lg-6 col-lg-offset-3">
				<div class="chat_list">
					<ul class="list-group" id="list">

					</ul>
				</div>
			</div>
		</div>
	</div>
	<br>
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
</body>
</html>