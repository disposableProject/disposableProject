<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="registerForm" id="registerForm">
<input id="userid" name="userid">
<input id="email" name="email">
<input id="password" name="password" type="password">
<input id="address" name="address">
<input id="shopName" name="shopName">
<input id="phone" name="phone">
<input id="notice" name="notice">
<button onclick="register()">회원가입</button>
</form>
<script>
function register(){
	 var registerData = $("form[name=registerForm]").serialize() ;
	 console.log(registerData)
	 $.ajax({
         type : 'post',
         url : '/user/ceoRegisterPro.do',
         data : registerData,
         dataType : 'json',
         success : function(json){
             alert(json)
         },
         error: function(xhr, status, error){
             alert(error);
         }
        
     });

}
</script>
</body>
</html>