<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<a href="javascript:kakaoLogin();"><img src="https://www.gb.go.kr/Main/Images/ko/member/certi_kakao_login.png" style="height:60px;width:auto;"></a>	
	<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
//f822ed22d4fa3acb2bb1a829ed115063

	window.Kakao.init("f822ed22d4fa3acb2bb1a829ed115063");
	function kakaoLogin(){
		
		window.Kakao.Auth.login({
		scope:'profile,account_email,gender',
		success: function(authObj){
			console.log(authObj);
			window.Kakao.API.request({
				url:'v2/user/me',
				success: res=>{
					const kakao_account = res.kakao_account;
					console.log(kakao_account);
				}
			});
		}
		});
	}
</script>
</body>
</html>