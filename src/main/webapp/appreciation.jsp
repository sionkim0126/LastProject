<%@page import="museum.ArtworkDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="jquery-3.7.1.js"></script>
 <link rel="stylesheet" href="style_app.css">
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
 <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
 <style>
    .swiper {
      width: 100%;
      height: 100%;
    }

    .swiper-slide {
      text-align: center;
      font-size: 18px;
      display: flex;
      justify-content: center;
      align-items: center;
    }
    .swiper-slide img {
      display: block;
    }
    .swiper-button-next{
    	color:  gray;
    	opacity: 0.5; /* 불투명도 50% */
    }
    .swiper-button-prev{
    	color:  gray;
    	opacity: 0.9; /* 불투명도 50% */
    }
    .swiper-pagination{
    	color: white;
    }
  </style>
</head>
<body>
  <div id="black">
  <div id="wrap">
     <div id="header">
    <div id="h1">
      <div class="logo">
      	<img src="images/LOGO.png" alt="">
      </div>
      <div class="member">
      <%
      	String loginNicname = (String) session.getAttribute("loginNicname");
      	if(loginNicname != null){
      %>
 	    <p><a><%= loginNicname %>님 반갑습니다</a></p>
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
          <li><a href="index.jsp">home</a>
            <ul class="submenu">
              <li><a href="#">서브메뉴4-1</a></li>
              <li><a href="#">서브메뉴4-2</a></li>
              <li><a href="#">서브메뉴4-3</a></li>
              <li><a href="#">서브메뉴4-4</a></li>
            </ul>
          </li>
        </ul>
      </div>
    </div>
    <div id="contents">
        <div class="appcon">
            <div class="swiper mySwiper">
    			<div class="swiper-wrapper">
      			<%
      			List<ArtworkDTO>apprList = (List<ArtworkDTO>)request.getAttribute("apprList");
                if (apprList != null && !apprList.isEmpty()) {
                    for (ArtworkDTO appr : apprList) {
      			%>
      			<div class="swiper-slide"> <img id="simg" alt="" src="<%= appr.getArtpath() %>"> </div>
      			<%
                    }
                }
      			%>
    		</div>
    		<div class="swiper-button-next"></div>
    		<div class="swiper-button-prev"></div>
    		<!-- <div class="swiper-pagination"></div> -->
  			</div>
        </div>
         <audio controls controlsList="nodownload">
          <source src="app/classic.mp3" type="audio/mp3">
        </audio>
      </div>
    <div id="footer">
      <p>kimsion@naver.com</p>
    </div>
  </div>
  </div>
 <script>
 		var swiper = new Swiper(".mySwiper", {
     	spaceBetween: 30,
     	centeredSlides: true,
     	autoplay: {
       	delay: 2500,
       	disableOnInteraction: false,
     	},
     	pagination: {
       	el: ".swiper-pagination",
       	clickable: true,
     	},
     	navigation: {
       	nextEl: ".swiper-button-next",
       	prevEl: ".swiper-button-prev",
     	},
   		}); 
 		
      $(function(){
        $(".nav > ul > li").mouseover(function(){
          $(this).find(".submenu").stop().slideDown(400);
        });
  
        $(".nav > ul > li").mouseout(function(){
          $(this).find(".submenu").stop().slideUp(1000);
        });
      });      
    </script>
</body>
</html>