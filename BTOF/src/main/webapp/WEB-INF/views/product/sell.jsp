<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>sell</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>
	<ul class="goMain">
	    <li><a href="/common/main" class="nav-link px-2 text-secondary">BTO_FIRE!!</a></li>
	</ul>
	<h1 align="center">SELL</h1>
	<table width="700" align="center">
		<tr>
			<td rowspan="3">
				<c:choose>
					<c:when test="${product.prod_tag == 'photo'}">
						<img src="<spring:url value='${product.prod_file}'/>" width="300" height="300" />
						<br />
					</c:when>
					<c:when test="${product.prod_tag == 'video'}">
						<video width="400" height="400" controls autoplay loop muted>
							<source src="<spring:url value='${product.prod_file}' />" type="video/mp4" />
						</video>
						
						<br />
					</c:when>
					<c:when test="${product.prod_tag == 'music'}">
						<audio src="<spring:url value='${product.prod_file}' />" controls autoplay></audio>
						<br />
						해당 작품은 오디오 작품으로 <br />이미지가 없습니다.
						
					</c:when>
					<c:otherwise>
					
					</c:otherwise>
				</c:choose>
				<!--serial no. ${product.prod_dtl_sn} / ${product.prod_div}-->
			</td>
			<td>
			<h2>작품명 : ${product.prod_name}</h2>
			<h4>소유자 : ${product.prod_dtl_own}</h4>
			
			
		</tr>
		<tr>
			<td>
				<!-- <h3>가격 : ${product.prod_dtl_price}</h3> -->
					<c:if test="${ownResult==1}">
					<input type="submit" value="판매하기" onclick="openSell();"/> <!-- 구매 연결 -->
					</c:if>
					<c:if test="${ownResult!=1}">
					<input type="button" value="구매하기" onclick="openBuy()"/> <!-- 판매 연결 -->
					</c:if>
				
				<h4>창작자 : ${product.prod_artist}</h4>
			</td>
		</tr>
		<tr>
			<td>
				<h2>작품상세</h2>
				uuid : ${product.prod_dtl_serial} <br />
				
				<br />
				<button type="button" class="btn btn-secondary" onclick="window.location='/product/artistProd?prod_artist=${product.prod_artist}'"> 작가의 다른 작품 보기 </button> <!-- 작가페이지연결 -->
			</td>
		</tr>
	
	
	
	</table>
	<table width="700" align="center">
		<tr>
			<td>
				<h2>History</h2>
				
				
				
			</td>
		</tr>
	</table>
	
		<script type="text/javascript">
		var popupX = (window.screen.width / 2) - (200 / 2);
		var popupY= (window.screen.height /2) - (300 / 2);
			function openBuy(){
				let url="/product/buy?prod_name=${product.prod_name}&prod_artist=${product.prod_artist}&prod_div=${product.prod_div}";
				open(url,"buy", 'status=no, height=700, width=600, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
			}
		</script>
	
	
	
	
</body>
</html>