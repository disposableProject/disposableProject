<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>

.container{
	width: 1240px;	display: flex; flex-direction: row; margin: 0 auto;
}
.rightSection{
	width: 100%
}
.review .top{
display: flex;
justify-content: space-between;
}
.review .mainOrderName{
height: 45px;
display: flex;
align-items: center;
padding-left: 10px
}
.review .orderList{
border-top: 1px solid #ddd;
border-bottom: 1px solid #ddd;
padding-left: 10px;
min-height: 180px;
display: flex;
align-items: center;
justify-content: space-between;
}
.orderboxLeft{
display: flex;
}
.orderboxLeft .photo{
height: 150px;
width: 130px;
border: 1px solid black;
}
hr{
margin: 5px 0px 5px 0px;
height: 3px;
}
.orderboxLeft .info{
display: flex;
flex-direction: column;
justify-content: center;
}
.info{
padding-left: 20px
}
.info .options{

}
.orderboxRight{
display: flex;
justify-content:space-between;
width: 300px
}
.orderboxRight .btnbox{
display: flex;
flex-direction: column;
}
.orderboxRight .states{
display: flex;
align-items: center;
}
</style>

<div class="container">
	<div class="leftSection">
		
	</div>
	
	<div class="rightSection">
		<div class="review">
			<h2>후기 작성</h2>
			
			<div class="top">
				<div class="ordernum">주문번호</div>
				<div class="question">문의하기</div>
			</div>
			<hr>
			<div class="bottom">
				<div class="mainOrderName">메인이름</div>
				<div class="orderList">
				<div class="orderboxLeft">
					<div class="photo">사진</div>
					<div class="info">
						<h3 class="foodname">음식이름</h3>
						<div class="options">옵션</div>
					</div>
				</div>	
					<div class="orderboxRight">
						<div class="states">픽업완료</div>
						<div class="btnbox">
							<button id="dupliButton" style="margin-bottom: 10px">후기쓰기</button>
							<button id="dupliButton">장바구니 담기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</div>