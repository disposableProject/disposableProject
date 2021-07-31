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
	
	if(orderItems == null || JSON.parse(sessionStorage.getItem(storeNum)).length < 1){
		var orderArray = []
		sessionStorage.setItem(storeNum, JSON.stringify(orderArray) );
		var html = ""
		html += '<div id="cartbtn"  style="justify-content: center"><span style="font-weight:900;">리뷰작성</span></div>'
		$("#orderBottom").html(html)
	}else{
		var html = "";
		var orders = JSON.parse(orderItems);
		var price = "0"
		for(var i=0;i<orders.length;i++){
			price = parseInt(price) + parseInt(orders[i].price)
		}
		html += '<div id="cartbtn" onclick="orderFood()" style="justify-content: center" onclick="location.href=\'/shop/foodCart.do?shopNum='+storeNum+'\'"  ><span style="font-weight:900;">주문하기</span></div>'
		$("#orderBottom").html(html)
	}
})
function orderFood(){
	var storeNum = '${getStoreInfo[0].STORENUM}'
	var orderList = sessionStorage.getItem(storeNum)
	
	
	$.ajax({
		type : 'POST',
		url : '/shop/orderInsert.do',
		data : {jsondata:orderList},
		dataType : 'json',
		success : function(json){
			
			if(json){
				alert("주문 되었습니다.");
				location.href = "/mobile"
				sessionStorage.removeItem(storeNum)
			}
			
		},
		error: function(xhr, status, error){
			alert("음식 옵션을 가져오지 못했습니다."+error);
		}
	});
	
	
}
</script>