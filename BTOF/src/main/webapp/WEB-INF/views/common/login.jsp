<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>	
<body>			
			<c:if test="${pref_result ==1}">
				<script type="text/javascript">
					alert("관심분야가 저장이 완료되었습니다. 로그인후 관심분야 작품들을 만나보실수 있습니다.");			
				</script>
			</c:if>
			
					<br/><br/><br/>
	<ul class="goMain">
	    <li><a href="/common/main" class="nav-link px-2 text-secondary">BTO_FIRE!!</a></li>
	</ul>
					<h2 align="center"> BTOF </h2>
		<form action="/common/login" method="post" name="login_form" onsubmit="return check()">
			<div style="margin-top : 250px " align="center">
			<table>
					<tr>
						<td>
									ID																
						</td>					
					</tr>
					
					<tr>
						<td>
								<input type="text" id="id"name="id"/>																
						</td>					
					</tr>
						</table>
							<br/><br/>
						<table>
					<tr>
						<td>
									PW																
						</td>					
					</tr>
					
					<tr>
						<td>
								<input type="password" id="pw" name="pw"/>																
						</td>					
					</tr>
			</table>	
						<br/><br/>
						<a href="/common/findID">forgot ID? </a>
							<br/>
						<a href="/common/findPw">forgot password? </a>
							<br/>
								<%@ include file="login_google.jsp" %>
								<%@ include file="login_kakao.jsp" %>
								<br/><br/>
					<button type="submit" name="login_btn" style="height:60px;width:auto;"> 로그인</button>
						<br/>
						
					<a href="/common/signup">don't have account? Register here</a>	
			</div>
		</form>
			<script type="text/javascript">
			function check(){
				let inputs = document.login_form;
				//console.log(inputs);//폼태그 잘 가져왔는지 체크
				if(!inputs.id.value){//값이 없으면
					alert("아이디를 입력하세요");
					return false;
				}
				if(!inputs.pw.value){
					alert("비밀번호를 입력하세요");
					return false;
				}
				
			}
			</script>

</body>
</html>