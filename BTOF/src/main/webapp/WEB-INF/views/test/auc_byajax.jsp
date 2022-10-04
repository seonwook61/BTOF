<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

	<form action="/test/auction" method="post">
		<div>
			<table>
				<tr>
					<td>상품명</td>
				</tr>
				
				<tr>
					<td> <input type="text" name="prod_name"></td>
				</tr>
				
				<tr>
					<td>사용자 아이디</td>
				</tr>
				
				<tr>
					<td> <input type="text" name="id" id="id"></td>
				</tr>
				
				<tr>
					<td>입찰 희망가격</td>
				</tr>
				
				<tr>
					<td> <input type="text" name="price" id="price" /></td>
				</tr>
			</table>
		
		</div>
	
				<input type="submit" value="입찰하기" id="btn_submit"/>	
	
	
	
	</form>

	<script>
	$(document).ready(function(){
		$("#btn_submit").click(function(){
			let price = $("price").val(); // 가격란에 적힌 가격을 받아오기
			console.log(price);
			$.ajax({
					type: "post",
					url :"/test/ajaxPrice",
					success : function(result){
						console.log("요청 성공");
					},
					error: function(e){
						console.log("에러발생");
						console.log(e);
					}
			}); //ajax
		});// btn_submit
	}); // document.ready
	</script>


</body>
</html>