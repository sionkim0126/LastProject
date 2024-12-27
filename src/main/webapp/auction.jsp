<%@page import="museum.Page"%>
<%@page import="museum.ArtworkDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="museum.ArtworkDTO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>AUCTION</title>
</head>
<body>
  <div id="wrap">
    <jsp:include page="header.jsp"></jsp:include>
    <div id="contents">
      <div class="auctionList">
      <div class="search">
                    <form action="auctionList" method="get">
                        <select name="searchField">
                            <option value="category">카테고리</option>
                            <option value="artist">작 가</option>
                        </select>
                        <input type="text" name="searchWord" />
                        <input type="submit" value="검색하기" />
                    </form>
                </div>
        <%

        
          List<ArtworkDTO> artList = (List<ArtworkDTO>) request.getAttribute("artList");
          if (artList != null && !artList.isEmpty()) {
            for (ArtworkDTO art : artList) {
        %>
          <div class="A-arts">
            <img id="A-lists" src="<%= art.getArtpath() %>" alt="경매품">
            <div class="artsP">
              <form action="inauction" method="post">
                <p>작품명  : <%= art.getTitle() %></p>
                <p>작  가  : <%= art.getArtist() %></p>
                <p>카테고리: <%= art.getCategory() %></p>
                <p>정 보 : <%= art.getInfo() %></p>
                <p>시작가 : <%= art.getPrice() %></p>
                <p>경매시작 : 2024/09/24 00:00</p>
            <p>경매종료 : 2024/09/25 00:00</p>
                <button class="button" type="submit" name="ackey" value=<%= art.getArt() %>>경매참여하기</button>
              </form>
            </div>
            <div class="tistP">
            <p>작가의 대표작</p>
            <img id="rpsw" src="arts/100003.jpg" alt="대표작">
            <img id="rpsw" src="arts/100012.jpg" alt="대표작">
            <img id="rpsw" src="arts/100024.jpg" alt="대표작">
          </div>
          </div>
        <%
            }
          } else {
        %>
            <p>경매 작품이 없습니다.</p>
        <%
          }
        %>
      
      <% int totalPages = (int) Math.ceil((double) ((Integer) request.getAttribute("totalCount")).intValue() / (int) request.getAttribute("pageSize")); %>
      <div class="pagination">
        <%
          for (int i = 1; i <= totalPages; i++) {
        %>
          <a href="auctionList?pageNum=<%= i %>&searchField=<%= request.getParameter("searchField") %>&searchWord=<%= request.getParameter("searchWord") %>">
            <%= i %>
          </a>
        <%
          }
        %>
      </div>
      </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
  </div>
</body>
</html>