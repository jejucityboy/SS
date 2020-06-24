<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    
    <meta charset="utf-8">
    <title>지금 우리 학교는</title>
  
</head>
<body>
<div class="alert alert-dark" role="alert" style="float: none; margin: 0 auto;">


  지금 우리 학교 COVID-19 현황

</div>
<div id="map" style="width:1150px;height:700px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=08ac5f210c21cf38bc0484639366ce74"></script>
<script>


   var mapContainer = document.getElementById('map'), // 지도의 중심좌표
   mapOption = {
      center : new kakao.maps.LatLng(37.456129, 126.705233), // 지도의 중심좌표
      level : 5
   // 지도의 확대 레벨
   };

   var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

   //마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
   var positions = [

      <c:forEach items="${list}" var="dto" varStatus="st">
      <c:if test="${st.index != 0}">,</c:if>
      {
          content: '${dto.sh_name}',
          latlng: new kakao.maps.LatLng(${dto.sh_location1}, ${dto.sh_location2})
      }
      </c:forEach>   ];

   for (var i = 0; i < positions.length; i ++) {
   // 마커를 생성합니다
   var marker = new kakao.maps.Marker({
       map: map, // 마커를 표시할 지도
       position: positions[i].latlng // 마커의 위치
   });


   // 마커에 표시할 인포윈도우를 생성합니다 
   var infowindow = new kakao.maps.InfoWindow({
       content: positions[i].content // 인포윈도우에 표시할 내용
   });

   // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
   // 이벤트 리스너로는 클로저를 만들어 등록합니다 
   // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
   kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
   kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
   }

   //인포윈도우를 표시하는 클로저를 만드는 함수입니다 
   function makeOverListener(map, marker, infowindow) {
   return function() {
       infowindow.open(map, marker);
   };
   }

   //인포윈도우를 닫는 클로저를 만드는 함수입니다 
   function makeOutListener(infowindow) {
   return function() {
       infowindow.close();
   };
   }
   
   function zoomIn() {        
	    // 현재 지도의 레벨을 얻어옵니다
	    var level = map.getLevel();
	    
	    // 지도를 1레벨 내립니다 (지도가 확대됩니다)
	    map.setLevel(level - 1);
	    
	    // 지도 레벨을 표시합니다
	    displayLevel();
	}    

	function zoomOut() {    
	    // 현재 지도의 레벨을 얻어옵니다
	    var level = map.getLevel(); 
	    
	    // 지도를 1레벨 올립니다 (지도가 축소됩니다)
	    map.setLevel(level + 1);
	    
	    // 지도 레벨을 표시합니다
	    displayLevel(); 
	}    
	 
	function displayLevel(){
	    var levelEl = document.getElementById('maplevel');
	    levelEl.innerHTML = '현재 지도 레벨은 ' + map.getLevel() + ' 레벨 입니다.';
	}
</script>



</body>
</html>