<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String root = request.getContextPath();%>
<!DOCTYPE html>

    <title>qna.jsp</title>  
  

  
  <header>
 	<jsp:include page = "/template/header.jsp"/>
  </header>
 <style>
 	div.bt{
 		padding-left: 83%;
 		padding-top: 1%;
 	}
 </style>
<body>
<br>
<br>
<br>
<br>
<br>
<div class="container">
	<h2>Q&A</h2>
	<br>
	<br>
  <table class="table table-bordered" style="text-align:center">
    <thead>
      <tr>
      	
        <th style="width: 10%; text-align:center"> 번호</th>
        <th style="width: 50%; text-align:center"> 제목</th>
        <th style="width: 20%; text-align:center">등록일</th>
        <th style="width: 10%; text-align:center"> 조회</th>
		    
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>1</td>
        <td><a href="<%=root%>/qna_detail.jsp">2번째 페이지 입니다.</a></td>
        <td>2018.05.01</td>
        <td>10</td>
      </tr>
      <tr>
        <td>2</td>
        <td><a href="<%=root%>/qna_detail.jsp">이번주 일요일에 자전거 타고 여행을 떠날거에요...</a></td>
        <td>2018.05.01</td>
        <td>21</td>
      </tr>
      <tr>
        <td>3</td>
        <td><a href="<%=root%>/qna_detail.jsp">즐거운 일요일 바이트럭 고마워요!</a></td>
        <td>2018.05.01</td>
        <td>15</td>
      </tr>
      <tr>
        <td>4</td>
        <td><a href="<%=root%>/qna_detail.jsp">새우푸드트럭은 어디에 있나요?</a></td>
        <td>2018.04.28</td>
        <td>33</td>
      </tr>
      <tr>
        <td>5</td>
        <td><a href="<%=root%>/qna_detail.jsp">푸드 트럭은 언제 까지 하나요?</a></td>
        <td>2018.04.28</td>
        <td>109</td>
      </tr>
      <tr>
        <td>6</td>
        <td><a href="<%=root%>/qna_detail.jsp">푸드트럭 이용 시간은 언제까지일까요?</a></td>
        <td>2018.04.28</td>
        <td>22</td>
      </tr>
      <tr>
        <td>7</td>
        <td><a href="<%=root%>/qna_detail.jsp">동호회를 만들고 싶어요</a></td>
        <td>2018.04.25</td>
        <td>14</td>
      </tr>
      <tr>
        <td>8</td>
        <td><a href="<%=root%>/qna_detail.jsp">3박4일 자전거 코스를 만들고싶은데 사이트좀 업데이트 해주세요</a></td>
        <td>2018.04.24</td>
        <td>5</td>
      </tr>
    </tbody>
  </table>
  <div class="bt" style="margin-left: 10%">
<button type="button" class="btn btn-default"><a href="<%=root%>/qna_write.jsp">글쓰기</a></button>  
</div>
  				<!-- END TOP FAQs -->
<div class="row">
	
		<div class="pagination" style="width: 400px;margin-left: 30%;">
	<ul class="pagination pagination-lg">
	 <li class="active"><a href="qna.jsp">1</a></li>
	 <li><a href="qna.jsp">2</a></li>
	 <li><a href="#">3</a></li>
	 <li><a href="#">4</a></li>
	 <li><a href="#">5</a></li>
	 <li><a href="#">6</a></li>
	 <li><a href="#">7</a></li>
	 <li><a href="#">8</a></li>
	 <li><a href="#">9</a></li>
	</ul>
		</div>
	
</div>
</div>


<!-- FOOTER -->
	<div>
      <footer>
      		<jsp:include page = "/template/footer.jsp"/>
      </footer>
     </div>

</body>
</html>







