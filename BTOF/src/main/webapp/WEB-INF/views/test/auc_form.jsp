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

	<form action="/test/auction" method="post" name="auctionForm" onsubmit="return check()">
		<div>
			<table>
				<tr>
					<td>상품명</td>
				</tr>
				
				<tr>
					<td> <input type="text" name="prod_name" id="prod_name"></td>
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
	
		<script type="text/javascript">
		function check(){
			let inputs = document.auctionForm;
			//console.log(inputs);//폼태그 잘 가져왔는지 체크
			if(!inputs.prod_name.value){//값이 없으면
				alert("상품명을 입력하세요");
				return false;
			}
			if(!inputs.id.value){
				alert("아이디를 입력하세요");
				return false;
			}
			if(!inputs.price.value){
				alert("가격을 입력하세요");
				return false;
		}
		}
		
		</script>


</body>
</html>