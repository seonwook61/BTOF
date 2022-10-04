<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<body>

		<h2> 아이디 찾기</h2>
		<form action="/common/findIDpro" method="post" name="input">
		<div style="margin-top:250px" align="center">
	<textarea rows="20" cols="20">
		닉네임과 가입시 등록한 휴대전화번호를 입력하시면 
		아이디의 일부를 알려 드립니다.	
	</textarea>
		</div>

		<div style="margin-top:200px" align="center">
			<table>
				<tr>
					<td> 닉네임</td>
				</tr>
				<tr>
					<td> <input type="text"  name="nick"></td>
				</tr>
			</table>
				<br/><br/>
				<table>
				<tr>
					<td> 전화번호</td>
				</tr>
				<tr>
					<td> <input type="text"  name="tel"></td>
				</tr>
			</table>
			
					<input type="submit" name="submit_btn" id="submit_btn" value="아이디찾기" /> 
			
				<br/><br/>
		</div>
		</form>
			
			
</body>
</html>