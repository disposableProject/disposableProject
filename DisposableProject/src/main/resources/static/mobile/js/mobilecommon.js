
var burger = document.getElementById('burger');
var nav = document.getElementById('main-nav');
var left = document.getElementById('left');

burger.addEventListener('click', function(e){
	this.classList.toggle('is-open');
	nav.classList.toggle('is-open');
	left.classList.toggle('is-open');
});



let clickEvent = new Event('click');


