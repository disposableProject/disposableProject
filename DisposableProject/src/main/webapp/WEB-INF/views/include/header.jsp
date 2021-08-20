<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="762533462627-6be5q0n8absr5gps7pv2bdvks2v98dj5.apps.googleusercontent.com">
<link rel="stylesheet" type="text/css" href="/css/default.css?v=210423" /><!-- 버전 수정 -->
<link rel="stylesheet" type="text/css" href="/css/common.css?v=2104144" /><!-- 버전 수정 -->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script  src="/js/common/config.js?v=210416"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
.topNav{

-webkit-box-shadow: 2px 6px 11px -2px rgba(0,0,0,0.05); 
box-shadow: 2px 6px 11px -2px rgba(0,0,0,0.05);
}

.NavTop{
width: 1200px;
margin: auto;
padding: 10px;
text-align: right;
font-size: 12px;
font-weight: 400
}
.NavTop a{

text-decoration: none;
color: #333;
}
.NavMid{
width: 1200px;
margin: auto;
text-align: center;
height: 35px;
display: flex;
justify-content: center;
align-items: center;
}
.NavBot span{
width: 1200px;
margin: auto;
text-align: left;	
display: flex;
justify-content: space-between;
}
.NavBot .firstUl{
width:70%;
list-style: none;
display: flex;
margin: auto;
padding-left: 0px
}
.NavBot .firstUl li{
padding-left: 120px;
}
.NavBot .secUl{
width:35%;
list-style: none;
display: flex;

}
.NavBot .secUl li{
padding-left: 30px;
}

.on { position: fixed; z-index: 9999 ;background: white;width: 100%; top: 0px;border-bottom: 1px solid #f2f2f2} 
.on span{z-index: 9999 ;background: white;width: 1200px;;display: flex;margin: auto;} 
.topNav li{
font-weight: 700;
}
.NavBot  {
height: 64px;
display: flex;
align-items: center;
}
</style>

<nav class="topNav">
<div class="NavTop">
	<c:if test="${userInfo != null && userInfo != ''}">
		<span>
		<c:out value="${userInfo.NICKNAME}"></c:out>
		<c:if test="${userInfo.STORENAME != null && userInfo.STORENAME != ''}">
			<a href="/management/managementMain.do">${userInfo.STORENAME}</a> 
		</c:if>
		| <a href="javascript:signOut();">로그아웃</a><!--  | <a href="/user/ceoRegister.do">사장님 시작하기</a> | <a href="/user/ceoLogin.do">사장님 로그인</a> --></span>	
	</c:if>
	<c:if test="${userInfo == null || userInfo == ''}">
		<span><a href="/user/userRegister.do">회원가입</a> | <a href="/user/userLogin.do">로그인</a> | <a href="/user/ceoRegister.do">사장님 시작하기</a> | <a href="/user/ceoLogin.do">사장님 로그인</a></span>
	</c:if>
	
</div>
<div class="NavMid">
	<h4 style="font-size: 25px; font-weight: bold;display: inline-block;cursor: pointer;" onclick="location.href='http://localhost:8110/'">Disposable</h4>
</div>
<div class="NavBot">
<span>
	<ul class="firstUl" style="margin: auto;">
		<li onclick="location.href='/new.do'">신메뉴</li>
		<li onclick="location.href='/best.do'">베스트</li>
		<li onclick="location.href='/around.do'">주변가게</li>
		<li onclick="location.href='/sale.do'">특가혜택</li>
	</ul>
	<!-- <ul class="secUl">
		<li>
			<input />
		</li>
		<li>버튼1</li>
		<li>버튼2</li>
	</ul> -->
</span>
</div>

</nav>
<script>
 const header = document.querySelector('.NavBot'); 
function scrollFunc(){ 
	if (pageYOffset >= 90) {
		header.classList.add('on'); 
		} else {
			header.classList.remove('on'); 
			} 
	} 
	window.addEventListener('scroll', scrollFunc); 

</script>
