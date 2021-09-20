package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;



public class boardDao {
	private Connection conn;
	public boardDao() {
		try{
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "kim";
			String password = "1111";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url,user,password);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public void insert(boardDto boardDto) {
		
		String sql = "INSERT INTO article VALUES(articleid.NEXTVAL,?,?,?,?,?)";
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
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
	public List<boardDto> selectPagin(int first,int end) {
		System.out.println("selectPagin"+first+" "+end );
		
		List<boardDto>array=new ArrayList<>();
		String sql = "select * from(select ROW_NUMBER() OVER (ORDER BY aid desc) num, a.* from article a order by aid desc) where num between ? and ?";
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, first);
			ps.setInt(2,end);
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
	public int getTotalCount() {
		System.out.println("selectPagin");
		String sql = "select count(*) from article";
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs;
			rs = ps.executeQuery();
			rs.next();
			return rs.getInt(1);
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("insert error"+e.getMessage());
			throw new RuntimeException(e.getMessage());
		}
	}
	public boardDto findByAid(int aid) {
		System.out.println("findByAid");
		boardDto boardDto=new boardDto();
		String sql = "select * from article where aid=?";
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, aid);
			ResultSet rs;
			rs = ps.executeQuery();
			if(rs.next()) {
				boardDto.setEmail(rs.getString("email"));
				boardDto.setHit(rs.getInt("hit"));
				boardDto.setText(rs.getString("text"));
				boardDto.setTitle(rs.getString("title"));
				boardDto.setId(rs.getInt("aid"));
				boardDto.setCreated(rs.getTimestamp("created"));
			}
			return boardDto;
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("findByAid error"+e.getMessage());
			throw new RuntimeException("게시글 찾기에 실패했습니다");
		}
	}
	public void plusHit(int aid,int plusHit) {
		System.out.println("findByAid");
	
		String sql = "update article set hit=? where aid=?";
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1,plusHit);
			ps.setInt(2, aid);
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("findByAid error"+e.getMessage());
			throw new RuntimeException("조회수 반영 실패");
		}
	}
}
