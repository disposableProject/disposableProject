<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="/css/default.css?v=210423" /><!-- 버전 수정 -->
<link rel="stylesheet" type="text/css" href="/css/common.css?v=2104144" /><!-- 버전 수정 -->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script  src="/js/common/config.js?v=210422"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<a href="/user/ceoRegister.do">사장님 회원가입</a>
<a href="/user/ceoLogin.do">사장님 로그인</a>
<a href="/user/userRegister.do">일반 회원가입</a>
<c:out value="${userInfo.USERID}"></c:out>
<c:if test="${userInfo != null && userInfo != ''}">
	<a href="/shop/shopManagementSelect.do">${userInfo.STORENAME}</a>
</c:if>