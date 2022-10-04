<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    <c:set var="user_id" value="${param.user_id}"></c:set>
    <c:set var="user_nick" value="${param.user_nick}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<form  action="/signup" method="post" name="inputForm" onsubmit="return check()">
		<table align="center">
			<tr>
				<td> 아이디</td>  
				<td> <input type="text" name="username" id="id" /></td>
				<td> 중복확인</td>
				<td><input type="text" id="idCheckResult"  disabled/></td>
					<td><input type="button" value="중복확인" onclick="openIdAvail(this.form)"/> </td>
			</tr>
				</table>
				<br/>
				<table align="center">
			<tr>
				<td> 비밀번호</td> 
				<td> <input type="password" name="password"/></td>
			</tr>
				</table align="center">
				<br/>
	<table align="center">
			<tr>
				<td> 휴대전화번호</td> 
				<td> <input type="password" name="pwch"/></td>
			</tr>
	</table>
			<table align="center">
				<tr>
					<td>닉네임</td>
				</tr>
					<tr>
						<td> <input class="NickAvail" type="text" name="nick" id="nick"  /></td>
						<td> <input type="button" value="닉네임중복확인" onclick="openNickAvail(this.form)"/></td>
						<td> <input type="text" id="nickCheckResult" disabled/> </td>
					</tr>
			</table>
			<table align="center">
				<tr>
					<td>주민번호 7자리(생년월일 + 앞숫자)</td>
				</tr>
					<tr>
						<td> <input type="text" name="social_num"/></td>
					</tr>
			</table>
				<table align="center">
				<tr>
					<td>추천인 닉네임</td>
				</tr>
				<tr>
					<td> <input type="text" name="ref_username"/></td>
					<td> <button onclick="verif_id"> 닉네임 확인</button></td>
				</tr>
			</table>
			<button type="submit" value="가입하기"> 가입하기</button>	
			<button type="reset">수정하기</button>
	
	</form>
		<script type="text/javascript">
		$(document).ready(function(){
			$("#id").change(function(){ 
				let idVal = $("#id").val();
				console.log(idVal);
				$.ajax({
					type : "post",
					url : "/common/ajaxIdAvail",
					data : {id : idVal},
					success : function(result){
						console.log("요청 성공!")
						console.log("Result : " +result);
						$("#idCheckResult").val(result);
					},
					errer : function(e){
						console.log("에러발생!");
						console.log(e);
					}
				});
			});
		});
		function check(){
			let inputs = document.inputForm;
			//console.log(inputs);//폼태그 잘 가져왔는지 체크
			if(!inputs.id.value){//값이 없으면
				alert("아이디를 입력하세요");
				return false;
			}
			if(!inputs.password.value){
				alert("비밀번호를 입력하세요");
				return false;
			}
			if(!inputs.pwch.value){
				alert("비밀번호 확인란을 입력하세요");
				return false;
			}
			if(!inputs.nick.value){
				alert("닉네임을 입력하세요");
				return false;
			}
			if(inputs.password.value != inputs.pwch.value){
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}
		}
		
		function openIdAvail(inputForm){// <--this.from을 받아줌
			if(inputForm.id.value==""|| !inputForm.id.value){
				alert("아이디를 입력하세요");
				return; // 함수 강제종료
			}
			let url = "/common/idAvail?id=" + inputForm.id.value; // 팝업으로 띄울 페이지 요청 경로 만들고
			open(url, "idAvail", "toolbar=no, location=no, status=no, menubar=no, resizable=no, width=300, height=200"); // 팝업띄우기.매개변수3개 필요 : url경로, 이름, 옵션(툴, 주소창, 아래상태바, 메뉴..등등)
		
		}
		</script>
		
		<script type="text/javascript">
		function openNickAvail(){
			if(inputForm.nick.value==""|| !inputForm.nick.value){
				alert("닉네임을 입력하세요");
				return false;
			}
			let url ="/common/NickAvail?nick="+inputForm.nick.value;
			open(url, "nickAvail","toolbar=no, location=no, status=no, menubar=no, resizable=no, width=300, height=200");
		}
		</script>
		

</body>
</html>