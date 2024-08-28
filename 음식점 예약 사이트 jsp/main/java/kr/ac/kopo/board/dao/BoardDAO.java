package kr.ac.kopo.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.util.ConnectionFactory;

/**
 	게시판(t_board) CRUD 기능클래스
 */

public class BoardDAO {

	/**
	 * 전체게시글 조회기능
	 */
	
	/**
	 * 새글등록
	 */
	public void insertBoard(BoardVO board) throws Exception {
		
		StringBuilder sql = new StringBuilder();
		sql.append("insert into t_board(no, title, writer, content) ");
		sql.append(" values(seq_t_board_no.nextval, ?, ?, ?) ");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getWriter());
			pstmt.setString(3, board.getContent());
			
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
	public BoardVO selectByNo(int boardNo) throws Exception {
		
		StringBuilder sql = new StringBuilder();
		sql.append("select no, title, writer, content, view_cnt ");
		sql.append("     , to_char(reg_date, 'yyyy-mm-dd') reg_date "); 
		sql.append("  from t_board ");
		sql.append(" where no = ? ");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt= conn.prepareStatement(sql.toString());
		) {
			pstmt.setInt(1, boardNo);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				String content = rs.getString("content");
				int viewCnt = rs.getInt("view_cnt");
				String regDate = rs.getString("reg_date");
				
				BoardVO board = new BoardVO(no, title, writer, content, viewCnt, regDate);
				return board;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
}













