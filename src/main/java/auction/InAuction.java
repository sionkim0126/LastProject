package auction;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class InAuction
 */
@WebServlet("/inauction")
public class InAuction extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public InAuction() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String art = request.getParameter("ackey");
        String auction_no = request.getParameter("auction_no");
        String hip = request.getParameter("hiprice");
        
        int hiprice = 0; // 기본값 설정
        boolean hipriceValid = true; // hiprice 유효성 플래그

        // hip 변수가 null인지 체크하고 파싱
        if (hip != null && !hip.isEmpty()) {
            try {
                hiprice = Integer.parseInt(hip);
                System.out.println(hiprice);
            } catch (NumberFormatException e) {
                hipriceValid = false; // 유효하지 않은 경우
                System.out.println("hiprice 변환 오류: " + e.getMessage());
            }
        } else {
            hipriceValid = false; // hip가 null 또는 비어 있는 경우
            System.out.println("hip는 null이거나 비어 있습니다.");
        }

        AuctionDAO dao = new AuctionDAO();

        // hiprice가 유효한 경우에만 입찰 처리
        if (hipriceValid) {
        	art =request.getParameter("art");
        	List<AuctionDTO> insertA = dao.insertList(auction_no, hiprice);
            List<AuctionDTO> insertB = dao.insertBids(auction_no, hiprice);
            List<BidsDTO> selectB = dao.selectBids(auction_no);
            request.setAttribute("selectB", selectB);
            List<AuctionDTO> auctionList = dao.selectList(art);
            request.setAttribute("auctionList", auctionList);
            
        }
        List<AuctionDTO> auctionList = dao.selectList(art);

        request.setAttribute("auctionList", auctionList);
        request.getRequestDispatcher("inauction.jsp").forward(request, response);
    }
}
