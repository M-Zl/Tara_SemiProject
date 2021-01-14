package com.kh.mvc.visit.action;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import visit.model.VisitCountDAO;

/**
 * Application Lifecycle Listener implementation class VisitSessionListener
 *
 */
@WebListener
public class VisitSessionListener implements HttpSessionListener {

    public VisitSessionListener() {
    }

    @Override
    public void sessionCreated(HttpSessionEvent se)  { 
    	// 세션이 새로 생성되면 execute() 메소드가 실행된다.
    	if(se.getSession().isNew()) {
//    		execute(se);
    	}
    }
    
//    public int execute(HttpSessionEvent se) {
//    	
//    }
//    

    public void sessionDestroyed(HttpSessionEvent se)  { 
    }
	
}
