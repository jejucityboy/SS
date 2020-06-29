<%@page import="crawl.CrawlDTO"%>
<%@page import="crawl.CrawlDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	CrawlDAO crawlDAO = CrawlDAO.getInstance();
List<CrawlDTO> list = crawlDAO.getCrawlList();
%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
	crossorigin="anonymous"></script>

<meta charset="utf-8">
<title>지금 우리 학교는</title>

<style type="text/css">
body {
	font-family: 'Nanum Myeongjo', serif;
}

a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: #881ca3;
	text-decoration: none;
}

a:hover {
	color: #349eeb;
	text-decoration: underline;
}
</style>

<style>
.modes {
	position: absolute;
	top: 700px;
	left: 1200px;
	z-index: 1;
}

.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

#menu_wrap {
	position: absolute;
	top: 0px;
	left: 10px;
	width: 300px;
	margin: 5px 0 30px 10px;
	padding: 5px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 0.7);
	z-index: 5;
	font-size: 12px;
}

#menu_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5F5F5F;
	margin: 3px 0;
}

#menu_wrap .option {
	text-align: center;
}

#menu_wrap .option p {
	margin: 10px 0;
}

#menu_wrap .option button {
	margin-left: 5px;
}

#placesList li {
	list-style: none;
}

#placesList .item {
	position: relative;
	border-bottom: 1px solid #888;
	overflow: hidden;
	cursor: pointer;
	min-height: 65px;
}

#placesList .item span {
	display: block;
	margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#placesList .item .info {
	padding: 10px 0 10px 55px;
}

#placesList .info .gray {
	color: #8a8a8a;
}

#placesList .info .jibun {
	padding-left: 26px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
		no-repeat;
}

#placesList .info .tel {
	color: #009900;
}

#placesList .item .markerbg {
	float: left;
	position: absolute;
	width: 36px;
	height: 37px;
	margin: 10px 0 0 10px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
		no-repeat;
}

#placesList .item .marker_1 {
	background-position: 0 -10px;
}

#placesList .item .marker_2 {
	background-position: 0 -56px;
}

#placesList .item .marker_3 {
	background-position: 0 -102px
}

#placesList .item .marker_4 {
	background-position: 0 -148px;
}

#placesList .item .marker_5 {
	background-position: 0 -194px;
}

#placesList .item .marker_6 {
	background-position: 0 -240px;
}

#placesList .item .marker_7 {
	background-position: 0 -286px;
}

#placesList .item .marker_8 {
	background-position: 0 -332px;
}

#placesList .item .marker_9 {
	background-position: 0 -378px;
}

#placesList .item .marker_10 {
	background-position: 0 -423px;
}

#placesList .item .marker_11 {
	background-position: 0 -470px;
}

#placesList .item .marker_12 {
	background-position: 0 -516px;
}

#placesList .item .marker_13 {
	background-position: 0 -562px;
}

#placesList .item .marker_14 {
	background-position: 0 -608px;
}

#placesList .item .marker_15 {
	background-position: 0 -654px;
}

#pagination {
	margin: 10px auto;
	text-align: center;
}

#pagination a {
	display: inline-block;
	margin-right: 10px;
}

#pagination .on {
	font-weight: bold;
	cursor: default;
	color: #777;
}

#footer {
	position: absolute;
	bottom: 0;
	width: 100%;
	background: #ccc;
}

