<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>modifyPro</title>
	
</head>
<body>
	<br />
	<c:if test="${result == 1}">
		<h3> ${result.nick}님의 회원 정보가 수정되었습니다. </h3>
		<h3> ㅋ </h3>
		<button onclick="window.location='/member/main'">메인</button>
		<button onclick="window.location='/member/mypage'">마이페이지</button>
	</c:if>
	<c:if test="${result != 1}">
		<script>
			alert("수정 실패... 다시 시도해주세요...");
			history.go(-1);
		</script>
	</c:if>
	

</body>
</html>