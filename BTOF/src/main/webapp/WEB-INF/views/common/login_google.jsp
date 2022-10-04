<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
  <head>
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="1024277341386-vvi3ia3ukiirt16gna7i1fnkvq5kq31p.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  </head>
  <body>
    <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
    
     	<button type="button" onclick="signOut();">Sign out</button> 
 
    <script>
      function onSignIn(googleUser) {
        // Useful data for your client-side scripts:
        var profile = googleUser.getBasicProfile();
        console.log("ID: " + profile.getId()); // Don't send this directly to your server!
        console.log('Full Name: ' + profile.getName());
        console.log('Given Name: ' + profile.getGivenName());
        console.log('Family Name: ' + profile.getFamilyName());
        console.log("Image URL: " + profile.getImageUrl());
        console.log("Email: " + profile.getEmail());

        // The ID token you need to pass to your backend:
        var id_token = googleUser.getAuthResponse().id_token;
        console.log("ID Token: " + id_token);
      
      $(document).ready(function(){
			let idVal = profile.getEmail();
			let nameVal = profile.getName();
				console.log("idVal :" + idVal);
				console.log("idVal :" + nameVal);
			$.ajax({
				type : "post",
				url : "/common/signupAjax",
				data : {id : idVal ,name : nameVal},
				success : function(result){
					console.log("요청성공");
				},
				error : function(e){
					console.log("에러발생");
				}
				
			});
		});
      }
      	function signOut(){
      		//로그아웃 버튼 생성
      		gapi.auth2.getAuthInstance().disconnect();
      	}
    </script>
    
    
    
    
  </body>
</html>