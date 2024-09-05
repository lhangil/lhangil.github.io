package DAO;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import VO.userVO;
import VO.emailVO;
import util.ConnectionFactory;

/**
 	게시판(t_board) CRUD 기능클래스
 */

public class emailDAO {

	/**
	 * 전체게시글 조회기능
	 */
	
	/**
	 * 새글등록
	 */
	public void insertBoard(emailVO board) throws Exception {
		
		StringBuilder sql = new StringBuilder();
		sql.append("INSERT INTO email(NO, SENDER, RECEIVER, TITLE, CONTENT, REG_DATE)");
		sql.append(" values(seq_email_no.nextval, ?, ?, ?,?,SYSDATE)");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			
			pstmt.setString(1, board.getSender());
			pstmt.setString(2, board.getReceiver());
			pstmt.setString(3, board.getTitle());
			pstmt.setString(4, board.getContent());
			
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 글번호로 게시글 조회기능
	 * @param boardNo  조회할글번호
	 * @return  조회된게시물, 만일 게시글이 존재하지 않으면 null 반환
	 */
	public emailVO selectByNo(int boardNo) throws Exception {
		
		StringBuilder sql = new StringBuilder();
		sql.append("select no, sender, receiver, title, content  ");
		sql.append("     , to_char(reg_date, 'yyyy-mm-dd') reg_date "); 
		sql.append("  from EMAIL ");
		sql.append(" where no = ? ");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt= conn.prepareStatement(sql.toString());
		) {
			pstmt.setInt(1, boardNo);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				int no = rs.getInt("no");
				
				String sender = rs.getString("sender");
				String receiver = rs.getString("receiver");
				String title = rs.getString("title");
				
				String content = rs.getString("content");
			
				String regDate = rs.getString("reg_date");
				
				emailVO board = new emailVO(no, sender, receiver, title, content, regDate);
				return board;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
}













