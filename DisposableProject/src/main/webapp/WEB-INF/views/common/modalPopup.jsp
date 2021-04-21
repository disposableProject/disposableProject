<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/common.css?v=210420" /><!-- 버전 수정 -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
jQuery(document).ready(function(){
	$("#modalBack").click(function(){
		$("#modalBack").hide()
		$(".modal").hide()
	})
});

function poenPopup(modalName){
	$("#modalBack").show()
	$("#"+modalName).show()
}
</script>

<div id="modalBack"></div>
<div id="emailCheckModal" class="modal">
	<div id="modalInner">
		<table>
			<tr><td colspan="3"><h5>메일로 인증번호가 전송 되었습니다. 전송된 인증 번호를 입력하세요</h5></td></tr>
			<tr><td class="text">인증번호:</td><td><input /></td><td><button id="purpleButton">인증완료</button></td></tr>
			<tr></tr>
		</table>
	</div>
</div>
<div id="addressCheckModal" class="modal">
	<div id="modalInner">
		<table>
			<tr><td colspan="3"><h5 style="text-align: center;">가게의 주소를 입력해주세요</h5></td></tr>
			<tr><td class="text">주소:</td><td><input /></td><td><button id="purpleButton">입력완료</button></td></tr>
			<tr></tr>
		</table>
	</div>
</div>
</body>
</html>