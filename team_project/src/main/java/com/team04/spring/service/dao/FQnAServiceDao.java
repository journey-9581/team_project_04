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
	
	public List<FQnA> getList(int pageNum, int isQnA) throws ClassNotFoundException, SQLException{
				
		String sql = "SELECT * FROM"
				+ "(SELECT rownum AS no, x.* FROM"
				+ "(SELECT * FROM serviceBBS WHERE BBSTYPE=? ORDER BY ref DESC, num ASC)x ORDER BY no ASC)" + 
				"WHERE no BETWEEN ? AND ?";	
		
		//Class.forName(driver);
		//Connection con = DriverManager.getConnection(url,uid, pwd);

		Connection con = dataSource.getConnection();
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, isQnA);
		st.setInt(2, pageNum*10-10+1);
		st.setInt(3, pageNum*10);
		
		ResultSet rs = st.executeQuery();
		
		List<FQnA> list = new ArrayList<FQnA>();
		
		while(rs.next()){
		    int num = rs.getInt("NUM");
		    String title = rs.getString("TITLE");
		    String writerId = rs.getString("WRITERID");
		    Date regDate = rs.getDate("REGDATE");
		    String content = rs.getString("CONTENT");
		    int bbsType = rs.getInt("BBSTYPE");
		    int ref = rs.getInt("REF");
		    int secrete = rs.getInt("SECRETE");
		    FQnA dto = new FQnA(
		    					num,
		    					title,
		    					content,
		    					writerId,
		    					regDate,
		    					bbsType,
		    					ref,
		    					secrete
		    				);

		    list.add(dto);
		    
		}

		
		rs.close();
		st.close();
		con.close();
		
		return list;
	}
	
	// Scalar 
	public int getCount(int isQnA) throws ClassNotFoundException, SQLException {
		int count = 0;
		
		String sql = "SELECT COUNT(NUM) COUNT FROM serviceBBS WHERE BBSTYPE=?";	
		
		//Class.forName(driver);
		//Connection con = DriverManager.getConnection(url,uid, pwd);
		Connection con = dataSource.getConnection();
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, isQnA);
		
		ResultSet rs = st.executeQuery();
		
		
		if(rs.next())
			count = rs.getInt("COUNT");		
		
		rs.close();
		st.close();
		con.close();
		
		return count;
	}


	public void insert(FQnA dto) throws SQLException, ClassNotFoundException {
		String title = dto.getTitle();
		String content = dto.getContent();	
		String writerId = dto.getWriterId();
		int secrete = dto.getSecrete();
		int bbsType = dto.getBbsType();
		
		String sql = "INSERT INTO serviceBBS VALUES (serBBS_SEQ.NEXTVAL," + 
				"    ?," + //title
				"    ?," + //content
				"    ?," + //id
				"    SYSDATE," + //regdate
				"    ?," +
				"    serBBS_SEQ.CURRVAL," + //ref
				"     ?)";	//secrete
		
		//Class.forName(driver);
		//Connection con = DriverManager.getConnection(url,uid, pwd);
		Connection con = dataSource.getConnection();
		//Statement st = con.createStatement();
		//st.ex....(sql)
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, title);
		st.setString(2, content);
		st.setString(3, writerId);
		st.setInt(4, bbsType);
		st.setInt(5, secrete);
		
		
		st.executeUpdate();
		
		
		st.close();
		con.close();
		
	}
	
	public FQnA detail(int pnum) throws SQLException {
		String sql = "SELECT * from serviceBBS where num=?";	
		
		//Class.forName(driver);
		//Connection con = DriverManager.getConnection(url,uid, pwd);

		Connection con = dataSource.getConnection();
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, pnum);
		
		ResultSet rs = st.executeQuery();
		
		FQnA dto = new FQnA();
		
		while(rs.next()){
		    int num = rs.getInt("NUM");
		    String title = rs.getString("TITLE");
		    String writerId = rs.getString("WRITERID");
		    Date regDate = rs.getDate("REGDATE");
		    String content = rs.getString("CONTENT");
		    int bbsType = rs.getInt("BBSTYPE");
		    int ref = rs.getInt("REF");
		    int secrete = rs.getInt("SECRETE");
		    
		    dto = new FQnA(
    					num,
    					title,
    					content,
    					writerId,
    					regDate,
    					bbsType,
    					ref,
    					secrete
    				);		    
		}

		
		rs.close();
		st.close();
		con.close();
		
		return dto;
	}
	
	public void reply(int num, FQnA dto) throws SQLException, ClassNotFoundException {
		String title = dto.getTitle();
		String content = dto.getContent();	
		String writerId = dto.getWriterId();
		int secrete = dto.getSecrete();
		
		String sql = "INSERT INTO serviceBBS VALUES (serBBS_SEQ.NEXTVAL," + 
				"    ?," + //title
				"    ?," + //content
				"    ?," + //id
				"    SYSDATE," + //regdate
				"    0," +
				"    ?," + //ref
				"     ?)";	//secrete
		
		//Class.forName(driver);
		//Connection con = DriverManager.getConnection(url,uid, pwd);
		Connection con = dataSource.getConnection();
		//Statement st = con.createStatement();
		//st.ex....(sql)
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, title);
		st.setString(2, content);
		st.setString(3, writerId);
		st.setInt(4, num);
		st.setInt(5, secrete);
		
		
		st.executeUpdate();
		
		
		st.close();
		con.close();
		
	}
	
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
	public void delete(int id) throws ClassNotFoundException, SQLException {

		String sql = "DELETE serviceBBS WHERE NUM=?";
		
		Connection con = dataSource.getConnection();
		PreparedStatement st = con.prepareStatement(sql);		
		st.setInt(1, id);
		
		st.executeUpdate();
				
		st.close();
		con.close();
}

	
	public int update(FQnA notice) throws SQLException, ClassNotFoundException {
		// TODO Auto-generated method stub
		return 0;
	}

}