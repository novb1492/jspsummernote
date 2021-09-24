package comment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import board.boardDto;

public class commentDao {
	private Connection conn;
	public commentDao() {
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
	public void insert(commentDto commentDto) {
			
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
	public List<commentDto> findByAid(int aid,int first,int end) {
		System.out.println("findByAid");
		List<commentDto>array=new ArrayList<>();
		String sql = "select * from(select ROW_NUMBER() OVER (ORDER BY cid desc) num, a.* from coment a order by cid desc) where aid=? and num between 0 and 10";
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, aid);
			//ps.setInt(1, first);
			//ps.setInt(2,end);
			ResultSet rs;
			rs = ps.executeQuery();
			while(rs.next()) {
				commentDto commentDto=new commentDto();
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
}
