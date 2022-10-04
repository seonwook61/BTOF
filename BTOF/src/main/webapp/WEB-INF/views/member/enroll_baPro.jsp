<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<c:if test="${result ==1}">
		<script type="text/javascript">
			alert("계좌 등록이 완료되었습니다.");
		</script>
		<meta http-equiv="refresh" content="3;url=http://localhost:8080/member/cashIn" >
	</c:if>
	<c:if test="${result == 0 }">
		<script type="text/javascript">	
			alert("비밀번호를 다시 입력해주세요")
			history.go(-1);
		</script>

	</c:if>
</body>
</html>