<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<link rel="stylesheet"   href="/js/datetimepicker/jquery.datetimepicker.css" />
<script  src="/js/datetimepicker/jquery.datetimepicker.full.min.js"></script>


<div style="height: 780px;overflow: auto;margin-top: 20px">
<div style="height: 80px;width: 80%;margin: auto;display: flex;justify-content: space-between;align-items: center;">
	<div style="height: 50%">
		<button id="dupliButton"  onclick="checkCeckBox()">모두선택/해제</button>
		<button id="dupliButton"  onclick="takeOrder('TAKE')">주문접수</button>
		<button id="dupliButton"  onclick="takeOrder('CANCEL')">주문취소</button>
		<button id="dupliButton"  onclick="takeOrder('PICKUP')">전달완료</button>
		
		 <form action="downloadOrder.do" method="get" style="display: inline-flex;">
		 	<input type="hidden"  name="state" value="NEW" />
			<button id="dupliButton"  type="submit" >내역 다운로드</button>
		</form>
	</div>
	<div style="height: 50%;display: flex;align-items: center;">
		<input id="date_timepicker_start"  name="startdate"  type="text"  style="height: 34px;border: 1px solid #999;border-radius: 0px;width: 120px" readonly="readonly">
		<span style="font-weight: bold;font-size: 14px"> ~ </span>
		<input id="date_timepicker_end" name="enddate"  type="text"  style="height: 34px;border: 1px solid #999;border-radius: 0px;width: 120px" readonly="readonly">
		<select id="States" style="margin-left: 5px;margin-right: 5px">
			<option value="PAY"> 주문내역</option>
			<option value="TAKE"> 주문접수</option>
			<option value="CANCEL"> 주문취소</option>
			<option value="PICKUP"> 전달완료</option>
		</select>
		<button id="dupliButton"  onclick="storeOrderList()">조회</button>
	</div>
</div>
	<div id="orderList" >
	
	</div>
</div>

<script>

		
$(document).ready(function(){
	storeOrderList();
	connect();
})
jQuery(function(){
	 jQuery('#date_timepicker_start').datetimepicker({
		  format:'Y/m/d',
		  defaultDate:new Date(),
		  onShow:function( ct ){
		   this.setOptions({
		    maxDate:jQuery('#date_timepicker_end').val()?jQuery('#date_timepicker_end').val():false
		   })
		  },
		  timepicker:false
		 });
		 jQuery('#date_timepicker_end').datetimepicker({
		  format:'Y/m/d',
		  defaultDate:new Date(),
		  onShow:function( ct ){
		   this.setOptions({
		    minDate:jQuery('#date_timepicker_start').val()?jQuery('#date_timepicker_start').val():false
		   })
		  },
		  timepicker:false
		 });
});
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
			var startDate = $("#date_timepicker_start").val();
			var endDate = $("#date_timepicker_end").val()
			console.log("startDate =>"+startDate)
			$.ajax({
				type : 'POST',
				url : 'storeOrderList.do',
				data : {STATE:STATE,startDate:startDate,endDate:endDate},
				dataType : 'json',
				success : function(json){
					var html = "";
					var ordercode = ""
					if(json.length == 0){
						html += '<div style="width:80%;margin: auto;margin-top: 20px;">검색된 내용이 없습니다.</div>'
					}
					var totalPrice  = 0;
					var num = 1
					for(var i=0;i<json.length;i++){
						if(ordercode != json[i].ORDERCODE){
							totalPrice = 0
							num = 1
							html += '<div  style="width:80%;margin: auto;margin-top: 20px;display: flex;align-items:center"><input type="checkbox" class="orderCode" value="'+json[i].ORDERCODE+'" />주문코드: '+json[i].ORDERCODE+' 주문시간: '+json[i].ORDERDATE+'</div>'
							html += '<div style="width:80%;min-height: 100px;border: 1px solid black; margin: auto;display: flex;justify-content: space-between;"><div style="width: 80%;display:flex;align-items:center;padding-left:20px"><div style="width: 100%;margin-bottom:10px;line-height: 25px;">'
						}
						
						html += '<div><span style="font-weight:bold;font-size:20px">('+(num)+') </span><span style="font-weight:bold;font-size:20px">'+json[i].FOODNAME+'</span><span style="font-size:13px;font-weight:bold;color:gray"> ('+ json[i].OPTIONS.slice(0, -3)+')</span><span> - '+common.format(json[i].ALLPRICE)+'원</span></div>'
						html += '<div style="display: flex;width: 100%;"></div>'
						totalPrice += parseInt(json[i].ALLPRICE)
						num = num + 1
						ordercode = json[i].ORDERCODE
						if(i<json.length-1){
						if(ordercode  != json[i+1].ORDERCODE){
							html += '<div>총 가격: '+common.format(totalPrice)+'원</div><div>주문자: '+json[i].EMAIL+'</div>'
							if(json[i].MEMO){
								html += '<div> '+json[i].MEMO+'</div>'
							}
							
							html += '</div></div><div style="display: flex;width: 20%"></div></div></div>'
							}
						}
						if(i == json.length-1){
							html += '<div>총 가격: '+common.format(totalPrice)+'원</div><div>주문자: '+json[i].EMAIL+'</div>'
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
		

		function connect() {
				var socket = new SockJS('/ws');
				stompClient = Stomp.over(socket);
				stompClient.connect({}, onConnected, onError);
		}

		function onError(error) {
		console.log(error)
		}
		function onConnected() {
			 stompClient.subscribe('/topic/public/${storenum}', onMessageReceived);
		}
		function onMessageReceived(payload) {
				storeOrderList()
			   console.log("payload =>"+payload)
			}
</script>
