<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<h2> 회원 탈퇴</h2>
		<form action="/member/delete" method="post" name="inputForm" onsubmit="return check()" >
		<div style="margin-top:250px" align="center">

		</div>
		
		<div style="margin-top:200px" align="center">
		<c:forEach var="member" items="${member}">
			<table>
				<c:if test ="${member != null }">	
				<tr>
					<td> 현재 아이디</td>
				</tr>
				<tr>
					<td> <input type="text"  name="id" id="id" value="${member.id}"></td>
				</tr>
				</c:if>
			</table>
				<br/><br/>
				<table>
				<tr>
					<td> 휴대전화번호</td>
				</tr>
				<tr>
					<td> <input type="text"  name="tell" id="tll"></td>
				</tr>
				<tr>
					<td> 비밀번호 </td>
				</tr>
				<tr>
					<td> <input type="pw"  name="pw"></td>
				</tr>
				<tr>
					<td> 비밀번호 확인</td>
				</tr>
				<tr>
					<td> <input type="pwch"  name="pwch"></td>
				</tr>
			</table>
			
					<input type="submit" name="submit_btn" id="submit_btn" value="회원탈퇴" /> 
			
				<br/><br/>
		</c:forEach>
		</div>
		</form>
		

<script type="text/javascript">
function check(){
	let inputs = document.inputForm;
	//console.log(inputs);//폼태그 잘 가져왔는지 체크
	
	
	if(!inputs.tell.value){
		alert("휴대전화를 입력하세요");
		return false;
	}
	if(!inputs.pw.value){
		alert("비밀번호를 입력하세요");
		return false;
	}
	if(!inputs.pwch.value){
		alert("비밀번호 확인란을 입력하세요");
		return false;
	}
	
	if(inputs.pw.value != inputs.pwch.value){
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	}
	
}		

function delete(inputForm){// <--this.from을 받아줌
	if(inputForm.pw.value ==""|| !inputForm.pw.value){
		alert("비밀번호를 입력하세요");
		return; // 함수 강제종료
	}
	let url = "/member/delete?id=" + inputForm.id.value; // 팝업으로 띄울 페이지 요청 경로 만들고
	open(url, "idAvail", "toolbar=no, location=no, status=no, menubar=no, resizable=no, width=300, height=200"); // 팝업띄우기.매개변수3개 필요 : url경로, 이름, 옵션(툴, 주소창, 아래상태바, 메뉴..등등)

}
		</script>
		
			
</body>

</html>