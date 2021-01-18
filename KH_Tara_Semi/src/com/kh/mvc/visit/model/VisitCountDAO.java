package com.kh.mvc.visit.model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;
import com.kh.mvc.common.jdbc.JDBCTemplate;
//	Visit 테이블의 DAO 방문자 관련 처리를 한다.
public class VisitCountDAO {
	 private static VisitCountDAO instance;
	    
		// 싱글톤 패턴
	    private VisitCountDAO(){}
	    public static VisitCountDAO getInstance(){
	        if(instance==null)
	            instance=new VisitCountDAO();
	        return instance;
	    }
	    
	    public void setTotalCount() throws SQLException
	    {
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        
	        try {
	            
	            // 쿼리생성
	            // 총 방문자수를 증가시키기 위해 테이블에 현재 날짜 값을 추가시킨다.
	        	// 지금 쿼리로는 StringBuffer 와 append를 사용할 필요는 없지만, 나중에 조건문등으로 조건을 추가하게 될때는 유용하다.
	            StringBuffer sql = new StringBuffer();
	            sql.append("INSERT INTO VISIT (V_DATE) VALUES (sysdate)");
	            
	            // 커넥션을 가져온다.
	            conn = JDBCTemplate.getConnection();

	            // 자동 커밋을 false로 한다.
	            conn.setAutoCommit(false);

	            pstmt = conn.prepareStatement(sql.toString());
	            // 쿼리 실행
	            pstmt.executeUpdate();
	            // 완료시 커밋
	            conn.commit(); 
	            
	        } catch (SQLException sqle) {
	            // 오류시 롤백
	            conn.rollback(); 
	            throw new RuntimeException(sqle.getMessage());
	        } finally {
	            // Connection, PreparedStatement를 닫는다.
	            try{
	                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
	                if ( conn != null ){ conn.close(); conn=null;    }
	            }catch(Exception e){
	                throw new RuntimeException(e.getMessage());
	            }
	        }
	    } // end setTotalCount()
	    
}

