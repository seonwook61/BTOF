<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>'
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 성공 페이지</title>
</head>
<body>

			<c:if test="${result == 1}">
			
			<h4>당신의 아이디는 ${id} 입니다.</h4>
			
				<button onclick="location.href='/common/login'"> 로그인 하러 가기 </button>
			</c:if>
				
			<c:if test="${result != 1}">
				<script type="text/javascript">
					alert("닉네임 혹은 전화번호가 일치하지 않습니다");
					history.go(-1);
				</script>
			
			
			
			</c:if>
		
</body>
</html>