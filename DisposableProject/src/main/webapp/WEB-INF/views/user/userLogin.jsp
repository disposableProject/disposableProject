<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/css/ceoRegister.css?v=210423" /><!-- 버전 수정 -->

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
				<td><a href="${naverUrl}">naver Login</a></td>
				<td class="btnTd"></td>
			</tr>
		</tbody>
	</table>
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
				location.href = '/user/usermain.do'
			}else{
				alert("로그인 정보가 다릅니다.");
			}
			
		},
		error: function(xhr, status, error){
			alert("로그인에 실패했습니다."+error);
		}
	});
}

</script>