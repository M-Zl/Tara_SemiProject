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
	public List<Board> findAll(Connection conn, String locName, String boardName, String boardUserId, String boardTitle, String boardContent, PageInfo info) {
		List<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = 
				  "SELECT * "
				+ "FROM ("
				+    "SELECT ROWNUM AS RNUM, "
				+           "BOARD_NO, "
				+ 			"BOARD_TITLE, "
				+           "LOC_NAME, "
				+           "BOARD_NAME, "
				+           "BOARD_CONTENT, "
				+           "BOARD_SCORE, "
				+ 			"USER_ID, "
				+ 			"BOARD_CREATE_DATE, "
				+ 			"BOARD_ORIGINAL_FILENAME, "
				+  			"BOARD_READCOUNT, "
				+     		"STATUS "
				+ 	 "FROM ("
				+ 	    "SELECT B.BOARD_NO, "
				+ 			   "B.BOARD_TITLE, "
				+              "B.LOC_NAME, "
				+              "B.BOARD_NAME, "
				+              "B.BOARD_CONTENT, "
				+              "B.BOARD_SCORE, "
				+  			   "M.USER_ID, "
				+ 			   "B.BOARD_CREATE_DATE, "
				+ 			   "B.BOARD_ORIGINAL_FILENAME, "
				+ 			   "B.BOARD_READCOUNT, "
				+ 	   		   "B.STATUS "
				+ 		"FROM BOARD B "
				+ 		"JOIN MEMBER M ON(B.BOARD_WRITER_NO = M.USER_NO) "
				+ 		"WHERE B.STATUS = 'Y'"
				+       "AND B.LOC_NAME = ? "
				+       "AND B.BOARD_NAME = ? "
				+       "AND M.USER_ID LIKE '%' || ? || '%' "
				+       "AND B.BOARD_TITLE LIKE '%' || ? || '%' "
				+       "AND B.BOARD_CONTENT LIKE '%' || ? || '%' "
				+       "ORDER BY B.BOARD_CREATE_DATE DESC"
				+ 	 ")"
				+ ") WHERE RNUM BETWEEN ? and ?";
				
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, locName);
			pstmt.setString(2, boardName);
			pstmt.setString(3, boardUserId);
			pstmt.setString(4, boardTitle);
			pstmt.setString(5, boardContent);	
			pstmt.setInt(6, info.getStartList());
			pstmt.setInt(7, info.getEndList());
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Board board = new Board(); 
				
				board.setBoardNo(rs.getInt("BOARD_NO"));
				board.setRowNum(rs.getInt("RNUM"));
				board.setBoardTitle(rs.getString("BOARD_TITLE"));
				board.setLocName(rs.getString("LOC_NAME"));
				board.setBoardName(rs.getString("BOARD_NAME"));
				board.setBoardContent(rs.getString("BOARD_CONTENT"));
				board.setBoardScore(rs.getInt("BOARD_SCORE"));
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


	public List<Board> findSerch(Connection conn, String locName, String boardUserId, String boardTitle, String boardContent,  PageInfo info ) {
		List<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = 
				  "SELECT * "
				+ "FROM ("
				+    "SELECT ROWNUM AS RNUM, "
				+           "BOARD_NO, "
				+ 			"BOARD_TITLE, "
				+           "LOC_NAME, "
				+           "BOARD_NAME, "
				+           "BOARD_CONTENT, "
				+           "BOARD_SCORE, "
				+ 			"USER_ID, "
				+ 			"BOARD_CREATE_DATE, "
				+ 			"BOARD_ORIGINAL_FILENAME, "
				+  			"BOARD_READCOUNT, "
				+     		"STATUS "
				+ 	 "FROM ("
				+ 	    "SELECT B.BOARD_NO, "
				+ 			   "B.BOARD_TITLE, "
				+              "B.LOC_NAME, "
				+              "B.BOARD_NAME, "
				+              "B.BOARD_CONTENT, "
				+              "B.BOARD_SCORE, "
				+  			   "M.USER_ID, "
				+ 			   "B.BOARD_CREATE_DATE, "
				+ 			   "B.BOARD_ORIGINAL_FILENAME, "
				+ 			   "B.BOARD_READCOUNT, "
				+ 	   		   "B.STATUS "
				+ 		"FROM BOARD B "
				+ 		"JOIN MEMBER M ON(B.BOARD_WRITER_NO = M.USER_NO) "
				+ 		"WHERE B.STATUS = 'Y'"
				+       "AND B.LOC_NAME = ? "
				+       "AND M.USER_ID LIKE '%' || ? || '%' "
				+       "AND B.BOARD_TITLE LIKE '%' || ? || '%' "
				+       "AND B.BOARD_CONTENT LIKE '%' || ? || '%' "
				+       "ORDER BY B.BOARD_CREATE_DATE DESC"
				+ 	 ")"
				+ ") WHERE RNUM BETWEEN ? and ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, locName);
			pstmt.setString(2, boardUserId);
			pstmt.setString(3, boardTitle);
			pstmt.setString(4, boardContent);
			pstmt.setInt(5, info.getStartList());
			pstmt.setInt(6, info.getEndList());
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Board board = new Board(); 
				
				board.setBoardNo(rs.getInt("BOARD_NO"));
				board.setRowNum(rs.getInt("RNUM"));
				board.setBoardTitle(rs.getString("BOARD_TITLE"));
				board.setLocName(rs.getString("LOC_NAME"));
				board.setBoardName(rs.getString("BOARD_NAME"));
				board.setBoardContent(rs.getString("BOARD_CONTENT"));
				board.setBoardScore(rs.getInt("BOARD_SCORE"));
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


}
