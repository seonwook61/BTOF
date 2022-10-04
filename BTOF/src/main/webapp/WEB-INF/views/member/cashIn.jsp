<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
</head>
<body> 

	<ul>
		<li><a href="/common/main">BTO_FIRE!!</a></li>
	</ul>
<%-- 1. session으로 아이디 가져와야함 

"${res}" 는 충전성공 혹은 계좌 없다고 말해줌.

--%>

<h2>cash-in</h2>

<h2>현재 아이디 : "${id}" </h2>
<h2>현재금액 : "${currentWallet}"</h2>
<h2>계좌 예금주 : "${accountOwner}"</h2>
<h2>계좌번호 : "${accountNum}"</h2>


<input type="button" value="충전하기" id="cashinBtn" class="Btn"/>
<input type="button" value="출금하기" id="cashoutBtn" class="Btn"/>
<input type="button" value="계좌 불러오기" id="acCheck"/>
<input type="button" value="계좌 등록하기" id="register" onclick= "window.location='/member/enroll_ba?id=${id}'" disabled/>

<!-- 
<form name="1" method = "POST">
	<input type='number' name='amount' min='1000' max='1000000' step='1000'/>
	아이디 입력 <input type=text name='id'/>
	<input type="submit" value="충전하기" />
</form>
 -->



<script type="text/javascript">
	$(document).ready(function(){
		// 충전하기 버튼 이벤트 
		$("#cashinBtn").click(function (){
			console.log("충전하기 버튼 클릭!");
			var amount = prompt("충전 금액을 입력해주세요");
			N_amount = Number(amount);
			var idVal = "${id}";
			$.ajax({
				type : "post",
				url : "/member/cashIn",
				data : {amount : N_amount, id: idVal},
				success : function(result){
					console.log("요청 성공!");
					console.log("result : " + result);
					if(result == '0'){
						alert("먼저 계좌를 등록해주세요.");
					}else{
						alert(amount + "원 충전 성공!!!");
					}
				},
				error : function(e){
					console.log("에러발생");
					console.log(e);
				}
			});
		});
		
		// 출금하기 버튼 이벤트 (바꾸기)
		$("#cashoutBtn").click(function(){
			console.log("출금하기 버튼 클릭!");
			var amount = prompt("충전 금액을 입력해주세요");
			N_amount = Number(amount);
			var idVal = "${id}";
			$.ajax({
				type : "post",
				url : "/member/cashIn",
				data : {amount : N_amount, id: idVal},
				success : function(result){
					console.log("요청 성공!");
					console.log("result : " + result);
					if(result == '0'){
						alert("먼저 계좌를 등록해주세요.");
						
					}else{
						alert(amount + "원 충전 성공!!!");
					}
				},
				error : function(e){
					console.log("에러발생");
					console.log(e);
				}
			});
		});	
		
		// 계좌등록 버튼 이벤트 
		$("#acCheck").click(function(){
			console.log("게좌 확인 버튼 클릭!");
			var Owner = prompt("계좌 예금주명을 입력해주세요");
			var ac_numS = prompt("계좌 번호를 입력해주세요");
			var ac_num = ac_numS;
			$.ajax({
				type :"post",
				url :"/member/ajaxBankCheck",
				data : {Owner : Owner ,ac_num :ac_num},
				success: function(result){
					console.log("요청 성공!");
					console.log("result : "+result);
					alert(result);
					$("#register").prop("disabled",false);
				},
				error : function(e){
					console.log("에러발생");
					console.log(e);
				}
			});
		});	
		
	});		
</script>

<jsp:include page="cashFlowRecord.jsp" flush="false"/>


</body>
</html>