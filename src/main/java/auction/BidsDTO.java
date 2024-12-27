package auction;

public class BidsDTO {
	private String auctionB;
	private String bidder;
	private int bidprice;
	
	
	public String getAuctionB() {
		return auctionB;
	}
	public void setAuctionB(String auctionB) {
		this.auctionB = auctionB;
	}
	public String getBidder() {
		return bidder;
	}
	public void setBidder(String bidder) {
		this.bidder = bidder;
	}
	public int getBidprice() {
		return bidprice;
	}
	public void setBidprice(int bidprice) {
		this.bidprice = bidprice;
	}
}
