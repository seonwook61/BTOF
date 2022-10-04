<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>marketplace</title>
</head>
<body>
		<br/>
		
			
		<div align ="left">
			<h5>Hot Art</h5>
		</div>
		<table>
				<tr>
					<td>작품이미지</td>
					<td>제목</td>
					<td>창작자</td>
					<td>가격</td>
				</tr>
		<c:forEach var="hot_board"items="${hot_list}">
			<tr>
				<td>${hot_list.prod_file}</td>			
				<td align="left"><a class="move" href="${prod_no}">${prod_name}</a></td>        
				<td>${hot_list.prod_artist}</td>
			</tr>
		</c:forEach>
		
		</table>
			<br/><br/><br/><br/><br/><br/><br/><br/><br/>
			
		<div align ="left">
		
		
			<h5>Latest Art</h5>
		</div>
		${Latelist}
<table>
				<tr>
					<td>작품이미지</td>
					<td>제목</td>
					<td>창작자</td>
					<td>가격</td>
				</tr>
		<c:forEach var="late_board"items="${Latelist}">
			<tr>
				<td>${late_list.prod_file}</td>			
				<td align="left"><a class="move" href="${prod_no}">${prod_name}</a></td>        
				<td>${late_list.prod_artist}</td>
			</tr>
		</c:forEach>
		
		</table>
			<script type="text/javascript">
			/*
			$(".move").click(function(e){
				e.preventDefault();
				//숨김 폼 태그에 bno input hidden 으로 태그 추가 
				pagingForm.append
				
			});
			*/
			</script>
</body>
</html>