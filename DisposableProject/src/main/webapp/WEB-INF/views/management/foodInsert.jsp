<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
.foodInsertContainer{
width: 90%;height: 100%;margin: auto;
}
.foodInsertContainer table{
width: 100%;border-collapse: collapse;margin: auto;
}
.foodInsertContainer .mainTable{
border-top: 2px solid #747474;margin-top: 10px
}
.foodInsertContainer table tr{
height: 50px;border-bottom: 1px solid #e7e7e7;
}
.foodInsertContainer table .imageTr{
height: 350px;
}

.foodInsertContainer table .titleTd{
background: #f8f8f8;width: 100px;color:#393939;font-size: 13px;font-weight: bold;text-align: center;border-right: 1px solid #e7e7e7;
}
</style>
<div class="foodInsertContainer">
<form name="foodForm">
	<h2>음식 등록</h2>
	<buttion type="button" onclick="addFood()">등록하기</buttion>
	<table class="mainTable">
		<thead></thead>
		<tbody class="mainBody">
			<tr class="imageTr">
				<td class="titleTd">음식 이미지</td>
				<td colspan="3"></td>
				
			</tr>
			<tr>
				<td class="titleTd">음식 이름</td>
				<td colspan="3"></td>
			
			</tr>
			<tr>
				<td class="titleTd">가격</td>
				<td colspan="3"></td>
				
			</tr>
			<tr>
				<td class="titleTd">음식 분류</td>
				<td colspan="3"></td>
			
			</tr>
			<tr>
				<td class="titleTd">추가 옵션</td>
				<td style="width: 280px">옵션 목록 갯수: 
					<select id="optionCount">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
					</select>
				</td>
				<td style="width: 280px">옵션 명: <input id="optionName" /></td>
				<td><button type="button" onclick="addOption()">옵션 추가하기</button></td>
			</tr>
		
		</tbody>
	</table>
	</form>
</div>

<script type="text/javascript">
function addOption(){
	var optionCount = $("#optionCount").val()
	var optionName = $("#optionName").val()
	var optionLength = $(".optionBox").length
	var html = "<tr class='optionBox option"+optionLength+"'>"
	html +=	`<td class="titleTd">
		옵션(`+optionName+`)`
	html += "<button onclick='deleteOption("+optionLength+")'>삭제</button>"
	html +=	`</td>
		<td colspan="3">`
		for(var i=0;i<optionCount;i++){
			html += `
				<table>
				<tbody>
					<tr>
						<td class="titleTd" style="width: 20px">옵션 명: </td>
						<td style="width:10px"><input name="option"></td>
						<td class="titleTd" style="width: 20px">가격: </td>
						<td style="width:150px"><input name="price"></td>
					</tr>
				</tbody>
			</table>
			`
		}
		
		html +=`
		</td>
	</tr>`
	$(".mainBody").append(html)
}
  
function deleteOption(optionLength){
	$(".option"+optionLength).remove()
}


function addFood(){
	var foodData =common.serializeObject($("form[name=foodForm]"));
	console.log(foodData)
	$.ajax({
		type : 'POST',
		url : '/user/ceoRegisterPro.do',
		data : registerData,
		dataType : 'json',
		success : function(json){
			alert("가입되었습니다.");
			location.href = '/user/usermain.do'
		},
		error: function(xhr, status, error){
			alert("가입에 실패했습니다."+error);
		}
	});
}
</script>

