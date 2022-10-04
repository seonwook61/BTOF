<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>sellList</title> 
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<ul class="goMain">
	    <li><a href="/common/main" class="nav-link px-2 text-secondary">BTO_FIRE!!</a></li>
	</ul>
	<h1 align="center"> sellListCate </h1>
	
	<table>
		<tr>
			<td rowspan="4">
			<h3>type</h3>
				<button type="button" class="btn btn-outline-secondary" onclick="window.location='/product/sell_listCate?prod_tag=photo'">photo</button><br /><br />
				<button type="button" class="btn btn-outline-secondary" onclick="window.location='/product/sell_listCate?prod_tag=video'">video</button><br /><br />
				<button type="button" class="btn btn-outline-secondary" onclick="window.location='/product/sell_listCate?prod_tag=music'">music</button><br /><br />
				<button type="button" class="btn btn-outline-secondary" onclick="window.location='/product/sell_list'">all</button><br /><br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
			<td>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
		</tr>  
		<tr>
			<c:forEach var="product" items="${cate}">
				<td>
					
					
					<c:choose>
						<c:when test="${product.prod_tag == 'photo'}">
							<a href="../product/sell?prod_no=${product.prod_no}">
								<img src="<spring:url value='${product.prod_file}'/>" width="150" height="150" />
								<br />
								${product.prod_name} (by ${product.prod_artist})
							</a>
							
						</c:when>
						<c:when test="${product.prod_tag == 'video'}">
							<a href="../product/sell?prod_no=${product.prod_no}">
								<video width="150" height="150" controls autoplay loop muted>
									<source src="<spring:url value='${product.prod_file}' />" type="video/mp4" />
								</video>
								<br />
								${product.prod_name} (by ${product.prod_artist})
							</a>
							
							
						</c:when>
						<c:when test="${product.prod_tag == 'music'}">
							<a href="../product/sell?prod_no=${product.prod_no}">
								<img src="<spring:url value='/img/audioThumb.jpg'/>" width="150" height="150" />
								<br />
								${product.prod_name} (by ${product.prod_artist})
							</a>
							
							
						</c:when>
						<c:otherwise>
							<h1>잘못된 태그</h1>
						</c:otherwise>
					</c:choose>
					
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
			</c:forEach>
		</tr>	
		
	</table>
	<br />
</body>
</html>