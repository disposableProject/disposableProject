<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
*{
	box-sizing: border-box;
}
.orderTop{
	text-align: center; margin-top: 50px; margin-bottom: 50px;
}
.container{
	width: 1240px; display: flex; flex-direction: column;  margin: 0 auto;
}
.middleBox{
	display: flex;
}
.boxLine{
	border-top: 1px solid #333; border-bottom: 1px solid #333; padding-bottom: 15px; padding-top: 25px;
}
.amountFont{
	font-size: 25px; color: #000; display: flex; flex-direction: row-reverse;margin-top: 10px; margin-bottom: 70px;
}
.nameFont{
	color: #000; font-size: 16px;
}
.opnameFont{
	color: #999; font-size: 14px; padding-top: 3px;
}
.pText{
	display: flex; height: 30px; line-height: 30px; margin-bottom: 8px; color: #666;
}
.cLeft{
	flex: 1; font-size: 21px; font-weight: 400;
}
.cRight{
	margin-right: 25px;
}
.gText{
	margin: 0; letter-spacing: 1px; margin-bottom: 1px;
}
.mRightBox{
	display:flex; flex-direction:column; width: 30%; margin-top: 70px;
}
.rightText{
	border: 1px solid #f2f2f2; height:500px; background: #fafafa; padding: 16px;
}

.mLeftBox{
	width: 70%;
}
.guideText{
	color: #666; margin-top: 25px; margin-right: 25px;
}
.mBoxLine{
	border-top: 1px solid; border-bottom: 1px solid; width: 98%;
}
.payBtn{
	width: 372px; margin-top: 12px; height: 70px; font-size: 20px; cursor: pointer;
}
</style>
<div class="orderTop">
	<h1>주문서</h1>
</div>
<div class="container">
	<div class="topBox" style="width: 100%;">
		<div class="order_List">
		<h2>주문 메뉴</h2>
			<ul style="list-style: none; padding-left: 0;">
				<div class="boxLine">
					<c:forEach items="${orderPayment}" var="orderList">
						<li style="display: flex; height: 60px;">
							<div class="photo" style="width: 300px;"><span>포토 들어갈 자리</span></div>
							<div class="nameBox">
								<div class="name" style="width: 500px;"><span class="nameFont">${orderList.FOODNAME} 메뉴명</span>
								<div class="optionName" style="width: 200px; padding-top: 4px;"><span class="opnameFont">${orderList.OPTIONS} 옵션명</span></div></div>
							</div>
							<div class="quantity" style="width: 200px;"><span>${orderList.PRICE}원</<span></div>
							<div class="quantity" style="width: 200px;"><span>${orderList.OPTIONPRICE}원</<span></div>
							<%-- <div class="quantity" style="width: 200px;"><span>${orderList.PRICE} 수량 원</<span></div> --%>
						</li>
					</c:forEach>
				</div>
				<div class="amount"><span class="amountFont">총 결제 금액 : ${orderPayment[0].ALLPRICE}원</span></div>
			</ul>
		</div>
	</div>
	<div class="middleBox" style="width: 100%; height: 600px;">
		<div class="mLeftBox">
			<h2>결제 방법</h2>
			<div class="mBoxLine">
				<div class="payGuide">
					<h3>카카오 페이로 결제하기</h3>
					<p>카카오 결제</p>
				</div>
			</div>
		</div>
		
		<div class="mRightBox">
				<div class="rightText">
					<h2>결제 예정금액</h2>
					<div class="payMiniBox">
						<div class="pText">
							<div class="cLeft">주문금액</div>
							<div class="cRight">원</div>
						</div>
						<div class="pText">
							<div class="cLeft">총 결제 금액</div>
							<div class="cRight">${orderPayment[0].ALLPRICE}원</div>
						</div>
					</div>
					<div class="guideText">
						<p class="gText">예상 소요시간 안내</p>
						<p class="gText">가게 사정에 따라 픽업 소요 시간은 변경될 수 있습니다.</p>
					</div>
				</div>
			<!-- 결제 버튼(태그) -->
			<div class="payArea">
				<button type="button" class="payBtn">결제하기</button>
			</div>
		</div>
	</div>
</div>
<script>
</script>