$( document ).ready(function() {
	$.ajax({
		type : 'POST',
		url : '/api/getKakaoApi.do',
		data : {},
		dataType : 'text',
		success : function(data){
			Kakao.init(data);
		},
		error: function(xhr, status, error){
			alert("API 등록에 실패했습니다."+error);
		}
	});

});
function Logout() {
	
}

function onSignIn(){
	var auth2 = gapi.auth2.getAuthInstance()
	if(auth2.isSignedIn.get()){
	 var profile = auth2.currentUser.get().getBasicProfile();
	 googleLoginPro(profile)
	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	  console.log('Name: ' + profile.getName());
	  console.log('Image URL: ' + profile.getImageUrl());
	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	
	}
	
}

 function signOut() {
	if(gapi.auth2 != undefined){
	 	var auth2 = gapi.auth2.getAuthInstance();
   		 auth2.signOut().then(function () {
    	  console.log('User signed out.');
    });
	}
   
if (Kakao.Auth.getAccessToken()) {
		Kakao.API.request({
			url: '/v1/user/unlink',
			success: function (response) {
				console.log(response)
		},
		fail: function (error) {
			console.log(error)
		},
		})
	Kakao.Auth.setAccessToken(undefined) 
	}
	
	location.href= "/user/logOut.do"
  }

