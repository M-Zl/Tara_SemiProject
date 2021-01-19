package com.kh.mvc.member.model.service;

import java.sql.Connection;

import static com.kh.mvc.common.jdbc.JDBCTemplate.rollback;
import static com.kh.mvc.common.jdbc.JDBCTemplate.close;
import static com.kh.mvc.common.jdbc.JDBCTemplate.commit;
import static com.kh.mvc.common.jdbc.JDBCTemplate.getConnection;

import com.kh.mvc.member.model.dao.MemberDAO;
import com.kh.mvc.member.model.vo.Member;

public class MemberService {
	private MemberDAO dao = new MemberDAO();

	public Member login(String useId, String userPwd) {
		Connection conn = getConnection();
		
		Member member = dao.findMemberByIdAndPwd(conn, useId, userPwd);
		
		close(conn);
		
		return member;
	}

	public Member findId(String name, String email) {
		
		Connection conn = getConnection();
		
		Member member = dao.findId(conn, name, email);
		
		close(conn);
		
		return member;
	}

	public Member findPwd(String id, String name, String email) {
		
		Connection conn = getConnection();
		
		Member member = dao.findPwd(conn, id, name, email);
		
		close(conn);
		
		return member;
	}

	public int changePwd(String id, String pwd) {
		Connection conn = getConnection();
		int result = dao.changePwd(conn, id, pwd);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public int joinMember(Member member) {
		Connection conn = getConnection();
		
		int result = dao.insertMember(conn, member);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}
	
	public boolean validate(String userId) {
		Connection conn = getConnection();
		
		Member member = dao.findMemberById(conn, userId);
		
		close(conn);
		
		
		return member != null;
	}

	public Member findMemberById(String userId) {		
		Connection conn = getConnection();
		
		Member member = dao.findMemberById(conn, userId);
		
		close(conn);
		
		
		return member;
	}

}
