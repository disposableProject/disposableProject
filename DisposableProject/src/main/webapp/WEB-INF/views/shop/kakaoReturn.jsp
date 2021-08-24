<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
body {
    font-style: normal;
}
.modal {
    position: absolute;
    top: 270px;
    left: 251px;
    width: 100%;
    /* height: 100%; */
    display: flex;
    justify-content: center;
    align-items: center;
    border: none;
}

.modal__overlay {
    width: 100%;
    /* height: 100%;
    background-color: rgba(0, 0, 0, 0.6); */
    position: absolute;
}

.modal__content {
    background-color: white;
    position: relative;
    top: 0px;
    padding: 50px 100px;
    text-align: center;
    border-radius: 5px;
    width: 15%;
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px rgba(0, 0, 0, 0.23);
}
h1 {
    margin: 0;
}
.hidden {
    display: none;
}
</style>

    <div class="modal">
        <div class="modal__overlay"></div>
        <div class="modal__content">
            <h4>주문 및 결제가 완료되었습니다.</h4>
            <button class="xBtn">확인</button>
        </div>
    </div>

<script type="text/javascript">
jQuery(document).ready(function () {
	$(".modal").show();
	 connect()
});

</script>

<script type="text/javascript">

const modal = document.querySelector(".modal");
const overlay = document.querySelector(".modal__overlay");
const closeBtn = document.querySelector(".xBtn");
const openModal = () => {
    modal.classList.remove("hidden");
}
const closeModal = () => {
	
   location.href="http://localhost:8110/";
}
overlay.addEventListener("click", closeModal);
closeBtn.addEventListener("click", closeModal);




function connect() {
		var socket = new SockJS('/ws');
		stompClient = Stomp.over(socket);
		stompClient.connect({}, onConnected, onError);
}

function onError(error) {
console.log(error)
}
function onConnected() {
    // Tell your username to the server
    stompClient.send("/app/live/oreder/${storenum}",
        {},'${storenum}')
     //{}, JSON.stringify({storenum: '${storenum}', type: 'JOIN'}))

    //connectingElement.classList.add('hidden');
}




</script>