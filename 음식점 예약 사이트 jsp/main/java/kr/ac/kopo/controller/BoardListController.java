package kr.ac.kopo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.board.dao.BoardDAO;
import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.framework.Controller;

/**
 * 전체게시글 조회 요청에 대한 처리
 * @author User
 *
 */
public class BoardListController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request,
					HttpServletResponse response) throws Exception {
		
		BoardDAO boardDao = new BoardDAO();
		List<BoardVO> boardList = boardDao.selectAllBoard();
		
		request.setAttribute("boardList", boardList);
		
		return "/board/list.jsp";
	}
}






