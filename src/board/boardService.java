package board;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import enums.StringsEnums;
import utill.utillService;



public class boardService {
	private	boardDao boardDao=new boardDao();
	private final int pagesize=10;
	private final int comentPagesize=10;
	private final int titleLength=50;
	private final int textLength=1000;
	private final String imgPath="C:/java_folder/make/WebContent/static/image/";
	private final String flag=StringsEnums.flag.getString();
	private final String start=StringsEnums.start.getString();
	private final String end=StringsEnums.end.getString();
	private final String article=StringsEnums.article.getString();
	private final String coments=StringsEnums.coment.getString();
	
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
			resmap.put(flag, true);
			return resmap;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insertArticle"+e.getMessage());
			resmap.put("message",e.getMessage());
			resmap.put(flag, false);
			return resmap;
		}
		
	}
	private void confrimInsert(boardDto boardDto) {
		String message=null;
		String title=boardDto.getTitle();
		String text=boardDto.getText();
		if(title==null||title.length()<=0) {
			message="제목이 공백입니다";
		}else if(text==null||text.length()<=0) {
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
		Map<String, Integer>map=utillService.getPagingStartEnd(nowPage, pagesize);
		HttpSession httpSession=request.getSession();
		httpSession.setAttribute("totalPage", totalPage);
		return boardDao.selectPagin( map.get(StringsEnums.start.getString()), map.get(StringsEnums.end.getString()));
	}
	public Map<String, Object> selectAritcleJoinComent(int aid,int nowPage) {
		System.out.println("selectAritcle");
		Map<String, Object>map=new HashMap<>();
		try {
			Map<String, Integer>map2=utillService.getPagingStartEnd(nowPage, comentPagesize);
			Map<String, Object>map3=boardDao.findByAidJoinComment(aid,map2.get(start),map2.get(end));
			boardDto boardDto=(boardDto)map3.get(article);
			if(boardDto==null) {
				System.out.println("존재하지 않는 게시글");
				throw new RuntimeException("존재하지 않는 게시글");
			}
			int plusHit=boardDto.getHit()+1;
			boardDao.plusHit(aid, plusHit);
			boardDto.setHit(plusHit);
			map.put(flag, true);
			map.put(article, boardDto);
			map.put(coments, map3.get(coments));
			System.out.println("전송");
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("selectAritcle error"+e.getMessage());
			map.put(flag,false);
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
			List<String>originImage=utillService.getImgSrc(originDto.getText());
			List<String>dtoImages=utillService.getImgSrc(boardDto.getText());
			utillService.deleteImage(originImage, dtoImages,imgPath);
			boardDao.update(boardDto);
			map.put(flag, true);
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("updateArticle error"+e.getMessage());
			map.put(flag, false);
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
	public Map<String, Object> deleteArticle(int aid,String email) {
		System.out.println("deleteArticle");
		Map<String, Object>map=new HashMap<>();
		boardDto boardDto=boardDao.findByAid(aid);
		try {
			deleteConfrim(boardDto, email);
			String text=boardDto.getText();
			List<String>imgs=utillService.getImgSrc(text);
			if(!imgs.isEmpty()) {
				System.out.println("이미지가 존재하는 게시물 이미지 삭제시도");
				for(String s:imgs) {
					deleteImage(s);
				}
			}
			boardDao.deleteByAid(aid);
			map.put(flag, true);
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("deleteArticle error"+e.getMessage());
			map.put(flag, false);
			map.put("message", e.getMessage());
			return map;
		}
		
	}
	private void deleteImage(String imagePath) {
		System.out.println("deleteImage");
		String[] splite=imagePath.split("/");
		String	 fileName=splite[3];
		System.out.println(fileName+" 이미지");
		utillService.deletefile(imgPath+fileName);
	}
	private void deleteConfrim(boardDto boardDto,String email) {
		System.out.println("deleteConfrim");
		String message=null;
		if(boardDto==null) {
			message="존재하지 않는 게시물입니다";
		}else if(!boardDto.getEmail().equals(email)) {
			message="작성자가 일치 하지 않습니다";
		}else {
			System.out.println("삭제 유효성 통과");
			return;
		}
		throw new RuntimeException(message);
	}

}
