<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/userRegister.css?version=21042111" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>일반 회원가입</title>
</head>
<body>
<form name="userRegisterForm" id="userRegisterForm" method="POST">
	<table>
		<thead>
			<tr>
				<th colspan="3">회원가입</th>
			</tr>
		</thead>
		<tbody>
			<tr style="height: 20px;"></th>
			<tr>
				<td class="text">이메일(ID)</td>
				<td>
					<input id="emailCheck" name="emailCheck" >
					<input type="hidden"  id="email" name="email"/>
				</td>
				<td class="btnTd"><button id="dupliButton" type="button"  onclick="checkEmail()" onclick="poenPopup('emailCheckModal')">이메일 인증</button></td>
			</tr>
			<tr>
				<td class="text">닉네임</td>
				<td>
					<input id="nicknameCheck" name="nicknameCheck">
					<input type="hidden" id="nickname" name="nickname">
				</td>
				<td class="btnTd"><button id="dupliButton" type="button" onclick="checkNickname()">중복체크</button></td>
			</tr>
			<tr>
				<td class="text">비밀번호</td>
				<td><input id="password" name="password" type="password"></td>
				<td></td>
			</tr>
			<tr>
				<td class="text">비밀번호확인</td>
				<td><input id="password" name="password2" type="password"></td>
				<td></td>
			</tr>
			<tr>
				<td class="text">전화번호</td>
				<td style="font-size: large;font-weight: bold;"><input id="phone" name="phone"></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="button" id="regiButton" onclick="register()" value="회원가입" /></td>
				<td  class="btnTd"></td>
			</tr>
		</tbody>
	</table>
</form>

<jsp:include page="../common/modalPopup.jsp"></jsp:include>

<script>
function checkNickname(){
	var nicknameCheck = $("#nicknameCheck").val();
	var nickname = $("#nickname").val();
	var regExp =  /^[가-힣|a-z|A-Z|0-9|]+$/;

	if(nicknameCheck == null || nicknameCheck == ""){
		alert("닉네임을 입력 해주세요");
		return false;
	}
	if(!regExp.test(nicknameCheck)){
		alert("닉네임은 한글, 영어, 숫자만 4 ~10자리로 입력 가능합니다.");
		return false;
	}
	$.ajax({
		type : 'POST',
		url : '/user/checkNickname.do',
		data : {nickname:nicknameCheck },
		dataType : 'json',
		success : function(data){
			console.log(data)
			if(data.JavaData == 'YES'){
				alert("사용가능한 닉네임 입니다.");
				$("#nickname").val(nicknameCheck);
			}else{
				alert("이미 존재하는 닉네임 입니다.");
				$("#nicknameCheck").val("");
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
	common.progressOn('메일을 전송중 입니다.','GreenProgress')
	$.ajax({
		type : 'POST',
		url : '/user/checkUserEmail.do',
		data : {email: emailCheck},
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
	var registerData =common.serializeObject($("form[name=userRegisterForm]"));
	if(registerData.nickname == null || registerData.nickname == ""){
		alert("닉네임 중복 체크를 해주세요");
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


	
	$.ajax({
		type : 'POST',
		url : '/user/userRegisterPro.do',
		data : registerData,
		dataType : 'json',
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

</body>
</html>