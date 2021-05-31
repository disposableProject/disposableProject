<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<input id="test1" name="test1">
<input id="test2" name="test2">
<input id="test3" name="test3" type="file">

<button onclick="send()">전송</button>

<script>
function send(){
	var test3 = $('input[name="test3"]').get(0).files[0];
	var test1 = $("#test1").val()
	var test2 = $("#test2").val()
	var formData = new FormData();
	formData.append('test1', test1);
	formData.append('test2', test2);
	formData.append('test3', test3);

	$.ajax({
		type : 'POST',
		url : '/test/testPro.do',
		//contentType: 'application/json',
		processData:false,
		contentType: false,
	    data: formData,
		//data : JSON.stringify(foodData),
		//dataType : 'json',
		success : function(json){
			alert("등록되었습니다.");
			location.href = '/management/managementMain.do'
		},
		error: function(xhr, status, error){
			alert("가입에 실패했습니다."+error);
		}
	});
}


</script>
</body>
</html>