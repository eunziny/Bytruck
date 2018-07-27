<!DOCTYPE html>
<html lang="ko">
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@page import="vo.Foodtruck_Location"%>
<head>
<meta charset="UTF-8">
<title>TruckSelMap.jsp</title>
<script type="text/javascript" lang="ko" charset="UTF-8"
   src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=lCSVdReL0yZjRvKWpVR1&submodules=geocoder"></script>
 </head>
<body>
   <div id="map" style="width: 100%; height: 400px;"></div>
   <script>
   var xlocation1;
   var ylocation1;

   $(function(){
      $.ajax({
         url: '<%=request.getContextPath()%>/foodtruckmap.bt',
         dataType : 'JSON',
         data: {num :'<%=request.getParameter("no")%>'},
         success : function(data) {
            console.log(data);
            console.log(data.location[0].xlocation);
            xlocation1 = data.location[0].xlocation;
            ylocation1 = data.location[0].ylocation;
            console.log(xlocation1+', '+ylocation1);
   
          var position = new naver.maps.LatLng(ylocation1, xlocation1);
         var menuLayer = $('<div style="position:absolute;z-index:10000;background-color:#fff;border:solid 1px #333;padding:10px;display:none;"></div>');
      
         var map = new naver.maps.Map('map', {
             center : position,
             zoom : 10
          });
         
          var marker = new naver.maps.Marker({
             position :position,
             map : map
          });
         
          map.getPanes().floatPane.appendChild(menuLayer[0]);
      
          naver.maps.Event.addListener(map, 'click', function(e) {
              marker.setPosition(e.coord);

              var coordHtml = 'Coord: ' + e.coord;//위치 표시 (위도,경도) -- 디비에 넣고, 확인후 지우기
              
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
      }
   });
});
      </script>
</body>
</html>