<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>idAvail</title>
	<link href="/resources/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<br/>
	<h3>삭제완료</h3>
	<c:if test="${result == 1}">
	
			 <table>
				<tr>
					 
				</tr>
			</table>
			<br/>
			<form action="/common/idAvail" method="post" name="checkForm" onsubmit="return check()">
				<table>
					<tr>
						<td>다른 아이디를 선택하세요 <br/>
							<input type="text" name="id"/>
							<input type="submit" value="아이디 중복확인" />
						</td>
					</tr>
				</table>
				
			</form>
	</c:if>
	<c:if test="${result != 1}">
	<table>
			<tr>
				<td>입력하신 ${trialId}은/는 사용하실 수 있습니다. <br/>
					<input type="button" value="사용하기" onclick="setId()"/>
				</td>
			</tr>
		</table>
	</c:if>
	
	<script type="text/javascript">
		function inputCheck(){
			let inputForm = document.checkForm;
			if(!inputForm.id.value){
				alert("아이디를 입력하세요.");
				return false;
			}
		}
		function setId(){
			opener.document.inputForm.id.value = "${trialId}";
			self.close();
		}
	</script>
	
</body>
</html>