<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
<meta name="viewport" content="width=device-width">
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<style>
html,body{
margin: 0px;
width: 100%;
height: 100%
}

/* Main menu positionning */
.main-nav {
    position: absolute;
    top: 0;
    right: 0;
    left: 0;
    bottom: 0;
    text-align: center;
    background: #FFF;
    opacity: 0;
    z-index: -1;
    visibility: hidden;
    transition: all .375s;
}
#left{
	z-index: -100;

}
#left.is-open{
	z-index:2000;

}
.main-nav.is-open {
    opacity: 1;
    z-index: 2001;
    visibility: visible;
}

/* Yellow band effect */
.main-nav::before {
	 content: '';
    position: fixed;
    top: 0;
    bottom: 0;
    left: 0;
    right: -15px;
    background: #b2cfbe;
    transform-origin: 0 0;
    transform: skew(-14deg) translateX(-120%);
    transition: all .275s .1s;
}

.main-nav.is-open::before {
    transform: skew(-14deg) translateX(0);
}

/* Skewing effect on menu links */
.main-nav ul {
    display: inline-flex;
    flex-direction: column;
    height: 93%; /* Should be 100%, but we have a notice message :D */
    align-items: flex-end;
    justify-content: center;
    transform: translateX(-18%) skew(-16deg);
}

.main-nav li {
    display: block;
    margin: .5rem 0;
    text-align: right;
    transform: skew(16deg);
}

/* Apparition effect on links */
.main-nav a {
    opacity: 0;
    transform: translateY(-10px);
}

.main-nav.is-open a {
    opacity: 1;
    transform: translateY(0);
}
.main-nav li:nth-child(1) a {
	transition: all 275ms 175ms
}
.main-nav li:nth-child(2) a {
	transition: all 275ms 225ms
}
.main-nav li:nth-child(3) a {
	transition: all 275ms 275ms
}
.main-nav li:nth-child(4) a {
	transition: all 275ms 325ms
}
.main-nav li:nth-child(5) a {
	transition: all 275ms 375ms
}


/* Decoration */
.main-nav ul,
.main-nav li {
	list-style: none;
	padding: 0;
}
.main-nav a {
	display: block;
	padding: 12px 0;
	color: #5A3B5D;
	font-size: 1.4em;
	text-decoration: none;
	font-weight: bold;
}

/* Burger Style: @see: https://codepen.io/CreativeJuiz/full/oMZNXy */
.open-main-nav {
	position: absolute;
	top: 15px;
	padding-top: 20px;
	right: 15px;
	z-index: 2005;
	background: none;
	border: 0;
	cursor: pointer;
}
.open-main-nav:focus {
	outline: none;
}
.burger {
	position: relative;
	display: block;
	width: 28px;
	height: 4px;
	margin: 0 auto;
	background: #5A3B5D;
	transform: skew(5deg);
	transition: all .275s;
}

.burger:after,
.burger:before {
	content: '';
	display: block;
	height: 100%;
	background: #5A3B5D;
	transition: all .275s;
}

.burger:after {
	transform: translateY(-12px) translateX(-2px) skew(-20deg);
}

.burger:before {
	transform: translateY(-16px) skew(-10deg);
}

/* Toggle State part */
.is-open .burger {
	transform: skew(5deg) translateY(-8px) rotate(-45deg);
}

.is-open .burger:before {
	transform: translateY(0px) skew(-10deg) rotate(75deg);
}

.is-open .burger:after {
	transform: translateY(-12px) translateX(10px) skew(-20deg);
    opacity: 0;
}

/* MENU Text part */

.burger-text {
	display: block;
	font-size: .675rem;
	letter-spacing: .05em;
	margin-top: .5em;
	text-transform: uppercase;
	font-weight: 500;
	text-align: center;
	color: #5A3B5D;
}

.device {
	position: relative;
	width: 345px;
	height: 600px;
	background: #FFF;
	border: 1px solid #EEE;
	border-radius: 3px;
	box-shadow: 0 0 0 10px rgba(0,0,0,.1);
}

.container {
	position: absolute;
	top: 0; right: 0;
	bottom: 0; left: 0;
	overflow: hidden;
	background: linear-gradient(to bottom, #eee, #ddd);
}

html,body  {
	height: 100%;
	width: 100%;
	margin: 0px
}



/* When slowmotion is activated */

.is-slowmo + .device .open-main-nav .burger,
.is-slowmo + .device .open-main-nav .burger:before,
.is-slowmo + .device .open-main-nav .burger:after,
.is-slowmo + .device .main-nav,
.is-slowmo + .device .main-nav::before,
.is-slowmo + .device .main-nav a {
	transition-duration: 3s;
}
.is-slowmo + .device .main-nav li:nth-child(1) a {
	transition-delay: 1750ms
}
.is-slowmo + .device .main-nav li:nth-child(2) a {
	transition-delay: 2250ms
}
.is-slowmo + .device .main-nav li:nth-child(3) a {
	transition-delay: 2750ms
}
.is-slowmo + .device .main-nav li:nth-child(4) a {
	transition-delay: 3250ms
}
.is-slowmo + .device .main-nav li:nth-child(5) a {
	transition-delay: 3750ms
}

/* Notice */
.notice {
	position: absolute;
	bottom: -15px;
	left: 0; right: 0;
	padding: 20px;
	background: #F2F2F2;
	color: #5A3B5D;
	font-size: 14px;
	font-weight: 400;
	line-height: 1.5;
	z-index: 100;
	text-align: center;
}
.notice strong {
	font-weight: 700;
}
.notice a {
	padding: 2px 3px;
	background: #b2cfbe;
	text-decoration: none;
}



</style>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="height: 60px;width:100%;display: flex; justify-content: center;align-items: center;background:#fff;position: fixed; ;z-index: 1000;border-bottom: 1px solid  #f2f2f2;">
		<tiles:insertAttribute name="header" />
	</div>
	<button id="burger" class="open-main-nav" style="position: fixed;">
			<span class="burger"></span>
			<span class="burger-text">Menu</span>
	</button>
	<div id="left" style="height:100%; width: 100%;position: fixed;">
			<tiles:insertAttribute name="left"/> 
	</div>
	<div style="min-height: 700px;width: 100%;padding-top: 60px;padding-bottom: 50px">
		<tiles:insertAttribute name="body"/>
	</div>

	<div style="min-height: 50px;width: 100%;position: fixed;bottom: 0px;background: white;border-top: 1px solid  #f2f2f2;display: flex;">
		<tiles:insertAttribute name="footer"/> 
	</div>
<script src="/mobile/js/mobilecommon.js"></script>
</body>
</html>

