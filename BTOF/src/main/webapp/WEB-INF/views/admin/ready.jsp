<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>ready</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>
	<h1 align="center">ready</h1>
	<form id="formObj" role="form" action="<c:url value='/admin/readyPro'/>" method="post">
	<table width="700" align="center">
		<tr>
			<td rowspan="10">
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
				<!-- serial no. ${product.prod_dtl_sn} / ${product.prod_div} -->
			</td>
			</tr>
			
			<br/> <br/> <br/>
			<tr>
			<td><input type="hidden" name="prod_no" value="${product.prod_no}" /></td>
			</tr>
			<!-- -- 상품 이미지,상품명, 분할개수, 상품설명, 상품태그, 아티스트, 상품신청일, 상품 가격  -->
			
			<tr>
			<td> 작품명<input type="text" value="${product.prod_name}" disabled/> </td>
			</tr>
			<tr>
			<td>분할 개수<input type="text" value="${product.prod_div}" disabled/></td>
			</tr>
			<tr>
			<td>상품설명<input type="text" value="${product.prod_descr}" disabled/></td>
			</tr>
			<tr>
			<td>상품태그<input type="text" value="${product.prod_tag}" disabled/></td>
			</tr>
			<tr>
			<td>아티스트<input type="text" value="${product.prod_artist}" disabled/></td>
			</tr>
			<tr>
			<td>신청일<input type="text" value="${product.prod_regist_day}" disabled/></td>
			</tr>
			<tr>
			<td>상품가격<input type="text" value="${product.prod_dtl_price}" disabled/></td>
			</tr>
			<tr>
			<td>수수료<input type="text" value="${product.prod_dtl_price * 1/100} 원" disabled/></td>
			</tr>
			<tr>
			<td>승인여부<input type="text" value="${product.prod_pass}" disabled/>
			</tr>
		
		<tr>
                <td><input type="submit" value="승인"/></td>
                 </form>
        </tr>        
                <form id="formObj2" role="form" action="<c:url value='/admin/readyPro2'/>" method="post">
                <td><input type="submit" value="거절"/> </td>
                <td><input type="hidden" name="prod_no" value="${product.prod_no}" /></td>
 				</form>                   
                 
           

   </table>
   
   
   
<script type="text/javascript">
      
      
   
</script>
</body>
</html>