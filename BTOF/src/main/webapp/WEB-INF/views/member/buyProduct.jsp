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

<h2> buy product</h2>
<form name="1" action="/member/buyProduct" method = "POST">
	작품번호 <input type=text name='prod_no'/>
	구매 수량 <input type=number name='buyStock_num'/>
	아이디 입력 <input type=text name='id'/>
	<input type="submit" value="구매하기" />
</form>


</body>
</html>