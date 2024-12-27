<%@page import="auction.BidsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="auction.AuctionDTO" %>
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
		<div class="inauctions">
		<%
            // 서블릿에서 전달된 auctionList 가져오기
            List<AuctionDTO> auctionList = (List<AuctionDTO>) request.getAttribute("auctionList");
            if (auctionList != null && !auctionList.isEmpty()) {
                for (AuctionDTO auction : auctionList) {
                int price = auction.getHi_price();
        %>
        	<div class="aucP1">
        	<div class="auc_img"><img id="auc_img" src="<%= auction.getW_artpath() %>" alt="입찰대상"></div>
				<p>작품 설명 : <%=auction.getW_subdescription() %></p>
        	</div>
			<div class="aucP2">
				<p> 작품명 : <%=auction.getW_title() %>
				<p>경매 시작일 : <%=auction.getStart_date() %></p>
				<p>경매 종료일 : <%= auction.getEnd_date() %></p>
				<p>현 최고 입찰가 : <%= auction.getHi_price() %> </p>
				<form action="inauction" method="post">
				<input type="hidden" name="auction_no" value="<%= auction.getAuction_no() %>">
				<input type="hidden" name="art" value="<%= auction.getArt() %>">
				<input type="number" name="hiprice" style="height: 25px;">
				<input type="submit" class="button" value="입찰">			
				</form>
			 <h3>입찰 목록</h3>
			</div>
		<%
                }
            }
            List<BidsDTO> bidsList = (List<BidsDTO>) request.getAttribute("selectB");
            if(bidsList != null && !bidsList.isEmpty()){
            	for(BidsDTO bids : bidsList){
		%>
			<div class="priceP">
				 <table>
              <tr>
                <th>닉네임 : </th>
                <th><%= bids.getBidder() %></th>
                <th>입찰가 : </th>
                <th><%= bids.getBidprice() %></th>
              </tr>
            </table>
			</div>		
		<%
            		
            	}
            }
		%>
			
		</div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
  </div>
</body>
</html>