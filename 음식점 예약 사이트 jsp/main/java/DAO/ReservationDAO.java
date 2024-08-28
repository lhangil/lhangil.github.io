package DAO;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import VO.ReservationVO;
import util.ConnectionFactory;

public class ReservationDAO {

    /**
     * 예약 조회
     * @param reservationId 조회할 예약 ID
     * @return 조회된 ReservationVO, 예약이 없을 시 null 반환
     */
    public ReservationVO getReservationById(String reservationId) {
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT * ");
        sql.append("FROM reservation ");
        sql.append("WHERE reservation_id = ?");

        try (
            Connection conn = new ConnectionFactory().getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql.toString());
        ) {
            pstmt.setString(1, reservationId);

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                int reservation_id = rs.getInt("reservation_id");
                String id = rs.getString("id");
                String reservation_date = rs.getString("reservation_date");
                int numGuests = rs.getInt("num_guests");
                String status = rs.getString("status");
                int deposit = rs.getInt("deposit");
                int total_reservations = rs.getInt("total_reservations");
               

                ReservationVO reservation = new ReservationVO(reservation_id, id, reservation_date, numGuests, status, deposit, total_reservations);

                return reservation;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }
    
    
    
    // 예약 목록 전부 가져오기
    public List<ReservationVO> selectAll(){
    	List<ReservationVO> bookList = new ArrayList<>();	

    	StringBuilder sql = new StringBuilder();
    	sql.append(" select ");
    	sql.append(" id, reservation_id, num_guests, to_char(reservation_date, 'yyyy-mm-dd') reservation_date ");
    	sql.append("  from reservation ");
    	sql.append(" order by reservation_id ");
    	try(
    		Connection conn = new ConnectionFactory().getConnection();
    		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
    	) {
    		
    		ResultSet rs = pstmt.executeQuery();
    		
    		while(rs.next()) {
    			int reservation_id = rs.getInt("reservation_id");
    			String id = rs.getString("id");
    			int numGuests = rs.getInt("num_guests");
    			String reservation_date = rs.getString("reservation_date");
    			
    			ReservationVO board = new ReservationVO();
    			board.setReservation_id(reservation_id);
    			board.setId(id);
    			board.setNumGuests(numGuests);
    			board.setReservation_date(reservation_date);
    			
    			bookList.add(board);
    		}
    		// 공유영역 등록
    		
    	} catch(Exception e) {
    		e.printStackTrace();
    	}
    	
    	return bookList;
    }

    // 예약 등록
    public Boolean insertReservation(ReservationVO reservation) {
    	 StringBuilder checkSql = new StringBuilder();
         checkSql.append(" SELECT COUNT(*) AS total_reservations ");
         checkSql.append(" FROM reservation ");
         checkSql.append(" WHERE reservation_date = ? ");
    	
    	StringBuilder sql = new StringBuilder();
        sql.append(" INSERT INTO res_reservation ");
        sql.append(" (reservation_id, user_id, reservation_date, num_guests  ) ");
        sql.append(" VALUES (res_reservation_seq.nextval@HAPPY_DB, ?, TO_DATE(?,'YYYY-MM-DD'), ? ) ");

        try (
            Connection conn = new ConnectionFactory().getConnection();
            
        	PreparedStatement checkPstmt = conn.prepareStatement(checkSql.toString());	
        	PreparedStatement pstmt = conn.prepareStatement(sql.toString()); )
        {
        	
        	checkPstmt.setString(1, reservation.getReservation_date());
        	 try (ResultSet rs = checkPstmt.executeQuery()) {
        	
        	int totalReservations = 0;
        	if(rs.next()) {
        	 totalReservations = rs.getInt("total_reservations");
        	
        	}
        		if(totalReservations>=5) {
        			System.out.println("예약불가");
        			return false;
        		} else{ 
        			

        			pstmt.setString(1, reservation.getId());
        			pstmt.setString(2, reservation.getReservation_date());
        			pstmt.setInt(3, reservation.getNumGuests());
        			
        	
        		}pstmt.executeUpdate();
         }
        	} catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }
    
    
    //예약 취소
   
        
        public boolean cancelReservation(int reservation_id) {
            boolean success = false;
            System.out.println("cancelREservation.DAO 에서 호출 : "+reservation_id);
            
            String sql = "DELETE FROM reservation WHERE reservation_id = ?";
            
            try (
            	Connection conn = new ConnectionFactory().getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);
            ) {
                pstmt.setInt(1, reservation_id);
                
                int rowsAffected = pstmt.executeUpdate();
                if (rowsAffected > 0) {
                    success = true;
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            
            return success;
        }
        
        
    
/**
 * 특정 사용자 ID의 예약 목록 조회
 * @param userId 조회할 사용자 ID
 * @return 사용자 ID에 해당하는 예약 목록
 */
public List<ReservationVO> getReservationsByUserId(String userid) {
    List<ReservationVO> reservationList = new ArrayList<>();
    StringBuilder sql = new StringBuilder();
    sql.append("SELECT * FROM res_reservation WHERE user_id = ?");

    try (
        Connection conn = new ConnectionFactory().getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql.toString());
    ) {
        pstmt.setString(1, userid);
        ResultSet rs = pstmt.executeQuery();

        while (rs.next()) {
            int reservation_id = rs.getInt("reservation_id");
            String id = rs.getString("user_id");
            String reservation_date = rs.getString("reservation_date");
            int numGuests = rs.getInt("num_guests");
            String status = rs.getString("status");
            int deposit = rs.getInt("deposit");
            int total_reservations = rs.getInt("total_reservations");

            ReservationVO reservation = new ReservationVO(reservation_id, id, reservation_date, numGuests, status, deposit, total_reservations);
            reservationList.add(reservation);
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }

    return reservationList;
}
}

