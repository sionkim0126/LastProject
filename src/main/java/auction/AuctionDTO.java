package auction;

public class AuctionDTO {
	private String auction_no;
	private int art;
	private String start_date;
	private String end_date;
	private int hi_price;
	private String id;
	private String w_artpath;
	private String w_subdescription;
	private String w_title;
	
	
	public String getAuction_no() {
		return auction_no;
	}
	public void setAuction_no(String auction_no) {
		this.auction_no = auction_no;
	}
	public int getArt() {
		return art;
	}
	public void setArt(int art) {
		this.art = art;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public int getHi_price() {
		return hi_price;
	}
	public void setHi_price(int hi_price) {
		this.hi_price = hi_price;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getW_artpath() {
		return w_artpath;
	}
	public void setW_artpath(String w_artpath) {
		this.w_artpath = w_artpath;
	}
	public String getW_subdescription() {
		return w_subdescription;
	}
	public void setW_subdescription(String w_subdescription) {
		this.w_subdescription = w_subdescription;
	}
	public String getW_title() {
		return w_title;
	}
	public void setW_title(String w_title) {
		this.w_title = w_title;
	}

}
