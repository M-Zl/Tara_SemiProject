package com.kh.mvc.common.wrapper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import com.kh.mvc.common.util.EncryptUtil;

public class EncryptWrapper extends HttpServletRequestWrapper {

	public EncryptWrapper(HttpServletRequest request) {
		super(request);
		
	}

	//재 정의 하고싶은 메소드를 작성한다.
	@Override
	public String getParameter(String name) {
		// client가 전달하는 값중에 비밀번호 name값만 암호화를 처리하고, 나머지는 정상적으로 리턴하도록 처리한다.
		String value = "";
		
		if(name.equals("userPwd")) {
			//암호화처리 후 반환
			value = EncryptUtil.oneWayEnc(super.getParameter(name), "SHA-256");
			
		} else {
			//정상적으로 반환
			value = super.getParameter(name);
		}
		
		return value;
	}

}

