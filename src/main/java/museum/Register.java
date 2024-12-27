package museum;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet implementation class Register
 */
@WebServlet("/register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
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
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String nicname = request.getParameter("nicname");
		String pass = request.getParameter("password");
		String email = request.getParameter("email");
		String postcode = request.getParameter("postcode");
		String postadd = request.getParameter("postadd");
		String postdetail = request.getParameter("postdetail");
		String phone = request.getParameter("phone");
		String role = request.getParameter("role");
		
		String address = postcode + " " + postadd + " " + postdetail; // 공백 추가
		JDBConnect jdbc = new JDBConnect();
		 PreparedStatement psmt = null;
		try {
			
			String sql = "INSERT INTO member VALUES("
					+ " ?, ?, ?, ?, ?, ?, ?, ?)";
			psmt = jdbc.con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pass);
			psmt.setString(3, name);
			psmt.setString(4, nicname);
			psmt.setString(5, address);
			psmt.setString(6, email);
			psmt.setString(7, phone);
			psmt.setString(8, role);
			
			 int result = psmt.executeUpdate(); // executeUpdate 사용

	            if (result > 0) {
	                response.getWriter().write("회원가입 성공!");
	                response.sendRedirect("index.jsp");
	            } else {
	                response.getWriter().write("회원가입 실패.");
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