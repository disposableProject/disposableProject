<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div style="width: 1100px;margin: auto;display: flex;flex-wrap: wrap;">
	<c:forEach items="${SaleFoodList}" var="SaleFoodLists">
		<div style="width: 250px;height: 350px;border: 1px solid #ddd;margin: 10px" onclick='location.href="/shop/shopMain.do?shopnum=${SaleFoodLists.STORENUM}&device=web"'>
				<div style="height: 70%">
					<img src="https://cookingcoding.s3.ap-northeast-2.amazonaws.com/${SaleFoodLists.IMGNAME}" style="width: 100%;height: 100%">
				</div>
				<div style="padding: 10px 5px 5px 5px">
				<div style="font-weight: bold;font-size: 20px">${SaleFoodLists.STORENAME} - ${SaleFoodLists.FOODNAME}</div>
				<div style="text-decoration:line-through">판매가: <fmt:formatNumber value="${SaleFoodLists.PRICE}" type="currency"  /></div>
				<div>할인가: <fmt:formatNumber value="${SaleFoodLists.PRICE - SaleFoodLists.PRICE * (SaleFoodLists.SALEPERCENT/100) }" type="currency"/> (${SaleFoodLists.SALEPERCENT}%)</div>
				<div class="time"><input type="hidden" class="now" value="${SaleFoodLists.SALEDATE}"><span class="timetext" style="color: red;font-size: 13px"></span></div>
				</div>
			</div>
	</c:forEach>
	
</div>
<script>
$(document).ready(function(){

	timeset()
	setInterval(timeset, 1000);
})
function timeset(){
	var date = new Date();
	$(".time").each(function(){
	var date2 = new Date($(this).find(".now").val());
	var gap = date2 - date
	var days = Math.floor(gap / (1000 * 60 * 60 * 24)); // 일
	var hour = String(Math.floor((gap/ (1000 * 60 *60 )) % 24 )).padStart(2, "0"); // 시
	var minutes = String(Math.floor((gap  / (1000 * 60 )) % 60 )).padStart(2, "0"); // 분
	var second = String(Math.floor((gap / 1000 ) % 60)).padStart(2, "0"); // 초

	 $(this).find(".timetext").text(days+"일"+hour+"시간"+minutes+"분"+second+"초")
	});
}
</script>