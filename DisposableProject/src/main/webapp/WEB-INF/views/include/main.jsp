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
		 dots: false,
		  infinite: false,
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
		<div class="arrowSlider" style="display: flex;width: 1400px;justify-content: space-between;position:relative;left: 13%;top: 200px">
			<span class="prev" id="aro1_prev">prev</span>
			<span class="next" id="aro1_next">next</span>
		</div>
		<ul class="slide02" style="height: 500px;padding: 0px;margin: 0px;width: 1200px;margin: auto;">
		
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
	
	</section>
	<section style="height:652px;">
	
	</section>
	<section style="height:200px;">
	
	</section>
	<section style="height:462px;">
	
	</section>

</body>
</html>