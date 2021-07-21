<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:if test="${fn:length(StoreFoodList) < 1}">
등록된 음식이 없습니다.
</c:if>
<div style="display: flex;">
	<div>
	<c:forEach items="${StoreFoodList}" var="foodInfo">
		<div onclick="getFoodOption('${foodInfo.STORENUM}','${foodInfo.FOODNUM}','${foodInfo.FOODNAME}','${foodInfo.PRICE}')">
			<span>${foodInfo.FOODNAME} -> </span>
			<span>${foodInfo.PRICE}원</span>
		</div>
	</c:forEach>
	</div>
	<div>
		<div id="optionList"></div>
		<div id="totalPrice"></div>
	</div>
</div>
<script>
function getFoodOption(storenum,foodnum,foodname,foodprice){
	$("#totalPrice").html("선택 가격: "+foodprice+"원 <button>장바구니담기</button>")
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
	$("#totalPrice").html("선택 가격: "+optionPrice+"원 <button>장바구니담기</button>")
}
</script>