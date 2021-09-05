<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>

<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<style>

.slider .slick-list {
    margin:0 -10px;
}

.slick-slide {
    margin:0 10px;
}
.slick-next{
right: -30px;
    background: url(https://res.kurly.com/pc/service/main/1908/btn_next_default.png?v=1) no-repeat 50% 50%;
    transition: background 0.5s;
}
.shopListBox{

width: 1200px;
margin: auto;
margin-top: 20px;
display: grid;
grid-template-columns: 300px 300px 300px 300px;
grid-gap: 10px;
background-color: #fff;
color: #444;
}


.box {
  background-color: #444;
  color: #fff;

  border: 1px solid #444;
  font-size: 150%;
  height: 250px;
}



</style>
<script>
$(document).ready(function(){
	$('.slide01').slick({
		dots: false,
		autoplay:true,
		autoplaySpeed:2000,
		infinite: true,
		speed: 1000,
		slidesToShow: 1,
		arrows: false
	});
	
})
$(document).ready(function(){
	$('.slide02').slick({
		 dots: true,
		 autoplay:true,
		  infinite: true,
		  speed: 1000,
		  autoplaySpeed:2000,
		  arrows: true,
		  speed: 800,
		  slidesToShow: 4,
		  slidesToScroll: 4,
		  prevArrow: $('#aro1_prev'),
		 nextArrow: $('#aro1_next'),
		/*   responsive: [
		    {
		      breakpoint: 1024,
		      settings: {
		        slidesToShow: 3,
		        slidesToScroll: 3,
		        infinite: true,
		        dots: true
		      }
		    },
		    {
		      breakpoint: 600,
		      settings: {
		        slidesToShow: 2,
		        slidesToScroll: 2
		      }
		    },
		    {
		      breakpoint: 480,
		      settings: {
		        slidesToShow: 1,
		        slidesToScroll: 1
		      }
		    }
		    // You can unslick at a given breakpoint now by adding:
		    // settings: "unslick"
		    // instead of a settings object
		  ] */
	});
	
})

$(document).ready(function(){
	getShopList(1,'first','')
	
	$(".tag").click(function(){
		console.log("ok")
		$(this).addClass("clickTag")
		$(this).siblings().removeClass("clickTag")
	});
	timeset()
	setInterval(timeset, 1000);
})

function getShopList(now,flag,classify){
	$.ajax({
		type : 'POST',
		url : '/getStoreList.do',
		data : {page:now,classify:classify},
		dataType : 'json',
		success : function(json){
			var total = json[0].TOTALCNT
			makePaging(total,now,classify)
			var html = ""
			for(var i=0;i<json.length;i++){
				if(json[i].PHOTO){
				html += "<div onclick='location.href=\"/shop/shopMain.do?shopnum="+json[i].STORENUM+"&device=web\"' class='box'><img src='https://cookingcoding.s3.ap-northeast-2.amazonaws.com/"+json[i].PHOTO+"' style='width:100%;height:100%'></div>"
				}else{
					html += "<div onclick='location.href=\"/shop/shopMain.do?shopnum="+json[i].STORENUM+"&device=web\"' class='box'>"+json[i].STORENAME+"</div>"	
				}
			}
			$(".shopListBox").html(html)
			console.log($(".storeTitle").offset())
			if(flag != "first"){
				$('html, body').animate({
					scrollTop: $(".storeTitle").offset().top
				}, 300);
			}
			
		},
		error: function(xhr, status, error){
			alert("가입에 실패했습니다."+error);
		}
	});
}

function makePaging(total,now,classify){
	var pagecnt = Math.ceil(total/12.0)
	var startCnt = Math.floor((now-1)/5) * 5 + 1 
	var pageBlock = Math.ceil(pagecnt/5)
	var nowBlock = Math.ceil(now/5)
	console.log("startCnt",startCnt)
	console.log(total,pagecnt)
	console.log("pageBlock",pageBlock)
	console.log("nowBlock",nowBlock)
	var html = ""
	if(pageBlock > 1 && nowBlock > 1){
		html += "<li class='noclick' onclick='getShopList("+(nowBlock*5-4)+","+now+","+classify+"'> &laquo;</li>"
	}
	for(var i=startCnt;i<=pagecnt;i++){
		if(now == i){
			html += "<li class='nowpage' onclick='getShopList("+i+","+now+","+classify+")'>"+i+"</li>"
		}else{
			html += "<li class='noclick' onclick='getShopList("+i+","+now+","+classify+")'>"+i+"</li>"
		}
		
	}
	
	if(pageBlock > 1 && nowBlock < pageBlock){
		html += "<li  onclick='getShopList("+(nowBlock*5+1)+")'>&raquo;</li>"
	}
	console.log(html)
	$(".pageAreaUl").html(html)
}

function ok(){
	console.log("oo")
}

function timeset(){
	var date = new Date();
	$(".time").each(function(){
	var date2 = new Date($(this).find(".now").val());
	var gap = date2 - date
	var days = Math.floor(gap / (1000 * 60 * 60 * 24)); // 일
	var hour = String(Math.floor((gap/ (1000 * 60 *60 )) % 24 )).padStart(2, "0"); // 시
	var minutes = String(Math.floor((gap  / (1000 * 60 )) % 60 )).padStart(2, "0"); // 분
	var second = String(Math.floor((gap / 1000 ) % 60)).padStart(2, "0"); // 초

	 $(this).find(".timetext").text(days+"일"+hour+"시간"+minutes+"분"+second+"초")
	});
}
</script>
	<section>
	<ul class="slide01" style="height: 370px;padding: 0px;margin: 0px">
	
		<li><img src="images/shop/mybanner1.png" style="width: 100%;height: 400px"></li>
		<li ><img src="https://img-cf.kurly.com/shop/data/main/1/pc_img_1583112495.jpg" style="width: 100%;;height: 400px"></li>
		<li ><img src="https://img-cf.kurly.com/shop/data/main/1/pc_img_1596164134.jpg" style="width: 100%;;height: 400px"></li> 
	</ul>
	</section>
	<section style="height:652px">
		<div style="padding: 69px 0 35px;display: flex;align-items: center;justify-content: center;width: 500px;margin: auto;">
		<span></span>
		<div style="text-align: center;margin: 0px; font-weight: 700;color:#333;font-size: 28px;font-family: noto sans;display: inline-block;" onclick="location.href='/best.do'">추천 음식 소개</div>

		</div>
		
		<!-- <div class="arrowSlider" style="display: flex;width: 1400px;justify-content: space-between;position:relative;left: 13%;top: 200px">
			<span class="prev" id="aro1_prev">prev</span>
			<span class="next" id="aro1_next">next</span>
		</div> -->
		<ul class="slide02" style="height: 455px;width:248px;padding: 0px;margin-bottom: 10px;width: 1100px;margin: auto;">
			<c:forEach items="${RecommendFoodList}" var="RecommendFoodList">
			<div style="height: 400px;margin: 10px"  onclick='location.href="/shop/shopMain.do?shopnum=${RecommendFoodList.STORENUM}&device=web"'>
				<div style="height: 320px">
					<img src="https://cookingcoding.s3.ap-northeast-2.amazonaws.com/${RecommendFoodList.IMGNAME}" style="width: 100%;height: 100%">
				</div>
				<div style="padding: 10px 5px 5px 5px">
				<div style="font-size: 16px;line-height: 23px;">[${RecommendFoodList.STORENAME}]  ${RecommendFoodList.FOODNAME}</div>
				<div style="display: block;padding-top: 9px;font-weight: 800;font-size: 16px;line-height: 20px;"><fmt:formatNumber value="${RecommendFoodList.PRICE}" type="currency"  /></div>
				<div>주문수: ${RecommendFoodList.ORDERCOUNT} 회 </div>
				
				</div>
			</div>
		</c:forEach>
		</ul>
		
	</section>
	<section style="height:652px;background-color: #f7f7f7;">
		<div style="padding: 69px 0 35px;display: flex;align-items: center;justify-content: space-around;width: 500px;margin: auto;">
		<span></span>
		<h2 style="text-align: center;margin: 0px; font-weight: 700;color:#333;font-size: 28px;font-family: noto sans;display: inline-block;">특가 음식</h2>
		<span style="font-size: 40px;color: #ddd" onclick="location.href='/sale.do'">></span>
		</div>
		<ul class="slide02" style="height: 455px;padding: 0px;margin: 0px;width: 1100px;margin: auto;">
		
		<c:forEach items="${SaleFoodList}" var="SaleFoodLists">
			<div style="height: 400px;border: 1px solid #ddd;margin: 10px"  onclick='location.href="/shop/shopMain.do?shopnum=${SaleFoodLists.STORENUM}&device=web"'>
				<div style="height: 320px">
					<img src="https://cookingcoding.s3.ap-northeast-2.amazonaws.com/${SaleFoodLists.IMGNAME}" style="width: 100%;height: 100%">
				</div>
				<div style="padding: 10px 5px 5px 5px">
				<div style="font-weight: bold;font-size: 20px">${SaleFoodLists.STORENAME} - ${SaleFoodLists.FOODNAME}</div>
				<div style="text-decoration:line-through">판매가: <fmt:formatNumber value="${SaleFoodLists.PRICE}" type="currency"  /></div>
				<div>할인가: <fmt:formatNumber value="${SaleFoodLists.PRICE - SaleFoodLists.PRICE * (SaleFoodLists.SALEPERCENT/100) }" type="currency"/> (${SaleFoodLists.SALEPERCENT}%)</div>
				<div class="time"><input type="hidden" class="now" value="${SaleFoodLists.SALEDATE}"><span class="timetext" style="color: red;font-size: 13px"></span></div>
				</div>
			</div>
		</c:forEach>
		</ul>
	</section>
	<section style="margin-bottom:30px">
	<h2 class="storeTitle" style="padding: 79px 0 35px;text-align: center;margin: 0px; font-weight: 700;color:#333;font-size: 28px;font-family: noto sans;">우리동네 가게</h2>
		<div class="shopTag">
			<span class="tag clickTag" onclick="getShopList('1','first')" id="ALL">전체</span>
			<span class="tag" onclick="getShopList('1','first','KOR')" id="KOR">한식</span>
			<span class="tag" onclick="getShopList('1','first','JPN')" id="JPN">일식</span>
			<span class="tag" onclick="getShopList('1','first','WEST')" id="WEST">양식</span>
			<span class="tag" onclick="getShopList('1','first','SIMPLE')" id="SIMPLE">분식</span>
			<span class="tag" onclick="getShopList('1','first','CHICKEN')" id="CHICKEN">치킨</span>
			<span class="tag" onclick="getShopList('1','first','PIG')" id="PIG">족발/보쌈</span>
			<span class="tag" onclick="getShopList('1','first','CAFE')" id="CAFE">카페</span>
		</div>
		<div class="shopListBox">
			
		</div>
		<div clas="pageArea" style="display: flex;justify-content: center;">
			<ul class="pageAreaUl"></ul>
		</div>
	</section>
	

</body>
</html>