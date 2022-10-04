<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1대1 문의사항 관련 페이지</title>
</head>
<body>
		<c:forEach var="list" items="${list}">
			
		<div align="center">${list.inq_no} <a href="/admin/reply?id=${list.id}">작성자 ${list.id}  문의 제목 ${list.head}</a> 	</div>
		
		
		</c:forEach>
		



</body>
</html>