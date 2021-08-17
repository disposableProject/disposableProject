<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7471cecaa76c6d8951aaabeda997b7c6"></script>
<style>
*{
	box-sizing: border-box;	letter-spacing: 0.1rem;
}
.container{
	width: 1240px;	display: flex; flex-direction: row; margin: 0 auto;
}
.leftSection{
	width: 880px;	position: relative;	
}
.rightSection{
	width: 360px;	min-height: 500px;max-height:800px	;position: fixed;	left: 64%;	border: 1px solid black;overflow: auto;background: white;
}
.rightSection {
    -ms-overflow-style: none; /* IE and Edge */
    scrollbar-width: none; /* Firefox */
}
.rightSection::-webkit-scrollbar {
    display: none; /* Chrome, Safari, Opera*/
}
.topBox{
	border: 1px solid black;
}
.storeInfo{
	display: flex;
}
.storeImg{
	border: 1px solid black;
}
.middleBox{
	border: 1px solid black; 
}
.selectMenu{
	border: 1px solid #c4c4c4;	min-height: 100px;
}
.foodBox{
	border: 1px solid; width: 280px; height: 300px; display: flex; flex-direction: column;
}
.items{
	display: grid; grid-template-columns: 280px 280px 280px; grid-template-rows: 300px; gap: 20px 20px;
}
.selectBox{
	display: flex; flex-direction: row-reverse; padding-top: 20px;
}
.reviewSelect{
	border: 1px solid #bfbfbf; height: 45px; width: 125px; font-size: 16px; line-height: 45px; padding: 0 0 0 7px;
}
.reviewText{
	text-align: left;
}
.sortBox{
	margin-bottom: 10px;
}
.reviewNum, .reviewPhoto, .reviewName, .reviewDate{
	text-align: center;
}
.writeReview{
	display: flex; flex-direction: row-reverse;
}
.delBtn{
    float: right; margin-right: 5px;
}
.foodImg{
width: 100%;
height: 70%;
border-bottom: 1px solid #d5d5d5;
}
/* @media screen and (max-width: 768px){
	.rightSection{
		display: none;
	}
	.storeInfo{
		display: flex;
    	flex-direction: column;
	}
	.items{
		display: grid;
	    grid-template-columns: 280px 280px;
	    grid-template-rows: 300px;
	    gap: 20px 20px;
	}
} */
</style>


<div class="container">
	<div class="leftSection">
		<div class="topBox">
			<div class="storeInfo">
				<div class="leftInfo">	
					<img class="storeImg" alt="" src="https://cookingcoding.s3.ap-northeast-2.amazonaws.com/${getStoreInfo[0].PHOTO}" style="width: 400px; height: 500px;"/>
				</div>
				<div class="rightInfo">
					<p>${getStoreInfo[0].STORENAME}</p>
					<p>가게주소: ${getStoreInfo[0].ADDRESS} <button onclick="showMap()">지도로 보기</button></p>
					<p>${getStoreInfo[0].NOTICE}</p>
					<div id="map" style="width:450px;height:350px;"></div>
				</div>
			</div>
		</div>
		
		<hr style="border: solid 1px #c4c4c4;" align="center;">
		
		<div class="middleBox">
			<div class="items">
				<c:forEach items="${StoreFoodList}" var="foodInfo">
					<div class="foodBox" onclick="getFoodOption('${foodInfo.STORENUM}','${foodInfo.FOODNUM}','${foodInfo.FOODNAME}','${foodInfo.PRICE}')">
						<div class="foodImg">
							<img src="https://cookingcoding.s3.ap-northeast-2.amazonaws.com/${foodInfo.IMGNAME}" style="width: 100%;height: 100%">
						</div>
						<span>${foodInfo.FOODNAME} -> </span>
						<span>${foodInfo.PRICE}원</span>
					</div>
				</c:forEach>
			</div>
		</div>
		
		<hr style="border: solid 1px #c4c4c4;" align="center;">
		
		<div class="bottomBox">
			<div class="reviewBox">
				<h2 style="margin: 0; color: #666;">REVIEW</h2>
				<div class="sortBox">
					<div class="guideBox">
						<ul style="margin: 0; padding:0; color: #666; list-style: none;">
							<li>주문 음식에 대한 소중한 리뷰를 남겨주세요.</li>
							<li>해당 게시판의 성격과 다른 글은 사전동의 없이 삭제될 수 있습니다.</li>
						</ul>
					</div>
					<div class="selectBox">
						<select name="reviewSelect" class="reviewSelect">
							<option value="newReview">최근등록순</option>
							<option value="oldReview">오래등록순</option>
						</select>
					</div>
				</div>
				<table style="width: 100%; border: 0; border-top: 3px solid #7ea155; border-bottom: 3px solid #7ea155;">
					<colgroup>
						<col style="width:50px;">
						<col style="width:200px;">
						<col style="width:autopx;">
						<col style="width:100px;">
						<col style="width:100px;">
					</colgroup>
					<tbody>
						<tr>
							<th>번호</th>
							<th>photo</th>
							<th>review</th>
							<th>작성자</th> 
							<th>작성일</th>
						</tr>
						<tr class="userReview">
							<td class="reviewNum">1</td>
							<td class="reviewPhoto">2</td>
							<td class="reviewText">3</td>
							<td class="reviewName">4</td>
							<td class="reviewDate">5</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- 리뷰 작성은 마이페이지 구매 내역으로 / 로그인 안한 사람은 로그인 화면으로 / 구매하지 않은 사람은 alert+현재페이지에-->
			<p class="writeReview">
				<a href="#none">
					<span>후기쓰기</span>
				</a>
			</p>
		</div>
	</div>
	
	<!-- 고정 + 주문하기 -->
	<div class="rightSection">
		<div id="optionList"></div>
		<div id="totalPrice"></div>
		<!-- 최종 장바구니 + 최종 결제 금액 -->
		<div class="selectMenu" id="selectMenu"></div>
		<div id="totalPayment"></div>
		<input id="dupliButton"  type="button" onclick="orderInsert()" value="주문하기">
	</div>
