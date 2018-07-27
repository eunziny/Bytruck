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
   var position = new naver.maps.LatLng(37.3595704, 127.105399);
   var markerList = [];
   var menuLayer = $('<div style="position:absolute;z-index:10000;background-color:#fff;border:solid 1px #333;padding:10px;display:none;"></div>');
   
   var map = new naver.maps.Map('map', {
       center: new naver.maps.LatLng(37.3595704, 127.105399),
       mapMode:1,
       mapTypeControl: true,
       mapTypeControlOptions: {
           style: naver.maps.MapTypeControlStyle.DROPDOWN
       },
       detectCoveredMarker : true
   });
   
   map.getPanes().floatPane.appendChild(menuLayer[0]);
   
   naver.maps.Event.addListener(map, 'mousedown', function(e) {//스크롤 움직일때 정보창 숨기기(지워도 될거같음)
       menuLayer.hide();
   });

   var polyline = new naver.maps.Polyline({
       map: map,
       path: [],
       strokeColor: '#ff0000',
       strokeWeight: 2
   });

   var index=1;
   var x = [];
   var y = [];
   naver.maps.Event.addListener(map, 'click', function(e) {
       var markersMap={};
       var marker = new naver.maps.Marker({
           position: e.coord,
           map: map
       });
       console.log(e.coord);
       
       marker.setTitle(marker.setZIndex(index));//마크 찍은 순번 저장
       index++;
       markerList.push(marker);//마크 리스트에 담기(복수) 
       
      var coordHtml = 'Coord: '+  e.coord+',number : '+ marker.getZIndex();//위치 표시 (위도,경도) -- 디비에 넣고, 확인후 지우기
      
        menuLayer.show().css({
           left: e.offset.x,//지도상위도
           top: e.offset.y//지도상경도
       }).html(coordHtml);   
       
       var path = polyline.getPath();//마크 연결하기
       path.push(e.coord);
       
       x[ marker.getZIndex()] = e.coord.x;
       y[ marker.getZIndex()] = e.coord.y;
       var data=marker.getZIndex()+'st marker --> x : ' + x[ marker.getZIndex()] +', y : ' + y[ marker.getZIndex()];
       console.log(data);
       $('textarea#xlocation').append(e.coord.x + "/").hide();
       $('textarea#ylocation').append(e.coord.y +  "/").hide();
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