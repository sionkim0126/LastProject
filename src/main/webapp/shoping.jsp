<%@page import="museum.ArtworkDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div id="wrap">
    <jsp:include page="header.jsp"></jsp:include>
    <div id="contents">
		<div class="shopcon">
		<h2>구매하기</h2>
		<%
            // 서블릿에서 전달된 auctionList 가져오기
            List<ArtworkDTO>shop = (List<ArtworkDTO>)request.getAttribute("shop");
            if (shop != null && !shop.isEmpty()) {
                for (ArtworkDTO sh  : shop) { 
        %>
        	<div class="sh_img">
			<img alt="상품" src="<%=sh.getArtpath()%>">
			</div>
			<div class="shP">
				<p>제목 : <%=sh.getTitle() %> </p>
        		<p>작가 : <%=sh.getArtist() %></p>
        		<p>카테고리 : <%=sh.getCategory() %></p>
        		<p>info : <%= sh.getInfo() %></p>
        		<p>가격 : <%= sh.getPrice() %></p>
        		<p>작품설명 : <%= sh.getSubdescription() %></p>
		<%
               }
            } 
		%>
			</div>
        <button type="submit" name="" id="shopbtn">BUY</button>
        <a href="shop.jsp">돌아가기</a>
        </div>
      </div>
    <jsp:include page="footer.jsp"></jsp:include>
  </div>
</body>
</html>