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
	<c:if test="${result !=0 }">
		<script type="text/javascript">
			alert("답변 등록이 완료되었습니다");
			window.location='/admin/Manage';
		
		</script>
	
	</c:if>

</body>
</html>