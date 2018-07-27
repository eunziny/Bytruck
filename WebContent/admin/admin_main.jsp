<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String root = request.getContextPath();
%>
</head>	
</head>
<style>
.content {
	padding-top: 50%;
}
</style>
<body>
	<!-- Bread crumb -->
	<div class="aside">
		<jsp:include page ="/template/admin_aside.jsp"/>
	</div>
		<div class="content">
			<p>"관리자 페이지입니다."</p>
		</div>
</body>
</html>