<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
th,td{padding:10px;}
table{border-spacing:5px; margin-left:auto; margin-right:auto;}
div{text-align: center;}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div align="center">
		<h2>likePage/위시리스트페이지</h2>
		<table border="1">
	
			<c:forEach var="getMyWishList" items="${getMyWishList}" varStatus="status">
			<tr align="left">
				<th rowspan="3">${status.count}</th>
				<th >작품명 : ${getMyWishList.prod_name}</th>
				<td colspan="2" align="right"><input type="button" value="구매하러가기" onclick="window.location='/product/product_detail?prod_no=${getMyWishList.prod_no}'"></td>
			</tr>

			<tr >
				<td align="right">작품 태그</td>
				<td align="right">작품 파일</td>
				<td align="center">작품 아티스트</td>
				<td colspan="2" align="right">작품가격</td>
			</tr>
			<tr>
				<td >${getMyWishList.prod_tag}</td>
				<td >${getMyWishList.prod_artist}</td>
				<td > <img src="<spring:url value='${getMyWishList.prod_file}'/>" width="100" height="100" /> </td>
				<td >${getMyWishList.prod_price}</td>
			</tr>
			</c:forEach>
		</table>
	</div>	


</body>
</html>