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
height: 120px;
-webkit-box-shadow: 2px 6px 11px -2px rgba(0,0,0,0.05); 
box-shadow: 2px 6px 11px -2px rgba(0,0,0,0.05);
}
</style>

<nav class="topNav">
<a href="/user/ceoRegister.do">사장님 회원가입</a>
<a href="/user/ceoLogin.do">사장님 로그인</a>
<a href="/user/userRegister.do">일반 회원가입</a>
<a href="/user/userLogin.do">일반 로그인</a>
<c:out value="${userInfo.USERID}"></c:out>
<c:out value="${userInfo.NICKNAME}"></c:out>
<c:if test="${userInfo != null && userInfo != ''}">
	<a href="/management/managementMain.do">${userInfo.STORENAME}</a>
	<a href="#">${userInfo.STORENUM}</a>
	<a href="javascript:signOut();">로그아웃</a>
</c:if>
</nav>