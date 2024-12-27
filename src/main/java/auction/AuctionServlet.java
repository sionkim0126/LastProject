package auction;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import museum.ArtworkDAO;
import museum.ArtworkDTO;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/auctionList")
public class AuctionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AuctionServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String searchField = request.getParameter("searchField");
        String searchWord = request.getParameter("searchWord");
        ArtworkDAO dao = new ArtworkDAO();

        Map<String, Object> param = new HashMap<>();
        if (searchWord != null && !searchWord.trim().isEmpty() &&
            ("category".equals(searchField) || "artist".equals(searchField))) {
            param.put("searchField", searchField);
            param.put("searchWord", searchWord);
        }

        int totalCount = dao.selectCount(param);
        int pageSize = 3;
        int pageNum = 1;
        String pageTemp = request.getParameter("pageNum");
        
        if (pageTemp != null && !pageTemp.isEmpty()) {
            try {
                pageNum = Integer.parseInt(pageTemp);
            } catch (NumberFormatException e) {
                pageNum = 1;
            }
        }

        int start = (pageNum - 1) * pageSize + 1;
        int end = pageNum * pageSize;
        param.put("start", start);
        param.put("end", end);

        // 경매 작품 리스트 조회
        List<ArtworkDTO> artList = dao.selectList(param);

        // 결과를 request에 저장
        request.setAttribute("artList", artList);
        request.setAttribute("totalCount", totalCount);
        request.setAttribute("pageNum", pageNum);
        request.setAttribute("pageSize", pageSize);
        
        // JSP로 포워딩
        request.getRequestDispatcher("auction.jsp").forward(request, response);
    }
}
