package comment;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import utill.utillService;

public class commentService {
	commentDao commentDao=new commentDao();
	private final int maxLength=200;
	public commentService() {
		// TODO Auto-generated constructor stub
	}
	public Map<String, Object> insertComment(commentDto commentDto) {
		System.out.println("insertComment");
		Map<String, Object>map=new HashMap<>();
		try {
			confrimInsert(commentDto);
			commentDto.setCreated(utillService.makeToTimetamp(LocalDateTime.now()));
			commentDao.insert(commentDto);
			System.out.println("댓글 등록 성공");
			map.put("flag", true);
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insertComment error"+e.getMessage());
			map.put("flag", false);
			map.put("message", e.getMessage());
			return map;
		}
	}
	private void confrimInsert(commentDto commentDto) {
		System.out.println("confrimInsert");
		String message=null;
		if(commentDto.getEmail()==null) {
			message="로그인 후 사용 부탁드립니다";
		}else if(commentDto.getComment()==null||commentDto.getComment().length()<=0) {
			message="댓글이 빈칸입니다";
		}else if(commentDto.getComment().length()>maxLength) {
			message="글자수가 "+maxLength+"를 초과합니다";
		}else {
			System.out.println("댓글 등록 유효성 통과");
			return;
		}
		throw new RuntimeException(message);
	}
	public List<commentDto> selectByAid(int aid) {
		System.out.println("selectByAid");
		try {
			return  commentDao.findByAid(aid, 0, 10);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("댓글 불러오기 실패");
		}
	}
}
