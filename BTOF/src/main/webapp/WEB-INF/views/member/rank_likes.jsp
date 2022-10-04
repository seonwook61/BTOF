<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

	<h2>rank_likes</h2>

	
	<input type="text" id="id" name="id" />
	<input type="number" id="prod_no" name="prod_no"/> <br />
	<!-- <input type="button" name="제공" onsubmit="changeHeart();"/> -->
	
	
	<!--  productDetail.jsp -->
	<c:choose>
	    <c:when test="${like eq 0}"> <!-- likecheck가0이면 빈하트-->
	        <img src="/resources/imgs/emptyheart.png" 
	             id="btn_like" align="left" style="cursor:pointer; width: 20px;">
	    </c:when>
	    <c:otherwise> <!-- likecheck가1이면 빨간 하트-->
	        <img src="/resources/imgs/filledheart.png" 
	              id="btn_like" align="left" style="cursor:pointer; width: 20px;">
	    </c:otherwise>
	</c:choose>


<script>
/*  */
 	$(document).ready(function(){ 
		
	 
	
/* 좋아요 버튼 눌렀을떄 */
		$("#btn_like").click(function() { 
			var idVal = $("#id").val();
			var prod_noVal = $("#prod_no").val();
			console.log(idVal);
			console.log(prod_noVal);
		    $.ajax({
		     	type : "POST",  
				url : "/member/rank_likes",       
		        data : {id:idVal , prod_no : prod_noVal}, //받아온 프로덕트넘버와 유저 아이디.
		        success : function(data) {
		            console.log("data : " + data);
		            console.log(data);
	                if(data == '-1'){
	                    alert("좋아요 오류");
	                }
	                else{
	                    if(data == '1'){
	                        $("#btn_like").attr("src","/resources/imgs/emptyheart.png");
	                    }
	                    else if (data == '0'){
	                        $("#btn_like").attr("src","/resources/imgs/filledheart.png" );
	                    }
	                }
		        },
		        error : function(e){
		                alert("통신 에러");
		                console.log(e);
		        }
			});//ajax
		}); // click
	
 	});// ready
	 
 </script>








</body>
</html>