<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 페이지 </title>
</head>
<body>
		<form >
		<div align="center">
	<h4>제목 :  el 표현식으로 제목 가져오기</h4>
		
				<br/>
	<h5>소유자 : el 표현식으로 소유자 가져오기 </h5>
	
		<h5> el표현식으로 상품 등록일                     status</h5>
					
				<h4> 최저가격   :   el로 최저 가격 가져오기 </h4>
				<!--  
					<c:if test="${sesson.id == null}">
				<button type="submit" onclick="location.href='/common/login.jsp';"> 선택 및 구매</button>
					</c:if>
				
					<c:if test="${session.id != null}">
				<button type="submit" onclick="location.href='/product/prod_detail';"> 선택 및 구매</button>
					</c:if>
				-->
						<button type="button" onclick="loginCheck();"> 선택 및 구매</button>
						
						<script type="text/javascript">
						
						function loginCheck(){
							//let id = null; 
							//if(${session.id} != null){
								//id = ${session.id}; 								
							//}
							//else{
								//id=null;	
							//}
							//if(id == null || !id){
								console.log("선택 및 구매 버튼 클릭 !");
							alert("로그인 후 이용하실수 있습니다.");
							location.href="/common/login";
						}
							//else{
							//location.href="product/buy";
					//}
						</script>			 			
		</div>
		</form>
					






</body>
</html>