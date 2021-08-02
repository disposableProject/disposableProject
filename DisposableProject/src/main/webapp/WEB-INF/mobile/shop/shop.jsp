<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<div style="width: 100%;height: 250px">
<img class="storeImg" alt="" src="https://cookingcoding.s3.ap-northeast-2.amazonaws.com/${getStoreInfo[0].PHOTO}" style="width: 100%;height: 100%"/>
</div>
<div style="width:90%;height: 100px;border: 1px solid black;margin: auto;position: relative;bottom:60px;background: white;text-align: center;">
<h2>${getStoreInfo[0].STORENAME}</h2>
</div>
<div style="width: 90%;margin: auto;">
	<h2>${getStoreInfo[0].ADDRESS}</h2>
	<h3>${getStoreInfo[0].NOTICE}</h3>
	<h4>${getStoreInfo[0].PHONE}</h4>
</div>
<div style="width: 80%;margin: auto;">
리뷰
</div>
<div class="FoodContainer" style="width: 100%;margin-top: 30px">
	<c:forEach items="${StoreFoodList}" var="StoreFoodList">
	<div onclick="location.href='/shop/MobileOptionSelect.do?shopnum=${StoreFoodList.STORENUM}&foodnum=${StoreFoodList.FOODNUM}'" style="border-bottom: 1px solid #f2f2f2;display: flex;justify-content: space-between;width: 90%;margin: auto;height: 60px;align-items: center;">
		<div>
			<div>
			${StoreFoodList.FOODNAME }
			</div>
			<div>
			${StoreFoodList.PRICE }
			</div>
		</div>
		<div>
			<img  alt="" src="https://cookingcoding.s3.ap-northeast-2.amazonaws.com/${StoreFoodList.IMGNAME }" style="width: 100px;height: 60px"/>
		</div>
	</div>
	</c:forEach>
</div>