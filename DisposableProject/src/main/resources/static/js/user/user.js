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


//카카오로그인
function kakaoLogin() {
	Kakao.Auth.login({
		success: function (response) {
		Kakao.API.request({
			url: '/v2/user/me',
			success: function (response) {
				kakaoLoginPro(response)
			},
			fail: function (error) {
				console.log(error)
			},
		})
	},
		fail: function (error) {
			console.log(error)
		},
	})
}

function kakaoLoginPro(response){
	var data = {id:response.id,email:response.kakao_account.email}
	$.ajax({
		type : 'POST',
		url : '/user/kakaoLoginPro.do',
		data : data,
		dataType : 'json',
		success : function(data){
			console.log(data)
			if(data.JavaData == "YES"){
				alert("로그인되었습니다.");
				location.href = '/user/usermain.do'
			}else if(data.JavaData == "register"){
				$("#kakaoEmail").val(response.kakao_account.email);
				$("#kakaoId").val(response.id);
				$("#kakaoForm").submit();
			}else{
				alert("로그인에 실패했습니다");
			}
			
		},
		error: function(xhr, status, error){
			alert("로그인에 실패했습니다."+error);
		}
	});
	
}
//카카오로그아웃  
function kakaoLogout() {
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
}