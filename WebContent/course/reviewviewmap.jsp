<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>map</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=lCSVdReL0yZjRvKWpVR1&submodules=geocoder"></script>
</head>
<body>
	<div id="map" style="width: 100%; height: 400px;"></div>
<script>
var xlocation;
var ylocation;

$(function(){
	console.log("aaa");
	$.ajax({
		url: '<%=request.getContextPath()%>/reviewmap.bt',
		dataType : 'JSON',
		data: {num :'<%=request.getParameter("num")%>'},
		success : function(data) {
			console.log(data);
			console.log(data.location[0].xlocation);
			xlocation = data.location[0].xlocation;
			ylocation = data.location[0].ylocation;

			var map = new naver.maps.Map('map', {
				center : new naver.maps.LatLng(ylocation, xlocation),
				zoom : 10
			});

			var marker = new naver.maps.Marker({
				position : new naver.maps.LatLng(ylocation, xlocation),
				map : map

			});
		}
	});	
});
</script>
</body>
</html>