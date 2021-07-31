<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
#cartNumber{
width:20px;height:20px;background:white;display:inline-block;color:#b2cfbe;border-radius:50%;margin-right:10px;display: inline-flex;align-items: center;justify-content: center;
}
#cartbtn{
color: #fff;text-align: center;display: flex;width: 100%;justify-content: space-around;
}
#priceBox{

}
</style>    
<div id="orderBottom" style="width: 100%;height: 50px;background: #b2cfbe;display: flex;justify-content: center;align-items: center;">

</div>

<script>
$(document).ready(function(){
	var storeNum = '${getStoreInfo[0].STORENUM}'
	var orderItems = sessionStorage.getItem(storeNum);
	console.log(orderItems)
	console.log(JSON.parse(sessionStorage.getItem(storeNum)).length)
	if(orderItems == null || JSON.parse(sessionStorage.getItem(storeNum)).length < 1){
		var orderArray = []
		sessionStorage.setItem(storeNum, JSON.stringify(orderArray) );
		var html = ""
		html += '<div id="cartbtn" onclick="orderSave()" ><span style="font-weight:900;">카트에 담기</span></div>'
		$("#orderBottom").html(html)
	}else{
		var html = "";
		var orders = JSON.parse(orderItems);
		var price = "0"
		for(var i=0;i<orders.length;i++){
			price = parseInt(price) + parseInt(orders[i].price)
		}
		html += '<div id="cartbtn" onclick="orderSave()" ><span></span><span style="font-weight:900;margin-left:60px"><span  id="cartNumber">'+JSON.parse(sessionStorage.getItem(storeNum)).length+'</span>카트에 담기</span><span id="priceBox">'+price+'원</span></div>'
		$("#orderBottom").html(html)
	}
})

function orderSave(){
	var options = ""
	var storeNum = '${getStoreInfo[0].STORENUM}'
	var foodNum =  '${getFoodInfo[0].FOODNUM}'
	var foodName = '${getFoodInfo[0].FOODNAME}'
	//var price = '${getFoodInfo[0].PRICE}'
	var checkedoption = $(".options:checked")
	var foodNumber = $("#foodNumber").val()
	var totalPrice =  '${getFoodInfo[0].PRICE}'
	for(var i=0;i <checkedoption.length;i++){
		options += checkedoption[i].value.split("/")[0] + "/"
		totalPrice = parseInt(totalPrice) + parseInt(checkedoption[i].value.split("/")[1])
	}
	totalPrice = totalPrice*foodNumber
	var orderObject = {
			storenum:storeNum,
			foodnum:foodNum,
			foodName:foodName,
			price:totalPrice,
			email : '${userInfo.EMAIL}',
			options:options
	}
 var order =JSON.parse(sessionStorage.getItem(storeNum)); 
order.push(orderObject)
sessionStorage.setItem(storeNum,JSON.stringify(order));
location.href = "/shop/shopMain.do?shopnum="+storeNum+"&device=mobile"
}
</script>