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
import com.kh.mvc.member.model.vo.Member;

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
				+     		"LCOUNT, "
				+     		"CCOUNT, "
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
				+ 	   		   "B.STATUS, "
				+ 	   		   "(SELECT COUNT(*) FROM LIKECOUNT L WHERE L.BOARD_NO = B.BOARD_NO) LCOUNT, "
				+ 	   		   "(SELECT COUNT(*) FROM COMMENTS C WHERE C.COMMENT_BOARD_NO = B.BOARD_NO)CCOUNT "
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
				board.setlCount(rs.getInt("LCOUNT"));
				board.setcCount(rs.getInt("CCOUNT"));
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
	
	public List<Board> findLikelocal(Connection conn, String locName,  String boardUserId, String boardTitle, String boardContent, PageInfo info) {
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
						+     		"LCOUNT, "
						+     		"CCOUNT, "
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
						+ 	   		   "B.STATUS, "
						+ 	   		   "(SELECT COUNT(*) FROM LIKECOUNT L WHERE L.BOARD_NO = B.BOARD_NO) LCOUNT, "
						+ 	   		   "(SELECT COUNT(*) FROM COMMENTS C WHERE C.COMMENT_BOARD_NO = B.BOARD_NO)CCOUNT "
						+ 		"FROM BOARD B "
						+ 		"JOIN MEMBER M ON(B.BOARD_WRITER_NO = M.USER_NO) "
						+ 		"WHERE B.STATUS = 'Y'"
						+       "AND B.LOC_NAME = ? "
						+       "AND M.USER_ID LIKE '%' || ? || '%' "
						+       "AND B.BOARD_TITLE LIKE '%' || ? || '%' "
						+       "AND B.BOARD_CONTENT LIKE '%' || ? || '%' "
						+       "ORDER BY LCOUNT DESC"
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
				board.setlCount(rs.getInt("LCOUNT"));
				board.setcCount(rs.getInt("CCOUNT"));
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


	public List<Board> findLikeMenu(Connection conn, String locName, String boardName, String boardUserId, String boardTitle, String boardContent,  PageInfo info ) {
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
				+     		"LCOUNT, "
				+     		"CCOUNT, "
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
				+ 	   		   "B.STATUS, "
				+ 	   		   "(SELECT COUNT(*) FROM LIKECOUNT L WHERE L.BOARD_NO = B.BOARD_NO) LCOUNT, "
				+ 	   		   "(SELECT COUNT(*) FROM COMMENTS C WHERE C.COMMENT_BOARD_NO = B.BOARD_NO)CCOUNT "
				+ 		"FROM BOARD B "
				+ 		"JOIN MEMBER M ON(B.BOARD_WRITER_NO = M.USER_NO) "
				+ 		"WHERE B.STATUS = 'Y'"
				+       "AND B.LOC_NAME = ? "
				+       "AND B.BOARD_NAME = ? "
				+       "AND M.USER_ID LIKE '%' || ? || '%' "
				+       "AND B.BOARD_TITLE LIKE '%' || ? || '%' "
				+       "AND B.BOARD_CONTENT LIKE '%' || ? || '%' "
				+       "ORDER BY LCOUNT DESC"
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
				board.setlCount(rs.getInt("LCOUNT"));
				board.setcCount(rs.getInt("CCOUNT"));
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
						+     		"LCOUNT, "
						+     		"CCOUNT, "
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
						+ 	   		   "B.STATUS, "
						+ 	   		   "(SELECT COUNT(*) FROM LIKECOUNT L WHERE L.BOARD_NO = B.BOARD_NO) LCOUNT, "
						+ 	   		   "(SELECT COUNT(*) FROM COMMENTS C WHERE C.COMMENT_BOARD_NO = B.BOARD_NO)CCOUNT "
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
				board.setlCount(rs.getInt("LCOUNT"));
				board.setcCount(rs.getInt("CCOUNT"));
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

	public Board findBoardByNo(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Board board = null;
		String query = 
				"SELECT  B.BOARD_NO, "
				+ 		"M.USER_NO, "
				+ 		"M.USER_ID, "
				+ 		"B.LOC_NAME, "
				+ 		"B.BOARD_NAME, "
				+ 		"B.BOARD_TITLE, "
				+ 		"B.BOARD_CONTENT, "
				+ 		"B.BOARD_READCOUNT, "
				+ 		"B.BOARD_ORIGINAL_FILENAME, "
				+ 		"B.BOARD_RENAMED_FILENAME, "
				+ 		"B.TRANSPORT, "
				+ 		"B.TRAVEL_MONEY, "
				+ 		"B.BOARD_SCORE, "
				+ 		"B.BOARD_CREATE_DATE, "
				+ 		"B.BOARD_MODIFY_DATE "
				+ "FROM BOARD B, MEMBER M "
				+ "WHERE (B.BOARD_WRITER_NO = M.USER_NO) AND B.STATUS ='Y' AND B.BOARD_NO = ?";

		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, boardNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				board = new Board();
				
				board.setBoardNo(rs.getInt("BOARD_NO"));
				board.setBoardWriteNo(rs.getInt("USER_NO"));
				board.setUserId(rs.getString("USER_ID"));
				board.setLocName(rs.getString("LOC_NAME"));
				board.setBoardName(rs.getString("BOARD_NAME"));
				board.setBoardTitle(rs.getString("BOARD_TITLE"));
				board.setBoardContent(rs.getString("BOARD_CONTENT").replace("\r\n", "<br>"));
				board.setBoardReadCount(rs.getInt("BOARD_READCOUNT"));
				board.setBoardOriginalFileName(rs.getString("BOARD_ORIGINAL_FILENAME"));
				board.setBoardOriginalFileName(rs.getString("BOARD_RENAMED_FILENAME"));
				board.setTransport(rs.getString("TRANSPORT"));
				board.setTravelMoney(rs.getString("TRAVEL_MONEY"));
				board.setBoardScore(rs.getFloat("BOARD_SCORE"));
				board.setBoardCreateDate(rs.getDate("BOARD_CREATE_DATE"));
				board.setBoardCreateDate(rs.getDate("BOARD_MODIFY_DATE"));
				
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}		
		
		return board;
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


	public List<BoardComment> getReplies(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<BoardComment> list = new ArrayList();
		String query = 
				"SELECT C.COMMENT_NO, "
				+ 		"C.COMMENT_CONTENT, "
				+ 		"C.COMMENT_WRITER_NO, "
				+ 		"C.COMMENT_BOARD_NO, "
				+ 		"M.USER_ID, "
				+ 		"C.COMMENT_CREATE_DATE, "
				+ 		"C.COMMENT_MODIFY_DATE "
				+ "FROM COMMENTS C "
				+ "JOIN MEMBER M ON(C.COMMENT_WRITER_NO = M.USER_NO) "
				+ "WHERE C.STATUS='Y' AND COMMENT_BOARD_NO = ?"
				+ "ORDER BY COMMENT_CREATE_DATE DESC";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, boardNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardComment reply = new BoardComment();
				
				reply.setCommentNo(rs.getInt("COMMENT_NO"));
				reply.setCommentBoardNO(rs.getInt("COMMENT_BOARD_NO"));
				reply.setCommentWriterNo(rs.getInt("COMMENT_WRITER_NO"));
				reply.setUserId(rs.getString("USER_ID"));
				reply.setCommentContent(rs.getString("COMMENT_CONTENT"));
				reply.setCommentCreateDate(rs.getDate("COMMENT_CREATE_DATE"));
				reply.setCommentModifyDate(rs.getDate("COMMENT_MODIFY_DATE"));
				
				list.add(reply);
				
//				System.out.println(reply);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}


	public int insertBoardReply(Connection conn, BoardComment reply) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO COMMENTS VALUES(SEQ_COMMENT_NO.NEXTVAL, ?, ?, ?, SYSDATE, SYSDATE, DEFAULT)";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, reply.getCommentBoardNO());
			pstmt.setInt(2, reply.getCommentWriterNo());
			pstmt.setString(3, reply.getCommentContent());
			
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


	public int updateBoard(Connection conn, Board board) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement("UPDATE BOARD SET LOC_NAME=?, BOARD_TITLE=?, TRANSPORT=?, TRAVEL_MONEY=?, BOARD_SCORE=?, BOARD_CONTENT=? WHERE BOARD_NO=?");
			
			pstmt.setString(1, board.getLocName());
			pstmt.setString(2, board.getBoardTitle());
			pstmt.setString(3, board.getTransport());
			pstmt.setString(4, board.getTravelMoney());
			pstmt.setFloat(5, board.getBoardScore());
			pstmt.setString(6, board.getBoardContent());
			pstmt.setInt(7, board.getBoardNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}		
		
		return result;
	}


	public int updateCommentStatus(Connection conn, int boardNo, int commentNo, String status) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement("UPDATE COMMENTS SET STATUS=? WHERE COMMENT_NO=? AND COMMENT_BOARD_NO=?");
			
			pstmt.setString(1, status);
			pstmt.setInt(2, commentNo);
			pstmt.setInt(3, boardNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}		
		
		return result;
	}


	public List<Board> findCreatedBoard(Connection conn, int userNo) {
		List<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query ="SELECT BOARD_NO, BOARD_TITLE, BOARD_CONTENT FROM BOARD WHERE BOARD_WRITER_NO = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, userNo);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Board board = new Board(); 
				
				board.setBoardNo(rs.getInt("BOARD_NO"));
				board.setBoardTitle(rs.getString("BOARD_TITLE"));
				board.setBoardContent(rs.getString("BOARD_CONTENT"));				
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


	public List<Board> findLikeBoard(Connection conn, int userNo) {
		List<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query ="SELECT B.BOARD_NO, BOARD_TITLE, BOARD_CONTENT "
				+ "FROM BOARD B, LIKECOUNT L "
				+ "WHERE B.BOARD_NO = L.BOARD_NO AND L.STATUS = 'Y' AND USER_NO = ?";
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, userNo);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Board board = new Board(); 

				board.setBoardNo(rs.getInt("BOARD_NO"));
				board.setBoardTitle(rs.getString("BOARD_TITLE"));
				board.setBoardContent(rs.getString("BOARD_CONTENT"));				
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
	public int cke_insertBoard(Connection conn, Board board) {
		// 게시글 작성 INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL,?,?,?,?,?,DEFAULT,?,?,?,?,?,DEFAULT,DEFAULT,DEFAULT);
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(
					"INSERT INTO BOARD VALUES(INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL,?,?,?,?,DEFAULT,?,?,?,?,?,DEFAULT,DEFAULT,DEFAULT)");
			
		
			pstmt.setInt(1, board.getBoardWriteNo());
			pstmt.setString(2, board.getLocName());
			pstmt.setString(3, board.getBoardName());
			pstmt.setString(4, board.getBoardTitle());
			
			pstmt.setString(5, board.getBoardOriginalFileName());
			pstmt.setString(6, board.getBoardRenamedFileName());
			pstmt.setString(7, board.getTransport());
			pstmt.setString(8, board.getTravelMoney());
			pstmt.setFloat(9, board.getBoardScore());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}		
		
		return result;
	}


	public int cke_updateBoard(Connection conn, Board board) {
		// 게시글 수정 UPDATE BOARD SET BOARD_TITLE=?,BOARD_CONTENT=? WHERE BOARD_NO=?
		PreparedStatement pstmt = null;
		int result = 0;
		
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

}


