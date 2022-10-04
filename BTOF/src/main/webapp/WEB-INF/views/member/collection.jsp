<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link type="text/css" href="/resources/css/main.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="/resources/js/main.js" defer></script>
	
</head>
<body>
	<!-- 상단 네비 -->
	<!--  
	<%@ include file="/WEB-INF/views/common/nav.jsp" %>
	-->
	
	<!-- 중앙 -->
	<!-- 중앙 좌측 -->
	
	<div id="wrap">
	    
	        	<div class="product" align="center">
	        		
	        	<c:forEach var="list" items="${list}">
					
					<a	href="../member/sender?prod_dtl_name=${list.prod_dtl_name}&prod_dtl_artist=${list.prod_dtl_artist}">
					
						
						작품명 : ${list.prod_dtl_name}					
							<br/>
						 
				
					
						 작가명 : ${list.prod_dtl_artist}
						        <br/></br></br>		
					</a>
	        	</c:forEach>
	        	
	        	</div>
	        
	    
	</div>
	<!-- 푸터 
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	-->
	
	<script>


	</script>
</body>
</html>