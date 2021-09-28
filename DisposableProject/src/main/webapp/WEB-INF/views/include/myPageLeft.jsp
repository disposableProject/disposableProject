<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
ul{
	list-style: none;
	padding-left: 0px;
}
a{
	text-decoration: none;
}
.leftMenu{
	border: 1px solid #f2f2f2;
	border-bottom: 0;
	width: 200px
}
.listMenu{
	display: block;
    padding: 15px 0 15px 20px;
    line-height: 40px;
    font-size: 18px;
    color: #666;
}
.listMenu li{
	border-bottom: 1px solid #f2f2f2;
}
.sideNav{
margin-left: 10px
}
</style>
<nav class="sideNav">
	<div class="myText"><h2>나의 현황</h2></div>
		<div class="leftMenu">
			<ul class="listMenu">
				<li><a href="/myPage/myorderList.do">주문 내역</a></li>
				<li><a href="/myPage/myPage.do">상품 후기</a></li>
				<li><a href="/myPage/myInfo.do">개인 정보 수정</a></li>
			</ul>
		</div>
</nav>