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
			JDBCTemplate.close(rset);
			JDBCTemplate.close(conn);
		}
		
		return member;
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
			JDBCTemplate.close(rset);
			JDBCTemplate.close(conn);
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
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
}


