<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지 </title>
<!-- 네비css --><link rel="stylesheet" href="../resources/css/mypage/main.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</head>

<body>
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
      </div>
    </div>
  </header>

	<!-- contents-area -->
	<div class="admin_wrap">
		<!-- 네비영역 -->
		<div class="admin_navi_wrap">
			<ul>
				<li><a class="admin_list_01" href="/member/mypage">마이
						페이지</a></li>
				<li><a class="admin_list_02" href="/member/collection?prod_dtl_own=${nick}">마이 NFT</a>
				</li>
				<lI><a class="admin_list_03" href="/member/cashIn">계좌
						등록</a></lI>
				<lI><a class="admin_list_04" href="/member/withdrawal">회원 탈퇴</a></lI>
				<li><a class="admin_list_05" href="/member/cashIn">충전</a></li>
			</ul>
		</div>
	</div>


	<!-- 프로필 이미지-->
	<table border="0" class="tbl_model">
		<div class="container col-2">
			<div
				class="row d-flex justify-content-center align-items-center h-100 card text-center">
				<div class="card-header">아티스트</div>
				<div id="current-profile-image" class="mt-3">
					<img src="/img/aaArt1.jpg" />
					<div class="custom-file">
						<label class="custom-file-label" for="profile-image-file">프로필 변경</label>
					</div>
					<div id="new-profile-image-control" class="mt-3">
						<input type="file" class="custom-file-input"
							id="profile-image-file">
					</div>
				</div>
				<div id="new-profile-image" class="mt-3"></div>
	
			</div>
			<div>
			<c:forEach var="member" items="${member}">
				<h4>로그인정보</h4>
				</br>
				<label>이메일 아이디</label>
				<!--  <input type="text" value="${member.id}"/> -->
				</br>
				<label>passsword</label>
				<input type="text" value="${member.pw}"/><button onclick="window.location='/member/pwch'">변경</button>
				</br>
				<label>휴대전화번호</label>
				<input type="text" value="${member.tell}"/><button onclick="window.location='/member/tellch'">변경</button>
				</br>
				<label>닉네임</label>
				<input type="text" value="${member.nick}"/><button onclick="window.location='/member/nickch'">변경</button>
				</br>
				<label>정산계좌</label>
				<input type="text" value=""/><button onclick="window.location='/member/nickch'">등록</button>
				
				<br/><br/><br/>
				<div style=" text-align: center;">
					<button style=" display: inline-block;" onclick="window.location='/common/market'">
					Marketplace</button>
				</c:forEach>
				</div>
			</div>
		</div>
	</table>


</body>
</html>