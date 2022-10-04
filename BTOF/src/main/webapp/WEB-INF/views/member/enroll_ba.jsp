<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>계좌 등록 페이지</title>
</head>
<body>
	<ul class="goMain">
	    <li><a href="/common/main" class="nav-link px-2 text-secondary">BTO_FIRE!!</a></li>
	</ul>
		<form action="/member/enroll_baPro" method="post" name ="ba_form" onsubmit ="return check()">
		<div> 예금주 명</div>
	<input type="text" name="Owner" id="Owner"/>
		<br/><br/>
		<div> 계좌번호</div>
		<input type="text" name=ac_num id="num"/>
		<button type="button" name="acCheck" onclick="bankCheck();" id="acCheck"> 계좌확인</button>
			<input type="text" name="checnk_result" id="check_result" disabled/>
				<br/><br/>
		<div> 비밀번호 확인</div>
			<input type="password" name="pwch" id="pwch"/>
			<input type="submit" value="등록하기"/> 
		</form>
			
		<script type="text/javascript">
		
		function check(){
			let inputs = document.ba_form;
			//console.log(inputs);//폼태그 잘 가져왔는지 체크
			if(!inputs.acOwner.value){//값이 없으면
				alert("예금주명을 입력하세요");
				return false;
			}
			if(!inputs.ac_num.value){
				alert("계좌번호를 입력하세요");
				return false;
			}
			if(!inputs.pwch.value){
				alert("비밀번호 확인란을 입력하세요");
				return false;
			}
			
		}
		</script>
		<script type="text/javascript">
			function bankCheck(){
					$(document).ready(function(){
					$("#acCheck").click(function(){
							console.log("게좌 확인 버튼 클릭!");
						let OwnerVal = $("#Owner").val();
						let acNumVal = $("#num").val();
						$.ajax({
							type :"post",
							url :"/member/ajaxBankCheck",
							data : {Owner : OwnerVal ,ac_num :acNumVal},
							success: function(result){
								console.log("요청 성공!");
								alert("등록이 가능한 계좌입니다.")
								console.log("result : "+result);
								$("#check_result").val(result);
							},
							error : function(e){
								console.log("에러발생");
								alert("존재하지 않는 계좌입니다.")
								console.log(e);
							}
						});
					});	
					});		
			}
		</script>
		
				
	
</body>
</html>