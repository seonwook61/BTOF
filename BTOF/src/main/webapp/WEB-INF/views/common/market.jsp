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
.content {
width: 100%;
 text-align: center;
}
#header { width: 100%; height: 52px; background: #447e65; position: relative; overflow: hidden; } 
#mask { width: 100%; height: 100%; position: fixed; top: 0; left: 0; background: #000; -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=50)"; filter: alpha(opacity=50); zoom: 1; opacity: 0.5; z-index: 9998; display: none; }

.btn_menu_open { background: none; border: 0; font-size: 15px; color: #fff; position: absolute; top: 15px; left: 15px; cursor: pointer; }
.slide_menu { width: 80%; height: 100%; max-width: 360px; background: #fff; position: fixed; top: 0; left: 0; overflow-y: scroll; z-index: 9999; display: none; }
.slide_menu .menu_close { width: 100%; height: 52px; background: #447e65; position: relative; }
.slide_menu .btn_menu_close { background: none; border: 0; font-size: 15px; color: #fff; position: absolute; top: 15px; right: 15px; cursor: pointer; }
.slide_menu .menu_list li { padding: 15px; border-bottom:1px solid #ccc; list-style: none; }
.slide_menu .menu_list li a { font-size: 15px; color: #333; }





    </style>



</style>
</head>
<body>

<header class="p-3 mb-3 border-bottom">
    <div class="container">
      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
        <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
          <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"/></svg>
        </a>

        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
          
          <li><a href="#" class="nav-link px-2 text-secondary">BTO_FIRE!!</a></li>
          <li><a href="#" class="nav-link px-2 text-black">MARKETPLACE</a></li>
          <li><a href="#" class="nav-link px-2 text-black">ARTIST</a></li>
          <li><a href="#" class="nav-link px-2 text-black">MYNFT</a></li>
          <li><a href="#" class="nav-link px-2 text-black">RANKING</a></li>
          <li><a href="#" class="nav-link px-2 text-black">SUPPORT</a></li>
        </ul>

        

        <div class="text-end">
          <button type="button" class="btn btn-light">로그인</button>
          <button type="button" class="btn btn-light">회원가입</button>
        </div>
      </div>
    </div>
  </header>
  
 
<div class="content" display:inline-block>
                		<form id="searchForm" action="/common/search" method="get">
                			<div class="search_input">
                				<select name="type">
                					<option value="N">상품명</option>
                					<option value="A">아티스트</option>
                					<option value="T">작품태그</option>
                				</select>
                				<input type="text" name="keyword">
                    			<button class='btn search_btn'>검 색</button>                				
                			</div>
                		</form>
                	</div>

	<div id="header">
		<div id="mask"></div>
		
		<button type="button" class="btn_menu_open">메뉴 열기</button>
		<div class="slide_menu">
			<div class="menu_close">
				<button type="button" class="btn_menu_close">메뉴 닫기</button>
			</div>
			<ul class="menu_list">
				<li><a href="#">메뉴 1</a></li>
				<li><a href="#">메뉴 2</a></li>
				<li><a href="#">메뉴 3</a></li>
				<li><a href="#">메뉴 4</a></li>
				<li><a href="#">메뉴 5</a></li>
			</ul>
		</div>
	</div>




	<div class="table-container">
<table>
<h2>HOT ARITIST</h2>

<div class="row">
	<c:forEach var="main" items="${list}">
		<div class="col-md-2">
			<div class="card" style="width: 18rem;">
				<img class="card-img-top" src="<spring:url value='${main.prod_file}'/>" width="300" height="150" />
				<div class="card-body">
					<h5 class="card-title">${main.prod_name }</h5>
					<p class="card-text">${main.prod_descr}</p>
					
					<a href="#" class="btn btn-primary">Go somewhere</a>
				</div>
			</div>
		</div>
		</c:forEach>
</div>
</table>
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









<script type= "text/javascript">
$(document).ready(function(){ $(".btn_menu_open").click(function(){ $("#mask").fadeIn(100); $(".slide_menu").show().animate({right: "0"}); }); $("#mask, .btn_menu_close").click(function(){ $("#mask").fadeOut(100); $(".slide_menu").hide().animate({right: "0"}); }); });



</script>


</body>
</html>