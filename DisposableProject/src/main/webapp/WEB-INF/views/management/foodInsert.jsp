<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
.foodInsertContainer{
width: 100%;height: 800px;margin: auto;overflow: auto;
}
.foodInsertContainer form{
width: 90%;margin: auto;
}
.foodInsertContainer {
    -ms-overflow-style: none; /* IE and Edge */
    scrollbar-width: none; /* Firefox */
}
.foodInsertContainer::-webkit-scrollbar {
    display: none; /* Chrome, Safari, Opera*/
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
.foodInsertContainer input[type=text]{
border: 1px solid #aaa;
height: 27px !important;
outline: none;
}
.foodInsertContainer input[type=number]{
border: 1px solid #aaa;
height: 27px !important;
outline: none;
}
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
}
.foodInsertContainer input:focus{
border: #264e36 1px solid;
}
.foodInsertContainer select{
border: 1px solid #aaa;
width:85px;
height: 27px !important;
}
</style>
<div class="foodInsertContainer">
<form name="foodForm">
	<input type="hidden" name="storeNum" value="${userInfo.STORENUM}" >
	<h2>음식 등록</h2>
	<button  id="dupliButton"  type="button" onclick="addFood()">등록하기</button>
	<table class="mainTable">
		<thead></thead>
		<tbody class="mainBody">
			<tr class="imageTr">
				<td class="titleTd">음식 이미지</td>
				<td colspan="3">
					<input  type="file" name="foodImg" multiple="multiple">
				</td>
				
			</tr>
			<tr>
				<td class="titleTd">음식 이름</td>
				<td colspan="3">
					<input type="text" name="foodName" >
				</td>
			
			</tr>
			<tr>
				<td class="titleTd">가격</td>
				<td colspan="3">
					<input type="text" name="foodPrice" >
				</td>
				
			</tr>
			<tr>
				<td class="titleTd">할인률</td>
				<td colspan="3">
					<input type="text" name="salepercent"  >
				</td>
				
			</tr>
			<tr>
				<td class="titleTd">소요시간</td>
				<td colspan="3">
					<input type="text" name="waitTime" >
				</td>
				
			</tr>
			<tr>
				<td class="titleTd">음식 분류</td>
				<td colspan="3">
					<input  type="radio" name="classify"  value="KOR"/>한식 
					<input  type="radio" name="classify" value="JPN"/>일식
					<input  type="radio" name="classify" value="WEST" />양식
					<input  type="radio" name="classify"  value="SIMPLE"/>분식
					<input  type="radio" name="classify"  value="CHICKEN"/>치킨
					<input  type="radio" name="classify"  value="PIG"/>족발/보쌈
					<input  type="radio" name="classify"  value="CAFE"/>카페
					<input  type="radio" name="classify"  value="ANOTHER"/>기타
				</td>
			
			</tr>
			<tr>
				<td class="titleTd">음식 설명</td>
				<td colspan="3">
					<textarea name="foodtext"></textarea>
				</td>
			
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
				<td style="width: 280px">옵션 그룹 명: <input type="text" id="optionName" /></td>
				<td><button  id="dupliButton"  type="button" onclick="addOption()">옵션 추가하기</button></td>
			</tr>
			
		</tbody>
	</table>
	</form>
</div>

<script type="text/javascript">
function addOption(){
	var optionCount = $("#optionCount").val()
	var optionName = $("#optionName").val()
	$("#optionName").val('')
	var optionLength = $(".optionBox").length
	if(optionName == null || optionName == ""){
		alert("옵션 그룹 이름을 입력해주세요")
		$("#optionName").focus()
		return false;
	}
	var html = "<tr class='optionBox option"+optionLength+"'>"
	html +=	`<td class="titleTd optionNameTd">
		옵션(`+optionName+`)`
	
	
	html +=	`</td>
		<td colspan="3">
		<span>다중 선택 가능 <input type='checkbox' id='multipleCheck' value='multi' ></span>
		`
		html += "<button onclick='deleteOption("+optionLength+")'>삭제</button>"
		for(var i=0;i<optionCount;i++){
			
			html += `
				<table style="border-top:1px solid #e7e7e7">
				<tbody>
					<tr>`
					html += "<input type='hidden' id='optionNum' value='"+i+"' >"
					html += "<input type='hidden' id='optionGroupName' value='"+optionName+"' >"
					html += "<input type='hidden' id='optionGroupNum' value='"+optionLength+"' >"
			html += `<td class="titleTd" style="width: 20px">옵션 명: </td>
						<td style="width:10px"><input type="text" name="option" id="optionName"></td>
						<td class="titleTd" style="width: 20px">가격: </td>
						<td style="width:150px"><input type="number" name="price" id="optionPrice" /></td>
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
	var foodOptions = []
	
	$('.optionBox tr').each(function (index, item) {
		var multiple = 'N'
		if($(this).find("input:checkbox[id='multipleCheck']").is(":checked") == true){
			multiple = 'Y'
		}
		var foodOptionInfo = {
				storeNum : '${userInfo.STORENUM}',
				optionGroupName : $(this).find("#optionGroupName").val(),
				optionGroupNum : $(this).find("#optionGroupNum").val(),
				optionNum : $(this).find("#optionNum").val(),
				optionName: $(this).find("#optionName").val(),
				optionPrice: $(this).find("#optionPrice").val(),
				multiple: multiple
		}
		foodOptions.push(foodOptionInfo)
		//$("#foodOptions").val(foodOptions)
	})
	
	var foodData = common.serializeObject($("form[name=foodForm]"));
	foodData.foodOptionInfo  = foodOptions
	foodData = JSON.stringify(foodData);
	console.log(foodData)
	var foodImg = $('input[name="foodImg"]').get(0).files;
	var formData = new FormData();
	for(var i=0;i<foodImg.length;i++){
		formData.append('foodImg', foodImg[i]);
	}
	
	formData.append("foodData",foodData)
	
	for (var pair of formData.entries()) { console.log(pair[0]+ ', ' + pair[1]); }


	
	$.ajax({
		type : 'POST',
		url : '/management/foodInsertPro.do',
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

