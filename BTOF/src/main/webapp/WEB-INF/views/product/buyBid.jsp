<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>Time Auction</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
	<link href="http://fonts.cdnfonts.com/css/aldo-the-apache" rel="stylesheet">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <style>
    	.wrap {
    		max-width: 1440px;
    	}
    	.div-center {
    		display: flex;
    		margin: 0 auto;
    		justify-content: space-between;
    		align-items: center;
   			width: 600px;
    	}
    	h4{
			font-family: 'arial', sans-serif;
			font-size: 18pt;
			font-weight: semi-bold;
		}
    	.time_container {
    		display:flex;
    		color: black;
    	}
    	#d-day-hour{
			font-family: 'Aldo the Apache', sans-serif;
			font-size: 36pt;
		}
		#d-day-min{
			font-family: 'Aldo the Apache', sans-serif;
			font-size: 36pt;
		}
		#d-day-sec{
			font-family: 'Aldo the Apache', sans-serif;
			font-size: 36pt;
		}
		#d-day{
			font-family: 'Aldo the Apache', sans-serif;
			font-size: 36pt;
		}
		h3{
			float: center;
			width: 1200px;
			text-align: left;
			font-family: 'arial', sans-serif;
			font-weight: semi-bold;
		}
		#highPrice{
			float: center;
			text-align: center;
			font-family: 'arial', sans-serif;
			font-weight: semi-bold;
		}
		span {
			margin-left: 10px;
			margin-right: 10px;
			padding: 15px;
			border: 5px solid #FFE641;
			border-radius: 5px;
			background: white;
		}
		#currPrice{
			font-family: 'arial', sans-serif;
			font-size: 34pt;
			font-weight: bold;
			color: #8B4513;
		}
		.frame {
			  width: 100%;
			  margin: auto;
			  text-align: center;
		}
		button {
			  margin: auto;
		}
			.custom-btn {
				  width: 120px;
				  height: 40px;
				  color: #fff;
				  border-radius: 5px;
				  padding: 10px 25px;
				  font-family: 'Lato', sans-serif;
				  font-weight: 500;
				  background: transparent;
				  cursor: pointer;
				  transition: all 0.3s ease;
				  position: relative;
				  display: inline-block;
				  box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
				   7px 7px 20px 0px rgba(0,0,0,.1),
				   4px 4px 5px 0px rgba(0,0,0,.1);
				  outline: none;
			}
			.btn-1 {
					background: #2C952C;
					border: none;
			}
			.btn-1:hover {
					background: #006400;
			}
			.btn-2 {
					background: #FF0000;
					border: none;
			}
			.btn-2:hover {
					background: #800000;
			}
	
	</style>
