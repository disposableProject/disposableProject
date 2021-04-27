<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
.managementMContainer{
display: flex;flex-direction: column;height: 100%
}
.managementMContainer .innerContainer{
display: flex;justify-content: space-around;align-items: center;height: 30%;min-width: 600px
}
.totalCount{
width: 150px; height: 150px; border: 1px solid black;border-radius: 50%;display: flex;justify-content: center;align-items: center;flex-direction: column;
}
.hide{
display: none
}
</style>
<div class="managementMContainer">
	<div class="innerContainer">
		<div>
		<h1>shopname</h1>
		<h4>8.8/10</h4>
		</div>
		
		<span class="totalCount">
			<h5>오늘의 주문</h5>
			<h3>3건</h3>
		</span>
		<span class="totalCount hide">
			<h5>오늘의 수익</h5>
			<h3>15000원</h3>
		</span>
		<span class="totalCount hide">
			<h5>오늘의 주문</h5>
			<h3>3건</h3>
		</span>
	</div>
	<div>
		bottom
	</div>
</div>