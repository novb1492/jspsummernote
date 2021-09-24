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
	public List<comentDto> findByAid(int aid,int start,int end) {
		System.out.println("findByAid");
		List<comentDto>array=new ArrayList<>();
		String sql = "select * from(select ROW_NUMBER() OVER (ORDER BY cid desc) num, a.* from coment a order by cid desc) where aid=? and num between ? and ?";
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, aid);
			ps.setInt(2, start);
			ps.setInt(3,end);
			ResultSet rs;
			rs = ps.executeQuery();
			while(rs.next()) {
				comentDto commentDto=new comentDto();
				commentDto.setAid(rs.getInt("aid"));
				commentDto.setCid(rs.getInt("cid"));
				commentDto.setComment(rs.getString("text"));
				commentDto.setCreated(rs.getTimestamp("created"));
				commentDto.setEmail(rs.getString("email"));
				array.add(commentDto);
			}
			return array;
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
				 commentDto.setCid(rs.getInt("cid"));
				 commentDto.setComment(rs.getString("text"));
				 commentDto.setCreated(rs.getTimestamp("created"));
				 commentDto.setEmail(rs.getString("email"));
			}
			return commentDto;
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("findByCid error"+e.getMessage());
			throw new RuntimeException(e.getMessage());
		}
	}
	public void update(comentDto commentDto) {
		String sql = "update coment set text=?,created=? where cid=?";
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
