<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 구매 페이지</title>
</head>
<body>
<div align="center">
	<table>
		<tr>
			<td><h5 align ="left">  제목 </h5></td>
				<td>${prod_name}</td>   
		</tr>
		<tr>
			<td><h5 align ="left">  창작자</h5></td>
			<td>${prod_artist}</td>
		</tr>
			<tr>
			<td><h5 align ="left">  발매갯수</h5></td>
			<td>${prod_div}</td>
		</tr>
	</table>
		<table>
			<tr>
			 	<td><h3>SERIAL</h3></td>  <td><h3> 가격 </h3></td>  <td><h3> 판매자 </h3></td>  
			</tr>
				<tr>
					<td>${checkType}</td>
				</tr>
		</table>
		<table> 
	<c:forEach var ="sellStatusVO" items="${list}"> <!--  지정가 판매인지 , 입찰 판매인지-->
		<tr>
			<c:if test="${sellStatusVO.prod_dtl_bid =='T'}"> <!-- 입찰가 구매 버튼 -->
			<td>${sellStatusVO.r} </td>
			<td><input type="text" value="입찰" disabled/></td>
			 <td> ${sellStatusVO.prod_dtl_price}</td><td>${sellStatusVO.prod_dtl_owner}</td> 
			<td><button type="button" onclick="window.location='/product/Bidbuy?prod_dtl_no=${sellStatusVO.prod_dtl_no}'">입찰</button></td>
		</c:if>
		</tr>
		<tr>
		<c:if test="${sellStatusVO.prod_dtl_bid =='F'}"><!--  지정가 구매 버튼  -->
			<td>${sellStatusVO.r} </td>
		<td><input type="text" value="지정가" disabled/></td>
			 <td> ${sellStatusVO.prod_dtl_price}</td> <td>${sellStatusVO.prod_dtl_owner}</td> 
		<td><button type="button" onclick="window.location='/product/Fixbuy?prod_dtl_no=${sellStatusVO.prod_dtl_no}'">구매</button></td>	
		</c:if>
		</tr>
	</c:forEach>	
		</table>
</div>
</body>
</html>