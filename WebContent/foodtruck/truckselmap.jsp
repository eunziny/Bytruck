<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>TruckSelMap.jsp</title>
<script type="text/javascript" lang="ko" charset="UTF-8"
   src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=lCSVdReL0yZjRvKWpVR1&submodules=geocoder"></script>
 </head>
<body>
   <div id="map" style="width: 100%; height: 400px;"></div>
   <script>
   var position = new naver.maps.LatLng(37.3595704, 127.105399);
	var menuLayer = $('<div style="position:absolute;z-index:10000;background-color:#fff;border:solid 1px #333;padding:10px;display:none;"></div>');

	var map = new naver.maps.Map('map', {
		center : position,
		zoom : 10
	});
	
	var marker = new naver.maps.Marker({
		position : position,
		map : map
	});
	
	map.getPanes().floatPane.appendChild(menuLayer[0]);

	naver.maps.Event.addListener(map, 'click', function(e) {
		marker.setPosition(e.coord);

		var coordHtml = 'Coord: ' + e.coord;
		
		console.log(e.coord);
		
		menuLayer.show().css({
			left : e.offset.x,//지도상위도
			top : e.offset.y
		}).html(coordHtml);
		
	   var data='marker --> x : ' + e.coord.x +', y : ' + e.coord.y;
	   console.log(data);
      $('textarea#xlocation').html(e.coord.x).hide();
      $('textarea#ylocation').html(e.coord.y).hide();
	});

	naver.maps.Event.addListener(map, 'mousedown', function(e) {
	}); 
      </script>
</body>
</html>