<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>


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

.shopTag{
width: 1200px;
margin: auto;
display: flex;
}
.shopTag .tag{
display: flex;
justify-content: center;
align-items: center;
margin-right: 15px;
margin-top: 20px;
border: 1px solid black;
border-radius: 10px;
width: 75px;
height: 30px;
cursor: pointer;
}
.clickTag{
background-color: #b2cfbe;
color: #fff;
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
  border-radius: 5px;
  border: 1px solid #444;
  font-size: 150%;
  height: 250px;
}
.nowpage{
color:red;
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
	getShopList(1,'first')
	
	$(".tag").click(function(){
		console.log("ok")
		$(this).addClass("clickTag")
		$(this).siblings().removeClass("clickTag")
	});
})

function getShopList(now,flag){
	$.ajax({
		type : 'POST',
		url : '/getStoreList.do',
		data : {page:now,classify:'2'},
		dataType : 'json',
		success : function(json){
			var total = json[0].TOTALCNT
			makePaging(total,now)
			var html = ""
			for(var i=0;i<json.length;i++){
				if(json[i].PHOTO){
				html += "<div class='box'><img src='https://cookingcoding.s3.ap-northeast-2.amazonaws.com/"+json[i].PHOTO+"' style='width:100%;height:100%'></div>"
				}else{
					html += "<div class='box'>"+json[i].STORENAME+"</div>"	
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

function makePaging(total,now){
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
		html += "<li  onclick='getShopList("+(nowBlock*5-4)+"'> &laquo;</li>"
	}
	for(var i=startCnt;i<=pagecnt;i++){
		if(now == i){
			html += "<li class='nowpage' onclick='getShopList("+i+")'>"+i+"</li>"
		}else{
			html += "<li  onclick='getShopList("+i+")'>"+i+"</li>"
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
</script>
	<section>
	<ul class="slide01" style="height: 370px;padding: 0px;margin: 0px">
	
		<li><img src="https://img-cf.kurly.com/shop/data/main/1/pc_img_1621841214.jpg" style="width: 100%"></li>
		<li ><img src="https://img-cf.kurly.com/shop/data/main/1/pc_img_1583112495.jpg" style="width: 100%"></li>
		<li ><img src="https://img-cf.kurly.com/shop/data/main/1/pc_img_1596164134.jpg" style="width: 100%"></li> 
	</ul>
	</section>
	<section style="height:652px">
		<h2 style="padding: 79px 0 35px;text-align: center;margin: 0px; font-weight: 700;color:#333;font-size: 28px;font-family: noto sans;">추천 음식 소개</h2>
		<!-- <div class="arrowSlider" style="display: flex;width: 1400px;justify-content: space-between;position:relative;left: 13%;top: 200px">
			<span class="prev" id="aro1_prev">prev</span>
			<span class="next" id="aro1_next">next</span>
		</div> -->
		<ul class="slide02" style="height: 450px;padding: 0px;margin: 0px;width: 1200px;margin: auto;">
		
			<li>
				<div style="background-image: url(https://img-cf.kurly.com/shop/data/goods/1470792458150l0.jpg);width: 100%;height: 350px;background-size: cover;"></div>
				<div>이름</div>
				<div>가격</div>
				<div>원가</div>
			</li>
			<li>
				<div style="background-image: url(https://img-cf.kurly.com/shop/data/goods/1470792458150l0.jpg);width: 100%;height: 350px;background-size: cover;"></div>
				<div>이름</div>
				<div>가격</div>
				<div>원가</div>
			</li>
			<li>
				<div style="background-image: url(https://img-cf.kurly.com/shop/data/goods/1470792458150l0.jpg);width: 100%;height: 350px;background-size: cover;"></div>
				<div>이름</div>
				<div>가격</div>
				<div>원가</div>
			</li>
			<li>
				<div style="background-image: url(https://img-cf.kurly.com/shop/data/goods/1470792458150l0.jpg);width: 100%;height: 350px;background-size: cover;"></div>
				<div>이름</div>
				<div>가격</div>
				<div>원가</div>
			</li>
			<li>
				<div style="background-image: url(https://img-cf.kurly.com/shop/data/goods/1470792458150l0.jpg);width: 100%;height: 350px;background-size: cover;"></div>
				<div>이름</div>
				<div>가격</div>
				<div>원가</div>
			</li>
			<li>
				<div style="background-image: url(https://img-cf.kurly.com/shop/data/goods/1470792458150l0.jpg);width: 100%;height: 350px;background-size: cover;"></div>
				<div>이름</div>
				<div>가격</div>
				<div>원가</div>
			</li>
			<li>
				<div style="background-image: url(https://img-cf.kurly.com/shop/data/goods/1470792458150l0.jpg);width: 100%;height: 350px;background-size: cover;"></div>
				<div>이름</div>
				<div>가격</div>
				<div>원가</div>
			</li>
			<li>
				<div style="background-image: url(https://img-cf.kurly.com/shop/data/goods/1470792458150l0.jpg);width: 100%;height: 350px;background-size: cover;"></div>
				<div>이름</div>
				<div>가격</div>
				<div>원가</div>
			</li>
		</ul>
		
	</section>
	<section style="height:684px;background-color: #f7f7f7;">
		<h2 style="padding: 79px 0 35px;text-align: center;margin: 0px; font-weight: 700;color:#333;font-size: 28px;font-family: noto sans;">특가 음식</h2>
		<ul class="slide02" style="height: 450px;padding: 0px;margin: 0px;width: 1200px;margin: auto;">
		
			<li>
				<div style="background-image: url(https://img-cf.kurly.com/shop/data/goods/1470792458150l0.jpg);width: 100%;height: 350px;background-size: cover;"></div>
				<div>이름</div>
				<div>가격</div>
				<div>원가</div>
			</li>
			<li>
				<div style="background-image: url(https://img-cf.kurly.com/shop/data/goods/1470792458150l0.jpg);width: 100%;height: 350px;background-size: cover;"></div>
				<div>이름</div>
				<div>가격</div>
				<div>원가</div>
			</li>
			<li>
				<div style="background-image: url(https://img-cf.kurly.com/shop/data/goods/1470792458150l0.jpg);width: 100%;height: 350px;background-size: cover;"></div>
				<div>이름</div>
				<div>가격</div>
				<div>원가</div>
			</li>
			<li>
				<div style="background-image: url(https://img-cf.kurly.com/shop/data/goods/1470792458150l0.jpg);width: 100%;height: 350px;background-size: cover;"></div>
				<div>이름</div>
				<div>가격</div>
				<div>원가</div>
			</li>
			<li>
				<div style="background-image: url(https://img-cf.kurly.com/shop/data/goods/1470792458150l0.jpg);width: 100%;height: 350px;background-size: cover;"></div>
				<div>이름</div>
				<div>가격</div>
				<div>원가</div>
			</li>
			<li>
				<div style="background-image: url(https://img-cf.kurly.com/shop/data/goods/1470792458150l0.jpg);width: 100%;height: 350px;background-size: cover;"></div>
				<div>이름</div>
				<div>가격</div>
				<div>원가</div>
			</li>
			<li>
				<div style="background-image: url(https://img-cf.kurly.com/shop/data/goods/1470792458150l0.jpg);width: 100%;height: 350px;background-size: cover;"></div>
				<div>이름</div>
				<div>가격</div>
				<div>원가</div>
			</li>
			<li>
				<div style="background-image: url(https://img-cf.kurly.com/shop/data/goods/1470792458150l0.jpg);width: 100%;height: 350px;background-size: cover;"></div>
				<div>이름</div>
				<div>가격</div>
				<div>원가</div>
			</li>
		</ul>
	</section>
	<section style="height:1252px;">
	<h2 class="storeTitle" style="padding: 79px 0 35px;text-align: center;margin: 0px; font-weight: 700;color:#333;font-size: 28px;font-family: noto sans;">우리동네 가게</h2>
		<div class="shopTag">
			<span class="tag clickTag">전체</span>
			<span class="tag">한식</span>
			<span class="tag">양식</span>
			<span class="tag">중식</span>
			<span class="tag">일식</span>
			<span class="tag">카페</span>
		</div>
		<div class="shopListBox">
			<div class="box a">A</div>
			<div class="box b">B</div>
			<div class="box c">C</div>
			<div class="box d">D</div>
			<div class="box e">E</div>
			<div class="box f">F</div>
		</div>
		<div clas="pageArea" style="display: flex;justify-content: center;">
			<ul class="pageAreaUl"></ul>
		</div>
	</section>
	

</body>
</html>