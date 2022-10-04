<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
th,td{padding:15px;}
table{border-spacing:10px; width: 400px; height : 100px;}

</style>
<title>Insert title here</title>
</head>

<!-- 작가의 이름 누르면 이 페이지 나오도록 -->
<body>
	
	<ul>
		<li><a href="/common/main">BTO_FIRE!!</a></li>
	</ul>
	<div align="center">
		<table>
		<h2>${id}</h2>
			<tr>
				<td align="center">아티스트 소개 페이지 (이미지)</td>
			</tr>
			<tr>
				<td align="center">아티스트 이미지</td>
			</tr>
		</table>
	</div>	
		
		
	<div align="center">
		<table>
			<tr >
				<td colspan="3" align="left">작가소개</td>
				<td colspan="3" align="right">작가 URL</td>
			</tr>
		</table>	
	</div >

	<div align="center">
		<table>
			<tr >
				<td colspan="3" align="left">${artistInfo.artist_introd}</td>
				<td colspan="3" align="right">${artistInfo.artist_url}</td>
			</tr>
		</table>	
	</div >

	
<c:forEach var="artistInfo2" items="${artistInfo}">
	<div align="center">	
		<table>
			<tr>
				<th colspan="3" align="left">작품 이미지</th>
				<th colspan="3" align="right">작품소개</th>
			</tr>
		</table>
	</div>
	<div align="center">
		<table>
			<tr>
				<td colspan="3" align="left"> <img src="<spring:url value='${artistInfo2.prod_file}'/>" width="100" height="100" /> </td>
				<td colspan="3" align="right">${artistInfo2.prod_descr}</td>
			</tr>	
		</table>		
	</div>
</c:forEach>	

</body>
</html>