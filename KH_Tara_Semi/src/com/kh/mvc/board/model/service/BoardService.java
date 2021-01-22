package com.kh.mvc.board.model.service;

import static com.kh.mvc.common.jdbc.JDBCTemplate.close;
import static com.kh.mvc.common.jdbc.JDBCTemplate.getConnection;
import static com.kh.mvc.common.jdbc.JDBCTemplate.commit;
import static com.kh.mvc.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.kh.mvc.board.model.dao.BoardDAO;
import com.kh.mvc.board.model.vo.Board;
import com.kh.mvc.common.util.PageInfo;

public class BoardService {

	public List<Board> getBoardList(String locName, String boardName, String boardUserId, String boardTitle, String boardContent ,  PageInfo info ) {
		Connection conn = getConnection();
		
		List<Board> list = new BoardDAO().findAll(conn, locName, boardName, boardUserId, boardTitle, boardContent, info);
		
		close(conn);		
	
		
		return list;
	}

	public List<Board> getBoardSerch(String locName, String boardUserId, String boardTitle, String boardContent,  PageInfo info) {
		Connection conn = getConnection();
		
        List<Board> list = new BoardDAO().findSerch(conn, locName, boardUserId, boardTitle, boardContent, info);
		
		close(conn);
				
		return list;
	}

	public int getBoardCount() {
		Connection conn = getConnection();
		
		int result = new BoardDAO().getBoardCount(conn);
		
		close(conn);
		
		return result;			
	}

	public int saveBoard(Board board) {
		int result = 0;
		Connection conn = getConnection();
		
		if(board.getBoardNo() != 0) {
			result = new BoardDAO().updateBoard(conn,board);
		} else {
			result = new BoardDAO().insertBoard(conn,board);
		}
		
		result = new BoardDAO().insertBoard(conn, board);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);
		
		return result;
	}

}

