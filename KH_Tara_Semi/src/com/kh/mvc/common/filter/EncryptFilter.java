package com.kh.mvc.common.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import com.kh.mvc.common.wrapper.EncryptWrapper;

// encryptWrapper로 한번 감싸주는 											// 해당하는 두개의 서블릿으로 갔을때 이 필터를 실행시켜준다.
@WebFilter(filterName="EncryptFilter", servletNames= {"login", "join", "updatePwd" })
public class EncryptFilter implements Filter {

   
    public EncryptFilter() {
      
    }

	
	public void destroy() {
		// TODO Auto-generated method stub
	}

	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// POST일때만 가능하게끔...PPST일때만 파라미터값이 넘어오므로  enrollServlet일때 doGet에서는 enroll.jsp로 넘어가게끔 회워가입페이지로 전화해주기 위해
		
		// 값을 가져올수는 있지만 변경할수가 없어서ㅠ
		// request의 파라미터 값을 변경할 수 없기 때문에 RequestWrapper를 생성한다. userPwd값을 암화화 처리하여 반환해주게끔하기 위해서
		// EncryptWrapper에서 userPwd값만 암호화처리하고 나머지는 정상적으로 처리하여 리턴되게끔 한다.
		EncryptWrapper wrapper = new EncryptWrapper((HttpServletRequest)request);
		
		//값을 변경할수없기때문에 감싸준것 request 객체에 생성한 wrapper 객체를 넘겨준다. 
		chain.doFilter(wrapper, response);
	}

	
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
