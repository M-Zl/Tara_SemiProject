package com.kh.mvc.board.model.service;

import static com.kh.mvc.common.jdbc.JDBCTemplate.close;
import static com.kh.mvc.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.kh.mvc.board.model.dao.BoardDAO;
import com.kh.mvc.board.model.vo.Board;

public class BoardService {

	public List<Board> getBoardList(String locName, String boardName, String boardUserId, String boardTitle, String boardContent) {
		Connection conn = getConnection();
		
		List<Board> list = new BoardDAO().findBoardList(conn, locName, boardName, boardUserId, boardTitle, boardContent);
		
		close(conn);		
	
		
		return list;
	}

	public List<Board> getBoardSerch(String locName, String boardUserId, String boardTitle, String boardContent) {
		Connection conn = getConnection();
		
        List<Board> list = new BoardDAO().findSerch(conn, locName, boardUserId, boardTitle, boardContent);
		
		close(conn);
				
		return list;
	}

	public void getBoard(int boardNo) {
		Connection conn = getConnection();
		Board board = new BoardDAO().findBoardByNo(conn, boardNo);
		
		close(conn);
		
//		return board;
	}
}
