<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
.shopInfoContainer{
width: 90%;height: 100%;margin: auto;
}
.shopInfoContainer table{
width: 100%;border-collapse: collapse;margin: auto;border-top: 2px solid #747474;
}
.shopInfoContainer table tr{
height: 50px;border-bottom: 1px solid #e7e7e7;
}
.shopInfoContainer table .titleTd{
background: #f8f8f8;width: 100px;color:#393939;font-size: 13px;font-weight: bold;text-align: center;border-right: 1px solid #e7e7e7;
}
</style>


<div class="shopInfoContainer">
	<h2>기본정보</h2>
	<table>
		<thead></thead>
		<tbody>
			<tr>
				<td class="titleTd">가게 명</td>
				<td>${storeInfo.STORENAME}</td>
				<td class="titleTd">전화번호</td>
				<td>${storeInfo.PHONE}</td>
			</tr>
			<tr>
				<td class="titleTd">주소</td>
				<td colspan="3">${storeInfo.ADDRESS}</td>
			</tr>
			<tr>
				<td class="titleTd">가게 분류</td>
				<td></td>
				<td colspan="2"><button>추가</button></td>
			</tr>
			<tr style="height: 450px">
				<td class="titleTd">공지사항</td>
				<td colspan="3" style="padding: 0px;" >
					<div >${storeInfo.NOTICE}</div>
				</td>
				
			</tr>
			<tr style="border: 0px">
				<td colspan="4" style="text-align: right;"><button>저장</button></td>
			</tr>
		</tbody>
	</table>
</div>