<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css" />
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />

<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<style>
.bigSlider{width: 100%;height: 20%;background: red}
.evenBox{width:100%;height: 37%;background: white;min-height: 330px}
.oddBox{width:100%;height: 37%;background: #f2f2f2}
.eventBox{height: 50%}
.bannerBox{height: 70px;background: green;}
.squares {
        overflow-x: scroll;
        overflow-y: hidden;
        height: 300px;
        white-space:nowrap;
        margin-left: 20px;
        margin-right: 20px;
    }

.squares .square {
        width: 45%;
		margin-right:10px;
        text-align: center;
        height: 250px;
        display:inline-block; /* Added */
        margin-bottom: 11%;
        /*padding-top: 1%;
        padding-left: 1%;
        padding-right: 1%;*/
        border-style: solid;
        border-width: 3px;
        border-color: rgb(145,147,150);
        border-radius: 10px;
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
/* 	$('.slide02').slick({
		 dots: true,
		 autoplay:true,
		  infinite: true,
		  speed: 1000,
		  autoplaySpeed:2000,
		  arrows: true,
		  speed: 800,
		  
		  prevArrow: $('#aro1_prev'),
		 nextArrow: $('#aro1_next')
	}) */

	const swiper = new Swiper('.swiper-container', {
		  // Optional parameters
		  direction: 'vertical',
		  loop: true,

		  // If we need pagination
		  pagination: {
		    el: '.swiper-pagination',
		  },

		  // Navigation arrows
		  navigation: {
		    nextEl: '.swiper-button-next',
		    prevEl: '.swiper-button-prev',
		  },

		  // And if we need scrollbar
		  scrollbar: {
		    el: '.swiper-scrollbar',
		  },
		});
	getShopList()
})

function getShopList(){
	$.ajax({
		type : 'POST',
		url : '/getStoreList.do',
		data : {page:'1',classify:'2'},
		dataType : 'json',
		success : function(json){
			var html = ""
			for(var i=0;i<8;i++){
				html += "<div class='square' onclick='location.href=\"/shop/shopMain.do?shopnum="+json[i].STORENUM+"&device=mobile\"' ><img src='https://cookingcoding.s3.ap-northeast-2.amazonaws.com/"+json[i].PHOTO+"' style='width:100%;height:100%'></div>"
			}
			html += "<div class='square' style='width: 20%'><img style='width:100%;height:100%'></div>"
			$(".squares").html(html)
		},
		error: function(xhr, status, error){
			alert("가입에 실패했습니다."+error);
		}
	});
}

</script>
<div class="bigSlider swiper-container">
	 <!-- Additional required wrapper -->
  <div class="swiper-wrapper">
    <!-- Slides -->
    <div class="swiper-slide">Slide 1</div>
    <div class="swiper-slide">Slide 2</div>
    <div class="swiper-slide">Slide 3</div>
  </div>
  <!-- If we need pagination -->
  <div class="swiper-pagination"></div>

  <!-- If we need navigation buttons -->
  <div class="swiper-button-prev"></div>
  <div class="swiper-button-next"></div>

  <!-- If we need scrollbar -->
  <div class="swiper-scrollbar"></div>
</div>
<div class="evenBox">
	<div style="height: 40px;display: flex;align-items: center;padding-left: 10px;padding-top: 5px">
		<span>이 상품 어때요?</span>
	</div>
	<div class="squares">
<div class='square' >aa</div>
	<div class='square'' ></div>
	<div class='square'' ></div>
	
    
    </div>
</div>
<div class="oddBox eventBox " >

</div>
<div class="evenBox">
slider la
</div>
<div class="bannerBox">
banner
</div>
<div class="evenBox">
MD
</div>
<div class="oddBox">
banner
</div>
<div class="evenBox">
slider la
</div>
<div class="oddBox">
slider la
</div>
<div class="evenBox">
slider la
</div>
<div class="oddBox">
slider la
</div>
<div class="evenBox">
slider la
</div>
<div class="oddBox">
slider sm
</div>
<div class="bannerBox">
banner
</div>
<div>
foot
</div>
