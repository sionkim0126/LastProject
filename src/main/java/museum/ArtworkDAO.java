package museum;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Vector;
import java.sql.SQLException;

public class ArtworkDAO extends JDBConnect {

    public ArtworkDAO() {
        super();
    }

    public int selectCount(Map<String, Object> map) {
        int totalCount = 0;
        String sql = "SELECT COUNT(*) FROM artwork";
        if(map.get("searchWord") != null) {
            sql += " WHERE " + map.get("searchField") + " LIKE ?";
        }

        try {
            psmt = con.prepareStatement(sql);
            if(map.get("searchWord") != null) {
                psmt.setString(1, "%" + map.get("searchWord") + "%");
            }
            rs = psmt.executeQuery();
            if (rs.next()) {
                totalCount = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("게시물 수를 구하는 중 예외 발생");
            e.printStackTrace();
        }

        return totalCount;
    }

    public List<ArtworkDTO> selectList(Map<String, Object> map) {
        List<ArtworkDTO> artList = new Vector<>();
        String sql = "SELECT * FROM ( "
                + " SELECT Tb.*, ROWNUM rNum FROM ( "
                + " SELECT * FROM artwork ";
        if(map.get("searchWord") != null) {
            sql += " WHERE " + map.get("searchField") + " LIKE ?";
        }
        sql += " ORDER BY ART DESC "
                + " ) Tb "
                + " ) "
                + " WHERE rNum BETWEEN ? AND ?";

        try {
            psmt = con.prepareStatement(sql);
            int paramIndex = 1; // 매개변수 인덱스 초기화
            if(map.get("searchWord") != null) {
                psmt.setString(paramIndex++, "%" + map.get("searchWord") + "%");
            }
            psmt.setInt(paramIndex++, (int) map.get("start"));
            psmt.setInt(paramIndex++, (int) map.get("end"));
            
            rs = psmt.executeQuery();
            
            while (rs.next()) {
                ArtworkDTO dto = new ArtworkDTO();
                dto.setArt(rs.getInt("art"));
                dto.setTitle(rs.getString("title"));
                dto.setArtist(rs.getString("artist"));
                dto.setCategory(rs.getString("category"));
                dto.setPrice(rs.getInt("price"));
                dto.setArtpath(rs.getString("artpath"));
                dto.setSubdescription(rs.getString("subdescription"));
                dto.setInfo(rs.getString("info"));
                artList.add(dto);
            }
        } catch (SQLException e) {
            System.out.println("게시물 조회 중 예외 발생");
            e.printStackTrace();
        } 
        return artList;
    }
    
    public List<ArtworkDTO> auctionList(String searchField, String searchWord, int start, int end) {
        List<ArtworkDTO> artList = new Vector<>();
        String sql = "SELECT * FROM ( "
                + " SELECT Tb.*, ROWNUM rNum FROM ( "
                + " SELECT * FROM artwork ";
        if (searchWord != null && !searchWord.isEmpty()) {
            sql += " WHERE " + searchField + " LIKE ?";
        }
        sql += " ORDER BY ART DESC "
                + " ) Tb "
                + " ) "
                + " WHERE rNum BETWEEN ? AND ?";

        try {
            psmt = con.prepareStatement(sql);
            if (searchWord != null && !searchWord.isEmpty()) {
                psmt.setString(1, "%" + searchWord + "%");
            }
            psmt.setInt(2, start);
            psmt.setInt(3, end);
            
            rs = psmt.executeQuery();

            while (rs.next()) {
                ArtworkDTO dto = new ArtworkDTO();
                dto.setArt(rs.getInt("art"));
                dto.setTitle(rs.getString("title"));
                dto.setArtist(rs.getString("artist"));
                dto.setCategory(rs.getString("category"));
                dto.setInfo(rs.getString("info"));
                dto.setPrice(rs.getInt("price"));
                dto.setArtpath(rs.getString("artpath"));
                artList.add(dto);
            }
        } catch (SQLException e) {
            System.out.println("경매 리스트 조회 중 예외 발생");
            e.printStackTrace();
        }

        return artList;
    }
    
    public List<ArtworkDTO> apprselectList() {
    	List<ArtworkDTO> apprList = new ArrayList<>();
        // 데이터베이스에서 ArtworkDTO를 조회하여 apprList에 추가하는 로직
        String sql = "select * from artwork";
        try {
        	psmt = con.prepareStatement(sql);
        	rs = psmt.executeQuery();
        	
        	while(rs.next()) {
        		ArtworkDTO dto = new ArtworkDTO();
        		dto.setArtpath(rs.getString("artpath"));
        		apprList.add(dto);
        	}
        	
        }catch (SQLException e) {
            System.out.println("전시물 조회 중 예외 발생");
            e.printStackTrace();
		}
        return apprList;
    }
}
