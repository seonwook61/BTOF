<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 </title>
</head>


		
<body>

		<div align="center" style="margin-top : 80px;">
		<H2> 비밀번호 찾기 </H2>

		</div>		
	<form action="/common/findPwpro" method="post">
		
						  
		<div align ="center" style="margin-top : 250px;">
			<table>
					<tr>
						<td> ID</td>					
						<td><input type="text" name="id" id="id" /></td>
					</tr>						
			</table>			
							<br/><br/>	
			<table>
					<tr>
						<td> 전화번호</td>		
						<td><input type="text" name="tel"></td>
					</tr>		
			</table>
						<input type ="submit" value="비밀번호 찾기"/>
						  
						 
						  
		</div>
	</form>



</body>
</html>