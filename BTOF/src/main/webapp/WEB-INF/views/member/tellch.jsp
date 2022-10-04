<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴대전화 변경</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<h2> 휴대전화 변경</h2>
		<form action="/member/tellchpro" method="post" name="inputForm" onsubmit="return check()" >
		<div style="margin-top:250px" align="center">

		</div>
		
		<div style="margin-top:200px" align="center">
			<table>
			
				<c:if test ="${member.tell != null }">	
				<tr>
					<td> 현재 휴대전화 번호</td>
				</tr>
				<tr>
					<td rowspan="3"> <input type="text" disabled name="beforetell" value="${member.tell}"></td>
				</tr>
				</c:if>
			</table>
				<br/><br/>
				<table>
				<tr>
					<td> 변경 휴대전화 번호</td>
				</tr>
				<tr>
						<td> <input class="phone" type="text" name="tell" id="tell"  /></td>
						
					</tr>
				<tr>
					<td> 비밀번호 </td>
				</tr>
				<tr>
					<td> <input type="text"  name="pw"></td>
				</tr>
			
			</table>
			
					<input type="submit" name="submit_btn" id="submit_btn" value="휴대전화번호 변경" /> 
			
				<br/><br/>
		</div>
		
		</form>
		


		
			
</body>

</html>