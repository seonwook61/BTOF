<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>닉네임 변경</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<h2> 닉네임 변경</h2>
		<form action="/member/nickchpro" method="post" name="inputForm" onsubmit="return check()" >
		<div style="margin-top:250px" align="center">

		</div>

		<div style="margin-top:200px" align="center">
			<table>
				<c:if test ="${member.nick != null }">	
				<tr>
					<td> 현재 닉네임</td>
				</tr>
				<tr>
					<td rowspan="3"> <input type="text" disabled name="beforenick" value="${member.nick}"></td>
				</tr>
				</c:if>
			</table>
				<br/><br/>
				<table>
				<tr>
					<td> 변경 닉네임</td>
				</tr>
				<tr>
						<td> <input class="NickAvail" type="text" name="nick" id="nick"  /></td>
						<td> <input type="button" value="닉네임중복확인" onclick="openNickAvail(this.form)"/></td>
					</tr>
				<tr>
					<td> 비밀번호 </td>
				</tr>
				<tr>
					<td> <input type="text"  name="pw"></td>
				</tr>
			</table>
			
					<input type="submit" name="submit_btn" id="submit_btn" value="닉네임변경" /> 
			
				<br/><br/>
		</div>
		</form>
		

<script type="text/javascript">
		function openNickAvail(){
			if(inputForm.nick.value==""|| !inputForm.nick.value){
				alert("닉네임을 입력하세요");
				return false;
			}
			let url ="/common/NickAvail?nick="+inputForm.nick.value;
			open(url, "NickAvail","toolbar=no, location=no, status=no, menubar=no, resizable=no, width=300, height=200");
		}
		</script>
		
			
</body>

</html>