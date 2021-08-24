<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <form id="usernameForm" name="usernameForm">
            <div class="form-group">
                <input type="text" id="name" placeholder="Username" autocomplete="off" class="form-control" />
            </div>
            <div class="form-group">
                <button type="submit" class="accent username-submit">채팅 시작하기</button>
            </div>
</form>

<script>
var username = null;
var usernameForm = document.querySelector('#usernameForm');
function connect(event) {
    username = document.querySelector('#name').value.trim();

    if(username) {

        var socket = new SockJS('/ws');
        stompClient = Stomp.over(socket);

        stompClient.connect({}, onConnected, onError);
    }
    event.preventDefault();
}

function onError(error) {
console.log(error)
}
function onConnected() {
    // Subscribe to the Public Topic
    stompClient.subscribe('/topic/public', onMessageReceived);

    // Tell your username to the server
    stompClient.send("/app/chat.addUser",
        {},
        JSON.stringify({sender: username, type: 'JOIN'})
    )

    //connectingElement.classList.add('hidden');
}


function onMessageReceived(payload) {
   console.log("payload =>"+payload)
}


usernameForm.addEventListener('submit', connect, true)
</script>