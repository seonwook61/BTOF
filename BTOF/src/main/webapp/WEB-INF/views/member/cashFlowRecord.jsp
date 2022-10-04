<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
</head>
<body>

	<h2>cashFlowRecord</h2>
	
	<h2>최근 <input type="number" id="num"/>일간의 거래내역 조회 </h2>
	<input type="button" value="조회하기" id="updateBtn"/>
	<div id="container">
		<table>
			<tr>
			<td>아이디</td>		
			<td>출금액</td>		
			<td>입금액</td>		
			<td>거래기록</td>		
			</tr>
		
		<c:forEach var="recordList" items="${recordList}">
			<tr>
				<td>${recordList.id}</td>
				<td>${recordList.withdrawal}</td> <%-- 업로드 파일불러오는거 추가해야함! --%>
				<td>${recordList.deposit}</td>
				<td>
					<fmt:formatDate pattern="yyyy-MM-dd E요일 HH:mm:ss" value="${recordList.recordDate}"/>  
				</td>
			</tr>	
		</c:forEach>
		</table>
	</div>
	
	
	<script type="text/javascript">
	$(document).ready(function(){
		let container = $("#container");
		
		function leftPad(value) { 
			if (value >= 10) { 
				return value; 
			} 
			return '0'+value; 
		}

		function toStringByFormatting(source) {
			const days = [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일' ];
			const year = source.getFullYear(); 
			const month = leftPad(source.getMonth() + 1); 
			const day = leftPad(source.getDate()); 
			const hour = leftPad(source.getHours());
			const min = leftPad(source.getMinutes());
			const sec = leftPad(source.getSeconds());
			let d = [year, month, day].join('-');
			let h = [hour, min, sec].join(':');
			return d + " " + days[source.getDay()] + " " + h; 
		}

		$("#updateBtn").click(		
			function(){
			var rid = "${id}";
			var rnum = $("#num").val();
			console.log(rid);
			console.log(rnum);
			
			$.ajax({
				type : "GET",
				url : "/member/cashFlowRecord2",
				data : {id : rid, num : rnum},
				dataType: "json",
				success : function(data){
					console.log("data" + data);
					console.log(data.length);
					console.log(data[0].recordDate);
					console.log(toStringByFormatting(new Date(data[0].recordDate)));
					container.empty();
					let str = '<table><tr><td>아이디</td><td>출금액</td><td>입금액</td><td>거래기록</td></tr>';
					for(let i = 0; i < data.length; i++){
						str += '<tr><td>'+data[i].id+'</td><td>'+data[i].withdrawal+'</td><td>'+data[i].deposit+'</td>';
						str += '<td>'+toStringByFormatting(new Date(data[i].recordDate))+'</td></tr>';
					}
					container.html(str);
					//$("#items").val() = data;
				},
				error : function(e){
					alert("통신에러");
					console.log(e);
		        }
			});//ajax
		}); // click
 	});// ready
	
	</script>
	
	
	

</body>
</html>