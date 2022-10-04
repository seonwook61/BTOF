<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>sellPopup</title>
	 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

	
	
		
		작품명 : ${vo.prod_name} <br />
		창작자 : ${vo.prod_artist}<br /><br />
		
		
		
		<form action="sellPopupAucPro" method="get">
			<table> 
			<tr>
			<td>
			
			
			</td>
			<td>
			<%int i=1; %>
			<c:forEach var ="sn" items="${r}">
				<%int j=1; %>
				<c:forEach var ="prod_dtl_no" items="${prod_dtl_no}">
			 		<%
			 		
			 		if(i==j) {
			 		%>
				      
				     <input type="radio" name="sn" value="${prod_dtl_no}"/>${sn} <br />
				      <%
				      }
			 		  
			 		   j++;%>
					
				<!-- input type="hidden" value="${list.prod_dtl_no}" /-->
				</c:forEach>
				<%i++; %>
			</c:forEach>	
			</td>
			<td>
				<c:forEach var ="tf" items="${tF}">
					<c:choose>
						<c:when test="${tf eq 'F'}">판매 가능 <br /></c:when>
						<c:when test="${tf eq 'T'}">판매 중 <br /></c:when>
						
					
					</c:choose>
					
				</c:forEach>			
			</td>
			
			
			</tr>
			</table>
			
			판매희망가 : <input type="text" name="price" id="price" /> <br />
			marketplace fee(10%) <input type="text" name="fees" id="fees" disabled/> <br/>
			정산 금액 : <input type="text" name="total" id="total" disabled /> <br/>
			
			
			
			
			
			<input type="submit" value="지정가로 등록" />
	
		</form>
		<script>
		$(function(){
	         function func(){
	            let price = document.getElementById('price').value;
	            let fees = price/10;
	            let total =  price-fees;
	            console.log(fees);
	            $("#fees").val(fees);
	            $("#total").val(total);
	         }
	         $("#price").change(function(){
	               func();
	         });
	         
	      }); 
		
		
		</script>
		
		
		
</body>
</html>