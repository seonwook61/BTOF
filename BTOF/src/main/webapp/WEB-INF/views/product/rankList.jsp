<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>rank_list</title>
	<link href="/resources/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<br />
	<h1 align="center"> Ranking </h1>
	<table>
	
		<h2>일반 메인페이지</h2>
		<tr>
			<td colspan="6" align="left">
				<!-- <button onclick="/board/content?artist_name=${prod_artist}">작가페이지로이동</button>  -->
			</td>
		</tr>
		<tr>
			<td>작가명</td>
			<td>작가이미지</td>
			<td>작품명</td>
			<td>대표작</td>
			<td>작품소개</td>
		</tr>


		<c:forEach var="rankList" items="${rankList}">
			<tr>
				<td>${rankList.prod_artist}</td>
				<td align="left"><a href="/board/content?prod_num=${rankList.prod_no}">${rankList.prod_name}</a></td>
				<td>${rankList.prod_file}</td> <%-- 업로드 파일불러오는거 추가해야함! --%>
				<td>${rankList.prod_descr}</td>
			</tr>	
		</c:forEach>
		
		

		
	</table>
	<table>
			<h2>최신 리스트</h2>
		
		<tr>
			<td>작가명</td>
			<td>작가이미지</td>
			<td>작품명</td>
			<td>대표작</td>
			<td>작품소개</td>
		</tr>
		
		
		<!-- 시작 시간 순서대로 랭킹리스트 -->
		<c:forEach var="listByStartDay" items="${listByStartDay}">
			<tr>
				<td>${listByStartDay.prod_artist}</td>
				<td align="left"><a href="/board/content?prod_num=${listByStartDay.prod_no}">${listByStartDay.prod_name}</a></td>
				<td>${listByStartDay.prod_file}</td> <%-- 업로드 파일불러오는거 추가해야함! --%>
				<td>${listByStartDay.prod_descr}</td>
			</tr>	
		</c:forEach>
		
		
		
		
	
	</table>
	<!-- 작품별 아티스트, 좋아요 가져오기 -->
	<table>
	<h2>원하는 작가와 좋아요 불러오기</h2>
	<td>원하는 작품 번호 입력<input type=number name=prod_no /></td>
	<td><input type=submit name="작품검색" /></td>
	<tr>
		<td>작품 이름과 좋아요 수</td>
		<td>좋아요 수</td>
	</tr>
	<tr>
		<td>${prod_name}</td>
		<td>${likesPerProduct}</td>
	</tr>
	</table>
	
	
	
	<!-- 전체 아티스트, 좋아요 가져오기 -->
	<table>
	<h2>전체 작품 검색</h2>
	<tr>
		<td>작품 이름과 좋아요 수</td>
	</tr>
	<tr>
		<td>${likeList}</td>
	</tr>
	</table>

	<script>
	$(document).ready(function(){
		
		let bnoVal = '<c:out value="${board.bno}" />';
		let list_container = $(".reply_list_container");
		showList(1);
		
		//전체 댓글 목록 가져와 뿌리기(댓글 페이지번호 주면서) 
		function showList(page){
			console.log("page : " + page); 
			// 전체 댓글 가져오는 js 함수 호출 
			//replyService.getList({bno:bnoVal, page:page||1}, function(data){ // data = 서버에서 전달해준 댓글 리스트 
			// #6. callback 함수 매개변수 수정, 안쪽 코드 수정/추가 
			replyService.getList({bno:bnoVal, page:page||1}, function(replyCount, data){ // replyCount, data 매개변수 2개로 수정  
				// #6. 추가 
				console.log("replyCount : " + replyCount);
				console.log("data : " + data);
			
			
				// 서버에서 댓글을 보내줬는지 확인 (댓글이 없는 본문은 안가져옴)
				if(data == null || data.length == 0){
					list_container.html("<div class='reply_li'>댓글이 없습니다</div>");
					return; // 아래는 실행할 필요없으니 강제 종료 
				}
				console.log(data);
				let str = ""; // 화면에 띄울 댓글 tr묶음 html을 만들어서 저장해놓을 변수 
				let len = data.length || 0; 

				// 댓글 목록 받아온 것 화면 띄우기위해 html 형태의 문자열로 구성 
				for(let i = 0; i < len; i++){
					let wid = data[i].lev * 2; 
					console.log("wid : " + wid);
					str += "<div class='reply_li' data-rno='"+data[i].rno+"' data-grp='"+data[i].grp+"' data-step='"+data[i].step+"' data-lev='"+data[i].lev+"' >";
					str += "<div class='reply_level' style='width:"+wid+"rem'></div>";
					str += "<div class='reply_content'>";
					// 리스트 분석용 데이터 출력 (나중에 지우기)
					str += "<div> rno: "+data[i].rno+", grp: "+data[i].grp+", step: "+data[i].step+", lev: "+data[i].lev+" </div>";
					
					str += "<div class='replyer'>"+data[i].replyer+"</div>";
					str += "<div class='reply'>"+data[i].reply+"</div>";
					str += "<div class='replyDate'>"+replyService.displayTimeFormat(data[i].replyDate)+"</div>";
					str += "<div class='reply_btns'><button class='addRepBtn'>답글</button>";
					str += "<button class='modifRepBtn'>수정</button></div></div></div>";
				}
				
				list_container.html(str); // list_container div 태그 안을 댓글목록만들어놓은 str로 변경 
				// #9. 댓글 페이징번호 띄우기 함수 호출 
				showReplyPaging(replyCount);
				
			});// replyService.getList
	</script>


	



	<table>
		<!-- 
	<h2>좋아요 순서대로 리스트</h2>
	
	<table>
	
		<tr>
			<td>작가명</td>
			<td>작가이미지</td>
			<td>작품명</td>
			<td>대표작</td>
			<td>작품소개</td>
		</tr>
	
			<!-- 좋아요 순서대로 랭킹리스트 -->
	<!-- 
		<c:forEach var="listByLikes" items="${listByLikes}">
			<tr>
				<td>${listByLikes.prod_artist}</td>
				<td>${listByLikes.prod_artist}</td>
				<td align="left"><a href="/board/content?prod_num=${listByLikes.prod_no}">${listByLikes.prod_name}</a></td>
				<td>${listByLikes.prod_file}</td> <%-- 업로드 파일불러오는거 추가해야함! --%>
				<td>${listByLikes.prod_descr}</td>
			</tr>	
		</c:forEach>
	-->
	</table>


</body>
</html>