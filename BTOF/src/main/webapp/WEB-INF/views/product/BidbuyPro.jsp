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
		<c:if test="${result != 0}">
			<script type="text/javascript">
			alert("입찰에 성공하셨습니다! 현재 최고 입찰자 이십니다.");
			window.location='/product/sell_list';
			</script>
		</c:if>
		<c:if test="${result ==0}">
			<script type="text/javascript">
				alert("현재 잔액보다 높게 입찰가를 입력하셨습니다. 입찰이 거부 됩니다. 잔액 충전후 다시 시도해주세요");
			window.location='/member/cashIn';
			</script>
		
		</c:if>

</body>
</html>