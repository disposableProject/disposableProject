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
	height: 100px;
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
					<img class="storeImg" alt="" src="" style="width: 400px; height: 500px;"/>
				</div>
				<div class="rightInfo">
					<p>가게이름</p>
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
		<button type="button">주문하기</button>
	</div>
</div>

<script>
function getFoodOption(storenum,foodnum,foodname,foodprice){
	$("#totalPrice").html("선택 가격: "+foodprice+"원 <br><button>메뉴 담기</button>")
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
						html += "<input type='radio' onclick='setFoodPrice("+foodprice+")'  class='foodoptions' name='"+json[i].OPTIONGROUP+"' value='"+json[i].PRICE+"' /><div>"+json[i].OPTIONNAME+": "+json[i].PRICE+"</div>"
					}else{
						html += "<input type='checkbox' onclick='setFoodPrice("+foodprice+")' class='foodoptions' name='"+json[i].OPTIONGROUP+"' value='"+json[i].PRICE+"' /><div>"+json[i].OPTIONNAME+": "+json[i].PRICE+"</div>"
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

function setFoodPrice(foodPrice){
	var optionPrice = foodPrice;
	$('.foodoptions:checked').each(function() {
		
		var value = $(this).val();
		optionPrice = parseInt(optionPrice) + parseInt(value);
	});
	$("#totalPrice").html("선택 가격: "+optionPrice+"원 <br><button>메뉴담기</button>")
}
</script>