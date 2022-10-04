<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.row{
		display:flex;
	}
	.col-md-2{
		margin:auto;
		position: absolute;
  		top: 40%;
  		left: 20%;
	}

	.btn{
		text-decoration: none;
		font-size:2rem;
		color:white;
		padding:10px 20px 10px 20px;
		margin:20px;
		display:inline-block;
		border-radius: 10px;
		transition: all 0.1s;
		text-shadow: 0px -2px rgba(0, 0, 0, 0.621);
	}
	.btn:active{
		transform: translateY(3px);
	}
	
	.btn.blue{
    
		background-color:rgba(0, 89, 255, 0.867);
		border-bottom:5px solid rgba(0, 89, 255, 0.738);
	}
    .btn.green{
    	
		background-color:green;
		border-bottom:5px solid rgb(6, 151, 6);
	}
    .btn.lightgreen{
    	
		background-color:lightgreen;
		border-bottom:5px solid rgb(154, 230, 154);
	}
    .btn.red{
    	
		background-color: rgb(255, 51, 24);
		border-bottom:5px solid rgb(245, 67, 44);
	}
    .btn.black{
    	color: white;
		background-color: black;
		border-bottom:5px solid grey;
	}
	.btn.exit{
    	
		background-color: rgb(255, 51, 24);
		border-bottom:5px solid rgb(245, 67, 44);
	}
	.btn.blue:active{
		border-bottom:2px solid rgb(14, 14, 68);
	}

</style>


</head>


<body>
	<c:if test="${login_res != 1}">
		<script type="text/javascript">
			alert("접근 권한이 없습니다.");
			window.location="/common/main";
		</script>	
	</c:if>

	<c:if test="${login_res ==1}">
			<script type="text/javascript">
				alert("관리자로 로그인 하셨습니다. 환영합니다");
				console.log("${result}");
			</script>		
		</c:if>

		<c:if test="${inq_result ==1}">
			<script type="text/javascript">
				alert("답변 등록이 완료되었습니다.");
			</script>
		</c:if>
<div class="row" text-align="center">
	<div class="col-md-2">
    <a class="btn blue" href="/admin/Membership ">회원관리</a>
    <a class="btn green" href="/admin/Approval">승인관리</a>
    <a class="btn lightgreen" href="/admin/Manage">운영관리</a>
    <a class="btn black" href="/product/setTime">이벤트관리</a>
    <a class="btn red" href="/admin/Balance">거래관리</a>
    <a class="btn exit" href="/common/logout">EXIT</a>
	</div>
</div>  

</body>
</html>









