package com.kh.mvc.board.model.service;

import static com.kh.mvc.common.jdbc.JDBCTemplate.close;
import static com.kh.mvc.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.kh.mvc.board.model.dao.BoardDAO;
import com.kh.mvc.board.model.vo.Board;
import com.kh.mvc.common.util.PageInfo;
import com.kh.mvc.member.model.dao.MemberDAO;
import com.kh.mvc.member.model.vo.Member;

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

	public List<Board> getCreatedBoard(int userNo) {

		Connection conn = getConnection();
		
		List<Board> list = new BoardDAO().findCreatedBoard(conn, userNo);
		
		close(conn);		
		
		return list;
	}
	public List<Board> getLikeBoard(int userNo) {

		Connection conn = getConnection();
		
		List<Board> list = new BoardDAO().findLikeBoard(conn, userNo);
		
		close(conn);		
		
		return list;
	}
	
	
}