</div>

<script>
var totalPrice = 0;

function getFoodOption(storenum,foodnum,foodname,foodprice){
	$("#totalPrice").html("선택 가격: "+common.format(foodprice)+"원 <br><button  id='dupliButton'  onclick=getOrderInfo('"+foodname+"','"+foodprice+"')>메뉴 담기</button>")
	$.ajax({
		type : 'POST',
		url : '/shop/getFoodOption.do',
		data : {storenum:storenum,foodnum:foodnum},
		dataType : 'json',
		success : function(json){
			console.log('json 넌 뭐니')
			console.log(json)
			var html = "";
			var optionGroupNum = 0;
			var optionnum = 0;
			html += "<div><span>"+foodname+"</span><span> "+common.format(foodprice)+"원</span></div>"
			if(json.length > 0){
				html += "<div>추가옵션</div>"
				html += "<div> <div>옵션"+optionGroupNum+" : "+json[0].OPTIONGRNAME+"<input type=hidden value="+json[0].OPTIONNUM+"></div>"
				for(var i=0;i<json.length;i++){
					console.log()
					if(json[i].OPTIONGROUP != optionGroupNum){
						optionGroupNum = json[i].OPTIONGROUP
						html += "</div><div> <div>옵션"+optionGroupNum+": "+json[i].OPTIONGRNAME+"</div>"
					}
					if(json[i].CHECKFLAG == "N"){
						optionnum = json[i].OPTIONNUM
						html += "<input type='radio' onclick=setFoodPrice('"+foodprice+"','"+foodname+"','"+foodnum+"','"+optionnum+"')  class='foodoptions' name='"+json[i].OPTIONGROUP+"' value='"+json[i].OPTIONPRICE+"/"+json[i].OPTIONNAME+"' /><div>"+json[i].OPTIONNAME+": "+common.format(json[i].OPTIONPRICE)+"원</div>"
					}else{
						optionnum = json[i].OPTIONNUM
						html += "<input type='checkbox' onclick=setFoodPrice('"+foodprice+"','"+foodname+"','"+foodnum+"','"+optionnum+"') class='foodoptions' name='"+json[i].OPTIONGROUP+"' value='"+json[i].OPTIONPRICE+"/"+json[i].OPTIONNAME+"' /><div>"+json[i].OPTIONNAME+": "+common.format(json[i].OPTIONPRICE)+"원</div>"
					}
					
				}
				html += "</div>"
			}else{
				
			}
			
			$("#optionList").html(html)
		},
		error: function(xhr, status, error){
			alert("음식 옵션을 가져오지 못했습니다."+error);
		}
	});
}

