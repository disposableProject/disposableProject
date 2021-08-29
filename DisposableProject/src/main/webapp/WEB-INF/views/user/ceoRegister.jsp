<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="/css/ceoRegister.css?v=2104222" /><!-- 버전 수정 -->
<style>
input[name=classify]{
height: 18px !important;
width: 12px !important;
}
</style>

<form name="registerForm" id="registerForm" method = "post">
	<table >
		<thead>
			<tr>
				<th colspan="3">사장님 회원가입</th>
			</tr>
		</thead>
		<tbody>
			<tr style="height: 20px"></tr>
			<tr>
				<td class="text">아이디</td>
				<td>
					<input id="useridCheck" name="useridCheck">
					<input type="hidden"  id="userid" name="userid">
				</td>
				<td class="btnTd"><button id="dupliButton" type="button"  onclick="checkId()">중복체크</button></td>
			</tr>
			<tr>
				<td class="text">이메일</td>
				<td>
					<input id="emailCheck" name="emailCheck" >
					<input type="hidden"  id="email" name="email"/>
				</td>
				<td class="btnTd"><button id="dupliButton" type="button" onclick="checkEmail()">이메일 인증</button></td>
			</tr>
			<tr>
				<td class="text">비밀번호</td>
				<td><input id="password" name="password" type="password"></td>
				<td class="btnTd"></td>
			</tr>
			<tr>
				<td class="text">비밀번호확인</td>
				<td><input id="password2" name="password2" type="password"></td>
				<td class="btnTd"></td>
			</tr>
			<tr>
				<td class="text">대표음식사진 등록</td>
				<td><input id="foodImg" name="foodImg" type="file"></td>
				<td class="btnTd"></td>
			</tr>
			<tr>
				<td class="text">주소</td>
				<td><input id="address" name="address" readonly="readonly"></td>
				<td class="btnTd"><button id="dupliButton" type="button" onclick="common.findAddress($('#address'),$('#latitude'),$('#longitude'))">주소검색</button></td>
				<input  type="hidden" id="latitude"  name="LATITUDE"    value="${storeInfo.LATITUDE}" >
				<input  type="hidden" id="longitude"  name="LONGITUDE"   value="${storeInfo.LONGITUDE}" >
			</tr>
			<tr>
				<td class="text">가게이름</td>
				<td><input id="storename" name="storename"></td>
				<td class="btnTd"></td>
			</tr>
			<tr>
				<td class="text">가게 분류</td>
				<td colspan="3">
				
					<input  type="radio" name="classify"  value="KOR"  checked  />한식 
					<input  type="radio" name="classify" value="JPN" />일식
					<input  type="radio" name="classify" value="WEST"  />양식
					<input  type="radio" name="classify"  value="SIMPLE" />분식
					<input  type="radio" name="classify"  value="CHICKEN" />치킨
					<input  type="radio" name="classify"  value="PIG"  />족발/보쌈
					<input  type="radio" name="classify"  value="CAFE" />카페
					<input  type="radio" name="classify"  value="ANOTHER" />기타
				</td>
			</tr>
			<tr>
				<td class="text">전화번호</td>
				<td style="font-size: large;font-weight: bold;"><input id="phone" name="phone"></td>
				<td class="btnTd"></td>
			</tr>
			<tr>
				<td class="text">공지사항</td>
				<td><textarea id="notice" name="notice"></textarea>
				<td class="btnTd"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="button" id="regiButton" onclick="register()" value="회원가입" /></td>
				<td class="btnTd"></td>
			</tr>
		</tbody>
	</table>
</form>

<jsp:include page="../common/modalPopup.jsp"></jsp:include>
<script>

