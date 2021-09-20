package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class boardDao {
	private DataSource ds;
	private Connection conn;
	private PreparedStatement pstmt;
	public boardDao() {
		try{
			Context ct = new InitialContext();
			ds=(DataSource)ct.lookup("java:comp/env/jdbc/orcl");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public void insert(boardDto boardDto) {
		
		String sql = "INSERT INTO article VALUES(articleid.NEXTVAL,?,?,?,?,?)";
		try {
			Connection conn=ds.getConnection();
			PreparedStatement ps=pstmt=conn.prepareStatement(sql);
			ps.setString(1, boardDto.getTitle());
			ps.setInt(2, boardDto.getHit());
			ps.setString(3, boardDto.getEmail());
			ps.setString(4, boardDto.getText());
			ps.setTimestamp(5, boardDto.getCreated());
		
			ps.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("insert error"+e.getMessage());
			throw new RuntimeException(e.getMessage());
		}
	}
	public List<boardDto> selectPagin(int nowPage) {
		System.out.println("selectPagin");
		List<boardDto>array=new ArrayList<>();
		String sql = "select * from article order by aid desc";
		try {
			Connection conn=ds.getConnection();
			PreparedStatement ps=pstmt=conn.prepareStatement(sql);
			ResultSet rs;
			rs = ps.executeQuery();
			while(rs.next()) {
				boardDto boardDto=new boardDto();
				boardDto.setEmail(rs.getString("email"));
				boardDto.setHit(rs.getInt("hit"));
				boardDto.setText(rs.getString("text"));
				boardDto.setTitle(rs.getString("title"));
				boardDto.setId(rs.getInt("aid"));
				boardDto.setCreated(rs.getTimestamp("created"));
				array.add(boardDto);
			}
			return array;
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("insert error"+e.getMessage());
			throw new RuntimeException(e.getMessage());
		}
	}
	/*rivate PreparedStatement  getPreparedStatement(String sql){
		System.out.println("getPreparedStatement");
		try {	
			conn=ds.getConnection();
			System.out.println(conn+"접속완료");
			pstmt=conn.prepareStatement(sql);
	
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getPreparedStatement error"+e.getMessage());
			throw new RuntimeException("데이터 베이스 접속 실패");
		}
		return pstmt;
	}*/
}
