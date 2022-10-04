<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%-- 1. session으로 아이디 가져와야함 --%>

<h2>cash-out</h2>

<form name="1" method = "POST">
	<input type='number' name='amount' min='1000' max='1000000' step='1000'/>
	아이디 입력 <input type=text name='id'/>
	<input type="submit" value="출금하기" />
</form>






</body>
</html>