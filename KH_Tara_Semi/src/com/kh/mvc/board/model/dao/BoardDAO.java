package com.kh.mvc.board.model.dao;

import static com.kh.mvc.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.mvc.board.model.vo.Board;

public class BoardDAO {

	public List<Board> findBoardList(Connection conn, String locName, String boardName, String boardUserId, String boardTitle, String boardContent ) {
		List<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = 
				 "SELECT B.BOARD_NO, "
				+       "B.BOARD_TITLE, "
				+       "B.LOC_NAME, "
				+       "B.BOARD_NAME, "
				+       "B.BOARD_CONTENT, "
				+       "B.BOARD_SCORE, "
				+       "M.USER_ID, "
				+       "B.BOARD_CREATE_DATE, "
				+       "B.BOARD_ORIGINAL_FILENAME, "
				+       "B.BOARD_READCOUNT "
				+ "FROM BOARD B JOIN MEMBER M ON(B.BOARD_WRITER_NO = M.USER_NO) "
				+ "WHERE B.STATUS = 'Y'"
				+ "AND B.LOC_NAME = ? "
				+ "AND B.BOARD_NAME = ? "
				+ "AND M.USER_ID LIKE '%' || ? || '%' "
				+ "AND B.BOARD_TITLE LIKE '%' || ? || '%' "
				+ "AND B.BOARD_CONTENT LIKE '%' || ? || '%' "
				+ "ORDER BY BOARD_NO DESC";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, locName);
			pstmt.setString(2, boardName);
			pstmt.setString(3, boardUserId);
			pstmt.setString(4, boardTitle);
			pstmt.setString(5, boardContent);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Board board = new Board(); 
				
				board.setBoardNo(rs.getInt("BOARD_NO"));
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

	public List<Board> findSerch(Connection conn, String locName, String boardUserId, String boardTitle, String boardContent ) {
		List<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = 
				 "SELECT B.BOARD_NO, "
				+       "B.BOARD_TITLE, "
				+       "B.LOC_NAME, "
				+       "B.BOARD_NAME, "
				+       "B.BOARD_CONTENT, "
				+       "B.BOARD_SCORE, "
				+       "M.USER_ID, "
				+       "B.BOARD_CREATE_DATE, "
				+       "B.BOARD_ORIGINAL_FILENAME, "
				+       "B.BOARD_READCOUNT "
				+ "FROM BOARD B JOIN MEMBER M ON(B.BOARD_WRITER_NO = M.USER_NO) "
				+ "WHERE B.STATUS = 'Y'"
				+ "AND B.LOC_NAME = ? "
				+ "AND M.USER_ID LIKE '%' || ? || '%' "
				+ "AND B.BOARD_TITLE LIKE '%' || ? || '%' "
				+ "AND B.BOARD_CONTENT LIKE '%' || ? || '%' "
				+ "ORDER BY BOARD_NO DESC";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, locName);
			pstmt.setString(2, boardUserId);
			pstmt.setString(3, boardTitle);
			pstmt.setString(4, boardContent);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Board board = new Board(); 
				
				board.setBoardNo(rs.getInt("BOARD_NO"));
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


}
