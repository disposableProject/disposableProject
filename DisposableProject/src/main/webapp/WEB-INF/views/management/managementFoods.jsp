<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
.ManagementFoodsContainer{
width: 1000px;height: 800px;margin: auto;overflow: auto;-ms-overflow-style: none;
}
.ManagementFoodsContainer::-webkit-scrollbar { display: none; }

.ManagementFoodsContainer table{
width: 100%;border-collapse: collapse;margin: auto;margin-top: 10px;border: 1px solid #d5d5d5;
}
.ManagementFoodsContainer table:hover{
border: 1px solid #1f9401;cursor: pointer;
}
.ManagementFoodsContainer table tr{
height: 140px;
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
</style>


<div class="ManagementFoodsContainer">
	<div class="InnerHeader">
		<h2>음식 관리</h2>
		<a href="foodInsert.do">등록하기</a>
	</div>
		
	<table>
		<thead></thead>
		<tbody>
			<tr>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</tbody>
	</table>
	<table>
		<thead></thead>
		<tbody>
			<tr>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</tbody>
	</table>
	<table>
		<thead></thead>
		<tbody>
			<tr>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</tbody>
	</table>
	<table>
		<thead></thead>
		<tbody>
			<tr>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</tbody>
	</table>


	<div class="bottomBtn">
		<span>1234 > >></span>
		<!-- <a>더보기</a> -->
	</div>
	
</div>