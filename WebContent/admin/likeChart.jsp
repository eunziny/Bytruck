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
<script src="<%=root%>/js/Chart.min.js"></script>
</head>
<canvas id="myChart" width="400" height="400"></canvas>
<script>
$(function() {
	$.ajax({
        url: '<%=root%>/grank.bt',
        dataType: 'json',
        success: function(data) {
      	var like = []; var label = [];
        for(var i = 0; i < data.like_chart.length; i++) {
        	label.push("아이디: " + data.like_chart[i].id);
        	like.push(data.like_chart[i].like);
        	}
       var ctx = document.getElementById("myChart");
	   var myChart = new Chart(ctx, {
    		type: 'bar',
    		label:'test',
    		data:{
    			  labels:label,
    			  datasets:[{
    				  label:"좋아요",
    				  data:like,
    				  backgroundColor: [
    					  	'rgba(255, 206, 86, 0.2)',
    		                'rgba(54, 162, 235, 0.2)',
                            'rgba(112, 62, 214, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(255, 99, 132, 0.2)'
    		            ],
    		         borderColor: [
    		        	 'rgba(255, 206, 86, 1)',
 		                 'rgba(54, 162, 235, 1)',
                         'rgba(112, 62, 214, 1)',
                         'rgba(75, 192, 192, 1)',
                         'rgba(255, 99, 132, 1)'	
    		        	 ],
    		        borderWidth: 1
    			  }]
    		},

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