<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="commonScript.jsp"></jsp:include>
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
height: 55px;
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


</nav>
