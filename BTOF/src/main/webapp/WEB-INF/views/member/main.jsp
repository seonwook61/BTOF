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

	<h2> main 페이지</h2>
	
	<c:if test="${result == 1}">
		<script type="text/javascript">
			alert(${id}+"님 환영합니다");
		</script>
	</c:if>
	
	<c:if test="${result != 1 }">
		<script type="text/javascript">
			alert("아이디 혹은 비밀번호가 틀렸습니다. 다시 입력해주세요");
			window.location.href="/common/login";
		
		
		
		</script>
	</c:if>
</body>
</html>