<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
*{
	box-sizing: border-box;
}
.container{
	width: 1240px;
	display: flex;
    flex-direction: row;
    margin: 0 auto;
}
.leftSection{
	width: 880px;
	position: relative;
	
}
.rightSection{
	width: 360px;
	height: 100%;
	position: fixed;
	left: 65%;
	border: 1px solid black;
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
.bottomBox{
	border: 1px solid black;
}
.selectMenu{
	border: 1px solid #c4c4c4;
	min-height: 100px;
}
.foodBox{
	border: 1px solid;
    width: 280px;
    height: 300px;
    display: flex;
    flex-direction: column;
}
.items{
	display: grid;
    grid-template-columns: 280px 280px 280px;
    grid-template-rows: 300px;
    gap: 20px 20px;
}
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
					<p>가게주소</p>
					<p>공지사항</p>
				</div>
			</div>
		</div>
		
		<hr style="border: solid 1px #c4c4c4;" align="center;">
		
		<div class="middleBox">
			<div class="items">
				<c:forEach items="${StoreFoodList}" var="foodInfo">
					<div class="foodBox" onclick="getFoodOption('${foodInfo.STORENUM}','${foodInfo.FOODNUM}','${foodInfo.FOODNAME}','${foodInfo.PRICE}')">
						<span>${foodInfo.FOODNAME} -> </span>
						<span>${foodInfo.PRICE}원</span>
					</div>
				</c:forEach>
			</div>
		</div>
		
		<hr style="border: solid 1px #c4c4c4;" align="center;">
		
		<div class="bottomBox">
			<div class="reviewBox">
				리뷰 들어갈거임
			</div>
		</div>
	</div>
	
	<!-- 고정 + 주문하기 -->
	<div class="rightSection">
		<div id="optionList"></div>
		<div id="totalPrice"></div>
		<!-- 최종 장바구니 + 최종 결제 금액 -->
		<div class="selectMenu"></div>
		<div id="totalPayment"></div>
		<input type="button" onclick="orderInsert()" value="주문하기">
	</div>
</div>

<script>
var totalPrice = 0;

function getFoodOption(storenum,foodnum,foodname,foodprice){
	$("#totalPrice").html("선택 가격: "+foodprice+"원 <br><button onclick=getOrderInfo('"+foodname+"','"+foodprice+"')>메뉴 담기</button>")
	$.ajax({
		type : 'POST',
		url : '/shop/getFoodOption.do',
		data : {storenum:storenum,foodnum:foodnum},
		dataType : 'json',
		success : function(json){
			console.log(json)
			var html = "";
			var optionGroupNum = 0;
			html += "<div><span>"+foodname+"</span><span> "+foodprice+"원</span></div>"
			if(json.length > 0){
				html += "<div>추가옵션</div>"
				html += "<div> <div>옵션"+optionGroupNum+" : "+json[0].OPTIONGRNAME+"</div>"
				for(var i=0;i<json.length;i++){
					console.log()
					if(json[i].OPTIONGROUP != optionGroupNum){
						optionGroupNum = json[i].OPTIONGROUP
						html += "</div><div> <div>옵션"+optionGroupNum+": "+json[i].OPTIONGRNAME+"</div>"
					}
					if(json[i].CHECKFLAG == "N"){
						html += "<input type='radio' onclick=setFoodPrice('"+foodprice+"','"+foodname+"')  class='foodoptions' name='"+json[i].OPTIONGROUP+"' value='"+json[i].PRICE+"/"+json[i].OPTIONNAME+"' /><div>"+json[i].OPTIONNAME+": "+json[i].PRICE+"</div>"
					}else{
						html += "<input type='checkbox' onclick=setFoodPrice("+foodprice+","+foodname+") class='foodoptions' name='"+json[i].OPTIONGROUP+"' value='"+json[i].PRICE+"/"+json[i].OPTIONNAME+"' /><div>"+json[i].OPTIONNAME+": "+json[i].PRICE+"</div>"
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

function setFoodPrice(foodPrice,foodname){
	var optionPrice = foodPrice;
	$('.foodoptions:checked').each(function() {
		
		var value = $(this).val();
		optionPrice = parseInt(optionPrice) + parseInt(value);
	});
	$("#totalPrice").html("선택 가격: "+optionPrice+"원 <br><button onclick=getOrderInfo('"+foodname+"','"+optionPrice+"')>메뉴담기</button>")
}

// 메뉴 선택 정보를 가져옴
function getOrderInfo(foodname, foodprice){
	var foodOption = document.querySelectorAll(".foodoptions");
	console.log('fffff'+foodname);
	console.log(foodOption);
	var result = '';
	var j = 0
	for(var i=0; i<foodOption.length; i++){
		  if(foodOption[i].checked)  {
			  j++
			  console.log(foodOption[i].value.split("/"))
		    result += " 옵션"+j+": "+foodOption[i].value.split("/")[1];
		  }
	}
	console.log("너 무슨 값인데?")
	console.log(result)
	var selectMenuText = document.querySelector(".selectMenu");
	$(selectMenuText).append("<div class='selectFood'>"+foodname+"<br>"+result+"  <button type='button' onclick=menuDelete(this,'"+foodprice+"')>삭제하기</button></div>");
	totalPrice = parseInt(totalPrice)+parseInt(foodprice)
	$("#totalPayment").text(totalPrice)
}

function menuDelete(ths,price){
	console.log(totalPrice)
	console.log(parseInt(price))
	var ths = $(ths);
	ths.parent("div").empty();
	totalPrice = parseInt(totalPrice)-parseInt(price)
	$("#totalPayment").text(totalPrice)
	
}

//주문서 생성
function orderInsert(){
	
	
}
</script>