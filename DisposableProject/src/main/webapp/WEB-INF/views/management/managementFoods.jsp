<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.ManagementFoodsContainer{
width: 1200px;height: 800px;margin: auto;overflow: auto;-ms-overflow-style: none;
}
.ManagementFoodsContainer::-webkit-scrollbar { display: none; }

.ManagementFoodsContainer table{
width: 100%;border-collapse: collapse;margin: auto;margin-top: 10px;border: 1px solid #d5d5d5;
}
.ManagementFoodsContainer table:hover{
border: 1px solid #1f9401;cursor: pointer;
}
.ManagementFoodsContainer table tr{
height: 110px;
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
width: 100%;
height: 70%;
border-bottom: 1px solid #d5d5d5;
}
.foodInfo{
padding: 10px;

}
.gridContainer{
 display: grid;
 grid-template-columns: 290px 290px 290px 290px;
grid-template-rows: 300px;
  gap: 20px 10px;
  }

.gridItem{
border: 1px solid #d5d5d5;
height: 300px;
}

.gridItem:hover{
border: 1px solid #1f9401;cursor: pointer;
}

.pageAreaUl {
  display: inline-block;
  list-style: none;
}

.pageAreaUl li {

  float: left;
  padding: 8px 16px;
  text-decoration: none;
  transition: background-color .3s;
  border: 1px solid #ddd;
  margin: 0 4px;
  cursor: pointer;
}
.noclick{
  color: black;
}
.nowpage { 
  background-color: #B6CBA3;
  color: white; 
  border: 1px solid #4CAF50;
}

.pageAreaUl li:hover:not(.nowpage) {background-color: #ddd;}
</style>


<div class="ManagementFoodsContainer">
	<div class="InnerHeader">
		<h2>음식 관리</h2>
		<button id="dupliButton"  onclick='location.href="foodInsert.do"'>등록하기</button>
	</div>
	
	<div class="gridContainer">
	<c:forEach items="${foodList}" var="foodInfo">
	<%-- <table>
		<thead></thead>
		<tbody>
			<tr>
				<td class="foodImg">
				<img src="https://cookingcoding.s3.ap-northeast-2.amazonaws.com/${foodInfo.IMGNAME}" style="width: 100%;height: 100px"> 
				</td>
				<td class="foodInfo">
					<h2>${foodInfo.FOODNAME}</h2>
					<h4>${foodInfo.PRICE}원</h4>
					<h6>분류</h6>
				</td>
			</tr>
		</tbody>
	</table> --%>	
	
	<div class="gridItem" onclick="location.href='foodUpdate.do?foodnum=${foodInfo.FOODNUM}'">
		<div class="foodImg">
			<img src="https://cookingcoding.s3.ap-northeast-2.amazonaws.com/${foodInfo.IMGNAME}" style="width: 100%;height: 100%">
		</div>
		<div>${foodInfo.FOODNAME}</div>
		<div>${foodInfo.PRICE}원</div>
	</div>
	
	</c:forEach>
</div>
	



	<div class="bottomBtn">
		<ul class="pageAreaUl">
			<c:if test="${1 < pageGroupNum}">
		<li aria-label="Previous" class='noclick'
			onclick="pageGroupMove('${pageGroupNum - 1}','${boardNum}')">&laquo;</li>
		</c:if>
		<c:if test="${pageGroupNum < pageGroupCnt}">
		<c:forEach var="p" begin="${startPage}" end="${startPage + 4}">
			<c:if test="${pageNum == p }">
			<li class='nowpage' onclick="pageMove('${p}','${boardNum}')"><span class="page${p}">${p}</span></li>
			</c:if>
			<c:if test="${pageNum != p }">
			<li class='noclick' onclick="pageMove('${p}','${boardNum}')"><span class="page${p}">${p}</span></li>
			</c:if>
		</c:forEach>
		</c:if>
		<c:if test="${pageGroupNum == pageGroupCnt}">
		<c:forEach var="p" begin="${startPage}" end="${totalPageCnt}">
		
			<c:if test="${pageNum == p }">
			<li class='nowpage' onclick="pageMove('${p}','${boardNum}')"><span class="page${p}">${p}</span></li>
			</c:if>
			<c:if test="${pageNum != p }">
			<li class='noclick' onclick="pageMove('${p}','${boardNum}')"><span class="page${p}">${p}</span></li>
			</c:if>
			
		</c:forEach>
		</c:if>

	<!-- next -->
		<c:if test="${pageGroupNum < pageGroupCnt}">
		<li aria-label="Next"
			onclick="pageGroupMove('${pageGroupNum + 1}','${boardNum}')">&raquo;</li>
		</c:if>
		</ul>
	</div>
	
</div>

<script>
function pageMove(pagenum, boardnum){
	location.href = "/management/managementFoods.do?pagenum="+pagenum+"&boardnum="+boardnum
	
}
function pageGroupMove(pageGroupNum, boardnum){
	var pagenum = (pageGroupNum - 1) * 5 + 1;
	location.href = "/management/managementFoods.do?pagenum="+pagenum+"&boardnum="+boardnum
}
</script>