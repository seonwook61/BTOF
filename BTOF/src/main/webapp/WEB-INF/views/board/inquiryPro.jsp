<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<c:if test="${result ==1 }">
			<script type="text/javascript">
				alert("문의 등록이 완료 되었습니다.");
				window.location='/board/notice';
			</script>
		
		
		</c:if>
	

</body>
</html>