<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7471cecaa76c6d8951aaabeda997b7c6"></script>
<style>
.shopTag{
width: 98%;
margin:auto;
display: flex;
flex-wrap:wrap;
}
.shopTag .tag{
display: flex;
justify-content: center;
align-items: center;
margin-right: 15px;
margin-top: 20px;
border: 1px solid #ddd;
border-radius: 10px;
width: 75px;
height: 30px;
cursor: pointer;
}
.clickTag{
background-color: #B6CBA3;
color: #fff;
}
.tag:hover:not(.clickTag) {background-color: #ddd;}
 input{
border: 1px solid #aaa;
height: 27px !important;
outline: none;
}
input:focus{
border: #264e36 1px solid;
}
</style>


<div style="width: 100%;height: 100%;display: flex;">
<div id="map" style="width: 70%; height: 100%" ></div>
<div style="width: 30%; height: 100%">
	<div class="shopTag">
			<span class="tag clickTag">전체</span>
			<span class="tag">한식</span>
			<span class="tag">일식</span>
			<span class="tag">양식</span>
			<span class="tag">분식</span>
			<span class="tag">치킨</span>
			<span class="tag">족발/보쌈</span>
			<span class="tag">카페</span>
	</div>
	<div style="display: flex;flex-direction: row;align-items: center;justify-content: space-between;width: 98%;margin: auto;margin-top: 30px">
		<input style="width: 350px;" /><button  id="dupliButton"  >검색하기</button>
	</div>
</div>
</div>

<script>
$(document).ready(function(){
	
	$(".tag").click(function(){
		console.log("ok")
		$(this).addClass("clickTag")
		$(this).siblings().removeClass("clickTag")
	});
})


var StoreInfo = JSON.parse('${AllStoreList}'); 
console.log(StoreInfo)
	var LONGITUDE = '${getStoreInfo[0].LONGITUDE}'
	var LATITUDE =  '${getStoreInfo[0].LATITUDE}'
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = { 
	    center: new kakao.maps.LatLng(37.4741012743523,126.953327857656), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	var positions = []
	for(var i=0;i<StoreInfo.length;i++){
	
	    var LATITUDE = StoreInfo[i].LATITUDE;
		var LONGITUDE = StoreInfo[i].LONGITUDE
		
		var locations = {text: '텍스트를 표시할 수 있어요!'
									,content: '<div>'+StoreInfo[i].STORENAME+'</div>'
									,storenum:StoreInfo[i].STORENUM
									,title: StoreInfo[i].STORENAME
									,latlng: new kakao.maps.LatLng(LATITUDE, LONGITUDE)
									,LATITUDE:LATITUDE,LONGITUDE:LONGITUDE
									,CLASSIFY:StoreInfo[i].CLASSIFY}
		positions.push(locations) 
	}
	console.log(positions)

	// 마커 이미지의 이미지 주소입니다
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	    
 	for (var i = 0; i < positions.length; i ++) {
 		console.log(positions[i])
 		 var imageSize =  null; 
 		if(positions[i].CLASSIFY == "KOR"){
 			imageSrc = "https://kmug.co.kr/data/file/design/data_image_1228918259_%EA%B7%B8%EB%A6%BC_2.png"
 			imageSize = new kakao.maps.Size(60, 65); 
 		}else if(positions[i].CLASSIFY == "JPN"){
 			imageSrc = "/images/shop/japan.jpg"
 			imageSize = new kakao.maps.Size(60, 65); 
 		}else if(positions[i].CLASSIFY == "WEST"){
 			imageSrc = "https://kmug.co.kr/data/file/design/data_image_1228918259_%EA%B7%B8%EB%A6%BC_2.png"
 	 		imageSize = new kakao.maps.Size(60, 65); 
 		}else if(positions[i].CLASSIFY == "SIMPLE"){
 			imageSrc ="/images/shop/simple.png"
 	 		imageSize = new kakao.maps.Size(60, 65); 
 		}else if(positions[i].CLASSIFY == "CHICKEN"){
 			imageSrc = "/images/shop/chicken.png"
 	 		imageSize = new kakao.maps.Size(60, 65); 
 		}else if(positions[i].CLASSIFY == "PIG"){
 			imageSrc = "https://kmug.co.kr/data/file/design/data_image_1228918259_%EA%B7%B8%EB%A6%BC_2.png"
 	 		imageSize = new kakao.maps.Size(60, 65); 
 		}else if(positions[i].CLASSIFY == "CAFE"){
 			imageSrc = "https://kmug.co.kr/data/file/design/data_image_1228918259_%EA%B7%B8%EB%A6%BC_2.png"
 	 		imageSize = new kakao.maps.Size(60, 65); 
 		}else{
 		   imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"
		   imageSize =  new kakao.maps.Size(24, 35); 
 		}
 		
	    // 마커 이미지의 이미지 크기 입니다
	   
	    
	    // 마커 이미지를 생성합니다    
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	    
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng, // 마커를 표시할 위치
	        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	        image : markerImage // 마커 이미지 
	    });
	    // 마커에 표시할 인포윈도우를 생성합니다 
	    var infowindow = new kakao.maps.InfoWindow({
	        content: positions[i].content // 인포윈도우에 표시할 내용
	    });
	    infowindow.open(map, marker);
	    kakao.maps.event.addListener(marker, 'click', makeClickListener(map, positions[i].title, positions[i].LATITUDE,positions[i].LONGITUDE,positions[i].storenum));
	    /* kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, positions[i].title,marker,infowindow))
	    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow,marker)) */
	    
 	} 
 	setCenter()

	
	function makeClickListener(map, StoreName, LATITUDE,LONGITUDE,storenum) {
		return function() {
		location.href="/shop/shopMain.do?shopnum="+storenum+"&device=web"
	//	window.open("https://map.kakao.com/link/to/"+StoreName+","+LATITUDE+","+LONGITUDE)
		};
	}
	function setCenter() {            
	    // 이동할 위도 경도 위치를 생성합니다 
	    var moveLatLon = new kakao.maps.LatLng(37.4741012743523,126.953327857656);
	    
	    // 지도 중심을 이동 시킵니다
	    map.setCenter(moveLatLon);
	}
	/* //마커에 클릭 이벤트를 등록합니다
	function makeOverListener(map, StoreName, marker,infowindow) {
		
		return function() {
			infowindow.open(map, marker);
		};
	} */
	/* //마커에 클릭 이벤트를 등록합니다
	function makeOutListener(infowindow,marker) {
		return function() {
			infowindow.close();
		};
	} */

</script>