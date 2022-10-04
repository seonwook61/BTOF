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
				alert("입찰에 성공하셨습니다!");
				//history.go(-1);
				window.location.href = '/member/main';
			</script>
		
		
		
		</c:if>
	<c:if test="${ result == 0}">
		<script type="text/javascript">
			alert("현재 입찰가보다 낮아 거절되었습니다. 다시 요청해주세요.");
			history.go(-1);
			
		</script>
	
	
	</c:if>
<c:if test="${ result == 2}">
		<script type="text/javascript">
			alert("입찰 희망 가격 보다 잔액이 작습니다. 잔액을 확인해주세요");
			window.location.href='/member/mypage';
		
		</script>
	
	
	</c:if>

</body>
</html>