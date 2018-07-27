<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>map</title>
<script type="text/javascript" lang="ko" charset="UTF-8"
   src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=lCSVdReL0yZjRvKWpVR1&submodules=geocoder"></script>
</head>
 
<body>
   <div id="map" style="width: 100%; height: 400px;"></div>
   <script>
   var HOME_PATH = window.HOME_PATH || '.';
   var map = new naver.maps.Map('map', {
       center: new naver.maps.LatLng(<%=list.get(0).getYlocationS()%>, <%=list.get(0).getXlocationS()%>),
       zoom: 10
   });
   
   
<%for(int i = 0; list.size() > i ; i++ ){ %>
   makeMarker(map, new naver.maps.LatLng(<%=list.get(i).getYlocationS()%>, <%=list.get(i).getXlocationS()%>), <%=list.get(i).getStep()-1%>);
<% } %>
   function makeMarker(map, position, index) {

       var ICON_GAP = 31;
       var ICON_SPRITE_IMAGE_URL = HOME_PATH +'/img/example/sp_pin_hd.png';
       var iconSpritePositionX = (index * ICON_GAP) + 1;
       var iconSpritePositionY = 1;

       var marker = new naver.maps.Marker({
           map: map,
           position: position,
           icon: {
             url: ICON_SPRITE_IMAGE_URL,
             size: new naver.maps.Size(26, 36), // 이미지 사이즈
             origin: new naver.maps.Point(iconSpritePositionX, iconSpritePositionY), // 스프라이트 이미지에서 클리핑 위치
             anchor: new naver.maps.Point(13, 36), // 지도 상 위치에서 이미지 위치의 offset 값
             scaledSize: new naver.maps.Size(395, 79)
           }
       });

       return marker;

   }
   
   var polyline = new naver.maps.Polyline({
	    map: map,
	    path: [
	    	<%for(int i = 0; list.size() > i ; i++ ){ %>
	        new naver.maps.LatLng(<%=list.get(i).getYlocationS()%>, <%=list.get(i).getXlocationS()%>),
	    	<%}%>
	    ]
	}); 
   var bicycleLayer = new naver.maps.BicycleLayer();
   var btn = $('#bicycle');
   naver.maps.Event.addListener(map, 'bicycleLayer_changed', function(bicycleLayer) {
       if (bicycleLayer) {
           btn.addClass('control-on');
       } else {
           btn.removeClass('control-on');
       }
   });

   bicycleLayer.setMap(map);
   btn.on("click", function(e) {
       e.preventDefault();
       if (bicycleLayer.getMap()) {
           bicycleLayer.setMap(null);
       } else {
           bicycleLayer.setMap(map);
       }
   });   
      </script>
</body>
</html>