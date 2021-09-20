package board;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import utill.utillService;



public class boardService {
	boardDao boardDao=new boardDao();
	public boardService() {
		// TODO Auto-generated constructor stub
	}
	public Map<String, Object> insertArticle(boardDto boardDto) {
		System.out.print("insertArticle");
		Map<String, Object>resmap=new HashMap<>();

		try {
			confrimInsert(boardDto);
			boardDto.setCreated(utillService.makeToTimetamp(LocalDateTime.now()));
			boardDao.insert(boardDto);
			
			System.out.println("글저장성공");
			resmap.put("flag", true);
			return resmap;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insertArticle"+e.getMessage());
			resmap.put("message",e.getMessage());
			resmap.put("flag", false);
			return resmap;
		}
		
	}
	private void confrimInsert(boardDto boardDto) {
		String message=null;
		if(boardDto.getTitle()==null) {
			message="제목이 공백입니다";
		}else if(boardDto.getText()==null) {
			message="내용이 공백입니다";
		}else if(boardDto.getEmail()==null) {
			message="로그인 후 시도 해주세요";
		}else {
			System.out.println("검증통과");
			return;
		}
		throw new RuntimeException("제목이 공백입니다");
	}
	public List<boardDto> selectAllByPage() {
		System.out.println("selectAllByPage");
		return boardDao.selectPagin(1);
	}
}