#loc {
	width: auto;
	height: 80px;
}
</style>
</head>
<body>
	<header class="alert alert-dark" role="alert"
		style="text-align: center; margin: 0 auto;">

		<h4>지금 우리 학교 COVID-19 현황</h4>

	</header>

	<div id="footer" style="padding-left: 10px;">
		<address>
			안동대학교 인공지능 개발자 교육 첫번째 미니 프로젝트 김지현 김정훈 박성용 윤예진 <br /> 지도 API 제공 :
			카카오맵 <br /> <small>Copyright &copy; 2020 SchoolSignal</small>
		</address>
	</div>



	<div id="map" style="width: 74%; height: 600px; float: left;"></div>

	<div style="width: 26%; float: left;">
		<div
			style="overflow-y: scroll; overflow-x: hidden; height: 510px; padding: 15px;">

			<table
				style="align: center; cellspacing: 0; cellpadding: 0; width: 360px; height: 80px;">
				<%
					for (CrawlDTO crawlDTO : list) {
				%>

				<tr>
					<td style="padding: 10px;"><img alt="news_img"
						src="<%=crawlDTO.getArti_img()%>"
						style="width: 80px; height: 80px;" /></td>
					<td><a href="<%=crawlDTO.getArti_link()%>"> <span
							style="font-weight: bold; font-size: 14px"><%=crawlDTO.getArti_tit()%>
						</span></a> <br /> <span style="font-size: 11px"><%=crawlDTO.getArti_date()%>
					</span></td>
				</tr>

				<%
					}
				%>
			</table>


		</div>

		<div style="width: 369px; height: 100px; margin-left: 10px; margin-top: 10px">
		<table
				style="align: center; width: 360px; height:50px;">
				

				<tr>
					<td><img src="http://static.naver.com/maps2/icons/pin_spot2.png"
				style="width: 22px; height: 22px; margin: 5px;" align="left" /></td>
					<td><h5>정상 등교 학교</h5></td>
				</tr>
				
				<tr>
					<td><img
				src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"
				style="width: 22px; height: 22px; margin: 5px;" align="left" /></td>
					<td><h5>등교 중단 학교</h5></td>
				</tr>

			</table>

		</div>

	</div>

	<div class="map_wrap">
		<div id="map"
			style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
		<p class="modes">
			<button onclick="selectOverlay('ALL')">서울</button>
			<button onclick="selectOverlay('CANCEL')">중단학교만 보이기</button>
			<button onclick="selectOverlay('ALL')">전체학교 보이기</button>
			<button onclick="selectOverlay('CANCEL')">중단학교만 보이기</button>
			<button onclick="selectOverlay('ALL')">전체학교 보이기</button>
			<button onclick="selectOverlay('CANCEL')">중단학교만 보이기</button>
			<button onclick="selectOverlay('ALL')">전체학교 보이기</button>
			<button onclick="selectOverlay('CANCEL')">중단학교만 보이기</button>


		</p>
		<div id="menu_wrap" class="bg_white">
			<div class="option">
				<div>
					<form onsubmit="searchPlaces(); return false;">
						학교검색 : <input type="text" value="" id="keyword" size="15">
						<button type="submit">학교 검색하기</button>
					</form>
				</div>
			</div>
			<hr>
			<ul id="placesList"></ul>
			<div id="pagination"></div>
		</div>
	</div>




	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=08ac5f210c21cf38bc0484639366ce74&libraries=services,clusterer"></script>
	<script>

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(36.448353, 127.726836), // 지도의 중심좌표
			level : 13
		// 지도의 확대 레벨
		};



   var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
   var clusterer = new kakao.maps.MarkerClusterer({
       map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
       averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
       minLevel: 7 // 클러스터 할 최소 지도 레벨 
   });
   //마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
   var positions = [

      <c:forEach items="${list}" var="dto" varStatus="st">
      <c:if test="${st.index != 0}">,</c:if>
    	  {
          content: '<div style="font-size:20px", "font-weight:bolder";>${dto.sh_name}</div><br><div style="color:red"; "font-weight:bold";>${dto.sh_state}</div><br><div>${dto.sh_address2}</div><br>&nbsp',
          latlng: new kakao.maps.LatLng(${dto.sh_location1}, ${dto.sh_location2})
    	  }
      </c:forEach>   ];
   var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
   
   var markers = [];
   
   for (var i = 0; i < positions.length; i ++) {
   // 마커를 생성합니다
   			// 마커 이미지의 이미지 크기 입니다
			var imageSize = new kakao.maps.Size(24, 35);

			// 마커 이미지를 생성합니다    
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);


   var marker = new kakao.maps.Marker({
       map: map, // 마커를 표시할 지도
       position: positions[i].latlng, // 마커의 위치
       title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		content : positions[i].content,
		image : markerImage
	// 마커 이미지 
   });

   // 마커에 표시할 인포윈도우를 생성합니다 
   var infowindow = new kakao.maps.InfoWindow({
       content: positions[i].content // 인포윈도우에 표시할 내용
   });

   markers.push(marker);
   // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
   // 이벤트 리스너로는 클로저를 만들어 등록합니다 
   // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
   kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
   kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
   
}
   clusterer.addMarkers(markers);
   
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
	   // 장소 검색 객체를 생성합니다
	   var ps = new kakao.maps.services.Places();

	   // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	   var infowindow = new kakao.maps.InfoWindow({
	      zIndex : 1
	   });

	   // 키워드로 장소를 검색합니다
	   /* searchPlaces(); */

	   // 키워드 검색을 요청하는 함수입니다
	   function searchPlaces() {

	      var keyword = document.getElementById('keyword').value;

	      if (!keyword.replace(/^\s+|\s+$/g, '')) {
	         alert('학교명을 입력해주세요!');
	         return false;
	      }

	      // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
	      ps.keywordSearch(keyword, placesSearchCB);
	   }

	   // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	   function placesSearchCB(data, status, pagination) {
	      if (status === kakao.maps.services.Status.OK) {

	         // 정상적으로 검색이 완료됐으면
	         // 검색 목록과 마커를 표출합니다
	         displayPlaces(data);

	         // 페이지 번호를 표출합니다
	         displayPagination(pagination);

	      } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

	         alert('검색 결과가 존재하지 않습니다.');
	         return;

	      } else if (status === kakao.maps.services.Status.ERROR) {

	         alert('검색 결과 중 오류가 발생했습니다.');
	         return;

	      }
	   }

	   // 검색 결과 목록과 마커를 표출하는 함수입니다
	   function displayPlaces(places) {

	      var listEl = document.getElementById('placesList'), menuEl = document
	            .getElementById('menu_wrap'), fragment = document
	            .createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';

	      // 검색 결과 목록에 추가된 항목들을 제거합니다
	      removeAllChildNods(listEl);

	      // 지도에 표시되고 있는 마커를 제거합니다
	      removeMarker();

	      for (var i = 0 ; i <1 ; i++) {

	         // 마커를 생성하고 지도에 표시합니다
	         var placePosition = new kakao.maps.LatLng(places[i].y,
	               places[i].x), marker = addMarker(placePosition, i), itemEl = getListItem(
	               i, places[i]); // 검색 결과 항목 Element를 생성합니다

	         // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	         // LatLngBounds 객체에 좌표를 추가합니다
	         bounds.extend(placePosition);

	         // 마커와 검색결과 항목에 mouseover 했을때
	         // 해당 장소에 인포윈도우에 장소명을 표시합니다
	         // mouseout 했을 때는 인포윈도우를 닫습니다
	         (function(marker, title) {
	            kakao.maps.event.addListener(marker, 'mouseover',
	                  function() {
	                     displayInfowindow(marker, title);
	                  });

	            kakao.maps.event.addListener(marker, 'mouseout',
	                  function() {
	                     infowindow.close();
	                  });

	            itemEl.onmouseover = function() {
	               displayInfowindow(marker, title);
	            };

	            itemEl.onmouseout = function() {
	               infowindow.close();
	            };
	         })(marker, places[i].place_name);

	         fragment.appendChild(itemEl);
	      }

	      // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
	      listEl.appendChild(fragment);
	      menuEl.scrollTop = 0;

	      // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	      map.setBounds(bounds);
	      
	   }

	   // 검색결과 항목을 Element로 반환하는 함수입니다
	   function getListItem(index, places) {

	      var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
	            + (index + 1)
	            + '"></span>'
	            + '<div class="info">'
	            + '   <h5>' + places.place_name + '</h5>';

	      if (places.road_address_name) {
	         itemStr += '    <span>' + places.road_address_name + '</span>'
	               + '   <span class="jibun gray">' + places.address_name
	               + '</span>';
	      } else {
	         itemStr += '    <span>' + places.address_name + '</span>';
	      }

	      itemStr += '  <span class="tel">' + places.phone + '</span>'
	            + '</div>';

	      el.innerHTML = itemStr;
	      el.className = 'item';

	      return el;
	   }

	   // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	   function addMarker(position, idx, title) {
	      var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
	      imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
	      imgOptions = {
	         spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
	         spriteOrigin : new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	         offset : new kakao.maps.Point(13, 37)
	      // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	      }, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
	            imgOptions), marker = new kakao.maps.Marker({
	         position : position, // 마커의 위치
	         image : markerImage
	      });

	      marker.setMap(map); // 지도 위에 마커를 표출합니다
	      markers.push(marker); // 배열에 생성된 마커를 추가합니다

	      return marker;
	   }

	   // 지도 위에 표시되고 있는 마커를 모두 제거합니다
	   function removeMarker() {
	      for (var i = 0; i < markers.length; i++) {
	         markers[i].setMap(null);
	      }
	      markers = [];
	   }

	   // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
	   function displayPagination(pagination) {
	      var paginationEl = document.getElementById('pagination'), fragment = document
	            .createDocumentFragment(), i;

	      // 기존에 추가된 페이지번호를 삭제합니다
	      while (paginationEl.hasChildNodes()) {
	         paginationEl.removeChild(paginationEl.lastChild);
	      }

	      for (i = 1; i <= pagination.last; i++) {
	         var el = document.createElement('a');
	         el.href = "#";
	         el.innerHTML = i;

	         if (i === pagination.current) {
	            el.className = 'on';
	         } else {
	            el.onclick = (function(i) {
	               return function() {
	                  pagination.gotoPage(i);
	               }
	            })(i);
	         }

	         fragment.appendChild(el);
	      }
	      paginationEl.appendChild(fragment);
	   }

	   // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	   // 인포윈도우에 장소명을 표시합니다
	   function displayInfowindow(marker, title) {
	      var content = '<div style="padding:5px;z-index:1;">' + title
	            + '</div>';

	      infowindow.setContent(content);
	      infowindow.open(map, marker);
	   }

	   // 검색결과 목록의 자식 Element를 제거하는 함수입니다
	   function removeAllChildNods(el) {
	      while (el.hasChildNodes()) {
	         el.removeChild(el.lastChild);
	      }
	   }




	</script>


</body>
</html>