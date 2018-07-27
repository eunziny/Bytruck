<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String root = request.getContextPath();
%>    
<html>
<head>
<meta content="text/html; charset=UTF-8">
<title>차트</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
<%-- <script src="<%=root%>/js/Chart.min.js"></script>  --%>
<script src="<%=root%>/js/Chart.bundle.js"></script>
<script src="<%=root%>/js/utils.js"></script>
</head>
<canvas id="memChart" width="400" height="400"></canvas>
<script>
$(function() {
	$.ajax({
        url: '<%=root%>/memrank.bt',
        dataType: 'json',
        success: function(data) {
      	var utype = []; 
      	 for(var i = 0; i < data.mem_chart.length; i++) {
      		utype.push(data.mem_chart[i].mcount2);
      		utype.push(data.mem_chart[i].mcount1);
         	}
       	var ctx = document.getElementById("memChart");
	   	var mChart = new Chart(ctx, {
	   		type: 'pie',
    		label:'MemberLank',
    		data : {
    			 	labels:["일반 회원", "푸드트럭 회원"],
   			  		datasets:[{
   				  label:"회원 수",
   				  data: utype,
   				backgroundColor: [
				  	'rgba(255, 206, 86, 0.2)',
	                'rgba(66, 244, 140, 0.2)'
	            	],
	            borderColor: [
   		        	 'rgba(255, 206, 86, 1)',
		             'rgba(66, 244, 140, 1)'
   		        	 ],	
   				  borderWidth: 1
   			  		}]
    			},
    		/* data:{
    			  labels:label,
    			  datasets:[{
    				  label:["회원 수"],
    				  data: [10,20],
    				  backgroundColor: [
    					  	'rgba(255, 206, 86, 0.2)',
    		                'rgba(54, 162, 235, 0.2)'
    		            ],
    		         borderColor: [
    		        	 'rgba(255, 206, 86, 1)',
 		                 'rgba(54, 162, 235, 1)'
    		        	 ],
    		        borderWidth: 1
    			  }], 
    			  
    		}, */
    options: {
    	animation: {
    		animateScale: true
    	},
    	responsive: false,
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                	}
              	}]
              }
    		}
		 });
	  }
	});
});
</script>		
</body>
</html>