<%@page import="museum.Page"%>
<%@page import="museum.ArtworkDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="museum.ArtworkDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    // ArtworkDAO의 기본 생성자를 호출하여 DB 연결
    ArtworkDAO dao = new ArtworkDAO();

    Map<String, Object> param = new HashMap<String, Object>();

    String searchField = request.getParameter("searchField");
    String searchWord = request.getParameter("searchWord");

    if (searchWord != null && !searchWord.trim().isEmpty()) {
        if ("category".equals(searchField) || "artist".equals(searchField)) {
            param.put("searchField", searchField);
            param.put("searchWord", searchWord);
        }
    }

    int totalCount = dao.selectCount(param);
    int pageSize = 15; // 기본값 또는 안전하게 init 파라미터에서 가져오기
    int blockPage = 3;  // 기본값 또는 안전하게 init 파라미터에서 가져오기

    int pageNum = 1;
    String pageTemp = request.getParameter("pageNum");
    if (pageTemp != null && !pageTemp.isEmpty()) {
        try {
            pageNum = Integer.parseInt(pageTemp);
        } catch (NumberFormatException e) {
            pageNum = 1; // 파싱 실패 시 1로 리셋
        }
    }

    int start = (pageNum - 1) * pageSize + 1;
    int end = pageNum * pageSize;
    param.put("start", start);
    param.put("end", end);

    List<ArtworkDTO> artLists = dao.selectList(param);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>museum shop</title>
</head>
<body>
    <div id="wrap">
        <jsp:include page="header.jsp"></jsp:include>
        <div id="contents">
            <div class="artlist">
                <div class="search">
                    <form action="shop.jsp" method="get">
                        <select name="searchField">
                            <option value="artist">작 가</option>
                            <option value="category">카테고리</option>
                        </select>
                        <input type="text" name="searchWord" />
                        <input type="submit" value="검색하기" />
                    </form>
                </div>
<%
                if (artLists.isEmpty()) {
                    out.println("<p>작품이 없습니다.</p>");
                } else {
                	int countNum = 0;
                    for (ArtworkDTO dto : artLists) {
                    	int art = dto.getArt();
                    	request.setAttribute("art", art);
%>
                        <div class="arts" >
                            <div class="arts-h">
                                <img id="lists" src="<%=dto.getArtpath()%>" alt="작품사진">
                            </div>
                            <div class="arts-b">
                                <p><a href="shopservelet?art=<%= dto.getArt() %>"><%= dto.getTitle() %></a></p>
                                <p><a href="shopservelet?art=<%= dto.getArt() %>"><%= dto.getArtist() %></a></p>
                                <p><a href="shopservelet?art=<%= dto.getArt() %>"><%= dto.getInfo() %></a></p>
                                <p><a href="shopservelet?art=<%= dto.getArt() %>"><%= dto.getPrice() + 300000 %>\</a></p>
                            </div>
                        </div>
<%
                    }
                }
%>	
			<div>
			 <%= Page.pagingStr(totalCount, pageSize, blockPage, pageNum, request.getRequestURI()) %>
			
			</div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </div>  
</body>
</html>
