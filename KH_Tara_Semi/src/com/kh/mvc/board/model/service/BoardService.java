package com.kh.mvc.board.model.service;

import static com.kh.mvc.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.kh.mvc.board.model.dao.BoardDAO;
import com.kh.mvc.board.model.vo.Board;
import com.kh.mvc.board.model.vo.BoardComment;
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

	public Board getBoard(int boardNo, boolean hasRead) {
		int result = 0;
		Connection conn = getConnection();
		Board board = new BoardDAO().findBoardByNo(conn, boardNo);
		
		// 게시글 조회수 증가 로직
		if(board != null && !hasRead) {
			result = new BoardDAO().updateReadCount(conn, board);
			
			if(result > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
			
		}
		
		close(conn);
		
		return board;
	}

	public List<BoardComment> getReplyList(int boardNo) {
		Connection conn = getConnection();
		
		List<BoardComment> replies = new BoardDAO().getReplies(conn, boardNo);
		
		close(conn);		
		
		return replies;
	}

	public int saveBoardReply(BoardComment reply) {
		int result = 0;
		Connection conn = getConnection();

		result = new BoardDAO().insertBoardReply(conn, reply);			

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
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int saveBoard(Board board) {
		int result = 0;
		Connection conn = getConnection();
		
		result = new BoardDAO().updateBoard(conn, board);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int deleteComment(int boardNo, int commentNo) {
		Connection conn = getConnection();
		int result = new BoardDAO().updateCommentStatus(conn, boardNo, commentNo, "N");
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int updateLikeCount(int boardNo, int writerNo) {
		int result = 0;
		Connection conn = getConnection();
		
		result = new BoardDAO().updateLikeCount(conn, boardNo, writerNo);
		System.out.println(result);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public int LikeCheck(int boardNo, int writerNo) {
		int result = 0;
		Connection conn = getConnection();
		
		result = new BoardDAO().likeCheck(conn, boardNo, writerNo);
		System.out.println(result);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	

	public int deleteLikeCount(int boardNo, int userNo) {
		int result = 0;
		Connection conn = getConnection();
		
		result = new BoardDAO().deleteLikeCount(conn, boardNo, userNo);
		System.out.println(result);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	
}

