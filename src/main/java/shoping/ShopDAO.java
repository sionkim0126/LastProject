package shoping;

import java.util.List;
import java.util.Vector;

import museum.ArtworkDTO;
import museum.JDBConnect;

public class ShopDAO extends JDBConnect {
	public ShopDAO() {
		super();
	}
	
	public List<ArtworkDTO>shopList(String art){
		List<ArtworkDTO>shop = new Vector<>();
		
		String sql ="select * from artwork where art= ?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, art);
			
			rs = psmt.executeQuery();
			while(rs.next()) {
				ArtworkDTO dto = new ArtworkDTO();
				dto.setArt(rs.getInt(1));
				dto.setTitle(rs.getString(2));
				dto.setArtist(rs.getString(3));
				dto.setCategory(rs.getString(4));
				dto.setInfo(rs.getString(5));
				dto.setPrice(rs.getInt(6)+300000);
				dto.setArtpath(rs.getString(7));
				dto.setSubdescription(rs.getString(8));
				
				shop.add(dto);
			}
			
			
		}catch (Exception e) {
            System.out.println("shopList 조회 중 오류: " + e.getMessage());
        }
		
		return shop;
	}
}
