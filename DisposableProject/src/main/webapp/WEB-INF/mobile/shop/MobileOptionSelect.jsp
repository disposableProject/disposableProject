<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<style>
.numpm{
width: 25px;
height: 25px;
border: 1px solid black;
border-radius: 50%;
display: inline-block;
text-align: center;
font-size: 18px;

margin-right: 5px;
margin-left: 5px
}
#visibleNumber{
font-size: 18px;

}
</style>


<div style="width: 100%;height: 250px">
<img class="storeImg" alt="" src="https://cookingcoding.s3.ap-northeast-2.amazonaws.com/${getStoreInfo[0].PHOTO}" style="width: 100%;height: 100%"/>
</div>
<div style="width: 92%;height: 100px;margin: auto;">
	<h2>${getFoodInfo[0].FOODNAME}</h2>
	<h5>음식 설명</h5>
</div>
<div style="width: 100%;height: 140px;border-top: 1px solid #f2f2f2 ">
	<div  style="width:92%;height: 70px;display: flex;align-items: center;justify-content: space-between;margin: auto;">
		<span>가격</span>
		<span>${getFoodInfo[0].PRICE}원</span>
	</div>
	<div  style="width:92%;height: 70px;display: flex;align-items: center;justify-content: space-between;margin: auto;">
		<span>수량</span>
		<span><span class="numpm" onclick="setNumber('1')">+</span><span id="visibleNumber">1</span><span class="numpm"  onclick="setNumber('-1')">-</span><input type="hidden"  id="foodNumber" value="1"/></span>	
	</div>
</div>
<c:set var="optiongrnum" value="-1" />
<c:forEach items="${FoodOptionList}" var="FoodOptionLists">
	<c:if test="${optiongrnum !=  FoodOptionLists.OPTIONGROUP}">
		<c:set var="optiongrnum" value="${FoodOptionLists.OPTIONGROUP}" />
		<div style="width: 100%;height: 50px;background: #f2f2f2;display: flex;align-items: center;justify-content: space-between;">
			<span style="padding: 0 15px 0 15px">${FoodOptionLists.OPTIONGRNAME}</span>
			<c:if test="${FoodOptionLists.CHECKFLAG == 'Y'}">
				<span style="padding: 0 15px 0 15px">필수 선택</span>
			</c:if>
		</div>
	</c:if>
	<div style="width: 92%;height: 60px;display: flex;align-items: center;margin: auto;">
		<c:if test="${FoodOptionLists.CHECKFLAG == 'N'}">
				<input type="checkbox"  class="options"  value="${FoodOptionLists.OPTIONNAME}/${FoodOptionLists.PRICE}"/> ${FoodOptionLists.OPTIONNAME} <span>(+ ${FoodOptionLists.PRICE}원)</span>
		</c:if>
		<c:if test="${FoodOptionLists.CHECKFLAG == 'Y'}">
				<input type="radio"  class="options"  name="${optiongrnum}"  value="${FoodOptionLists.OPTIONNAME}/${FoodOptionLists.PRICE}"/> ${FoodOptionLists.OPTIONNAME} <span>(+ ${FoodOptionLists.PRICE}원)</span>
		</c:if>
	</div>
</c:forEach>

<script>
function setNumber(num){
	var foonumber = $("#foodNumber").val()
	foonumber = parseInt(foonumber) + parseInt(num)
	if(foonumber > 0){
		$("#visibleNumber").text(foonumber)
		$("#foodNumber").val(foonumber)
	}else{
		$("#visibleNumber").text("1")
		$("#foodNumber").val(1)
	}
}
</script>

