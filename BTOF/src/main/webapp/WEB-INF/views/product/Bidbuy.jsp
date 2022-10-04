<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입찰 구매</title>
</head>
<body>

	<form action="/product/BidbuyPro" method="post" name="bidform" onsubmit="return check()"> 
	<table>
		<tr>
				<td> 입찰 마감일 </td>			<td>${list.prod_dtl_endday}</td>
		</tr>
		<tr>
			<td> 현재 최고 입찰가</td>  <td> ${list.prod_dtl_bid_price}</td>
		</tr>
		<tr>
			<td><h2> 입찰 희망가</h2></td>
			
			<td><input type="number" id="bid" name="prod_dtl_bid_price" placeholder="직접입력"/></td> 
		</tr>	
			<tr>
			<td><input type="submit" value="입찰하기"/></td>
				
			</tr>
	</table>
		<input type="hidden" name="prod_dtl_name" value="${list.prod_dtl_name}">
		<input type="hidden" name="prod_dtl_artist" value="${list.prod_dtl_artist}">
	</form>
	<script type="text/javascript">
		function check(){
		let input = document.bidform
			if(!input.bid.value){
				alert("입찰가를 입력하세요");
				return false;
			}
			if(input.bid.value<${list.prod_dtl_bid_price}){
				alert("현재 최고 입찰가보다 적게 입찰하실수 없습니다.");
				return false;
			}
		}
		
	</script>


</body>
</html>