function setFoodPrice(foodPrice,foodname,foodnum,optionnum){
	var optionPrice = foodPrice;
	$('.foodoptions:checked').each(function() {
		
		var value = $(this).val();
		optionPrice = parseInt(optionPrice) + parseInt(value);
	});
	$("#totalPrice").html("선택 가격: "+common.format(optionPrice)+"원 <br><button id='dupliButton' onclick=getOrderInfo('"+foodname+"','"+optionPrice+"','"+foodnum+"','"+optionnum+"')>메뉴 담기</button>")
}

// 메뉴 선택 정보를 가져옴
function getOrderInfo(foodname, foodprice,foodnum,optionnum){
	var foodOption = document.querySelectorAll(".foodoptions");
	console.log('fffff '+foodname);
	console.log(foodOption);
	console.log('옵션 넘버 좀 가지고 있어줄래?')
	console.log(optionnum)
	var result = '';
	var optionName="";
	var j = 0
	for(var i=0; i<foodOption.length; i++){
		  if(foodOption[i].checked)  {
			  j++
			  console.log(foodOption[i].value.split("/"))
		    result += " 옵션"+j+": "+foodOption[i].value.split("/")[1];
			 optionName += foodOption[i].value.split("/")[1]+" / "
		  }
	}
	console.log("너 무슨 값인데?")
	console.log(result)
	var selectMenuText = document.querySelector(".selectMenu");
	//selectFood 내 foodnum과 food옵션 가져오기
	$(selectMenuText).append("<div class='selectFood' name='"+foodnum+"'><input type='hidden' class='foodnum' value='"+foodnum+"'><input type='hidden' class='optionnum' value='"+optionnum+"'><input type='hidden' class='optionName' value='"+optionName+"'>"+foodname+"<br><span class='selectfoodoption'>"+result+"</span> <br> <button onclick='test()'>-</button><input type='text' name='eaea' id='eaea' value='1' size='2' readonly='readonly' /><button onclick='test1()'>+</button> <button type='button' class='delBtn' onclick=menuDelete(this,'"+foodprice+"')>X</button></div>");

	var eaea = document.getElementById("eaea").value;
	console.log("eaeaeaeaeaea" + eaea)
	console.log(eaea)
	totalPrice = parseInt(totalPrice)+parseInt(foodprice)*parseInt(eaea)
	$("#totalPayment").text(common.format(totalPrice)+" 원")
}

function menuDelete(ths,price){
	console.log(totalPrice)
	console.log(parseInt(price))
	var ths = $(ths);
	ths.parent("div").empty();
	totalPrice = parseInt(totalPrice)-parseInt(price)
	$("#totalPayment").text(totalPrice)
	document.getElementById
	
}

//수량체크
function test() {
    var tmp = document.getElementById("eaea").value;
    tmp--;

    document.getElementById("eaea").value = tmp;
}
function test1() {
    var tmp = document.getElementById("eaea").value;
    tmp++;

    document.getElementById("eaea").value = tmp;
}

//주문서 생성
//비회원이 주문서 생성할 때 로그인 하라고 알람 주기
function orderInsert(){
	var userInfo = '${userInfo.EMAIL}';
	if(userInfo == null || userInfo == ''){
		alert("주문 시 로그인 필수");
		window.location.replace("http://localhost:8110/user/userLogin.do");
	}else{
		var orderArray = []
		var selectFoodList = $(".selectFood")
		var foodnum = $(".selectFood .foodnum")
		var optionName = $(".selectFood .optionName")
		var optionnum = $(".selectFood .optionnum")
		for(var i=0; i< selectFoodList.length;i++){
	
			var orderInfo ={
					storenum : '${getStoreInfo[0].STORENUM}',
					foodnum : foodnum[i].value,
					price : $('#totalPayment').text(),
					email : '${userInfo.EMAIL}',
					options : optionName[i].value,
					optionnum : optionnum[i].value
				}
			orderArray.push(orderInfo)
		}
		console.log("오더 옵션")
		console.log(orderArray)
		
		var jsonData = JSON.stringify(orderArray);
		
		$.ajax({
			type : 'POST',
			url : '/shop/orderInsert.do',
			data : {'jsondata':jsonData},
			dataType : 'json',
			success : function(json){
				alert("주문서 생성 성공");
				location.href="orderPayment.do";
			},
			error: function(xhr, status, error){
				alert("주문서를 생성하지 못했습니다."+error);
			}
		});
	}
}

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = { 
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 

//마커를 생성합니다
var marker = new kakao.maps.Marker({
position: markerPosition
});

//마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);
</script>

