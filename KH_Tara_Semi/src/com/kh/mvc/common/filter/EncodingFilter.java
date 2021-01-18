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


@WebFilter(filterName = "encoding", urlPatterns = "/*")
public class EncodingFilter implements Filter {

    public EncodingFilter() {       	
    }
	
 	public void init(FilterConfig fConfig) throws ServletException {
 	}
 	 	
 	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
 		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
				
		chain.doFilter(request, response);// 다음 필터를 호출하거나 마지막이라면 servlet, JSP를 호출한다.	
	}
	
	public void destroy() {			
	}
}
