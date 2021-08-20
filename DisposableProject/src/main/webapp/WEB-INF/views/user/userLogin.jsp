<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/css/ceoRegister.css?v=210444" /><!-- 버전 수정 -->

<script src="/js/user/user.js?v=210337"></script>
<form name="registerForm" id="registerForm" method = "post">
	<table >
		<thead>
			<tr>
				<th colspan="3">유저 로그인</th>
			</tr>
		</thead>
		<tbody>
			<tr style="height: 20px"></tr>
			<tr>
				<td class="text">이메일</td>
				<td><input id="email" name="email"/></td>
				<td class="btnTd"></td>
			</tr>
			<tr>
				<td class="text">비밀번호</td>
				<td><input id="password" name="password" type="password"></td>
				<td class="btnTd"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="button" id="regiButton" onclick="Login()" value="로그인" /></td>
				<td class="btnTd"></td>
			</tr>
			<tr>
				<td></td>
				<td>
				<div style="width:90%;margin: auto;height: 40px;display: flex;align-items: center;justify-content: center;" id="regiButton"   onclick='location.href="${naverUrl}"'>
					네이버 로그인
				</div>
				</td>
				<td class="btnTd"></td>
			</tr>
			<tr>
				<td></td>
				<td>
				<div style="width:90%;margin: auto;height: 40px;display: flex;align-items: center;justify-content: center;" id="regiButton"   onclick="javascript:kakaoLogin()">
					카카오 로그인
				</div>
				</td>
				<td class="btnTd"></td>
			</tr>
				<tr>
				<td></td>
				<td><a   style="width:90%;margin: auto;height: 40px;display: flex;align-items: center;justify-content: center;" id="regiButton" class="g-signin2"  onClick="onSignIn()">Google Login</a>구글 로그인</td>
				<td class="btnTd"></td>
			</tr>
		</tbody>
	</table>
</form>

<form name="kakaoForm" id="kakaoForm" method = "post" action="/user/setSnsInfo.do">
<input type="hidden" name="email" id="kakaoEmail" />
<input type="hidden" name="id" id="kakaoId" />
<input type="hidden" name="flag" id="flag" value="kakao" />
</form>

<form name="googleForm" id="googleForm" method = "post" action="/user/setSnsInfo.do">
<input type="hidden" name="email" id="googleEmail" />
<input type="hidden" name="id" id="googleId" />
<input type="hidden" name="flag" id="flag" value="google" />
</form>
<script>
function Login(){
	var registerData =common.serializeObject($("form[name=registerForm]"));
	if(registerData.password == null || registerData.password == ""){
		alert("이메일을 입력하세요");
		$("#email").focus();
		return false;
	}
	if(registerData.password == null || registerData.password == ""){
		alert("비밀번호를 입력하세요");
		$("#password").focus();
		return false;
	}
	$.ajax({
		type : 'POST',
		url : '/user/userLoginPro.do',
		data : registerData,
		dataType : 'json',
		success : function(data){
			console.log(data)
			if(data.JavaData != null && data.JavaData != ""){
				alert("로그인되었습니다.");
				location.href = '/'
			}else{
				alert("로그인 정보가 다릅니다.");
			}
			
		},
		error: function(xhr, status, error){
			alert("로그인에 실패했습니다."+error);
		}
	});
}

function googleLoginPro(profile){
	console.log(profile.getEmail())
	$.ajax({
		type : 'POST',
		url : '/user/googleLoginPro.do',
		data : {email: profile.getEmail(), id:profile.getId()},
		dataType : 'json',
		success : function(data){
			if(data.JavaData == "YES"){
				location.href = '/'
			}else if(data.JavaData == "register"){
				console.log(profile.getEmail())
				$("#googleEmail").val(profile.getEmail());
				$("#googleId").val(profile.getId());
				$("#googleForm").submit();
			}else{
				alert("로그인에 실패했습니다");
			}
			
		},
		error: function(xhr, status, error){
			alert("로그인에 실패했습니다."+error);
		}
	});
}


</script>