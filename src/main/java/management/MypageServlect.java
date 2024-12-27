package management;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

/**
 * Servlet implementation class MypageServlect
 */
@WebServlet("/Mypage")
public class MypageServlect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageServlect() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		
		 HttpSession session = request.getSession();
		 
		 String[] keys = (String[])session.getAttribute("key");
		 
		 List<MemberDTO>memberList = dao.Mselect(keys[0]);
		 
		 request.setAttribute("memberList", memberList);
		
		 request.getRequestDispatcher("mypage.jsp").forward(request, response);
		
		
		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String nicname = request.getParameter("nicname");
		String pass = request.getParameter("password");
		String email = request.getParameter("email");
		String postcode = request.getParameter("postcode");
		String postadd = request.getParameter("postadd");
		String postdetail = request.getParameter("postdetail");
		String phone = request.getParameter("phone");
		
		String address = postcode + " " + postadd + " " + postdetail; // 공백 추가
		
		MemberDTO member = new MemberDTO();
	    member.setId(id);
	    member.setName(name);
	    member.setNicname(nicname);
	    member.setPass(pass);
	    member.setEmail(email);
	    member.setAddress(address); // 주소 설정
	    member.setPhone(phone);

	    // DAO 호출
	    MemberDAO dao = new MemberDAO();
	    boolean isUpdated = dao.updateMember(member); // 업데이트 메서드 호출
	    String alertmsg ="";
	    if (isUpdated) {
	        alertmsg = "수정되었습니다!";
	        response.sendRedirect("mypage.jsp?alertmsg=" + URLEncoder.encode(alertmsg, "UTF-8")); // 성공 시 리다이렉트
	    } else {
	        alertmsg = "정보수정에 실패하였습니다!";
	        response.sendRedirect("mypage.jsp?alertmsg=" + URLEncoder.encode(alertmsg, "UTF-8")); // 실패 시 리다이렉트
	    }

	}
		
	}