function checkId(){
	var useridCheck = $("#useridCheck").val()
	if(useridCheck == null || useridCheck == ""){
		alert("아이디를 입력 해주세요");
		return false;
	}
	var regExp = /^[a-z0-9]{4,20}$/;
	if(!regExp.test(useridCheck)){
		alert("아이디는 영 소문자, 숫자 4~10자리로 입력해주세요.");
		return false;
	}
	$.ajax({
		type : 'POST',
		url : '/user/checkUserId.do',
		data : {userId:useridCheck },
		dataType : 'json',
		success : function(data){
			if(data.JavaData == 0){
				alert("사용가능한 아이디 입니다.");
				$("#userid").val(useridCheck);
			}else{
				alert("이미 존재하는 아이디 입니다.");
				$("#useridCheck").val("");
			}
		},
		error: function(xhr, status, error){
			alert(error);
		}
	});
}
function checkEmail(){
	var emailCheck = $("#emailCheck").val();
	var email = $("#email").val();
	 
	if(emailCheck == null || emailCheck == ""){
		alert("이메일을 입력 해주세요");
		return false;
	}
	var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	if(!regExp.test(emailCheck)){
		alert("올바른 이메일 형식을 입력하세요");
		return false;
	}
	if(email == emailCheck ){
		alert("이미 인증되었습니다.")
		return false;
	}
	//로딩 프로그레스 추가하기
	console.log(emailCheck)
	common.progressOn('메일을 전송중 입니다.','GreenProgress')
	$.ajax({
		type : 'POST',
		url : '/user/checkEmail.do',
		data : {email:emailCheck},
		dataType : 'json',
		success : function(data){
			common.progressOff('GreenProgress');
			if(data.JavaData == "YES"){
				openPopup('emailCheckModal')
			}else{
				alert("이미 존재하는 이메일 입니다.");
				$("#emailCheck").val("");
			}
		},
		error: function(xhr, status, error){
			common.progressOff('GreenProgress');
			alert(error);
		}
	});
}

function authNumcheck(){
	  var authNum = $("#authNum").val();
	  var emailCheck = $("#emailCheck").val();
	  
	  $.ajax({
			type : 'POST',
			url : '/user/emailAuth.do',
			data : {authNum: authNum},
			dataType : 'json',
			success : function(data){
				if(data.JavaData == "YES"){
					$("#email").val(emailCheck);
					alert("인증되었습니다.");
					closeModal()
				}else{
					alert("인증번호가 다릅니다.");
				}
				$("#authNum").val('')
			},
			error: function(xhr, status, error){
				alert(error);
			}
		});
}

function register(){
	var registerData =common.serializeObject($("form[name=registerForm]"));
	if(registerData.userid == null || registerData.userid == ""){
		alert("아이디 중복체크를 해주세요");
		return false;
	}
	if(registerData.email == null || registerData.email == ""){
		alert("이메일 인증을 해주세요");
		return false;
	}
	if(registerData.password == null || registerData.password == ""){
		alert("비밀번호를 입력하세요");
		$("#password").focus();
		return false;
	}
	if(registerData.password2 == null || registerData.password2 == ""){
		alert("비밀번호를 입력하세요");
		$("#password2").focus();
		return false;
	}
	if(registerData.password != registerData.password2){
		alert("비밀번호가 일치하지 않습니다.");
		$("#password2").focus();
		return false;
	}
	if(registerData.storename == null || registerData.storename == ""){
		alert("가게 이름을 입력하세요");
		$("#storename").focus();
		return false;
	}
	if(registerData.phone == null || registerData.phone == ""){
		alert("번호를 입력하세요");
		$("#phone").focus();
		return false;
	}
	var phoneRegExp = /^\d{3}-\d{3,4}-\d{4}$/;
	var telRegExp = /^\d{2,3}-\d{3,4}-\d{4}$/;
	var phoneNum = registerData.phone.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3")
	if(!phoneRegExp.test(phoneNum) && !telRegExp.test(phoneNum)){
		alert("올바른 번호 형식을 입력하세요");
		return false;
	}
	
	var formData = new FormData();
	formData.append("registerData",JSON.stringify(registerData));
	var foodImg = $('input[name="foodImg"]').get(0).files;
	for(var i=0;i<foodImg.length;i++){
		formData.append('foodImg', foodImg[i]);
	}
	$.ajax({
		type : 'POST',
		url : '/user/ceoRegisterPro.do',
		processData:false,
		contentType: false,
		data: formData,
		/* dataType : 'json', */
		success : function(json){
			alert("가입되었습니다.");
			location.href = '/user/usermain.do'
		},
		error: function(xhr, status, error){
			alert("가입에 실패했습니다."+error);
		}
	});
}
</script>
