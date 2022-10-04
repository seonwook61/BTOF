<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> 작품 등록 신청 페이지</title>
	<link type="text/css" href="/resources/css/main.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="/resources/js/main.js" defer></script>
	
</head>
<body>	
			<c:if test="${result ==1}">
				<script type="text/javascript">
					alert("작품등록 신청이 완료되었습니다. 승인심사후 등록가능합니다");
					window.location='/product/sell_list';
				</script>
			
			</c:if>
			<c:if test="${result !=1}">
				<script type="text/javascript">
					alert("신청이 완료되지 않았습니다. 다시 신청해주세요");
					history.go(-1);
				</script>
			
			</c:if>

</body>
</html>