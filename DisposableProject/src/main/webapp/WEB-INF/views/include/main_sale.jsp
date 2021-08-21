<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div style="width: 1100px;margin: auto;display: flex;flex-wrap: wrap;">
	<c:forEach items="${SaleFoodList}" var="SaleFoodLists">
		<div style="width: 250px;height: 300px;border: 1px solid #ddd;margin: 10px" onclick="location.href='/shop/shopMain.do?device=web&shopnum=${SaleFoodLists.STORENUM}'">
			<div style="height: 75%">
				<img src="https://cookingcoding.s3.ap-northeast-2.amazonaws.com/${SaleFoodLists.IMGNAME}" style="width: 100%;height: 100%">
			</div>
			<div style="font-weight: bold;font-size: 20px">${SaleFoodLists.STORENAME} - ${SaleFoodLists.FOODNAME}</div>
			<div>판매가: <fmt:formatNumber value="${SaleFoodLists.PRICE}" type="currency"  /></div>
			<div>할인가: <fmt:formatNumber value="${SaleFoodLists.PRICE - SaleFoodLists.PRICE * (SaleFoodLists.SALEPERCENT/100) }" type="currency"/> (${SaleFoodLists.SALEPERCENT}%)</div>
		</div>
	</c:forEach>
	
</div>