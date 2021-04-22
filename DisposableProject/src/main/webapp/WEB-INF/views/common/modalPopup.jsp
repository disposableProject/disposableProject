<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/css/common.css?v=210420" /><!-- 버전 수정 -->



<script type="text/javascript">
jQuery(document).ready(function(){
	$("#modalBack").click(function(){
		$("#modalBack").hide()
		$(".modal").hide()
	})
});

function openPopup(modalName){
	$("#modalBack").show()
	$("#"+modalName).show()
}
function closeModal(){
	$("#modalBack").hide()
	$(".modal").hide()
}

</script>

<div id="modalBack"></div>
<div id="emailCheckModal" class="modal">
	<div id="modalInner">
		<table>
			<tr><td colspan="3"><h5>메일로 인증번호가 전송 되었습니다. 전송된 인증 번호를 입력하세요</h5></td></tr>
			<tr><td class="text">인증번호:</td><td><input id="authNum" /></td><td><button id="purpleButton"  onclick="authNumcheck()">인증완료</button></td></tr>
			<tr></tr>
		</table>
	</div>
</div>
