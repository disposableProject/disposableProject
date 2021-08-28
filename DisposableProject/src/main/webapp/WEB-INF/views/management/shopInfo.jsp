<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7471cecaa76c6d8951aaabeda997b7c6&libraries=services"></script>
<link rel="stylesheet"   href="/js/datetimepicker/jquery.datetimepicker.css" />
<script  src="/js/datetimepicker/jquery.datetimepicker.full.min.js"></script>
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
input[type=checkbox] {
height: 18px
}
input[type=radio] {
height: 18px
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
				<td colspan="2"><input  type="text" id="address"  name="ADDRESS"  style="width: 500px"  value="${storeInfo.ADDRESS}" readonly="readonly"></td>
				<td colspan="1"><button id="dupliButton" type="button" onclick="common.findAddress($('#address'),$('#latitude'),$('#longitude'))">주소검색</button></td>
				<input  type="hidden" id="latitude"  name="LATITUDE"    value="${storeInfo.LATITUDE}" >
				<input  type="hidden" id="longitude"  name="LONGITUDE"   value="${storeInfo.LONGITUDE}" >
			</tr>
			<tr>
				<td class="titleTd">영업시간</td>
				<td colspan="3"><input  type="text"   id="date_timepicker_start"  name="opentime"    value=""  style="width: 50px"> ~ <input  type="text"  id="date_timepicker_end"  name="closetime"    value="" style="width: 50px"></td>
			</tr>
			<tr>
				<td class="titleTd">가게 분류</td>
				<td colspan="3">
				
					<input  type="radio" name="classify"  value="KOR"  <c:if test="${storeInfo.CLASSIFY =='KOR' }">checked</c:if> />한식 
					<input  type="radio" name="classify" value="JPN"<c:if test="${storeInfo.CLASSIFY =='JPN' }">checked</c:if> />일식
					<input  type="radio" name="classify" value="WEST" <c:if test="${storeInfo.CLASSIFY =='WEST' }">checked</c:if> />양식
					<input  type="radio" name="classify"  value="SIMPLE"<c:if test="${storeInfo.CLASSIFY =='SIMPLE' }">checked</c:if> />분식
					<input  type="radio" name="classify"  value="CHICKEN"<c:if test="${storeInfo.CLASSIFY =='CHICKEN' }">checked</c:if> />치킨
					<input  type="radio" name="classify"  value="PIG" <c:if test="${storeInfo.CLASSIFY =='PIG' }">checked</c:if> />족발/보쌈
					<input  type="radio" name="classify"  value="CAFE"<c:if test="${storeInfo.CLASSIFY =='CAFE' }">checked</c:if> />카페
					<input  type="radio" name="classify"  value="ANOTHER"<c:if test="${storeInfo.CLASSIFY =='ANOTHER' }">checked</c:if> />기타
				</td>
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
jQuery(function(){
jQuery('#date_timepicker_start').datetimepicker({
	format:'H:i',
	datepicker:false,
	 allowTimes:[
	  '00:00', '00:30', '01:00', '01:30', '02:00', '02:30', '03:00', '03:30', '04:00', '04:30', '05:00', '05:30', '06:00'
	  , '07:00', '07:30', '08:00', '08:30', '09:00', '10:00', '10:30','11:00', '11:30' ,'12:00','12:30' ,'13:00', '13:30', '14:00', '14:30', '15:00'
	  , '15:30', '16:00', '16:30','17:00', '17:30', '18:00', '18:30' ,'19:00', '19:30','20:00', '20:30', '21:00', '21:30', '22:00', '22:30', '23:00', '23:30'
	 ]
	});
jQuery('#date_timepicker_end').datetimepicker({
	format:'H:i',
	datepicker:false,
	 allowTimes:[
		 '00:00', '00:30', '01:00', '01:30', '02:00', '02:30', '03:00', '03:30', '04:00', '04:30', '05:00', '05:30', '06:00'
		  , '07:00', '07:30', '08:00', '08:30', '09:00', '10:00', '10:30','11:00', '11:30', '12:00','12:30', '13:00', '13:30', '14:00', '14:30' ,'15:00'
		  , '15:30', '16:00', '16:30','17:00', '17:30', '18:00', '18:30', '19:00', '19:30','20:00', '20:30', '21:00', '21:30', '22:00', '22:30', '23:00', '23:30'
	 ]
	});
});
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