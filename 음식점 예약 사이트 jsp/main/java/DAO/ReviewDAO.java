package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import VO.ReviewVO;
import util.ConnectionFactory;

public class ReviewDAO {

    /**
     * 리뷰 조회
     * @param reviewId 조회할 리뷰 ID
     * @return 조회된 ReviewVO, 단 리뷰가 없을 시 null 반환
     */
    public ReviewVO review(ReviewVO reviewVO) {
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT * ");
        sql.append("FROM review ");
        sql.append("WHERE id = ? and content = ?");

        try (
            Connection conn = new ConnectionFactory().getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql.toString());
        ) {
            pstmt.setString(1, reviewVO.getId());
            pstmt.setString(2, reviewVO.getContent());

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                int no =rs.getInt("no");
            	String id = rs.getString("id");
                String reservation_id = rs.getString("reservation_id");
                int rating = rs.getInt("rating");
                String content = rs.getString("content");
                String review_date = rs.getString("review_date");

                ReviewVO review = new ReviewVO(no, id, reservation_id, rating, content, review_date);

                return review;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    // 리뷰 등록
    public void addReview(ReviewVO review) {
        StringBuilder sql = new StringBuilder();
        sql.append("INSERT INTO review ");
        sql.append("( no, id,  content, rating ) ");
        sql.append("VALUES (seq_review_no.nextval, ?,?,?)");

        try (
            Connection conn = new ConnectionFactory().getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql.toString());
        ) {
         
            pstmt.setString(1, review.getId());
            
 
            pstmt.setString(2, review.getContent());
            
            pstmt.setInt(3, review.getRating());
            //pstmt.setString(4, review.getReview_date());
          

            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public List<ReviewVO> getAllReviews() {
        List<ReviewVO> reviews = new ArrayList<>();
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT * FROM review");

        try (
            Connection conn = new ConnectionFactory().getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql.toString());
        ) {
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                int no = rs.getInt("no");
                String id = rs.getString("id");
                String reservation_id = rs.getString("reservation_id");
                int rating = rs.getInt("rating");
                String content = rs.getString("content");
                String review_date = rs.getString("review_date");

                ReviewVO review = new ReviewVO(no, id, reservation_id, rating, content, review_date);
                reviews.add(review);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return reviews;
    }
    /**
     * 리뷰 삭제
     * @param no 삭제할 리뷰의 번호
     * @return 삭제 성공 여부
     */
    public boolean deleteReview(int no) {
        StringBuilder sql = new StringBuilder();
        sql.append("DELETE FROM review ");
        sql.append("WHERE no = ?");

        try (
            Connection conn = new ConnectionFactory().getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql.toString());
        ) {
            pstmt.setInt(1, no);

            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}
