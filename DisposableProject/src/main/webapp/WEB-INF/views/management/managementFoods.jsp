<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.ManagementFoodsContainer{
width: 700px;height: 800px;margin: auto;overflow: auto;-ms-overflow-style: none;
}
.ManagementFoodsContainer::-webkit-scrollbar { display: none; }

.ManagementFoodsContainer table{
width: 100%;border-collapse: collapse;margin: auto;margin-top: 10px;border: 1px solid #d5d5d5;
}
.ManagementFoodsContainer table:hover{
border: 1px solid #1f9401;cursor: pointer;
}
.ManagementFoodsContainer table tr{
height: 160px;
}
.ManagementFoodsContainer .InnerHeader{
display: flex; justify-content: space-between;margin-top: 10px;align-items: center;
}
.ManagementFoodsContainer .InnerHeader a{
height: 30px;background: #B6CBA3;border: 1px solid #d5d5d5;color: #fff;text-decoration: none
}
.ManagementFoodsContainer .bottomBtn{
display: flex; justify-content: center; align-items: center; margin-top: 10px
}
.ManagementFoodsContainer .bottomBtn a{
display: inline-block;width: 171px;height: 45px;line-height: 45px;border: 1px solid #8a8a8a;text-align: center;font-size: 16px;font-weight: bold;box-sizing: border-box;border-radius: 50px;text-decoration: none;
}
.ManagementFoodsContainer .bottomBtn a:hover{
background: #B6CBA3; color: #fff; cursor: pointer;
}
.foodImg{
border-right: 1px solid #d5d5d5;
width: 40%
}
.foodInfo{
padding: 10px
}
</style>


<div class="ManagementFoodsContainer">
	<div class="InnerHeader">
		<h2>음식 관리</h2>
		<a href="foodInsert.do">등록하기</a>
	</div>
	<c:forEach items="${foodList}" var="foodInfo">
	<table>
		<thead></thead>
		<tbody>
			<tr>
				<td class="foodImg">
				<img src="https://cookingcoding.s3.ap-northeast-2.amazonaws.com/${foodInfo.IMGNAME}" style="width: 100%;"> 
				</td>
				<td class="foodInfo">
					<h2>${foodInfo.FOODNAME}</h2>
					<h4>${foodInfo.PRICE}원</h4>
					<h6>분류</h6>
				</td>
			</tr>
		</tbody>
	</table>	
	</c:forEach>

	



	<div class="bottomBtn">
		<span>1234 > >></span>
		<!-- <a>더보기</a> -->
	</div>
	
</div>