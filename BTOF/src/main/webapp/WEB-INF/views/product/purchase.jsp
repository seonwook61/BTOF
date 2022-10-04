<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Balance로 결제 페이지</title>
</head>
<body>
		<table>
			<tr>
				<td> <input type="text" value="지정가로 구매" disabled/></td>			
			</tr>
			<tr>
				<td> <input type="text" value ="결제금액:    " disabled/></td> <td> <input type="text" value="${list.prod_dtl_price}" disabled> </td> 
			</tr>
			<tr>
				<td> <input type="text" value="내 balance :   " disabled/></td> <td> <input type="number" value="${balance}" disabled/> <button onclick="window.location='/member/cashIn'"> 충전하기</button>
			</tr>
				<tr>
					<td> <button type="submit" onclick="window.location='/product/balancePay?prod_dtl_no=${list.prod_dtl_no}&prod_dtl_price=${list.prod_dtl_price}'">결제하기</button></td>
				</tr>
		</table>
	
	

</body>
</html>