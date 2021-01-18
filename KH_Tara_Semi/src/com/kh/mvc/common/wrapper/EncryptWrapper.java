package com.kh.mvc.common.wrapper;

// 브라우즈에서 리퀘스트랩퍼선택해서 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import com.kh.mvc.common.util.EncryptUtil;

//필터에서는 겟파라미터값을 변경할수없기때문에 여기서 재정의 해주는 것
public class EncryptWrapper extends HttpServletRequestWrapper {

	// addConstructer 추가 한것
	public EncryptWrapper(HttpServletRequest request) {
		super(request);
		
	}

	// 재정의 하고싶은 메소드를 작성한다. 
	// OVerride implements를 통해 알트쉬프트 에스
	@Override
	public String getParameter(String name) {
		// client가 전달하는 값 중에 비밀번호 name속성이 userPwd인 값을 암호화를 처리하고 나머지는 정상적으로 리턴하도록 처리
		String value = "";
		
		if(name.equals("userPwd")) {
			// 따라서 userPwd라면 암호화해서 반환해라
			// 암호화 처리 후 반환
			value = EncryptUtil.oneWayEnc(super.getParameter(name), "SHA-256");
		} else {
			// 정상적으로 반환
			value = super.getParameter(name);
		}
		
		
		
		return value;
	}

	
}
