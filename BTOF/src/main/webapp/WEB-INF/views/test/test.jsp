<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
			<c:if test="${result == 1}">
				<script type="text/javascript">
					alert("회원가입 완료!");
					window.location.href='/common/signup';
				</script>
			</c:if>	

			<c:if test="${result !=1}">
		<form action="test/test" method="post" >
			<table>
				<tr>
					<td> 아이디</td>
					<td> <input type="text" name="id" id="id"/></td>
				</tr>			
				<tr>
					<td> 비밀번호</td>
					<td> <input type="text" name="pw" id="pw"/></td>
				</tr>			
			</table>
			
					<input type="submit" value="확인" />
		</form>
			</c:if>





</body>
</html>