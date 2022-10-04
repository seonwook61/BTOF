<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 결제 내역</title>
</head>
<body>
		<h2> 결제 내역 페이지 입니다.</h2>
			<div style="display:inline-block; width:40%; height:500px; margin:0; pedding:0; background:red; ">
			<hr/>
		<div style="margin-top: 10px;">
		<h2> 지정가 거래 내역</h2>
		
		<%-- 
				지정가 거래 저장하는 테이블 따로 파기
				<c:forEach var="fixed" items="${fixed_list}">
				거래번호 =${fixed.no}
				구매자 = ${fixed.buyer}
				판매자 = ${fixed.seller}
				거래가격 = ${fixed.price}
				수수료 = ${fixed.fee}
				</c:forEach>
			--%>
		</div>
			</div>
			<div style="display:inline-block; width:40%; height:500px; margin:0; pedding:0; background:yellow;">
			<hr/>
		<div style="margin-top: 10px;">
		<h2> 입찰가 거래 내역  </h2>	
		</div>
			<%-- 
				입찰가 거래 저장하는 테이블 따로 파기
				<c:forEach var="bid" items="${bid_list}">
				거래번호 =${bid.no}
				구매자 = ${bid.buyer}
				판매자 = ${bid.seller}
				거래가격 = ${bid.price}
				수수료 = ${bid.fee}
				</c:forEach>
			--%>
			</div>
</body>
</html>