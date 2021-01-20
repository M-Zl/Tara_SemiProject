package com.kh.mvc.member.model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static com.kh.mvc.common.jdbc.JDBCTemplate.*;
import com.kh.mvc.common.util.PageInfo;

import com.kh.mvc.member.model.vo.Member;


public class MemberDAO {

	public Member findMemberByIdAndPwd(Connection conn, String useId, String userPwd) {
		Member member = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String query = "SELECT * FROM MEMBER WHERE USER_ID = ? AND USER_PWD = ? AND STATUS = 'Y'";

		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, useId);
			pstmt.setString(2, userPwd);

			rset = pstmt.executeQuery();

			if(rset.next()) {
				member = new Member(
						rset.getInt("USER_NO"),
						rset.getString("USER_ID"),
						rset.getString("USER_PWD"),
						rset.getString("USER_NAME"),
						rset.getString("PHONE"),
						rset.getString("USER_EMAIL"),
						rset.getInt("USER_ROLE"),
						rset.getString("ADDRESS"),
						rset.getString("USER_IMG"),
						rset.getString("TRAVEL"),
						rset.getDate("CREATE_DATE"),
						rset.getDate("MODIFY_DATE"),
						rset.getString("STATUS")
						);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(conn);
		}
		
		return member;
	}
	
	public int insertMember(Connection conn, Member member) {
		   int result = 0;
		      PreparedStatement pstmt = null;
		      
		      try {				
		    	  pstmt = conn.prepareStatement("INSERT INTO MEMBER VALUES(SEQ_UNO.NEXTVAL,?,?,?,?,?,1,?,?,?,SYSDATE,SYSDATE,'Y')");
		    	  
		    	  pstmt.setString(1, member.getUserId());
		    	  pstmt.setString(2, member.getUserPwd());
		    	  pstmt.setString(3, member.getUserName());
		    	  pstmt.setString(4, member.getPhone());
		    	  pstmt.setString(5, member.getEmail());
		    	  pstmt.setString(6, member.getAddress());
		    	  pstmt.setString(7, member.getUserimg());
		    	  pstmt.setString(8, member.getTravel());
			
		    	  	result = pstmt.executeUpdate();
			
			}  catch (SQLException e) {	         
		         e.printStackTrace();
		      }finally {
			     close(pstmt);		
				}
				return result;
		
	}

	public Member findMemberById(Connection conn, String userId) {
		 Member member = null;
	      ResultSet rset = null;
	      PreparedStatement pstmt = null;
	      
	      try {
			pstmt = conn.prepareStatement("SELECT * FROM MEMBER WHERE USER_ID = ?");
			
			pstmt.setString(1, userId); 
	 		 

	         rset = pstmt.executeQuery(); 
	         
	         if( rset.next()) {
		            
		     System.out.println(rset.getString("USER_ID") + ", " + rset.getString("USER_PWD")); 
		     
		 	member = new Member(
					rset.getInt("USER_NO"),
					rset.getString("USER_ID"),
					rset.getString("USER_PWD"),
					rset.getString("USER_NAME"),
					rset.getString("PHONE"),
					rset.getString("USER_EMAIL"),
					rset.getInt("USER_ROLE"),
					rset.getString("ADDRESS"),
					rset.getString("USER_IMG"),
					rset.getString("TRAVEL"),
					rset.getDate("CREATE_DATE"),
					rset.getDate("MODIFY_DATE"),
					rset.getString("STATUS")
					);
		     
		     
	         }
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	      
	     return member;
	}

	public Member findId(Connection conn, String name, String email) {
		Member member = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String query = "SELECT * FROM MEMBER WHERE USER_NAME = ? AND USER_EMAIL = ? AND STATUS = 'Y'";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, name);
			pstmt.setString(2, email);
		
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				member = new Member(
						rset.getInt("USER_NO"),
						rset.getString("USER_ID"),
						rset.getString("USER_PWD"),
						rset.getString("USER_NAME"),
						rset.getString("PHONE"),
						rset.getString("USER_EMAIL"),
						rset.getInt("USER_ROLE"),
						rset.getString("ADDRESS"),
						rset.getString("USER_IMG"),
						rset.getString("TRAVEL"),
						rset.getDate("CREATE_DATE"),
						rset.getDate("MODIFY_DATE"),
						rset.getString("STATUS")
						);
			}
			
			System.out.println(member);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(conn);
		}
		
		return member;
	}


	public List<Member> findAll(Connection conn, PageInfo info) {
		List<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = 
				  "SELECT * "
				+ "FROM ("
				+    "SELECT ROWNUM AS RNUM, "
				+			"USER_NO, "
				+           "USER_ID, "
				+ 			"USER_NAME, "
				+ 			"USER_EMAIL, "
				+ 			"CREATE_DATE, "
				+     		"STATUS "
				+ 	 "FROM ("
				+ 	    "SELECT USER_NO, "
				+ 			   "USER_ID, "
				+  			   "USER_NAME, "
				+ 			   "USER_EMAIL, "
				+ 			   "CREATE_DATE, "
				+ 	   		   "STATUS "
				+ 		"FROM MEMBER "
				+ 		"ORDER BY USER_NO"
				+ 	 ")"
				+ ") WHERE RNUM BETWEEN ? and ?";
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, info.getStartList());
			pstmt.setInt(2, info.getEndList());
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Member member = new Member(); 
				
				member.setUserNo(rs.getInt("USER_NO"));
				member.setRowNum(rs.getInt("RNUM"));
				member.setUserId(rs.getString("USER_ID"));
				member.setUserName(rs.getString("USER_NAME"));
				member.setEmail(rs.getString("USER_EMAIL"));
				member.setCreateDate(rs.getDate("CREATE_DATE"));
				member.setStatus(rs.getString("STATUS"));
				
				list.add(member);				
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
				
		return list;
	}

	public int getMemberCount(Connection conn) {
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			int result = 0;
			String query = "SELECT COUNT(*) FROM MEMBER";
			
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

	public Member findPwd(Connection conn, String id, String name, String email) {
		Member member = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String query = "SELECT * FROM MEMBER WHERE USER_ID = ? AND USER_NAME = ? AND USER_EMAIL = ? AND STATUS = 'Y'";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, email);
		
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				member = new Member(
						rset.getInt("USER_NO"),
						rset.getString("USER_ID"),
						rset.getString("USER_PWD"),
						rset.getString("USER_NAME"),
						rset.getString("BIRTHDATE"),
						rset.getString("PHONE"),
						rset.getString("USER_EMAIL"),
						rset.getInt("USER_ROLE"),
						rset.getString("ADDRESS"),
						rset.getString("USER_IMG"),
						rset.getString("TRAVEL"),
						rset.getDate("CREATE_DATE"),
						rset.getDate("MODIFY_DATE"),
						rset.getString("STATUS")
						);
			}
			
			System.out.println(member);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(conn);
		}
		
		return member;
	}

	public int changePwd(Connection conn, String id, String pwd) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement("UPDATE MEMBER SET USER_PWD=? WHERE USER_ID=?");
			
			pstmt.setString(1, pwd);
			pstmt.setString(2, id);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	//멤버 목록
	public int getMemberSearchCount(String field, String value, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query ="";
		if(field.equals("userNo")) {
			query = "SELECT COUNT(*) FROM(SELECT ROWNUM AS RNUM, " + "USER_NO, " + "USER_ID, " + "USER_NAME, " + "USER_EMAIL, "
					+ "CREATE_DATE, " + "STATUS " + "FROM(SELECT USER_NO, " + "USER_ID," + "USER_NAME," + "USER_EMAIL,"
					+ "CREATE_DATE," + "STATUS " + "FROM MEMBER " + "WHERE USER_NO=?" + "ORDER BY CREATE_DATE)" + ")";
		}else if(field.equals("userId")) {
			query = "SELECT COUNT(*) FROM(SELECT ROWNUM AS RNUM, " + "USER_NO, " + "USER_ID, " + "USER_NAME, " + "USER_EMAIL, "
					+ "CREATE_DATE, " + "STATUS " + "FROM(SELECT USER_NO, " + "USER_ID," + "USER_NAME," + "USER_EMAIL,"
					+ "CREATE_DATE," + "STATUS " + "FROM MEMBER " + "WHERE USER_ID LIKE ? " + "ORDER BY CREATE_DATE)"
					+ ")";
		}else {
			query = "SELECT COUNT(*) FROM(SELECT ROWNUM AS RNUM, " + "USER_NO, " + "USER_ID, " + "USER_NAME, " + "USER_EMAIL, "
					+ "CREATE_DATE, " + "STATUS " + "FROM(SELECT USER_NO, " + "USER_ID," + "USER_NAME," + "USER_EMAIL,"
					+ "CREATE_DATE," + "STATUS " + "FROM MEMBER " + "WHERE USER_NAME LIKE ? " + "ORDER BY CREATE_DATE)"
					+ ")";
		}
		
		try {
			pstmt = conn.prepareStatement(query);
			if(field.equals("userNo")) {
				pstmt.setString(1, value);
			}else {
				pstmt.setString(1, "%"+value+"%");
			}
			
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

	public List<Member> findMembers(String field, String value, Connection conn, PageInfo info) {
		List<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "";
		if(field.equals("userNo")) {
			query = "SELECT * FROM(SELECT ROWNUM AS RNUM, " + "USER_NO, " + "USER_ID, " + "USER_NAME, " + "USER_EMAIL, "
					+ "CREATE_DATE, " + "STATUS " + "FROM(SELECT USER_NO, " + "USER_ID," + "USER_NAME," + "USER_EMAIL,"
					+ "CREATE_DATE," + "STATUS " + "FROM MEMBER " + "WHERE USER_NO=?" + "ORDER BY CREATE_DATE)" + ")"
					+ "WHERE RNUM BETWEEN ? AND ?";
		}else if(field.equals("userId")) {
			query = "SELECT * FROM(SELECT ROWNUM AS RNUM, " + "USER_NO, " + "USER_ID, " + "USER_NAME, " + "USER_EMAIL, "
					+ "CREATE_DATE, " + "STATUS " + "FROM(SELECT USER_NO, " + "USER_ID," + "USER_NAME," + "USER_EMAIL,"
					+ "CREATE_DATE," + "STATUS " + "FROM MEMBER " + "WHERE USER_ID LIKE ? " + "ORDER BY CREATE_DATE)"
					+ ")" + "WHERE RNUM BETWEEN ? AND ?";
		}else {
			query = "SELECT * FROM(SELECT ROWNUM AS RNUM, " + "USER_NO, " + "USER_ID, " + "USER_NAME, " + "USER_EMAIL, "
					+ "CREATE_DATE, " + "STATUS " + "FROM(SELECT USER_NO, " + "USER_ID," + "USER_NAME," + "USER_EMAIL,"
					+ "CREATE_DATE," + "STATUS " + "FROM MEMBER " + "WHERE USER_NAME LIKE ? " + "ORDER BY CREATE_DATE)"
					+ ")" + "WHERE RNUM BETWEEN ? AND ?";
		}
		try {
			pstmt = conn.prepareStatement(query);
			
			if(field.equals("userNo")) {
				pstmt.setString(1, value);
			}else {
				pstmt.setString(1, "%"+value+"%");
			}
			pstmt.setInt(2, info.getStartList());
			pstmt.setInt(3, info.getEndList());
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Member member = new Member(); 
				
				member.setUserNo(rs.getInt("USER_NO"));
				member.setRowNum(rs.getInt("RNUM"));
				member.setUserId(rs.getString("USER_ID"));
				member.setUserName(rs.getString("USER_NAME"));
				member.setEmail(rs.getString("USER_EMAIL"));
				member.setCreateDate(rs.getDate("CREATE_DATE"));
				member.setStatus(rs.getString("STATUS"));
				
				list.add(member);	
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
