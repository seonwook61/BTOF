<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link type="text/css" href="/resources/css/main.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="/resources/js/main.js" defer></script>
	
</head>
<body>	
	<ul class="goMain">
	    <li><a href="/common/main" class="nav-link px-2 text-secondary">BTO_FIRE!!</a></li>
	</ul>		
	<!-- 상단 네비-->
	<%-- include file="/WEB-INF/views/common/nav.jsp" --%>
	 
	<!-- 중앙 -->
	<!-- 중앙 상단 / 좌 / 우 
	
	
	
	<div id="wrap">
	    <main class="body_inner">
	        <section id="main_top" class="main_inner"><h3>작가등록 신청 페이지</h3></section>
	        <section id="main_left" class="main_inner">
	        	<h3>Collection</h3>
	        	<h4>판매상태</h4>
	        	<input type="checkbox" name="all">전체보기<br/>
	        	<input type="checkbox" name="onsale">판매중<br/>
	        	<input type="checkbox" name="notsale">미판매
	        	
					        	
	        	
	        </section>
	        <section id="main_right" class="main_inner">
	-->        	
	        	<h4 style="display: none;"><a href="">작가등록신청폼</a></h4>
	        	<form action="/member/enrollArtistPro" method="post" enctype="multipart/form-data" name="enrollArtist" onsubmit="return check()">
	        	<!--  어드민으로 보내기  -->
				<!-- 
	        		비밀번호 확인<br/>
	        		<input type="password" name="pwCheck"> <br/>
 				-->
	        		등록할 작가명<br/>
	        		<input type="text" name="artist_name" width="250px"> 
	        		<!-- <button onclick="window/location='member/artistNCheck'">중복확인</button> -->
	        		<hr/>
	        		<div class="formInnerWrap">
						<div class="left item">
	        				본인 인증 첨부서류 
						</div>
						<div class="right item">
							<p>※ 주민등록증, 운전면허증, 여권 등 법적 효력이 있는 신분증만 유효합니다.</p>
							<input type="file" name="img" />
						</div>	        		
	        		</div>
	        		<hr/>
	        		<div class="formInnerWrap">
						<div class="left item">
	        				포트폴리오 URL 
						</div>
						<div class="right item">
							<p>※ 심사 받을 포트폴리오의 링크 추가</p>
							<input type="text" name="artist_url" /><!-- button으로 하면 form에 연결된요청으로 들어감 -->
						</div>	        		
	        		</div>
	        		<hr />
	        		자기소개 <br />
	        		<textarea rows="10" cols="45" name="artist_introd"></textarea>		
	        		
	        		<div class="right">
		        		<input type="submit" value="신청하기" />
		        		<input type="reset" value="reset" />
		        		<input type="button" value="취소" onclick="window.location='history.goback(-1)'" />
	        		</div>
	        	</form>
<!-- 
	        </section>
	    </main>
	</div> -->
	<!-- 푸터 -->
				
	<%-- include file="/WEB-INF/views/common/footer.jsp" --%>
	
	<script>
	function check(){
		let inputs = document.enrollArtist;
		//console.log(inputs);//폼태그 잘 가져왔는지 체크
		if(!inputs.artist_name.value){//값이 없으면
			alert("작가활동명을 입력하세요");
			return false;
		}
		if(!inputs.portfolio_url.value){
			alert("포트폴리오 url을 입력하세요");
			return false;
		}
		if(!inputs.content.value){
			alert("자기소개를 입력하세요");
			return false;
	}
	}

	</script>
</body>
</html>