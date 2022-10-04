<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
<head>
<title>waiting room</title>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link href="http://fonts.cdnfonts.com/css/aldo-the-apache" rel="stylesheet">
	<meta charset="UTF-8">
	<style>
		.container{
			width: 720px;
			height: 600px;
			margin: 0 auto;
			background-color: white;
			border: 15px solid #84DCC8;
			border-radius: 10px;
		}
		h2{
			font-size: 14pt;
			color: black;
		}
		h3 {
			float: center;
			width: 720px;
			text-align: center;
			display: inline;
			font-family: 'Aldo the Apache', sans-serif;
			font-size: 28pt;
			color: black;
		}
		h6{
			font-size: 13pt;
			font-weight: bold;
			background-color: #FFF978;
			margin: 0 78;
			line-height: 26pt;
			color: #EB0000;
		}
		.mainBtn{
			width: 60px;
			height: 30px;
			color: red;
			border: 2px solid red;
			border-radius: 2px;
			background: transparent;
			cursor: pointer;
			transition: all 0.3s ease;
		}
		.mainBtn:hover{
			color: white;
			background: red;
			border: 2px solid red;
			border-radius: 2px;
		}
	</style>
</head>
<body>
	<br /><br />
	<div class="container" align="center">
			<br />
			<h2> 대기열에 들어오셨습니다. 경매가 열리면 자동으로 이동합니다. </h2>
			<h4> AUCTION OPEN IN</h4>
			<h3 id="d-day-hour"></h3><h3>&nbsp;:&nbsp;</h3>
			<h3 id="d-day-min"></h3><h3>&nbsp;:&nbsp;</h3>
			<h3 id="d-day-sec"></h3>
			<br /><br />
			<video width="240" height="240" controls autoplay loop muted>
                <%-- <source src="<spring:url value='/video/${eventBox}' />" type="video/mp4" > --%>
                <source src="/resources/video/${eventBox}" type="video/mp4" >
            </video>
            <br /><br />
			<button class="mainBtn" onclick="window.location='/common/main'">main</button>
			<br /><br />
			<h6>대기열에서 나간뒤 경매가 열리면 다시 들어오실 수 없습니다.</h6> 
			<br />		
	</div>
	<!-- 경매장 오픈 시간 디스플레이 스크립 -->
	<script type="text/javascript">
		function remaindTime() {
	   	    var now = new Date();
	   	    var nt = now.getTime();
	   	    var ot = ${openT};
	   	  	
	   	    if(nt<ot){ 
	   	    	sec = parseInt(ot - nt) / 1000;
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
	<!-- 시간이 되면 자동으로 넘어가게 하는 스크립 -->
	<script type="text/javascript">
    	var now = new Date();
    	var open = ${openT};
    	var dif = Math.abs(open - now.getTime());
    	var timer =	setTimeout("auction_open()", dif);
	    function auction_open(){
    		clearInterval(timer);
    		location.href="/buyBid";
	    }
	</script>
</body>
</html>