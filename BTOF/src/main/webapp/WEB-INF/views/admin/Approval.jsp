<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Approval</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
		<c:if test="${uuid_res== 1}">
		<script type="text/javascript">
			alert("작품 등록 처리가 완료되었습니다.");			
		</script>
		</c:if>


	<h1 align="center"> sellList </h1>
	<%
	int i=0; 
	%>
	<table>
		<tr>
			<td rowspan="4">
			<h3>type</h3>
				<button type="button" class="btn btn-outline-dark" onclick="window.location='/product/sell_listCate?prod_tag=photo'">photo</button><br /><br />
				<button type="button" class="btn btn-outline-dark" onclick="window.location='/product/sell_listCate?prod_tag=video'">video</button><br /><br />
				<button type="button" class="btn btn-outline-dark" onclick="window.location='/product/sell_listCate?prod_tag=music'">music</button><br /><br />
				<button type="button" class="btn btn-outline-dark" onclick="window.location='/product/sell_list'">all</button><br /><br />
				<br /><br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
			<td>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
		</tr>  
		
		<c:forEach var="product" items="${list}">
			<% 
			
			System.out.println(i);
			if(i%5==0) {
			%>
			<tr>
			<%} %>
			
		
			
				<td>
					
					
					<c:choose>
						<c:when test="${product.prod_tag == 'photo'}">
							
								<img src="<spring:url value='${product.prod_file}'/>" width="150" height="150" />
								<br />
								${product.prod_name} ${product.prod_no}
								<a href="../admin/ready?prod_no=${product.prod_no}">승인신청</a>
							
							
							
						</c:when>
						<c:when test="${product.prod_tag == 'video'}">
							
								<video width="150" height="150" controls autoplay loop muted>
									<source src="<spring:url value='${product.prod_file}' />" type="video/mp4" />
								</video>
								<br />
								${product.prod_name} ${product.prod_no}
								<a href="../admin/ready?prod_no=${product.prod_no}">승인신청</a>
							
							
							
						</c:when>
						<c:when test="${product.prod_tag == 'music'}">
							
								<img src="<spring:url value='/img/audioThumb.jpg'/>" width="150" height="150" />
								<br />
								${product.prod_name} ${product.prod_no}
								<a href="../admin/ready?prod_no=${product.prod_no}">승인신청</a>
							
							
							
						</c:when>
						<c:otherwise>
							<h1>잘못된 태그</h1>
						</c:otherwise>
					</c:choose>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				
				
			<% 
			
			
			if(i%5==0 && i!=0) {
			%>
			</tr>
			<%}
			
			i++;
			%>
				
		</c:forEach>
	</table>
	<br />
</body>
<script>
		function openNickAvail2(){
			if(inputForm.nick2.value==""|| !inputForm.nick2.value){
				alert("닉네임을 입력하세요");
				return false;
			}
			let url ="/common/NickAvail2?nick2="+inputForm.nick2.value;
			open(url, "NickAvail2","toolbar=no, location=no, status=no, menubar=no, resizable=no, width=300, height=200");
		}
		</script>

</html>