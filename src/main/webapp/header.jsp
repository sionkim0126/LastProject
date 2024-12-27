<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="jquery-3.7.1.js"></script>
 <link rel="stylesheet" href="style.css">
 <script>
      /*$(document).ready(function(){ })*/
      $(function(){
        $(".nav > ul > li").mouseover(function(){
          $(this).find(".submenu").stop().slideDown(400);
        });
  
        $(".nav > ul > li").mouseout(function(){
          $(this).find(".submenu").stop().slideUp(1000);
        });
      });

      $(function(){
        $("#t1").hide().fadeIn(5000);
        $("#t2").hide().fadeIn(16000);
        $("#t3").hide().fadeIn(9000); // 처음에 숨겼다가 슬라이드 다운
      });
      
      function checkLogin() {
          <% String[] keys1 = (String[]) session.getAttribute("key"); %>
          <% if (keys1 == null) { %>
              alert("로그인 후에 이용해 주세요" );
              return false; // 로그인하지 않은 경우 false 반환
          <% } else { %>
          		alert(<%= keys1[0] %>)
              return true; // 로그인한 경우 true 반환
          <% } %>
      }
      
      function index() {
          window.location.href = "index.jsp"; 
      }
  </script>
</head>
<body>
    <div id="header">
    <div id="h1">
      <div class="logo">
      	<img src="images/LOGO.png" alt="" onclick="index()" style="cursor:pointer;">
      </div>
      <div class="member">
      <%
      	String[] keys = (String[]) session.getAttribute("key");
      	if(keys != null){
      %>
 	    <p><a><%= keys[1] %>님 반갑습니다</a></p>
      	<p><a href="logout.jsp">로그아웃</a></p>
 	  <%
      	}else{
 	  %>
      	<p><a href="join.jsp">회원가입</a></p>
      	<p><a href="loginForm.jsp">로그인</a></p>
      <% 
      	}
      %>		
      </div>
    </div>
      <div class="nav">
        <ul>
          <li><a href="shop.jsp">Museum shop</a>
            <ul class="submenu">
              <li><a href="shop.jsp?searchField=category&searchWord=현대화">현대화</a></li>
              <li><a href="shop.jsp?searchField=category&searchWord=서양화">서양화</a></li>
              <li><a href="shop.jsp?searchField=category&searchWord=아트">아트</a></li>
            </ul>
          </li>
          <li><a href="auctionList">Art Auction</a>
            <ul class="submenu">
              <li><a href="auctionList">온라인 경매</a></li>
            </ul>
          </li>
          <li><a href="apprservlet">Appreciation</a>
          </li>
          <li ><a href="Mypage"  onclick="return checkLogin()">Mypage</a>
            <ul class="submenu">
              <li><a href="#"  onclick="return checkLogin()">정보 수정</a></li>
              <li><a href="#">서브메뉴4-2</a></li>
              <li><a href="#">서브메뉴4-3</a></li>
              <li><a href="#">서브메뉴4-4</a></li>
            </ul>
          </li>
        </ul>
      </div>
    </div>
</body>
</html>