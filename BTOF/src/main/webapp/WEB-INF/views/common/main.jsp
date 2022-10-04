<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
   <style>
      @media screen and (max-width: 765px) and (min-width: 300px){

.table-container{
	 width:100%;	
	 overflow-x:auto;
     white-space: nowrap;
	}
   
 table{
    width:auto;
 } 
 
 }
    </style>



</style>
</head>
<body>	
	
		
	<c:if test="${login_res==0}">
		<script type="text/javascript">
			alert("아이디 혹은 비밀번호가 틀리셨습니다. 다시 로그인 해주세요");
			history.go(-1);
		</script>
	</c:if>
		<c:if test="${login_res != 0}">
<header class="p-3 mb-3 border-bottom">
    <div class="container">
      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
        <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
          <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"/></svg>
        </a>

        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
          
          <li><a href="/common/main" class="nav-link px-2 text-secondary">BTO_FIRE!!</a></li>
          <li><a href="/product/sell_list" class="nav-link px-2 text-black">MARKETPLACE</a></li>
          <li><a href="/artist/artistPage" class="nav-link px-2 text-black">ARTIST</a></li>
          <li><a href="/member/collection?prod_dtl_own=${nick}" class="nav-link px-2 text-black">MYNFT</a></li>
          <li><a href="/artist/artistRanking" class="nav-link px-2 text-black">RANKING</a></li>
          <li><a href="/board/notice" class="nav-link px-2 text-black">SUPPORT</a></li>
        </ul>

        

        <div class="text-end">
        	<c:if test="${stat eq '1'}">
        		<form action="/common/logout" method="post">
        			<input type="submit" class="btn btn-light" value="로그아웃" />
        		</form>
        	<div align="right" display="inline">
       			<button onclick="window.location='/buyAuction'">경매 참여</button>
       			<button onclick="window.location='/member/mypage'">mypage</button>
       			<button onclick="window.location='/member/cashIn'">balance</button>
        	</div>
        	</c:if>
        	<c:if test="${stat eq '0'}">
        		<button type="button" class="btn btn-light" onclick="window.location='/common/login'">로그인</button>
            <button type="button" class="btn btn-light" onclick="window.location='/common/signup'">회원가입</button>
        	</c:if>
        	
            
        </div>
      </div>
    </div>
  </header>


<%-- board : BoardVO 객체 담기는 변수 
			 items : 컨트롤러로부터 전달받은 List<BoardVO> 리스트 
					리스트의 요소 개수만큼 자동으로 반복하며, 하나씩 꺼내서 board변수에 체워줌 
		<c:forEach var="board" items="${list}"> --%>
<table>




<div class="table-container">
<table>
<h2>HOT ARITIST</h2>
<div class="row">
	<c:forEach var="main" items="${list}">
		<div class="col-md-2">
			<div class="card" style="width: 18rem;">
				<img class="card-img-top" src="<spring:url value='${main.PROD_FILE}'/>" width="300" heigh="150" />
				<div class="card-body">
					<h5 class="card-title">${main.PROD_NAME }</h5>
					<p class="card-text">${main.PROD_DESCR}</p>
					
					<a href="../product/sell?prod_no=${main.prod_no}" class="btn btn-primary">Go somewhere</a>
				</div>
			</div>
		</div>
		</c:forEach>
</div>
</table>
</div>


<HR/>

<h2>MD PICK</h2>
<div class="row">
	<c:forEach var="main" items="${list}">
		<div class="col-md-2">
			<div class="card" style="width: 18rem;">
				<img class="card-img-top" src="<spring:url value='${main.PROD_FILE}'/>" width="300" heigh="150" />
				<div class="card-body">
					<h5 class="card-title">${main.PROD_NAME }</h5>
					<p class="card-text">${main.PROD_DESCR}</p>
					<a href="#" class="btn btn-primary">Go somewhere</a>
				</div>
			</div>
		</div>
		</c:forEach>
</div>


<!-- Footer 영역 -->

		
		<div class="footer">
			<div class="footer_container">
				
				<div class="footer_left">
					<img src="../resources/img/LOGO.PNG" width="100" height="100">
				</div>
				<div class="footer_right">
					(주) BIOFIRE    대표이사 : 박광범
					<br>
					사업자등록번호 : ooo-oo-ooooo
					<br>
					대표전화 : oooo-oooo(발신자 부담전화)
					<br>
					<br>
					COPYRIGHT(C) <strong>http://www.tjoeun.co.kr/</strong>	ALL RIGHTS RESERVED.
				</div>
				<div class="clearfix"></div>
			</div>
		</div> <!-- class="footer" -->	









		</c:if>
<script type= "text/javascript">

</script>


</body>
</html>