package com.kh.mvc.board.model.service;

import static com.kh.mvc.common.jdbc.JDBCTemplate.close;
import static com.kh.mvc.common.jdbc.JDBCTemplate.commit;
import static com.kh.mvc.common.jdbc.JDBCTemplate.getConnection;
import static com.kh.mvc.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.kh.mvc.board.model.dao.BoardDAO;
import com.kh.mvc.board.model.vo.Board;
import com.kh.mvc.board.model.vo.BoardComment;
import com.kh.mvc.common.util.PageInfo;

public class BoardService {

	public List<Board> getBoardList(PageInfo info) {
		Connection conn = getConnection();
		
		List<Board> list = new BoardDAO().findAll(conn, info);
		
		close(conn);		
		
		return list;
	}

	public Board getBoard(int boardNo, boolean hasRead) {
		int result = 0;
		Connection conn = getConnection();
		Board board = new BoardDAO().findBoardByNo(conn, boardNo);
		
		// 게시글 조회수 증가 로직
		if(board != null && !hasRead) {
			result = new BoardDAO().updateReadCount(conn, board);
			
			if (result > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
		}		
		
		close(conn);	
		
		return board;
	}

	public int saveBoard(Board board) {
		int result = 0;
		Connection conn = getConnection();
		
		if(board.getBoardNo() != 0) {
			result = new BoardDAO().updateBoard(conn, board);	
		} else {
			result = new BoardDAO().insertBoard(conn, board);			
		}
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);
		
		return result;
	}

	public int deleteBoard(int boardNo) {
		Connection conn = getConnection();
		int result = new BoardDAO().updateBoardStatus(conn, boardNo, "N");
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);
		
		return result;
	}

	public int getBoardCount() {
		Connection conn = getConnection();
		
		int result = new BoardDAO().getBoardCount(conn);
		
		close(conn);
		
		return result;			
	}
	
	public List<BoardComment> getReplyList(int boardNo) {
		Connection conn = getConnection();
		
		List<BoardComment> replies = new BoardDAO().getComments(conn, boardNo);
		
		close(conn);		
		
		return replies;
	}
	
	public int saveBoardReply(BoardComment reply) {
		int result = 0;
		Connection conn = getConnection();

		result = new BoardDAO().insertBoardComment(conn, reply);			

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);
		
		return result;		
	}
}