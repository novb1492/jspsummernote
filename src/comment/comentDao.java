package comment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import board.boardDto;

public class comentDao {
	private Connection conn;
	public comentDao() {
		try {
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "kim";
			String password = "1111";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url,user,password);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("db접속 실패");
		}
	}
	public void insert(comentDto commentDto) {
			
			String sql = "INSERT INTO coment VALUES(commentid.NEXTVAL,?,?,?,?)";
			try {
				PreparedStatement ps=conn.prepareStatement(sql);
				ps.setInt(1, commentDto.getAid());
				ps.setString(2, commentDto.getEmail());
				ps.setTimestamp(3, commentDto.getCreated());
				ps.setString(4, commentDto.getComment());
			
				ps.executeUpdate();
				
			}catch (Exception e) {
				e.printStackTrace();
				System.out.println("insert error"+e.getMessage());
				throw new RuntimeException(e.getMessage());
			}
	}
	public comentDto findByCid(int cid) {
		String sql = "select * from coment where cid=?";
		comentDto commentDto=new comentDto();
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, cid);
			ResultSet rs;
			rs = ps.executeQuery();
			if(rs.next()) {
				 commentDto=new comentDto();
				 commentDto.setAid(rs.getInt("aid"));
				 commentDto.setCid(rs.getInt("caid"));
				 commentDto.setComment(rs.getString("ctext"));
				 commentDto.setCreated(rs.getTimestamp("ccreated"));
				 commentDto.setEmail(rs.getString("cemail"));
			}
			return commentDto;
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("findByCid error"+e.getMessage());
			throw new RuntimeException(e.getMessage());
		}
	}
	public void update(comentDto commentDto) {
		String sql = "update coment set ctext=?,ccreated=? where cid=?";
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, commentDto.getComment());
			ps.setTimestamp(2, commentDto.getCreated());
			ps.setInt(3, commentDto.getCid());

		
			ps.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("insert error"+e.getMessage());
			throw new RuntimeException(e.getMessage());
		}
	}
}
