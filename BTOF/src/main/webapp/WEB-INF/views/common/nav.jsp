<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <!-- 상단 네비 -->
   

    <div id="wrap">
   
       <nav class="body_inner">
          <ul class="logo">
              <li><a href="/product/sell_list" style="size:2rem">BTO_FIRE</a></li>
              <li><a href="/product/like" >♥LIKE</a></li>
          </ul>
          <ul class="nav_menu">
                <c:if test="${sessionScope.memId == null}">
                       <li><a href="/product/sell_list">MARKETPLACE</a> |</li>
                     <li><a href="/artist/artistPage">ARTIST</a> |</li>
                  
                     <li><a href="/artist/artistRanking">RANKING</a> |</li>
                     <li><a href="/board/notice">SUPPORT</a> </li>
            </c:if>        
            <c:if test="${sessionScope.memId !=null}">
                  <li><a href="/product/sell_list">MARKETPLACE</a> |</li>
                     <li><a href="/artist/artistPage">ARTIST</a> |</li>
                     <li><a href="/member/collection">My NFT</a> |</li> 
                     <li><a href="/artist/artistRanking">RANKING</a> |</li>
                     <li><a href="/board/notice">SUPPORT</a> </li>
                </c:if>
             
            
              
          </ul>
          <ul class="member">
<!-- 달라지는부분 -->
<c:if test="${sessionScope.memId != null}">
              <li><a href="/common/login">LOGIN</a> |</li>
              <li><a href="/common/signup">SIGN UP</a></li>
</c:if>

              <c:if test="${stat eq '1'}">
                 <form action="/common/logout" method="post">
                    <input type="submit" class="btn btn-light" value="로그아웃" />
                       <button onclick="window.location='/buyAuction'">경매 참여</button>
                 </form>
              </c:if>
         
          </ul>
       </nav>
    <!-- 우측 하단 버튼 -->
       <aside>
          <h3>찜한 상품</h3>
          <h3>문의</h3>
          <a href="" id="top_btn">상단으로</a>
       </aside> 
       
   </div>   
   