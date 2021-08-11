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

.shopInfoContainer input[type=text]{
border: 1px solid #aaa;
height: 27px !important;
outline: none;
}

.shopInfoContainer input:focus{
border: #264e36 1px solid;
}

.shopInfoContainer textarea{
width: 90%; height: 450px;border: #ccc 2px solid; resize: none; outline: none;font-size : 15px
}
.shopInfoContainer textarea:focus{
border: #264e36 2px solid;
}
</style>

<form name="shopForm" id="shopForm" method = "post">
<div class="shopInfoContainer">
	<h2>기본정보</h2>
	<table>
		<thead></thead>
		<tbody>
			<tr>
				<td class="titleTd">가게 명</td>
				<td><input  type="text"  name="shopName" value="${storeInfo.STORENAME}"></td>
				<td class="titleTd">전화번호</td>
				<td><input  type="text"  name="phone" value="${storeInfo.PHONE}"></td>
			</tr>
			<tr>
				<td class="titleTd">주소</td>
				<td colspan="2"><input  type="text"  name="ADDRESS"  style="width: 500px"  value="${storeInfo.ADDRESS}" readonly="readonly"></td>
				<td colspan="1"><button id="dupliButton" type="button" onclick="common.findAddress($('#address'))">주소검색</button></td>
			</tr>
			<tr>
				<td class="titleTd">가게 분류</td>
				<td colspan="2"></td>
				<td colspan="1"><button id="dupliButton" type="button" >추가</button></td>
			</tr>
			<tr style="height: 450px">
				<td class="titleTd">공지사항</td>
				<td colspan="3" style="padding: 0px;" >
					<div ><textarea id="notice" name="notice">${storeInfo.NOTICE}</textarea></div>
				</td>
				
			</tr>
			<tr style="border: 0px">
				<td colspan="4" style="text-align: right;"><button id="dupliButton" type="button" onclick="update()">저장</button></td>
			</tr>
		</tbody>
	</table>
</div>
</form>
<script>
function update(){
	var paramMap = common.serializeObject($("form[name=shopForm]"));
	var phoneRegExp = /^\d{3}-\d{3,4}-\d{4}$/;
	var telRegExp = /^\d{2,3}-\d{3,4}-\d{4}$/;
	var phoneNum = paramMap.phone.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3")
	if(paramMap.phone == null || paramMap.phone == ""){
		alert("번호를 입력하세요");
		$("#phone").focus();
		return false;
	}
	if(!phoneRegExp.test(phoneNum) && !telRegExp.test(phoneNum)){
		alert("올바른 번호 형식을 입력하세요");
		return false;
	}
	$.ajax({
		type : 'POST',
		url : '/management/shopInfoUpdate.do',
		data:  paramMap,
		dataType : 'json',

		success : function(json){
			alert("수정되었습니다.");
			location.href = '/management/shopInfo.do'
		},
		error: function(xhr, status, error){
			alert("수정에 실패했습니다."+error);
		}
	});
}

</script>