package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import comment.comentDto;
import enums.StringsEnums;



public class boardDao {
	private Connection conn;
	public boardDao() {
		try{
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "kim";
			String password = "1111";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url,user,password);
		}catch(Exception e){
			e.printStackTrace();
			throw new RuntimeException("db 접속실패");
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
		String sql = null;
		List<boardDto>array=new ArrayList<>();
		sql = "select b.*,(select count(*) from article)totalcount from(select ROW_NUMBER() OVER (ORDER BY aid desc)  num, a.* from article a ) b where num between ? and ?";
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, first);
			ps.setInt(2,end);
			ResultSet rs;
			rs = ps.executeQuery();
			while(rs.next()) {
				boardDto boardDto=new boardDto();
				boardDto.setEmail(rs.getString("aemail"));
				boardDto.setHit(rs.getInt("hit"));
				boardDto.setText(rs.getString("atext"));
				boardDto.setTitle(rs.getString("title"));
				boardDto.setId(rs.getInt("aid"));
				boardDto.setCreated(rs.getTimestamp("acreated"));
				boardDto.setTotalCount(rs.getInt("TOTALCOUNT"));
				array.add(boardDto);
			}
			return array;
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("insert error"+e.getMessage());
			throw new RuntimeException(e.getMessage());
		}
	}
	public List<boardDto> selectPagin(int first,int end,String title) {
		System.out.println("selectPagin"+first+" "+end );
		String sql = null;
		List<boardDto>array=new ArrayList<>();
		sql = "select b.*,(select count(*) from article where title like ?)totalcount from(select ROW_NUMBER() OVER (ORDER BY aid desc)  num, a.* from article a ) b where  title like ? and num between ? and ?";
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "%"+title+"%");
			ps.setString(2, "%"+title+"%");
			ps.setInt(3, first);
			ps.setInt(4,end);
			ResultSet rs= ps.executeQuery();
			while(rs.next()) {
				boardDto boardDto=new boardDto();
				boardDto.setEmail(rs.getString("aemail"));
				boardDto.setHit(rs.getInt("hit"));
				boardDto.setText(rs.getString("atext"));
				boardDto.setTitle(rs.getString("title"));
				boardDto.setId(rs.getInt("aid"));
				boardDto.setCreated(rs.getTimestamp("acreated"));
				boardDto.setTotalCount(rs.getInt("totalcount"));
				array.add(boardDto);
			}
			return array;
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("insert error"+e.getMessage());
			throw new RuntimeException(e.getMessage());
		}
	}
	public Map<String, Object> findByAidJoinComment(int aid,int start,int end) {
		System.out.println("findByAidJoinComment");
		Map<String, Object>map=new HashMap<>();
		boardDto boardDto=new boardDto();
		List<comentDto>comentDtos=new ArrayList<>();
		String sql = "select a.*,c.*,(select count(*) from coment where caid=?)totalcount from article a left join (select * from(select ROW_NUMBER() OVER (ORDER BY cid desc ) num, a.* from coment a ) where num between ? and ?) c on a.aid=c.caid where a.aid=?";
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, aid);
			ps.setInt(2, start);
			ps.setInt(3, end);
			ps.setInt(4, aid);
			ResultSet rs;
			rs = ps.executeQuery();
			boolean temp=true;
			while(rs.next()) {
				if(temp) {
					boardDto.setEmail(rs.getString("aemail"));
					boardDto.setHit(rs.getInt("hit"));
					boardDto.setText(rs.getString("atext"));
					boardDto.setTitle(rs.getString("title"));
					boardDto.setId(rs.getInt("aid"));
					boardDto.setCreated(rs.getTimestamp("acreated"));
					map.put(StringsEnums.article.getString(), boardDto);
					System.out.println("게시글 map 넣음");
					temp=false;
				}
				
				comentDto comentDto=new comentDto();
				comentDto.setAid(rs.getInt("caid"));
				comentDto.setCid(rs.getInt("cid"));
				comentDto.setComment(rs.getString("ctext"));
				comentDto.setCreated(rs.getTimestamp("ccreated"));
				comentDto.setEmail(rs.getString("cemail"));
				comentDto.setTotalCount(rs.getInt("totalcount"));
				comentDtos.add(comentDto);
			}
			map.put(StringsEnums.coment.getString(), comentDtos);
			return map;
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("findByAidJoinComment error"+e.getMessage());
			throw new RuntimeException("게시글 찾기에 실패했습니다");
		}
	}
	public void plusHit(int aid,int plusHit) {
		System.out.println("plusHit");
	
		String sql = "update article set hit=? where aid=?";
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1,plusHit);
			ps.setInt(2, aid);
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("plusHit error"+e.getMessage());
			throw new RuntimeException("조회수 반영 실패");
		}
	}
	public void update(boardDto boardDto) {
		
		String sql = "update article set title=?,atext=?,acreated=? where aid=?";
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, boardDto.getTitle());
			ps.setString(2, boardDto.getText());
			ps.setTimestamp(3, boardDto.getCreated());
			ps.setInt(4, boardDto.getId());
		
			ps.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("update error"+e.getMessage());
			throw new RuntimeException("글 테이블 수정 실패");
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
				System.out.println(rs.getString("title"));
				boardDto.setEmail(rs.getString("aemail"));
				boardDto.setHit(rs.getInt("hit"));
				boardDto.setText(rs.getString("atext"));
				boardDto.setTitle(rs.getString("title"));
				boardDto.setId(rs.getInt("aid"));
				boardDto.setCreated(rs.getTimestamp("acreated"));
			}
			return boardDto;
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("findByAid error"+e.getMessage());
			throw new RuntimeException("게시글 찾기에 실패했습니다");
		}
	}
	public void deleteByAid(int aid) {
		
		String sql = "delete from article where aid=?";
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, aid);
		
			ps.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("deleteByAid error"+e.getMessage());
			throw new RuntimeException("글 테이블 삭제 실패");
		}
	}
}
