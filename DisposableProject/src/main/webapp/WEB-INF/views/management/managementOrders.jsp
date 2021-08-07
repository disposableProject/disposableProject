<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>


<script src="/js/jqueryGrid/js/jquery.jqGrid.min.js"></script> 
<script src="/js/jqueryGrid/js/i18n/grid.locale-en.js"></script>

<link rel="stylesheet" href="/js/jqueryGrid/css/ui.jqgrid-bootstrap-ui.css"> 
<link rel="stylesheet" href="/js/jqueryGrid/css/ui.jqgrid-bootstrap.css"> 
<link rel="stylesheet" href="/js/jqueryGrid/css/ui.jqgrid-bootstrap4.css"> 
<link rel="stylesheet" href="/js/jqueryGrid/css/ui.jqgrid.css">
<link rel="stylesheet" href="/js/jquery-ui-1.12.1/jquery-ui.css"> 
<link rel="stylesheet" href="/js/jquery-ui-1.12.1/jquery-ui.structure.css">
 <link rel="stylesheet" href="/js/jquery-ui-1.12.1/jquery-ui.theme.css">
 

 <style>
.ui-jqgrid .ui-jqgrid-htable .ui-th-div {
    height: 19px;
    margin-top: 5px;
} 
</style>
<!-- <table id="jqGrid" style="margin: auto"></table> 
<div id="gridpager"></div> -->

<div style="height: 800px;overflow: auto;">
<div style="height: 80px;width: 80%;margin: auto;border: 1px solid black">
	<div style="height: 50%">
		<button onclick="checkCeckBox()">모두선택/해제</button>
		<button onclick="takeOrder('TAKE')">주문접수</button>
		<button onclick="takeOrder('CANCEL')">주문취소</button>
		<button onclick="takeOrder('PICKUP')">전달완료</button>
		
		 <form action="downloadOrder.do" method="get">
		 	<input type="hidden"  name="state" value="NEW" />
            <button type="submit">매출내역 다운로드</button>
        </form>
	</div>
	<div style="height: 50%">처리상태: 
		<select id="States">
			<option value="NEW"> 주문내역
			<option value="TAKE"> 주문접수
			<option value="CANCEL"> 주문취소
			<option value="PICKUP"> 전달완료
			<option>
			<option>
		</select>
		<button onclick="storeOrderList()">조회</button>
	</div>
</div>
	<div id="orderList" >
	
	</div>
</div>

<script>

		
$(document).ready(function(){
	storeOrderList();
})

		var check = "1"

		function checkCeckBox(){
			var orderCode = $(".orderCode")
			if(check == "1"){
				for(var i=0;i<orderCode.length;i++){
					$(".orderCode")[i].checked = true;
				}
				check = "2"
				
			}else{
				for(var i=0;i<orderCode.length;i++){
					$(".orderCode")[i].checked = false;
				}
				check = "1"
			}
		}

		function storeOrderList(){
			var STATE = $("#States").val()
			$.ajax({
				type : 'POST',
				url : 'storeOrderList.do',
				data : {STATE:STATE},
				dataType : 'json',
				success : function(json){
					var html = "";
					var ordercode = ""
					if(json.length == 0){
						html += '<div style="width:80%;margin: auto;margin-top: 20px;">검색된 내용이 없습니다.</div>'
					}
					for(var i=0;i<json.length;i++){
						if(ordercode != json[i].ORDERCODE){
							
							html += '<div  style="width:80%;margin: auto;margin-top: 20px;"><input type="checkbox" class="orderCode" value="'+json[i].ORDERCODE+'" />주문코드: '+json[i].ORDERCODE+' 주문시간: '+json[i].ORDERDATE+'</div>'
							html += '<div style="width:80%;min-height: 100px;border: 1px solid black; margin: auto;display: flex;justify-content: space-between;"><div style="width: 80%"><div style="width: 100%;margin-bottom:10px">'
						}
						
						html += '<div>'+json[i].FOODNAME+'</div>'
						html += '<div style="display: flex;width: 100%;"><span>'+json[i].OPTIONS+'</span><span>'+json[i].PRICE+'</span></div>'
					
					
						ordercode = json[i].ORDERCODE
						if(i<json.length-1){
						if(ordercode  != json[i+1].ORDERCODE){
							html += '<div>총 가격: '+json[i].ALLPRICE+'원/</div><div>주문자: '+json[i].EMAIL+'</div>'
							if(json[i].MEMO){
								html += '<div> '+json[i].MEMO+'</div>'
							}
							
							html += '</div></div><div style="display: flex;width: 20%"></div></div></div>'
							}
						}
						if(i == json.length-1){
							html += '<div>총 가격</div><div>주문자: '+json[i].EMAIL+'</div>'
							if(json[i].MEMO){
								html += '<div> '+json[i].MEMO+'</div>'
							}
							
							html += '</div></div><div style="display: flex;width: 20%"></div></div></div>'
							}
						}
					
					$("#orderList").html(html)
					check = "1"
				},
				error: function(xhr, status, error){
					alert("주문내역을 불러오는데 실패했습니다."+error);
				}
			});
		}
		
		function takeOrder(state){
			var STATE = $("#States").val()
			if(state == "TAKE"
					&&(STATE == "CANCEL" || STATE == "PICKUP" || STATE == "TAKE"  )){
				alert("처리상태 조건이 주문내역일 경우에만 주문접수가 가능합니다.");
				return;
			}
			if(state == "CANCEL"
				&&(STATE == "CANCEL" || STATE == "PICKUP"  )){
			alert("처리상태 조건이 주문내역, 주문접수 일 경우에만 주문취소가 가능합니다.");
			return;
			}
			if(state == "PICKUP"
				&&(STATE == "CANCEL" || STATE == "PICKUP"  || STATE == "NEW"  )){
			alert("처리상태 조건이   주문접수 일 경우에만 전달완료가 가능합니다.");
			return;
			}
			var orderCode = $(".orderCode:checked")
			var orderCodes = []
			for(var i=0;i<orderCode.length;i++){
				orderCodes.push(orderCode[i].value)
			}
			 jQuery.ajaxSettings.traditional = true; 

			$.ajax({
				type : 'POST',
				url : 'updateOrder.do',
				data : {orderCodes:orderCodes,state:state},
				dataType : 'json',
				success : function(json){
					if(json){
						alert("상태가 변경되었습니다.");
						storeOrderList();
					}
				},
				error: function(xhr, status, error){
					alert("주문내역을 불러오는데 실패했습니다."+error);
				}
			});
		}
		
		function downloadExcel(){
			var STATE = $("#States").val()
			$.ajax({
				type : 'POST',
				url : 'downloadOrder.do',
				data : {STATE:STATE},
				dataType : 'json',
				success : function(json){
					
				},
				error: function(xhr, status, error){
					alert("주문내역을 불러오는데 실패했습니다."+error);
				}
			});
		}
</script>
