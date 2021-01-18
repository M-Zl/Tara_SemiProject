package com.kh.mvc.member.model.service;

import java.sql.Connection;

import com.kh.mvc.common.jdbc.JDBCTemplate;
import com.kh.mvc.member.model.dao.MemberDAO;
import com.kh.mvc.member.model.vo.Member;

public class MemberService {
	private MemberDAO dao = new MemberDAO();

	public Member login(String useId, String userPwd) {
		Connection conn = JDBCTemplate.getConnection();
		
		Member member = dao.findMemberByIdAndPwd(conn, useId, userPwd);
		
		JDBCTemplate.close(conn);
		
		return member;
	}

	public Member findId(String name, String email) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		Member member = dao.findId(conn, name, email);
		
		JDBCTemplate.close(conn);
		
		return member;
	}

	public Member findPwd(String id, String name, String email) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		Member member = dao.findPwd(conn, id, name, email);
		
		JDBCTemplate.close(conn);
		
		return member;
	}

	public int changePwd(String id, String pwd) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.changePwd(conn, id, pwd);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

}
