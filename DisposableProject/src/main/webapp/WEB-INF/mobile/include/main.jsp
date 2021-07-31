<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css" />
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />

<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<style>
.bigSlider{width: 100%;height: 20%;background: red}
.evenBox{width:100%;background: white;min-height: 270px}
.oddBox{width:100%;height: 37%;background: #f2f2f2}
.eventBox{height: 50%}
.bannerBox{height: 70px;background: green;}
.squares {
        overflow-x: scroll;
        overflow-y: hidden;
        height: 230px;
        white-space:nowrap;
     	padding-left:15px
       
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
        /* border-style: solid;
        border-width: 3px;
        border-color: rgb(145,147,150); */
        border-radius: 10px;
          
  }
.foodOptionBox{
 		overflow-x: scroll;
        overflow-y: hidden;
        white-space:nowrap;
      	background: white;
		height: 95px;
		padding-left:15px
}

.foodOptionBox .foodClassify {
        width: 60px;
		margin-top:10px;
        text-align: center;
        height: 60px;
        display:inline-block; /* Added */
      	border: 1px solid black;
        /*padding-top: 1%;
        padding-left: 1%;
        padding-right: 1%;*/
        /* border-style: solid;
        border-width: 3px;
        border-color: rgb(145,147,150); */
        border-radius: 50%;
        margin-right: 10px;
  }
  .foodClassifyimg{
  	width: 100%;
  	height: 60px;
  }
  .foodClassifyTxt{
  width: 100%;
  display: flex;
  justify-content: center;
  }
  .shopList{
  width: 95%;
  margin: auto;
  height: 250px
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
		 // direction: 'vertical',
		  loop: true,

		  // If we need pagination
	

		  // Navigation arrows
		 
		  // And if we need scrollbar
		
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
				html += "<div class='square' onclick='location.href=\"/shop/shopMain.do?shopnum="+json[i].STORENUM+"&device=mobile\"' ><img src='https://cookingcoding.s3.ap-northeast-2.amazonaws.com/"+json[i].PHOTO+"' style='width:100%;height:70%;'>"
				html += "<div style='width:100%;height:30%;margin-top:10px'><div style='width:100%;text-align:left;font-size:14px;font-weight:bold'>"+json[i].STORENAME+"</div><div style='width:100%;text-align:left;font-size:10px'>4.8(10) 1.2km</div></div></div>"
			}
			//html += "<div class='square' style='width: 20%'><img><div style='height:100%'></div></div>"
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
    <div class="swiper-slide">
		<img style="width:100%;height: 100%" src="https://us.123rf.com/450wm/kesu87/kesu871904/kesu87190400215/121887103-spring-rolls-asian-food-with-various-ingredients-on-stone.jpg?ver=6">
	</div>
    <div class="swiper-slide">
		<img style="width:100%;height: 100%" src="https://s3.envato.com/files/269504081/DSC_8614%20copy.jpg">
	</div>
    <div class="swiper-slide">
		<img style="width:100%;height: 100%" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXPKBr_2DAu8_r_SFoVB4QjpiMdro8SDkNwQ&usqp=CAU">
	</div>
  </div>
</div>
<div class="bannerBox foodOptionBox">
	<div class="foodClassify">
		<div class="foodClassifyimg"></div>
		<div class="foodClassifyTxt">한식</div>
	</div>
	<div class="foodClassify">
		<div class="foodClassifyimg"></div>
		<div class="foodClassifyTxt">일식</div>
	</div>
	<div class="foodClassify">
		<div class="foodClassifyimg"></div>
		<div class="foodClassifyTxt">양식</div>
	</div>
	<div class="foodClassify">
		<div class="foodClassifyimg"></div>
		<div class="foodClassifyTxt">분식</div>
	</div>
	<div class="foodClassify">
		<div class="foodClassifyimg"></div>
		<div class="foodClassifyTxt">치킨</div>
	</div>
	<div class="foodClassify">
		<div class="foodClassifyimg"></div>
		<div class="foodClassifyTxt">족발/보쌈</div>
	</div>
</div>
<div class="evenBox">
	<div style="height: 40px;display: flex;align-items: center;padding-left: 10px;padding-top: 5px">
		<span style="font-weight: bold">이 가게 어때요?</span>
	</div>
	<div class="squares"> </div>
</div>
<div class="oddBox">
	<div style="height: 40px;display: flex;align-items: center;padding-left: 10px;padding-top: 5px">
		<span style="font-weight: bold">인기 프렌차이즈</span>
	</div>
	<div class="squares"> </div>
</div>
<div class="evenBox" style="min-height: 400px">
	<div style="height: 40px;display: flex;align-items: center;padding-left: 10px;padding-top: 5px">
		<span style="font-weight: bold">골라먹는 맛집</span>
	</div>	
	<div style="width: 95%;margin: auto;">sortBox</div>
	<div class="shopList">
		<div style="display: flex;width: 100%">
			<div style="width: 68%;height: 170px;margin-right: 5px;border: 1px solid black">img1</div>
			<div  style="width: 30%;height: 170px">
				<div style="width: 100%;height: 48%;margin-bottom: 5px;border: 1px solid black">img2</div>
				<div  style="width: 100%;height: 48%;border: 1px solid black">img3</div>
			</div>
		</div>
		<div style="display: flex;justify-content: space-between;">
			<span>가게명</span>
			<span>시간</span>
		</div>
		<div>평점</div>
	</div>
	<div class="shopList">
		<div style="display: flex;width: 100%">
			<div style="width: 68%;height: 170px;margin-right: 5px;border: 1px solid black">img1</div>
			<div  style="width: 30%;height: 170px">
				<div style="width: 100%;height: 48%;margin-bottom: 5px;border: 1px solid black">img2</div>
				<div  style="width: 100%;height: 48%;border: 1px solid black">img3</div>
			</div>
		</div>
		<div style="display: flex;justify-content: space-between;">
			<span>가게명</span>
			<span>시간</span>
		</div>
		<div>평점</div>
	</div>
	<div class="shopList">
		<div style="display: flex;width: 100%">
			<div style="width: 68%;height: 170px;margin-right: 5px;border: 1px solid black">img1</div>
			<div  style="width: 30%;height: 170px">
				<div style="width: 100%;height: 48%;margin-bottom: 5px;border: 1px solid black">img2</div>
				<div  style="width: 100%;height: 48%;border: 1px solid black">img3</div>
			</div>
		</div>
		<div style="display: flex;justify-content: space-between;">
			<span>가게명</span>
			<span>시간</span>
		</div>
		<div>평점</div>
	</div>
</div>

