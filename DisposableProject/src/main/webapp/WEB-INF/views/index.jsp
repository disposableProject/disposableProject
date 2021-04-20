<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<tiles:insertAttribute name="header" />  <!--공통으로 쓸 메인헤더-->
  	<tiles:insertAttribute name="body"/>   <!--요청에의해 바뀌는 body부분-->
  	<tiles:insertAttribute name="footer"/>   <!--요청에의해 바뀌는 body부분-->
</body>
</html>