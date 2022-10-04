<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지정가 구매 페이지</title>
<!-- jQuery 라이브러리 추가  -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- iamport.payment.js 아임포트 라이브러리 추가 : 최신버전은 iamport doc에서 찾아보기  -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
</head>
<body>

		<table style="margin-top=100;" align="center">
			<tr>
					<td><h4> 지정가</h4></td>  <td>${list.prod_dtl_price}  KRW</td>
			</tr>
				<tr>
					<td> 결제방법</td>
				</tr>
					<tr>
							<td> <button type="button" id="payBtn">카카오 페이로 결제하기 </button></td>
					</tr>
				<tr>
					<td><button type="submit" onclick="window.location='/product/purchase?prod_dtl_no=${list.prod_dtl_no}&prod_dtl_price=${list.prod_dtl_price}'" >Balance로 결제하기</button></td>
				</tr>
		</table>

		<script type="text/javascript">
		$(document).ready(function(){
			// 결제 준비 
			var IMP = window.IMP; // 생략 가능
		    IMP.init("imp74537496"); // 내정보에서 가져오기 
		    
		    // 결제 요청 : 결제하기 버튼 클릭시 요청 
		    $("#payBtn").click(function(){
		    	// IMP.request_pay(파라미터 객체{}, callback function(){}); 
		    	IMP.request_pay({ // parameter 
		    		pg: 'kakaopay',
		    		pay_method: 'card',
		    		merchant_uid: 'ORD_'+ new Date().getTime(),  // 임의로 만들기 
		    		name: '${list.prod_dtl_name}', 
		    		amount: ${list.prod_dtl_price}, 
		    		buyer_name: '${list.id}',
		    		buyer_tel: '${list.prod_dtl_no}', 
		    	}, function(rsp){
		    		console.log(rsp);
		    		if (rsp.success) {
		                // 결제 성공 시 로직,
		                console.log("결제 성공!!!");
		                // 응답 받은 정보를 DB 일정 데이터를 저장하겠다~~~  
		                let result = {
		                		imp_uid: rsp.imp_uid, 	// 아임포트 고유 결제 번호 
		                		merchant_uid: rsp.merchant_uid, // 우리사이트의 고유 주문번호
		                		pay_method: rsp.pay_method, 	// 결제 방법, card, kakaopay
		                		paid_amount: rsp.paid_amount,	// 결제 금액 
		                		name: rsp.name,					// 주문명 
		                		pg_provider: rsp.pg_provider, 	// 결제 승인시도한 PG사 
		                		buyer_name: rsp.buyer_name, 	// 주문자명 
		                		buyer_tel: rsp.buyer_tel, 		// 주문자 휴대폰번호 
		                		//paid_at: rsp.paid_at, 
		                		paid_at: new Date().getTime(), 	// 결제 승인시각 
		                		receipt_url: rsp.receipt_url	// PG사에서 발행하는 거래 매출 전표 url
		                };
		                // DB 처리되게 하는 요청
		                $.ajax({
		                	url: '/product/insertPayInfo', 
		                	type: 'POST',
		                	data: JSON.stringify(result),
		                	contentType: 'application/json;charset=utf-8', 
		                	dataType: 'text',  // ajax 요청처리후 Controller에서 "success"같은 문자열 리턴해줄예정.. 
		                	success: function(data, status, xhr){
		                		alert("결제 처리 성공!!!"); 
		                		window.location='/common/main';
		                		console.log(data);
		                	}, 
		                	error: function(xhr, status, e) {
		                		console.log(e);
		                	}
		                }); 
		            } else {
		                // 결제 실패 시 로직,
		                console.log("결제 실패....");
		            }
		    		
		    	}); 
		    	
		    	
		    }); 
			
			
			
		}); 	
					
				
				
		</script>


</body>
</html>