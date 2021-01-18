package com.kh.mvc.member.model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.kh.mvc.common.jdbc.JDBCTemplate;
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
			JDBCTemplate.close(rset);
			JDBCTemplate.close(conn);
		}

		return member;
	}

	public int insertMember(Connection conn, Member member) {
		   int result = 0;
		      PreparedStatement pstmt = null;
		      
		      try {				
		    	  	pstmt = conn.prepareStatement("INSERT INTO MEMBER VALUES(SEQ_UNO.NEXTVAL, ?, ?, ?, ?, ?, '1', ?, ?,SYSDATE, SYSDATE, DEFAULT)");
			
		    	  	pstmt.setString(1, member.getUserId());
		    	  	pstmt.setString(2, member.getUserPwd());
		    	  	pstmt.setString(3, member.getUserName());
		    	  	pstmt.setString(4, member.getPhone());
		    	  	pstmt.setString(5, member.getEmail());
		    	  	pstmt.setString(6, member.getAddress());
		    	  	pstmt.setString(7, member.getTravel());
			
		    	  	result = pstmt.executeUpdate();
			
			}  catch (SQLException e) {	         
		         e.printStackTrace();
		      }finally {
			     JDBCTemplate.close(pstmt);		
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

	
}