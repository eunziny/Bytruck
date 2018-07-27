<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>summary.jsp</title>
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
				<!-- BREADCRUMBS -->
				<ol class="breadcrumb link-accent separator-arrow">
					<li><a href="<%=root%>/index.jsp" title="Home"><i
							class="fa fa-home"></i></a></li>
					<li class="active">개요</li>
					<li><a href="<%=root%>/brand/notice.jsp" title="Home">공지사항</a></li>

				</ol>
				<div class="page-header">
					<div class="row">
						<div class=col-lg-12">
							<h1 align="center">
								<b>BRAND</b>
							</h1>
							<p align="center">
								<b>BYTRUCK을 소개합니다.</b>
							</p>
						</div>
					</div>
				</div>
				<h4>
					<strong>브랜드 소개</strong>
				</h4>
				<p>끊임없이 성장하는 기업 바이트럭입니다.</p>
				<br>
				<div class="col-md-12">
					<img src="<%=root%>/images/brand1.jpg" height="300"
						class="col-md-5" /> <span class="col-md-7"> 전 세계를 향해 끊임없이
						도전하여 세계적인 글로벌No.1 문화관광 기업으로 나아가겠습니다.<br /> 바이트럭은 국내 및 해외에서 약
						4,500명(자회사 포함)이 넘는 직원이 여행서비스를 제공하는 국내 최대 여행기업으로, 20년 연속 국내 여행 1위를
						달성하고 있는 1등 여행종합기업입니다.<br /> 바이트럭은 최고의 여행전문 인력과 전 세계 30여개의 해외 법인과
						지사등 현지 네트워크를 통해 한 차원 높은 여행서비스를 제공함으로써 여행산업의 질적 양적 성장을 동시에 이끌어왔으며,
						고객 만족도와 여행사 선호도 조사에서 확고한 선두 지위를 확보하고 있습니다.<br /> <br /> 또한,
						바이트럭은 여행산업에 혁신적인 IT 시스템을 접목하여 생산성과 수익성을 높이고 시장 지위를 지속적으로 확장하며,
						2006년 세계 3대 증권시장 중 하나인 런던증권거래소(LSE)에 상장하여 하나투어 기업경영의 투명성과 신뢰도를
						국제적으로 공인 받는 동시에 세계적인 기업으로 성장하는 발판을 마련하였습니다.<br /> 하나투어는 여행업 중심의
						사업영역을 관광개발과 문화상품 제작∙유통업 등의 분야로 확장하여 2030년 글로벌 No.1<br /> 문화관광
						유통그룹으로 성장하고자 합니다. 인적자원의 글로벌 역량을 강화하고, 문화관광 유통 관련 사업의 역량을 강화하여 고객에게
						세계 최고의 문화관광 유통 서비스를 제공하는 기업으로 성장하겠습니다.
					</span>
				</div>
				<li style="list-style: none;">&nbsp;&nbsp;</li>
				<hr>
				<h4>
					<strong>주요 활동</strong>
				</h4>
				<p>바이트럭은 후원및 공공사업등 다양한 활동을 하고 있습니다.</p>
				<br>
				<div class="col-md-12">
					<img class="col-md-4" src="<%=root%>/images/brand2.jpg" width="250"
						height="200"> <img class="col-md-4"
						src="<%=root%>/images/brand3.jpg" width="250" height="200">
					<img class="col-md-4" src="<%=root%>/images/brand4.jpg" width="250"
						height="200">
				</div>
				<li style="list-style: none;">&nbsp;&nbsp;</li>
				<hr>
				<h4>
					<strong>기대 효과</strong>
				</h4>
				<p>바이트럭은 미래형 자전거 개발에 투자 하고있으며, 푸드트럭과 협약을 맺어 여행자와 사업자 모두가 행복하기를
					기대합니다.</p>
				<br>
				<div class="col-md-12">
					<img class="col-md-4" src="<%=root%>/images/brand5.jpg" width="250"
						height="200"> <img class="col-md-4"
						src="<%=root%>/images/brand6.jpg" width="250" height="200">
					<img class="col-md-4" src="<%=root%>/images/brand7.jpg" width="250"
						height="200">
				</div>
				<li style="list-style: none;">&nbsp;&nbsp;</li>
				<hr>
				<h3>
					<strong>Developer</strong>
				</h3>
				<p>바이트럭을 위해 힘쓰고 있는 개발자들을 소개합니다.</p>
				<li style="list-style: none;">&nbsp;&nbsp;</li>

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
		</div>
	</div>
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