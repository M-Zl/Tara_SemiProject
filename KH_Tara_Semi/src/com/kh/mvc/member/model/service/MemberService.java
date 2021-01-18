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

}
