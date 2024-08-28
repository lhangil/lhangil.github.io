package test;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

import java.beans.Transient;

import org.junit.Ignore;
import org.junit.Rule;
import org.junit.Test;

import kr.ac.kopo.board.dao.BoardDAO;
import kr.ac.kopo.board.vo.BoardVO;

public class BoardDAOTest {

	private BoardDAO boardDao = new BoardDAO();
	
	@Ignore
	@Test
	public void 글번호조회서비스() throws Exception {
		BoardVO board = boardDao.selectByNo(3);
		
		assertNotNull(board);
	}
	
	@Test
	public void 새글등록테스트() throws Exception {
		
		BoardVO board = new BoardVO();
		board.setTitle("테스트제목");
		board.setWriter("테스트");
		board.setContent("테스트내용");
		
		boardDao.insertBoard(board);
	}
}








