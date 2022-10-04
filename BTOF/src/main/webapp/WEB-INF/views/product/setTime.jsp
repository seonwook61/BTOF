<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>set time page</title>
</head>
<body>
<h2> 관리자용 이벤트 옥션 등록 페이지 </h2>
<form name="setT" method="post" action="/adminSetT" enctype="multipart/form-data">
	<h3> 옥션 오픈 시간 입력</h3>
	<div>
		<input name="openTime" type="datetime-local" required/>
	</div>
	<h3> 옥션 종료 시간 입력</h3>
	<div>
		<input name="closeTime" type="datetime-local" required/>
	</div>
	<br />
	<h3> 경매 상품 등록 </h3>
	<div>
		<input name="eventItem" type="file" required/>
	</div>
	<h3> 시작가 등록 </h3>
	<div>
		<input name="startPrice" type="text" id="intTextBox" required/>원(KRW) / 금액은 숫자로 입력해주세요.
	</div>
	<!-- 숫자만 입력하게 하는 스크립 -->
   <script>
		function setInputFilter(textbox, inputFilter) {
   	  		["input", "keydown", "keyup", "mousedown", "mouseup", "select", "contextmenu", "drop"]
   	  		.forEach(function(event) {
   	    		textbox.addEventListener(event, 
   	    		function() {
   	      			if (inputFilter(this.value)) {
   	        			this.oldValue = this.value;
   	        			this.oldSelectionStart = this.selectionStart;
   	        			this.oldSelectionEnd = this.selectionEnd;
   	      			} else if (this.hasOwnProperty("oldValue")) {
   	        			this.value = this.oldValue;
   	        			this.setSelectionRange(this.oldSelectionStart, this.oldSelectionEnd);
   	      			} else {
   	        		this.value = "";
   	      			}
   	    		});
   	  		});
   		}
	     setInputFilter(document.getElementById("intTextBox"), function(value) {
    		 	return /^-?\d*$/.test(value); 
     	});
   </script>
   <br />
	<input type='submit' value='이벤트 등록'> 
</form>
</body>
</html>