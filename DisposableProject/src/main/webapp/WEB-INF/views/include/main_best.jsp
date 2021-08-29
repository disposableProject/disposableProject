<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div style="width: 1100px;margin: auto;display: flex;flex-wrap: wrap;">
	<c:forEach items="${RecommendFoodList}" var="RecommendFoodList">
		<div style="width: 250px;height: 350px;border: 1px solid #ddd;margin: 10px" onclick='location.href="/shop/shopMain.do?shopnum=${RecommendFoodList.STORENUM}&device=web"'>
				<div style="height: 70%">
					<img src="https://cookingcoding.s3.ap-northeast-2.amazonaws.com/${RecommendFoodList.IMGNAME}" style="width: 100%;height: 100%">
				</div>
				<div style="padding: 10px 5px 5px 5px">
				<div style="font-weight: bold;font-size: 20px">${RecommendFoodList.STORENAME} - ${RecommendFoodList.FOODNAME}</div>
				<div >판매가: <fmt:formatNumber value="${RecommendFoodList.PRICE}" type="currency"  /></div>
				<div>주문수: ${RecommendFoodList.ORDERCOUNT} 회 </div>
				</div>
			</div>
	</c:forEach>
</div>