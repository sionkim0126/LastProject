package museum;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class LoginProcess
 */
@WebServlet("/loginprosecess")
public class LoginProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginProcess() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession(); //세션을 호출 또는 생성 할때 사용
		
		String userId = request.getParameter("userId");
		String userPass = request.getParameter("userPass");
		
		JDBConnect jdbc = new JDBConnect();
		 PreparedStatement psmt = null;
		try {
			String sql = "select * from member where id= ? and pass= ?";
			psmt = jdbc.con.prepareStatement(sql);
			psmt.setString(1, userId);
			psmt.setString(2, userPass);
			
			ResultSet rs = psmt.executeQuery();
			
			if (rs.next()) { // 결과가 있을 경우
				String[] key = {rs.getString("id"), rs.getString("nicname")};
				session.setAttribute("key", key);
	            System.out.println("로그인 성공!");
	            response.sendRedirect("index.jsp");
	        } else { // 결과가 없을 경우
	            session.setAttribute("loginNicname", null);
	            response.sendRedirect("loginForm.jsp");
	            System.out.println("로그인 실패!");
	        }
			
			
			
			
		} catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("SQL 오류: " + e.getMessage());
        } finally {
            // 자원 정리
            try {
                if (psmt != null) psmt.close();
                if (jdbc != null) jdbc.close(); // JDBConnect의 close 메서드 호출
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}