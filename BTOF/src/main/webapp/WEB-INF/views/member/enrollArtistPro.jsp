<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>등록신청완료</title>
</head>
<body>
		
		<c:if test="${result ==1}">
			<script>
			alert("작가 등록 신청이 완료되었습니다. 심사 결과를 기다려 주세요");
			window.location='product/sell_list';
			</script>
		</c:if>
	
		<c:if test="${result !=1 }">
			<script>
			alert("등록처리가 되지 않았습니다. 다시 시도해주세요.");
				history.go(-1);
			</script>
		</c:if>
	
	



	<h2>작가 등록이 완료되었습니다.</h2>
</body>
</html>