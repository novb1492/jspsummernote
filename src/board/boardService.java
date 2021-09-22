package board;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utill.utillService;



public class boardService {
	private	boardDao boardDao=new boardDao();
	private final int pagesize=10;
	private final int titleLength=50;
	private final int textLength=1000;
	
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
		String title=boardDto.getTitle();
		String text=boardDto.getText();
		if(title==null) {
			message="제목이 공백입니다";
		}else if(text==null) {
			message="내용이 공백입니다";
		}else if(boardDto.getEmail()==null) {
			message="로그인 후 시도 해주세요";
		}else if(title.length()>titleLength) {
			message="제목은 최대 "+titleLength+"글자 입니다 현제 :"+title.length()+"글자";
		}else if(text.length()>textLength) {
			message="제목은 최대 "+textLength+"글자 입니다 현제 :"+text.length()+"글자";
		}else {
			System.out.println("검증통과");
			return;
		}
		throw new RuntimeException(message);
	}
	public List<boardDto> selectAllByPage(int nowPage,HttpServletRequest request) {
		System.out.println("selectAllByPage");
		int totalPage=utillService.getTotalpages(boardDao.getTotalCount(), pagesize);
		int first=0;
		int end=0;
		if(nowPage==1) {
			first=0;
		}else {
			first=(nowPage-1)*pagesize+1;
		}
		end=first+pagesize;
		HttpSession httpSession=request.getSession();
		httpSession.setAttribute("totalPage", totalPage);
		return boardDao.selectPagin(first,end);
	}
	public Map<String, Object> selectAritcle(int aid) {
		System.out.println("selectAritcle");
		Map<String, Object>map=new HashMap<>();
		try {
			boardDto boardDto=boardDao.findByAid(aid);
			int plusHit=boardDto.getHit()+1;
			boardDao.plusHit(aid, plusHit);
			boardDto.setHit(plusHit);
			map.put("flag", true);
			map.put("dto", boardDto);
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("selectAritcle error"+e.getMessage());
			map.put("flag",false);
			map.put("messsage",  e.getMessage());
			return map;
		}
	}
	public Map<String, Object> updateArticle(boardDto boardDto) {
		System.out.println("updateArticle");
		Map<String, Object>map=new HashMap<>();
		boardDto originDto=boardDao.findByAid(boardDto.getId());
		try {
			confrimUpdate(originDto, boardDto);
			boardDto.setCreated(utillService.makeToTimetamp(LocalDateTime.now()));
			boardDao.update(boardDto);
			map.put("flag", true);
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("updateArticle error"+e.getMessage());
			map.put("flag", false);
			map.put("message", e.getMessage());
			return map;
		}
		
	}
	private void confrimUpdate(boardDto originDto,boardDto boardDto) {
		System.out.println("confrimUpdate");
		String message=null;
		if(originDto==null) {
			message="존재하지 않는 게시글 입니다";
		}else if(!originDto.getEmail().equals(boardDto.getEmail())) {
			message="작성자가 일치 하지 않습니다";
		}else {
			confrimInsert(boardDto);
			System.out.println("글수정 유효성 통과");
			return;
		}
		throw new RuntimeException(message);
	}
}
