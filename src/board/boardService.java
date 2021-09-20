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
	public List<boardDto> selectAllByPage(int nowPage,HttpServletRequest request) {
		System.out.println("selectAllByPage");
		int totalPage=utillService.getTotalpages(boardDao.getTotalCount(), pagesize);
		int first=0;
		int end=0;
		if(nowPage==1) {
			first=0;
		}else {
			first=(nowPage-1)*pagesize;
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
}
