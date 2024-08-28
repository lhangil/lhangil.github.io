package VO;

import java.sql.Timestamp;

public class ReviewVO {
    private int no;
	private String id;
    private String reservationId;
    private int rating;
    private String content;
    private String review_date;

    // 생성자, getter, setter
    public ReviewVO(int no, String id, String reservationId, int rating, String content, String review_date) {
        this.no = no;
        this.id = id;
        this.reservationId = reservationId;
        this.rating = rating;
        this.content = content;
        this.review_date = review_date;
    }
    public ReviewVO(String id, String content, int rating, String review_date) {
    	this.id = id;
    	this.content = content;
    	this.rating = rating;
    	this.review_date = review_date;
    }
    public ReviewVO(String id, String content, int rating) {
    	this.id = id;
    	this.content = content;
    	this.rating = rating; }
    	
    
    public ReviewVO() {
		super();
	}


	public ReviewVO(String id, String content) {
    	this.id = id;
    	this.content = content;
    }

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getReservationId() {
		return reservationId;
	}

	public void setReservationId(String reservationId) {
		this.reservationId = reservationId;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReview_date() {
		return review_date;
	}

	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}

	@Override
	public String toString() {
		return "ReviewVO [no=" + no + ", id=" + id + ", reservationId=" + reservationId + ", rating=" + rating
				+ ", content=" + content + ", review_date=" + review_date + "]";
	}

	
    
}

