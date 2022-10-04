<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>닉네임 중복검사</title>
</head>
<body>

<h3> 닉네임 중복 확인 페이지</h3>
		
		
		<c:if test="${result !=1}">
		
			
			<table>
				<tr>
					<td>
						${trialNick2}은/는 존재하지 않는 닉네임입니다..						
					</td>
				</tr>			
			</table>
					<form action="/common/NickAvail2" method="get" name="checkForm" onsubmit="return check()">
				<table>
					<tr>
						<td>다른 닉네임을 선택하세요 <br/>
							<input type="text" name="nick2"/>
							<input type="submit" value="추천인 확인" />
						</td>
					</tr>
				</table>
				
			</form>
			
		</c:if>
		<c:if test="${result == 1}">
		<table>
			<tr>
				<td>입력하신 ${trialNick}은/는 사용하실 수 있습니다. <br/>
					<input type="button" value="사용하기" onclick="setNick()"/>
				</td>
			</tr>
		</table>
	</c:if>
		<script type="text/javascript">
		function inputCheck(){
			let inputForm = document.checkForm;
			if(!inputForm.nick2.value){
				alert("닉네임을 입력하세요.");
				return false;
			}
		}
		function setNick(){
			opener.document.inputForm.nick2.value = "${trialNick2}";
			self.close();
		}
	</script>
</body>
</html>