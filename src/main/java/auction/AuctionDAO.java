package auction;

import java.util.List;
import java.util.Vector;

import museum.JDBConnect;

public class AuctionDAO extends JDBConnect {
	public AuctionDAO() {
		super();
	}
	
	public List<AuctionDTO> selectList(String art) { // 타입 수정
        List<AuctionDTO> auctionList = new Vector<>(); // 리스트 타입 수정
		
		String sql = "SELECT a.auction_no, a.art,a.start_date, a.end_date,a.hi_price,a.id ,w.artpath, w.subdescription, w.title"
				+ " FROM auction a"
				+ " join artwork w ON w.art = a.art"
				+ " where a.art= ? ";
		
		try {
			psmt = con.prepareStatement(sql);
			
			psmt.setString(1, art);
			
			rs = psmt.executeQuery();
			while (rs.next()) {
			    AuctionDTO dto = new AuctionDTO();
			    dto.setAuction_no(rs.getString(1));
			    dto.setArt(rs.getInt(2));
			    dto.setStart_date(rs.getString(3));
			    dto.setEnd_date(rs.getString(4));
			    dto.setHi_price(rs.getInt(5));
			    dto.setW_artpath(rs.getString(7));
			    dto.setW_subdescription(rs.getString(8));
			    dto.setW_title(rs.getString(9));

			    auctionList.add(dto);
			    System.out.println("1");
			}
			
		}catch (Exception e) {
            System.out.println("경매 테이블 조회 중 오류: " + e.getMessage());
        }
		
		return auctionList; // 반환값 수정
	}
	
	public List<AuctionDTO> insertList(String auction_no, int hiprice) {
		List<AuctionDTO> insertA = new Vector<>();
		
		String sql = "UPDATE auction SET HI_PRICE = ? WHERE AUCTION_NO = ?";
		try {
	        psmt = con.prepareStatement(sql);
	        psmt.setInt(1, hiprice); // HI_PRICE 값 설정
	        psmt.setString(2, auction_no); // AUCTION_NO 값 설정
	        psmt.executeUpdate(); // UPDATE 문 실행

	        System.out.println("2");
		}catch (Exception e) {
			System.out.println("경매 테이블 INSERT 중 오류: " + e.getMessage());
		}
		
		return insertA;
	}
	
	public List<AuctionDTO> insertBids(String auction_no, int hiprice){
		List<AuctionDTO> insertB = new Vector<>();
		
		String sql = "insert into bids values("
				+" ?, 'nic', ? )";
	try {
		psmt = con.prepareStatement(sql);
		psmt.setString(1, auction_no);
		psmt.setInt(2, hiprice);
		psmt.executeQuery();

		System.out.println("3");
	}catch (Exception e) {
		System.out.println("입찰 테이블 INSERT 중 오류: " + e.getMessage());
	}
		
		return insertB;
	}
	public List<BidsDTO> selectBids(String auction_no) {
	    List<BidsDTO> selectB = new Vector<>();
	    String sql = "SELECT * FROM bids WHERE auction_no = ?"; // 특정 경매 번호 조회

	    try {
	        psmt = con.prepareStatement(sql);
	        psmt.setString(1, auction_no);
	        rs = psmt.executeQuery();

	        while (rs.next()) {
	            BidsDTO dto = new BidsDTO();
	            dto.setAuctionB(rs.getString(1));
	            dto.setBidder(rs.getString(2));
	            dto.setBidprice(rs.getInt(3));
	            selectB.add(dto); // 리스트에 추가
	        }
	        System.out.println("4");
	    } catch (Exception e) {
	        System.out.println("입찰 테이블 조회 중 오류: " + e.getMessage());
	    }

	    return selectB;
	}

}
