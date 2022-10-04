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
		<c:if test="${result != null }">
			<script type="text/javascript">
				alert("구매에 성공하셨습니다! 현재 남은 잔액은"+${leftover}+"입니다!");
				window.location="/product/sell_list";
			
			</script>
		
		</c:if>
		
		<h2> balancePay page</h2>
</body>
</html>