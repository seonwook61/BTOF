<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<style>
	.row{
		display:flex;
	}
	.col-md-2{
		margin:auto;
		position: absolute;
  		top: 40%;
  		left: 20%;
	}

	.btn{
		text-decoration: none;
		font-size:2rem;
		color:white;
		padding:10px 20px 10px 20px;
		margin:20px;
		display:inline-block;
		border-radius: 10px;
		transition: all 0.1s;
		text-shadow: 0px -2px rgba(0, 0, 0, 0.621);
	}
	.btn:active{
		transform: translateY(3px);
	}
	
	.btn.blue{
    
		background-color:rgba(0, 89, 255, 0.867);
		border-bottom:5px solid rgba(0, 89, 255, 0.738);
	}
    .btn.green{
    	
		background-color:green;
		border-bottom:5px solid rgb(6, 151, 6);
	}
    .btn.lightgreen{
    	
		background-color:lightgreen;
		border-bottom:5px solid rgb(154, 230, 154);
	}
    .btn.red{
    	
		background-color: rgb(255, 51, 24);
		border-bottom:5px solid rgb(245, 67, 44);
	}
	.btn.exit{
    	
		background-color: rgb(255, 51, 24);
		border-bottom:5px solid rgb(245, 67, 44);
	}
	.btn.blue:active{
		border-bottom:2px solid rgb(14, 14, 68);
	}

</style>
</head>
<body>


	<h2>고객 센터</h2>
	
	<br/><br/><br/><br/><br/>
	<div class="row" text-align="center">
	<div class="col-md-2">
		<table>
			<tr>
				<td>
    <a class="btn blue" href="/board/notice">공지사항</a>
				</td>
				<td>				
    <a class="btn green" href="/board/inquiry">1대1 문의하기</a>
				</td>
			</tr>
			<tr>
				<td>
				    <a class="btn lightgreen" href="/member/enrollArtist">작가 등록 신청</a>
				    </td>
					    <td><a class="btn red" href="/member/exit">회원탈퇴</a></td>
					</tr>
			
		</table>
	</div>
</div>  
	<!--  
	<h1 align="center"> 게시판 </h1>
	<table>
		<tr>
			<td colspan="5" align="left">
				<button onclick="window.location='/board/write'">글작성</button>
			</td>
		</tr>
		<tr>
			<td>No.</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>수정일</td>
		</tr>
		<%-- board : BoardVO 객체 담기는 변수 
			 items : 컨트롤러로부터 전달받은 List<BoardVO> 리스트 
					리스트의 요소 개수만큼 자동으로 반복하며, 하나씩 꺼내서 board변수에 체워줌 --%>
		<c:forEach var="board" items="${list}">
			<tr>
				<td>${board.bno}</td>
				<td align="left"><a class="move" href="${board.bno}">${board.title}</a></td>
				<td>${board.writer}</td>
				<td><fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd" /> </td>
				<td><fmt:formatDate value="${board.updateDate}" pattern="yyyy-MM-dd" /></td>
			</tr>	
		</c:forEach>
	</table>
	<br />
	-->
	
	
	
</body>
</html>