<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<style>
.mail_check_button{
    border: 1px solid black;
    height: 10px;
    width: 10%;
    background-color: #ececf7;
    cursor: pointer;
    text-align: center;
    font-size: 10px;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<h2> 비밀번호 변경</h2>
		<form action="/member/pwchPro" method="post" name="inputForm" onsubmit="return check()">
		<div style="margin-top:250px" align="center">

		</div>

		<div style="margin-top:200px" align="center">
			<table>   
				<c:if test ="${member != null }">
				<tr>
					<td> 아이디</td>
				</tr>
				<tr>
					<td> <input type="text" name="id" value="${member.id}"></td>
				</tr>
				</c:if>
				<tr>
					<td> 현재 비밀번호</td>
				</tr>
				<tr>
					<td> <input type="text" name="beforepw" id="beforepw"></td>
				</tr>
			</table>
				<br/><br/>
				<table>
				<tr>
					<td> 변경 비밀번호</td>
				</tr>
				<tr>
						<td> <input class="text" type="text" name="pw" id="pw"  /></td>
						
					</tr>
				<tr>
					<td> 변경 비밀번호 확인 </td>
				</tr>
				<tr>
					<td> <input type="text"  name="pwch" id="pwch" ></td>
				</tr>
			</table>
			
			<div class="mail_wrap">
				<div class="mail_name">이메일</div> 
				<div class="mail_input_box">
					<input class="mail_input" name="memberMail">
				</div>
				<span class="final_mail_ck">이메일을 입력해주세요.</span>
				<sapn class="mail_input_box_warn"></sapn>
				<div class="mail_check_wrap">
					<div class="mail_check_input_box" id="mail_check_input_box_false">
						<input class="mail_check_input" disabled="disabled">
					</div>
					<div class="mail_check_button">
						<span>인증번호 전송</span>
					</div>
					<div class="clearfix"></div>
					<span id="mail_check_input_box_warn"></span>
				</div>
			</div>
			
					<input type="submit" name="submit_btn" id="submit_btn" value="비밀번호변경" /> 
			
				<br/><br/>
		</div>
		</form>
		
<script>
function check(){
	let inputs = document.inputForm;
	//console.log(inputs);//폼태그 잘 가져왔는지 체크
	
	if(!inputs.beforepw.value){
		alert("현재 비밀번호를 입력하세요");
		return false;
	}
	if(!inputs.pw.value){
		alert("비밀번호를 입력하세요");
		return false;
	}
	if(!inputs.pwch.value){
		alert("비밀번호 확인란을 입력하세요");
		return false;
	}
	
	if(inputs.pw.value != inputs.pwch.value){
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	}
	
}
</script>	

<script>
var mail = $('.mail_input').val();
				
/* 인증번호 이메일 전송 */
$(".mail_check_button").click(function(){
	
	var email = $(".mail_input").val();			// 입력한 이메일
	var cehckBox = $(".mail_check_input");		// 인증번호 입력란
	var boxWrap = $(".mail_check_input_box");	// 인증번호 입력란 박스
	var warnMsg = $(".mail_input_box_warn");	// 이메일 입력 경고글
	
	/* 이메일 형식 유효성 검사 */
	if(mailFormCheck(email)){
		warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요.");
		warnMsg.css("display", "inline-block");
	} else {
		warnMsg.html("올바르지 못한 이메일 형식입니다.");
		warnMsg.css("display", "inline-block");
		return false;
	}		
	
	$.ajax({
		
		type:"GET",
		url:"mailCheck?email=" + email,
			success : function(data) {

				//console.log("data : " + data);
				cehckBox.attr("disabled", false);
				boxWrap.attr("id", "mail_check_input_box_true");
				code = data;

			}

		});

	});

	/* 인증번호 비교 */
	$(".mail_check_input").blur(function() {

		var inputCode = $(".mail_check_input").val(); // 입력코드	
		var checkResult = $("#mail_check_input_box_warn"); // 비교 결과 	

		if (inputCode == code) { // 일치할 경우
			checkResult.html("인증번호가 일치합니다.");
			checkResult.attr("class", "correct");
			mailnumCheck = true;
		} else { // 일치하지 않을 경우
			checkResult.html("인증번호를 다시 확인해주세요.");
			checkResult.attr("class", "incorrect");
			mailnumCheck = false;
			submit_btn=false;
		}

	});

	/* 입력 이메일 형식 유효성 검사 */
	function mailFormCheck(email) {
		var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
		return form.test(email);
	}
</script>
		
</body>

</html>