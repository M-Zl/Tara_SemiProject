package com.kh.mvc.board.model.dao;

import static com.kh.mvc.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.mvc.board.model.vo.Board;
import com.kh.mvc.board.model.vo.BoardComment;
import com.kh.mvc.common.util.PageInfo;

public class BoardDAO {

	public List<Board> findAll(Connection conn, PageInfo info) {
		List<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = 
				  "SELECT * "
				+ "FROM ("
				+    "SELECT ROWNUM AS RNUM, "
				+           "BOARD_NO, "
				+ 			"BOARD_TITLE, "
				+ 			"USER_ID, "
				+ 			"BOARD_CREATE_DATE, "
				+ 			"BOARD_ORIGINAL_FILENAME, "
				+  			"BOARD_READCOUNT, "
				+     		"STATUS "
				+ 	 "FROM ("
				+ 	    "SELECT B.BOARD_NO, "
				+ 			   "B.BOARD_TITLE, "
				+  			   "M.USER_ID, "
				+ 			   "B.BOARD_CREATE_DATE, "
				+ 			   "B.BOARD_ORIGINAL_FILENAME, "
				+ 			   "B.BOARD_READCOUNT, "
				+ 	   		   "B.STATUS "
				+ 		"FROM BOARD B "
				+ 		"JOIN MEMBER M ON(B.BOARD_WRITER_NO = M.USER_NO) "
				+ 		"WHERE B.STATUS = 'Y'  ORDER BY B.BOARD_CREATE_DATE DESC"
				+ 	 ")"
				+ ") WHERE RNUM BETWEEN ? and ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, info.getStartList());
			pstmt.setInt(2, info.getEndList());
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Board board = new Board(); 
				
				board.setBoardNo(rs.getInt("BOARD_NO"));
				board.setRowNum(rs.getInt("RNUM"));
				board.setBoardTitle(rs.getString("BOARD_TITLE"));
				board.setUserId(rs.getString("USER_ID"));
				board.setBoardCreateDate(rs.getDate("BOARD_CREATE_DATE"));
				board.setBoardOriginalFileName(rs.getString("BOARD_ORIGINAL_FILENAME"));
				board.setBoardReadCount(rs.getInt("BOARD_READCOUNT"));
				
				list.add(board);				
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
				
		return list;
	}
//	밑에 수정해야함
	
	public Board findBoardByNo(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Board board = null;
		String query = 
			  "SELECT  B.BOARD_NO, "
			+         "B.BOARD_TITLE, "
			+         "M.USER_ID, "
			+         "B.BOARD_READCOUNT, "
			+         "B.BOARD_ORIGINAL_FILENAME, "
			+		  "B.BOARD_RENAMED_FILENAME, "
			+         "B.BOARD_CONTENT, "
			+         "B.BOARD_CREATE_DATE, "
			+         "BOARD_MODIFY_DATE "
			+ "FROM BOARD B "
			+ "JOIN MEMBER M ON(B.BOARD_WRITER_NO = M.USER_NO) "
			+ "WHERE B.STATUS = 'Y' AND B.BOARD_NO=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, boardNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				board = new Board();
				
				board.setBoardNo(rs.getInt("BOARD_NO"));
				board.setBoardTitle(rs.getString("BOARD_TITLE"));
				board.setUserId(rs.getString("USER_ID"));
				board.setBoardReadCount(rs.getInt("BOARD_READCOUNT"));
				board.setBoardOriginalFileName(rs.getString("BOARD_ORIGINAL_FILENAME"));
				board.setBoardRenamedFileName(rs.getString("BOARD_RENAMED_FILENAME"));
				board.setBoardContent(rs.getString("BOARD_CONTENT"));
				board.setBoardCreateDate(rs.getDate("BOARD_CREATE_DATE"));
				board.setBoardModifyDate(rs.getDate("BOARD_MODIFY_DATE"));
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}		
		
		return board;
	}
	
	public int getBoardCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = "SELECT COUNT(*) FROM BOARD WHERE STATUS = 'Y'";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}	

	public int updateReadCount(Connection conn, Board board) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement("UPDATE BOARD SET BOARD_READCOUNT=? WHERE BOARD_NO=?");
			
			board.setBoardReadCount(board.getBoardReadCount() + 1);
			
			pstmt.setInt(1, board.getBoardReadCount());
			pstmt.setInt(2, board.getBoardNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}		
		
		return result;
	}

	public int insertBoard(Connection conn, Board board) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(
					"INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL,?,?,?,?,?,DEFAULT,DEFAULT,DEFAULT,DEFAULT)");
			
			pstmt.setInt(1, board.getBoardWriteNo());
			pstmt.setString(2, board.getBoardTitle());
			pstmt.setString(3, board.getBoardContent());
			pstmt.setString(4, board.getBoardOriginalFileName());
			pstmt.setString(5, board.getBoardRenamedFileName());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}		
		
		return result;
	}
	
	public int updateBoard(Connection conn, Board board) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement("UPDATE BOARD SET BOARD_TITLE=?,BOARD_CONTENT=? WHERE BOARD_NO=?");
			
			pstmt.setString(1, board.getBoardTitle());
			pstmt.setString(2, board.getBoardContent());
			pstmt.setInt(3, board.getBoardNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}		
		
		return result;
	}

	public int updateBoardStatus(Connection conn, int boardNo, String status) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement("UPDATE BOARD SET STATUS=? WHERE BOARD_NO=?");
			
			pstmt.setString(1, status);
			pstmt.setInt(2, boardNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}		
		
		return result;
	}

	//↑↑↑여기까지
	
	
	public int insertBoardComment(Connection conn, BoardComment comment) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = 
			    "INSERT INTO COMMENTS VALUES(SEQ_COMMENT_NO.NEXTVAL, ?, ?, ?, SYSDATE, SYSDATE,DEFAULT)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, comment.getCommentBoardNO());
			pstmt.setInt(2, comment.getCommentWriterNo());
			pstmt.setString(3, comment.getCommentContent());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public List<BoardComment> getComments(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<BoardComment> list = new ArrayList();
		String query = 
				  "SELECT COMMENT_NO, "
				+ 	   "COMMENT_BOARD_NO, "
				+ 	   "USER_ID, "
				+ 	   "COMMENT_CONTENT, "
				+      "C.COMMENT_CREATE_DATE, "
				+      "C.COMMENT_MODIFY_DATE, "
				+      "C.STATUS "
				+ "FROM COMMENTS C "
				+ "JOIN MEMBER M ON(C.COMMENT_WRITER_NO = M.USER_NO) "
				+ "WHERE C.STATUS='Y' AND BOARD_NO = ?	"
				+ "ORDER BY COMMENT_CREATE_DATE DESC";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, boardNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardComment comment=new BoardComment();
				
				comment.setCommentNo(rs.getInt("COMMENT_NO"));
				comment.setCommentBoardNO(rs.getInt("COMMENT_BOARD_NO"));
				comment.setUserId(rs.getString("USER_ID"));
				comment.setCommentContent(rs.getString("COMMENT_CONTENT"));
				comment.setCommentCreateDate(rs.getDate("COMMENT_CREATE_DATE"));
				comment.setCommentModifyDate(rs.getDate("COMMENT_MODIFY_DATE"));
				
				list.add(comment);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
}