package management;

import java.util.List;
import java.util.Vector;

import museum.JDBConnect;

public class MemberDAO extends JDBConnect {
	public MemberDAO() {
		super();
	}
	
	public List<MemberDTO>Mselect(String info){
		List<MemberDTO>memberList = new Vector<>();
		
		String sql = "select * from member where id= ?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, info);
			
			rs = psmt.executeQuery();
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));
				dto.setNicname(rs.getString("nicname"));
				dto.setAddress(rs.getString("address"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone(rs.getString("phone"));
				dto.setRole(rs.getString("role"));
				
				memberList.add(dto);
			}
			
		}catch (Exception e) {
            System.out.println("회원 정보 테이블 조회 중 오류: " + e.getMessage());
		}
		
		
		return memberList;
	}
	
	 public boolean updateMember(MemberDTO member) {
	        String sql = "UPDATE member SET name = ?, nicname = ?, pass = ?, email = ?, address = ?, phone = ? WHERE id = ?";
	        try{
	        	psmt = con.prepareStatement(sql);
	            psmt.setString(1, member.getName());
	            psmt.setString(2, member.getNicname());
	            psmt.setString(3, member.getPass());
	            psmt.setString(4, member.getEmail());
	            psmt.setString(5, member.getAddress());
	            psmt.setString(6, member.getPhone());
	            psmt.setString(7, member.getId());

	            // 쿼리 실행 및 결과 반환
	            int result = psmt.executeUpdate();
	            return result > 0; // 업데이트 성공 여부 반환
	        } catch (Exception e) {
	            System.out.println("회원 정보 테이블 조회 중 오류: " + e.getMessage());
	            return false; // 예외 발생 시 false 반환
	        }
	    }

	
}
