<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1대1 문의 페이지</title>
</head>
<body>			
			<div align="center"><h2> 1대1 문의 작성</h2> </div>
				<div align="center">
			<form action="/board/inquiryPro" method="post" name=inputForm onsubmit="return check()">
					<table>
						<tr>
							<td> 제목 </td>
						</tr>
						<tr>
							<td><textarea rows="3" cols="100" name="head"></textarea></td>
						</tr>
						<tr>
							<td> 문의내용</td>
						</tr>
						<tr>	<td><textarea rows="30" cols="150" name="content"></textarea></td>
						</tr>
								<tr>
									<td> <input type="submit" value="작성완료"/></td>
									<td> <input type="reset" value="다시작성"/></td>	
								</tr>	
								<tr>
									<td><textarea rows="30" cols="150" name="reply" disabled ></textarea></td>
								</tr>
						
									
			
					</table>
				</form>
				</div>	
				<script type="text/javascript">
					function check(){
							let input = document.inputForm;
						if(!input.head.value){
							alert("제목을 작성해주세요.");
							return false;
						}	
						if(!input.content.value){
							alert("문의내용을 작성해주세요.");
							return false;
						}
					}
				</script>


</body>
</html>