<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
<table id="jqGrid" style="margin: auto"></table> 
<div id="gridpager"></div>

<script>

var dataArr = 
	[
		{CODE:"a132ihhuw",FOODNAME:"마라탕",OPTION:"맵기: 덜맵게/소스포함",MEMO:"찾으러 갈게요",STATUS:"주문접수"}, 
		{CODE:"213afwdwad",FOODNAME:"우육면",OPTION:"맵기: 덜맵게/소스포함",MEMO:"찾으러 갈게요",STATUS:"주문접수"},
		{CODE:"awfes213",FOODNAME:"양꼬치",OPTION:"구워서",MEMO:"찾으러 갈게요",STATUS:"조리중"},
		{CODE:"okoakdio1",FOODNAME:"옥수수면",OPTION:"맵기: 덜맵게/",MEMO:"찾으러 갈게요",STATUS:"조리중"},
		{CODE:"3453asdcaw",FOODNAME:"꿔바로우",OPTION:"따뜻하게",MEMO:"찾으러 갈게요",STATUS:"주문완료"},
		{CODE:"af23eqaa",FOODNAME:"중국냉면",OPTION:"",MEMO:"찾으러 갈게요",STATUS:"주문완료"},
		{CODE:"a3fw1245",FOODNAME:"아메리카노",OPTION:"아이스",MEMO:"찾으러 갈게요",STATUS:"주문완료"},
		{CODE:"a3g5u7u7",FOODNAME:"마라탕",OPTION:"맵기: 덜맵게/소스포함",MEMO:"찾으러 갈게요",STATUS:"주문완료"},
		{CODE:"86i87q2e2q",FOODNAME:"마라탕",OPTION:"맵기: 덜맵게/소스포함",MEMO:"찾으러 갈게요",STATUS:"조리중"},
		{CODE:"98o97wr3rw",FOODNAME:"마라탕",OPTION:"맵기: 덜맵게/소스포함",MEMO:"찾으러 갈게요",STATUS:"조리중"},
		{CODE:"76h08n3frew",FOODNAME:"마라탕",OPTION:"맵기: 덜맵게/소스포함",MEMO:"찾으러 갈게요",STATUS:"주문접수"},
		{CODE:"65uyr123r13",FOODNAME:"마라탕",OPTION:"맵기: 덜맵게/소스포함",MEMO:"찾으러 갈게요",STATUS:"주문완료"},
		{CODE:"g46uh6y65y4",FOODNAME:"마라탕",OPTION:"맵기: 덜맵게/소스포함",MEMO:"찾으러 갈게요",STATUS:"주문접수"},
		{CODE:"fw332r34tt34t",FOODNAME:"마라탕",OPTION:"맵기: 덜맵게/소스포함",MEMO:"찾으러 갈게요",STATUS:"주문완료"},
		{CODE:"7k86bry6jn6m5",FOODNAME:"마라탕",OPTION:"맵기: 덜맵게/소스포함",MEMO:"찾으러 갈게요",STATUS:"주문접수"},
		
		
		]; 
		$("#jqGrid").jqGrid({ 
			datatype: "local", 
			data: dataArr, 
			height: 600, 
			autowidth : true,    
			//width: 1500,
			colNames : ['주문코드','음식명','옵션 사항','메모','상태'], 
			colModel:[
				//{name:"NO", index:"NO", width:15, align:'center', hidden:false },
				{name : 'CODE', index : 'CODE', width :  "10%", align : 'left', hidden:false, }, 
				{name : 'FOODNAME', index : 'FOODNAME', width :  "20%", align : 'center', hidden:false },
				{name : 'OPTION', index : 'OPTION', width :  "20%", resizable : true, align : 'right', hidden:false },
				{name : 'MEMO', index : 'MEMO', width :  "20%", resizable : true, align : 'right', hidden:false },
				{name : 'STATUS', index : 'STATUS', width : "5%", resizable : true, align : 'right', hidden:false }
				
				],
				loadtext: "로딩중일때 표시되는 텍스트!", 
				caption:"주문관리", 
				pager:"#gridpager", 
				rowNum:20,
	//rownumbers:true, 
	multiselect : true,
	//shrinkToFit: true,
	scrollOffset:'10'
	
//	viewrecords:true, 
//	pgbuttons:true, 
//	pginput:true, 
	//shrinkToFit:true,
	//sortable: false, 
	//loadComplete:function(data){}, 
	//scroll:true, 
	//loadonce:false, 
	//hidegrid:true
	});
		

</script>
