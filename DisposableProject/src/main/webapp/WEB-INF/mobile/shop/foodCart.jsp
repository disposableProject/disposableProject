<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div style="width: 100%;height: 55px;display: flex;justify-content: space-between;border-bottom: 1px solid #f2f2f2;align-items: center;">
	<div style="margin-left: 15px">${getStoreInfo[0].ADDRESS}</div>
	<div style="margin-right: 15px">지도</div>
</div>
<div style="width: 100%;min-height: 170px;border-bottom: 1px solid #f2f2f2">
	<div style="width: 90%;height: 50px;margin-left: 15px">${getStoreInfo[0].STORENAME}</div>
	<div style="width: 100%;border-top:1px solid #f2f2f2 ">
		<div id="cartList"  style="width: 100%">
			<div style="display: flex;width: 100%;height:100px;justify-content: space-between;border-bottom: 1px solid #f2f2f2">
				<div style="margin-left: 15px">
					<div>음식명</div>
					<div>옵션</div>
					<div>가격</div>
				</div>
				<div style="margin-right: 15px">X</div>
			</div>
		</div>
		<div style="width: 100%;height:70px;display: flex;justify-content: center;align-items: center; " onclick='location.href="/shop/shopMain.do?shopnum=${getStoreInfo[0].STORENUM}&device=mobile"'>+메뉴추가</div>
	</div>
</div>
<div style="width: 100%;height: 80px;border-bottom: 1px solid #f2f2f2;">
	<div style="display: flex;justify-content: space-between;height: 50%;align-items: center;">
		<span style="margin-left: 15px">주문금액</span>
		<span style="margin-right: 15px"><span id="totalOrderPrice"></span>원</span>
	</div>
	<div  style="display: flex;justify-content: space-between;height: 50%;align-items: center;">
		<span style="margin-left: 15px">배달비</span>
		<span style="margin-right: 15px">+<span id="anotherPrice">0</span>원</span>
	</div>
</div>
<div style="width:100%;height:70px;display: flex;justify-content: space-between;border-bottom: 1px solid #f2f2f2;align-items: center;">
	<span  style="margin-left: 15px">총 결재금액</span>
	<span  style="margin-right: 15px"><span id="totalCartPrice"></span>원</span>
</div>

<script>
var storeNum =""
	var orderItems = ""
$(document).ready(function(){
	 storeNum = '${getStoreInfo[0].STORENUM}'
	 orderItems = JSON.parse(sessionStorage.getItem(storeNum));
	setCartList()
	
	
	
})

function setCartList(){
	storeNum = '${getStoreInfo[0].STORENUM}'
	orderItems = JSON.parse(sessionStorage.getItem(storeNum));
	var html = "";
	var totalPrice = "0"
	var anotherPrice = $("#anotherPrice").text()
	if(orderItems.length < 1){
		alert("주문 할 음식이 없습니다.")
		location.href="/shop/shopMain.do?shopnum="+storeNum+"&device=mobile"
	}
	for(var i=0;i<orderItems.length;i++){
		html += '<div id="cartList'+i+'" style="display: flex;width: 100%;height:100px;justify-content: space-between;border-bottom: 1px solid #f2f2f2">'
		html += '<div style="margin-left: 15px">'
		html +='<div>'+orderItems[i].foodName+'</div><div>'+orderItems[i].options.slice(0,-1)+'</div><div>'+orderItems[i].price+' 원</div></div>'
		html += '<div style="margin-right: 15px" onclick="deleteCart('+i+')">X</div></div>'
		totalPrice = parseInt(totalPrice)+ parseInt(orderItems[i].price)
		}
		
		$("#cartList").html(html)
		$("#totalOrderPrice").html(totalPrice)
		totalPrice =parseInt(totalPrice) + parseInt(anotherPrice)
		$("#totalCartPrice").html(totalPrice)
		
}

function deleteCart(num){
	orderItems.splice(num,1)
	console.log(num)
	console.log(orderItems)
	sessionStorage.setItem(storeNum, JSON.stringify(orderItems) );
	$("#cartList"+num).remove()
	setCartList()
}
</script>

