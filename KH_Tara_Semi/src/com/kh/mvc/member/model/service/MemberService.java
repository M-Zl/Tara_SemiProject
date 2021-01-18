package com.kh.mvc.member.model.service;

import static com.kh.mvc.common.jdbc.JDBCTemplate.rollback;
import static com.kh.mvc.common.jdbc.JDBCTemplate.close;
import static com.kh.mvc.common.jdbc.JDBCTemplate.commit;
import static com.kh.mvc.common.jdbc.JDBCTemplate.getConnection;

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
