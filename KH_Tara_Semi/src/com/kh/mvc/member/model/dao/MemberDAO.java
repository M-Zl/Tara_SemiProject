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
//		
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

}
