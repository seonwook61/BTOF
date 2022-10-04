<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 답변 작성 페이지</title>
</head>
<body>

				<div align="center"><h2> 1대1 문의 내용</h2> </div>
					<div align="center">
						<form action="/admin/replyPro" method="post" name=inputForm>
							<table>
									<tr>
										<td> <h2> 작성자 : ${list.id} </h2></td>
										<td><input type="hidden" name="id" value="${list.id}"/></td>
									</tr>
								<tr>
									<td> 제목 </td>
								</tr>
								<tr>
									<td><textarea rows="3" cols="100" name="head" disabled>${list.head}</textarea></td>
								</tr>
								<tr>
									<td> 문의내용</td>
								</tr>
								<tr>	
									<td><textarea rows="30" cols="150" name="content" disabled>${list.content}</textarea></td>
								</tr>
								<tr>
									<td> <input type="submit" value="작성완료"/></td>
									<td> <input type="reset" value="다시작성"/></td>	
								</tr>	
								<tr>
									<td><textarea rows="30" cols="150" name="reply" placeholder="답변하기">${list.reply}</textarea></td>
								</tr>
										
									
			
						</table>
				</form>
			</div>	
</body>
</html>