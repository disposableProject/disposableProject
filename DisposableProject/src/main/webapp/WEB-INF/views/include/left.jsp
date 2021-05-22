<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
.sideNav{
background: #B6CBA3;min-height: 800px;height: 100%
}
.sideNav ul{
width:216px;margin: 0px;padding:0px;list-style: none;text-align: center;margin: auto;
}
.sideNav ul li{
width:100%;height: 50px;color:#fff;line-height: 50px;border-bottom: 1px solid #fff
}
.sideNav ul li a{
color:#fff;text-decoration: none;
}
</style>
<nav class="sideNav">
	<ul>
		<li><a href="managementMain.do">가게 관리 메인</a></li>
		<li><a href="shopInfo.do">가게 정보 관리</a></li>
		<li><a href="managementFoods.do?pagenum=1">음식 등록 및 수정</a></li>
		<li><a href="managementOrders.do">주문관리</a></li>
	</ul>
</nav>