</head>
<body>
<br /><br /><br />
	<div class="wrap" align="center" >
		<div class="div-center" align="center">
			<div class="txt">
				<h4>Time remaining until auction close &nbsp;&nbsp;</h4> 
			</div>
			<div class="time_container">
				<div class="time"><h4 id="d-day-hour"></h4></div>
				<div class="time"><h4 id="d-day">&nbsp;:&nbsp;</h4></div>
				<div class="time"><h4 id="d-day-min"></h4></div>
				<div class="time"><h4 id="d-day">&nbsp;:&nbsp;</h4></div>
				<div class="time"><h4 id="d-day-sec"></h4></div>
				<br />
			</div>
		</div>
	</div>
    <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
    	<div class="frame">
  			<h3 id="startPrice"> start price : ${price} KRW </h3>
  			<br />
	        <h2 id="highPrice"> HIGHEST PRICE : <span id="currPrice">${price}</span> KRW</h2>
	        <br /><br />
	        <button class="custom-btn btn-1" id="open" type="button" onclick="openSocket();">입찰 참여</button>
		    <button class="custom-btn btn-2" type="submit" onclick="exit()" >나가기</button>
		</div>
	    <br />
  		입찰가 입력 : 
        <input type="text" id="sender" value="${id}" style="display: none;">
        <input class="form-control" type="text" placeholder="입찰 참여 버튼을 누른 후 입력이 가능합니다." id="intTextBox" disabled="disabled">
        <br />
        <button class="form-control btn btn-primary" type="submit" onclick="checkPrice();"> 입찰 </button>
    	<br /><br /><br /><br />
    </div>
    <!-- Server responses get written here -->
    <div id="messages">
    </div>
    <script type="text/javascript">
    	function alarm(){
	   	    $("#recentHigh").html("currPrice");	
    	}
    </script>
    <!-- 종료 시간에 맞춰 자동 종료되는 스크립 -->
    <script type="text/javascript">
    	var now = new Date();
    	var close = ${closeT};
    	var dif = Math.abs(close - now.getTime());
    	var timer =	setTimeout("auction_close()", dif);
	    function auction_close(){
	    	var currPriceVal = document.getElementById("currPrice").innerHTML;
	    	var finalBidder = document.getElementById("sender").value;
    		alert("경매가 종료되었습니다."+"\r 최종 입찰가 : "+currPriceVal+"\r 최종 낙찰자 : "+finalBidder);
    		clearInterval(timer);
    		location.href="/common/main";
		}
    </script>
    <!-- 경매 종료 시간 디스플레이 스크립 -->
    <script type="text/javascript">
	   	function remaindTime() {
	   	    var now = new Date();
	   	    var nt = now.getTime();
	   	    var ct = ${closeT};
	   	  	
	   	    if(nt<ct){ 
	   	    	sec = parseInt(ct - nt) / 1000;
	   	    	hour = parseInt(sec/60/60);
	   	    	sec = (sec - (hour*60*60));
	   	    	min = parseInt(sec/60);
	   	    	sec = parseInt(sec-(min*60));
	   	  
	   	   	if(hour<10){hour="0"+hour;}
	   	    if(min<10){min="0"+min;}
	   	    if(sec<10){sec="0"+sec;}
	   	    $("#d-day-hour").html(hour);
	   	    $("#d-day-min").html(min);
	   	    $("#d-day-sec").html(sec);
	   	   	} else{
	   	    $("#d-day-hour").html('00');
	   	    $("#d-day-min").html('00');
	   	    $("#d-day-sec").html('00');
	  		}
		}
	   	  setInterval(remaindTime,1000);
	</script>
    <!--웹소켓 처리 스크립 -->
	<script type="text/javascript">
        var ws;
        var messages = document.getElementById("messages");
        
        function openSocket(){
        	alert("입찰을 시작합니다.");
        	document.getElementById('open').setAttribute('disabled', 'disabled');
        	document.getElementById('open').style.color="grey";
        	document.getElementById('intTextBox').removeAttribute('disabled', 'disabled');
        	document.getElementById('intTextBox').removeAttribute('placeholder');
            if(ws !== undefined && ws.readyState !== WebSocket.CLOSED ){
                writeResponse("WebSocket is already opened.");
                return;
            }
            //웹소켓 객체 만드는 코드
            ws = new WebSocket("ws://localhost:8080/echo");
            
            ws.onopen = function(event){
                if(event.data === undefined){
              		return;
                }
                writeResponse(event.data);
            };
            
            ws.onmessage = function(event){
                writeResponse(event.data);
            };
            
            ws.onclose = function(event){
    			alert("경매 종료");
    			history.go(-2);
            }
        }
        // 숫자만 입력하게
        function setInputFilter(textbox, inputFilter) {
      	  ["input", "keydown", "keyup", "mousedown", "mouseup", "select", "contextmenu", "drop"].forEach(function(event) {
      	    textbox.addEventListener(event, function() {
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
        	
        // 입력값 검사
        function checkPrice(){
        	var balance = "${balance}";
        	console.log(balance);
        	var currPriceVal = document.getElementById("currPrice").innerHTML;
        	console.log(currPriceVal);
        	if(currPriceVal){
        		oldPrice = parseInt(document.getElementById("currPrice").innerHTML);
        	}else{
        		
        	}
        	var newPrice = parseInt(document.getElementById("intTextBox").value);
        	console.log(newPrice);
        	if(newPrice > oldPrice && newPrice <= balance){
        		return send(newPrice);
        	}else if(newPrice <= oldPrice){
        		alert("현재가보다 높은 금액으로 입찰하셔야 합니다.");
        	}else if(newPrice > balance){
        		alert("balance가 부족합니다.");
        	}
        	return;
        }
        
        function send(newPrice){
        	console.log("newPrice : " + newPrice);
            var text = newPrice +","+document.getElementById("sender").value;
            ws.send(text);
            document.getElementById("currPrice").innerHTML = newPrice;
            text = "";
        }
        
        function writeResponse(text){
            messages.innerHTML += "<br/>"+text;
            document.getElementById("currPrice").innerHTML = text.substring(text.indexOf(":")+1).trim();
        }
        
        function exit() {
            if (confirm("경매에서 나가시면 다시 들어오실 수 없습니다.")) {
            	window.location="/common/main";
            } else {
                return;
            }
        }
	</script>
</body>
</html>
