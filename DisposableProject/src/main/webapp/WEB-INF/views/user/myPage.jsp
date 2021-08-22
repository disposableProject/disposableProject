<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
*{
	box-sizing: border-box;	letter-spacing: 0.1rem;
}
.container{
	width: 1240px;	display: flex; flex-direction: row; margin: 0 auto;
}
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
</style>

<div class="container">
	<div class="leftSection">
		<div class="myText"><h2>나의 현황</h2></div>
		<div class="leftMenu">
			<ul class="listMenu">
				<li>
					<a href="#none">주문 내역</a>
				</li>
				<li>
					<a href="#none">상품 후기</a>
				</li>
				<li>
					<a href="#none">개인 정보 수정</a>
				</li>
			</ul>
		</div>
	</div>
	
	<div class="rightSection">
	
	</div>
</div>