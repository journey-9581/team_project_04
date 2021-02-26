package com.team04.spring.service.dao;

import java.sql.*;
import java.util.*;
import java.util.Date;

import javax.sql.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.team04.spring.service.*;
import com.team04.spring.service.entity.*;


@Service
public class FQnAServiceDao implements FQnAService{
//	private String url = "jdbc:oracle:thin:@localhost:1521/xe";
//	private String uid = "C#scott";
//	private String pwd = "tiger";
//	private String driver = "oracle.jdbc.driver.OracleDriver";

	@Autowired
	private DataSource dataSource;
	
	public List<FQnA> getList(int page, String field, String query, int isQnA) throws ClassNotFoundException, SQLException{
		int start = 1 + (page-1)*10;     // 1, 11, 21, 31, ..
		int end = 10*page; // 10, 20, 30, 40...
		
		String sql = "SELECT * FROM NOTICE_VIEW WHERE "+field+" LIKE ? AND NUM BETWEEN ? AND ?";	
		
		//Class.forName(driver);
		//Connection con = DriverManager.getConnection(url,uid, pwd);

		Connection con = dataSource.getConnection();
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, "%"+query+"%");
		st.setInt(2, start);
		st.setInt(3, end);
		ResultSet rs = st.executeQuery();
		
		List<FQnA> list = new ArrayList<FQnA>();
		
		while(rs.next()){
		    int id = rs.getInt("ID");
		    String title = rs.getString("TITLE");
		    String writerId = rs.getString("WRITER_ID");
		    Date regDate = rs.getDate("REGDATE");
		    String content = rs.getString("CONTENT");
		    int hit = rs.getInt("hit");
		    String files = rs.getString("FILES");
		    
		    FQnA notice = new FQnA(
		    					id,
		    					title,
		    					writerId,
		    					regDate,
		    					content,
		    					hit,
		    					files
		    				);

		    list.add(notice);
		    
		}

		
		rs.close();
		st.close();
		con.close();
		
		return list;
	}
	
	// Scalar 
	public int getCount() throws ClassNotFoundException, SQLException {
		int count = 0;
		
		String sql = "SELECT COUNT(ID) COUNT FROM NOTICE";	
		
		//Class.forName(driver);
		//Connection con = DriverManager.getConnection(url,uid, pwd);
		Connection con = dataSource.getConnection();
		Statement st = con.createStatement();
		
		ResultSet rs = st.executeQuery(sql);
		
		if(rs.next())
			count = rs.getInt("COUNT");		
		
		rs.close();
		st.close();
		con.close();
		
		return count;
	}

//	public int insert(Notice notice) throws SQLException, ClassNotFoundException {
//		String title = notice.getTitle();
//		String writerId = notice.getWriterId();
//		String content = notice.getContent();
//		String files = notice.getFiles();
//		
//		String url = "jdbc:oracle:thin:@localhost:1521/xepdb1";
//		String sql = "INSERT INTO notice (    " + 
//				"    title," + 
//				"    writer_id," + 
//				"    content," + 
//				"    files" + 
//				") VALUES (?,?,?,?)";	
//		
//		//Class.forName(driver);
//		//Connection con = DriverManager.getConnection(url,uid, pwd);
//		Connection con = dataSource.getConnection();
//		//Statement st = con.createStatement();
//		//st.ex....(sql)
//		PreparedStatement st = con.prepareStatement(sql);
//		st.setString(1, title);
//		st.setString(2, writerId);
//		st.setString(3, content);
//		st.setString(4, files);
//		
//		int result = st.executeUpdate();
//		
//		
//		st.close();
//		con.close();
//		
//		return result;
//	}
//	
	public int update(FQnAService notice) throws SQLException, ClassNotFoundException {
		return 1;
	}
//		String title = notice.getTitle();
//		String content = notice.getContent();
//		String files = notice.getFiles();
//		int id = notice.getId();
//		
//		String url = "jdbc:oracle:thin:@localhost:1521/xepdb1";
//		String sql = "UPDATE NOTICE " + 
//				"SET" + 
//				"    TITLE=?," + 
//				"    CONTENT=?," + 
//				"    FILES=?" + 
//				"WHERE ID=?";
//		
//		//Class.forName(driver);
//		//Connection con = DriverManager.getConnection(url,uid, pwd);                   
//		Connection con = dataSource.getConnection();
//		//Statement st = con.createStatement();
//		//st.ex....(sql)
//		PreparedStatement st = con.prepareStatement(sql);
//		st.setString(1, title);
//		st.setString(2, content);
//		st.setString(3, files);
//		st.setInt(4, id);
//		
//		int result = st.executeUpdate();
//				
//		st.close();
//		con.close();
//		
//		return result;
//	}
//	
	public int delete(int id) throws ClassNotFoundException, SQLException {
		return 0;
	}
//	
//		String url = "jdbc:oracle:thin:@localhost:1521/xepdb1";
//		String sql = "DELETE NOTICE WHERE ID=?";
//		
//		//Class.forName(driver);
//		//Connection con = DriverManager.getConnection(url,uid, pwd);                  
//		Connection con = dataSource.getConnection();
//		//Statement st = con.createStatement();
//		//st.ex....(sql)
//		PreparedStatement st = con.prepareStatement(sql);		
//		st.setInt(1, id);
//		
//		int result = st.executeUpdate();
//				
//		st.close();
//		con.close();
//		
//		return result;
//	}
//
//	

	public int insert(FQnAService notice) throws SQLException, ClassNotFoundException {
		// TODO Auto-generated method stub
		return 0;
	}

	public int insert(FQnA notice) throws SQLException, ClassNotFoundException {
		// TODO Auto-generated method stub
		return 0;
	}

	public int update(FQnA notice) throws SQLException, ClassNotFoundException {
		// TODO Auto-generated method stub
		return 0;
	}
}