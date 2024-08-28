package VO;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class ReservationVO {
    private int reservation_id;
    private String id;
    private String reservation_date;
    private int numGuests;
    private String status;
    private int deposit;
    private int totalReservations;
    private String menu_id;

    
    
    public ReservationVO() {
	}
	// 생성자, getter, setter
    public ReservationVO(int reservation_id, String id, String reservation_date, int numGuests,
                         String status, int deposit, int totalReservations) {
        this.reservation_id = reservation_id;
        this.id = id;
        this.reservation_date = reservation_date;
        this.numGuests = numGuests;
        this.status = status;
        this.deposit = deposit;
        this.totalReservations = totalReservations;
        this.menu_id = menu_id;
    }
    public ReservationVO(String id, int numGuests, String reservation_date ) {
    	 this.id = id;
    	 this.numGuests = numGuests;
    	 this.reservation_date = reservation_date;
    	
    	 
    	
    }

	public int getReservation_id() {
		return reservation_id;
	}

	public void setReservation_id(int reservation_id) {
		this.reservation_id = reservation_id;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getReservation_date() {
		return reservation_date;
	}

	public void setReservation_date(String reservation_date) {
		this.reservation_date = reservation_date;
	}

	public int getNumGuests() {
		return numGuests;
	}

	public void setNumGuests(int numGuests) {
		this.numGuests = numGuests;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getDeposit() {
		return deposit;
	}

	public void setDeposit(int deposit) {
		this.deposit = deposit;
	}

	public int getTotalReservations() {
		return totalReservations;
	}

	public void setTotalReservations(int totalReservations) {
		this.totalReservations = totalReservations;
	}

	public String getMenu_id() {
		return menu_id;
	}

	public void setMenu_id(String menu_id) {
		this.menu_id = menu_id;
	}

	@Override
	public String toString() {
		return "ReservationVO [reservation_id=" + reservation_id + ", id=" + id + ", reservation_date="
				+ reservation_date + ", numGuests=" + numGuests + ", status=" + status + ", deposit=" + deposit
				+ ", totalReservations=" + totalReservations + ", menu_id=" + menu_id + "]";
	}

	
}
