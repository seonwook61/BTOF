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


<h2>현재금액 : "${currentWallet}"</h2>
	<%-- 출금 성공시 --%>
	<c:if test="${result == 1}">
		<h2>출금 성공!  </h2>
		<button onclick="window.location='/member/cashOut'">돌아가기</button>
		<%-- 3초후 main으로 이동 --%>
		<meta http-equiv="refresh" content="3;url=http://localhost:8080/member/cashOut" >
	</c:if>
	<%-- 출금 실패시 --%>
	<c:if test="${result != 1}">
		<h2> 출금 실패... 다시 시도해주세요. </h2>
		<button onclick="window.location='/member/cashOut'">돌아가기</button>
	</c:if>





</body>
</html>