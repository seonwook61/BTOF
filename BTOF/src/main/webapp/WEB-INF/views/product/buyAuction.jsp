<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
<title>today's drop</title>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link href="http://fonts.cdnfonts.com/css/aldo-the-apache" rel="stylesheet">
	<style>
		video {
			padding: 0;
			margin: 0;
		}
		.div-center {
			margin-left: auto;
			margin-right: auto;
		}
		h3 {
			float: center;
			width: 60px;
			text-align: center;
			display: inline;
			font-family: 'Aldo the Apache', sans-serif;
			font-size: 34pt;
			color: black;
		}
		h4 {
			float: center;
			width: 480px;
			text-align: center;
			font-family: 'arial', sans-serif;
			font-size: 14pt;
			color: black;
		}
		.playBtn{
			width: 80px;
			height: 30px;
			border: 2px solid #B4C3FF;
			border-radius: 2px;
			background: transparent;
			cursor: pointer;
			transition: all 0.3s ease;
		}
		.playBtn:hover{
			background-color: #B4C3FF;
			border: 2px solid #B4C3FF;
			border-radius: 2px;
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
		.div-center1 {
			margin-left: auto;
			margin-right: auto;
		}
	
	</style>
</head>
	<div class="container">
		<div class="div-center" align="center">
		<br /><br /><br />
			<h4> NFT DROP START IN</h4>
			<h3 id="d-day-hour"></h3><h3>&nbsp;:&nbsp;</h3>
			<h3 id="d-day-min"></h3><h3>&nbsp;:&nbsp;</h3>
			<h3 id="d-day-sec"></h3>
			<br /><br />
			<video id="preview" width="300" height="300" controls autoplay loop muted>
                <source src="/resources/video/${eventBox}" type="video/mp4" >
            </video>
			<br /><br />
	    	<button class="playBtn" onClick="openVideoModal()">NFT play</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button class="mainBtn" onclick="window.location='/common/main'">main</button>		
		</div>
    <!-- 모달창 부분 -->
    <div id="fileModal" class="modal fade" role="dialog">
     	<div class="modal-dialog" style="max-width: 100%; width: auto; display: table;">
        	<div class="modal-content">
          		<div class="modal-header modal-header-sm">
            		<h6 class="modal-title"> Today's Drop Item</h6>
            		<button type="button" class="close" data-dismiss="modal">&times;</button>
          		</div>
          		<div class="modal-body">
            		<video width="480" height="480" controls autoplay loop muted>
                		<source src="/resources/video/${eventBox}" type="video/mp4" >
            		</video>
          		</div>
        	</div>
      	</div>
    </div>
    <!-- 모달창오픈과 파일 재생 관련 스크립 -->
	<script type="text/javascript">
		function openVideoModal() {
			$('#file-viewer').empty();

		  	var div = document.createElement('div');
		  	div.setAttribute('class', 'embed-responsive embed-responsive-16by9');

		  	// video 태그 사용
		  	var video = document.createElement('video');
		  	video.setAttribute('class', 'embed-responsive-item');
		  	video.setAttribute('controls', 'controls');
		  	video.setAttribute('src', 'video/pro01.mp4');
		  	div.append(video);

		  	$('#file-viewer').append(div);
		  	$('#fileModal').modal();
		}	
	</script>
	<!-- 경매 종료 타이머 디스플레이 스크립 -->
	<script type="text/javascript">
	   	function remaindTime() {
	   	    var now = new Date();
	   	    console.log(now);
	   	    var nt = now.getTime();
	   	    console.log(nt);
	   	    var ot = ${openT};
	   	    console.log(ot);
	   	  	
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
	<!-- 아이디 불러오는 스크립/ 이제 필요없는듯? -->
	<script>
		var id = "${id}";
		 
		$('input[name=id]').attr('value',id);
	</script>
	<br /><br />
	<div class="div-center1" align="center">
    	<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        	<div class="panel panel-success">
            	<div class="panel-body">
                	<form id="login-form" method="post" action="waitingRoom">
                    	
                    	<div>
                        	<button type="submit" class="form-control btn btn-primary">Join Waiting Room</button>
                    	</div>
                	</form>
            	</div>
        	</div>
    	</div>
	</div>
</div> <!-- 컨테이너 종료 지점 -->
</html>
