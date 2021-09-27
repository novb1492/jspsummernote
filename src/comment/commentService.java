package comment;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import enums.StringsEnums;
import utill.utillService;

public class commentService {
	comentDao comentDao=new comentDao();
	private final int maxLength=200;
	private final int pagesize=10;
	private final String imgPath="C:/java_folder/make/WebContent/static/image/";
	private final String flag=StringsEnums.flag.getString();
	public commentService() {
		// TODO Auto-generated constructor stub
	}
	public Map<String, Object> insertComment(comentDto commentDto) {
		System.out.println("insertComment");
		Map<String, Object>map=new HashMap<>();
		try {
			confrimInsert(commentDto);
			commentDto.setCreated(utillService.makeToTimetamp(LocalDateTime.now()));
			comentDao.insert(commentDto);
			System.out.println("댓글 등록 성공");
			map.put(flag, true);
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insertComment error"+e.getMessage());
			map.put(flag, false);
			map.put("message", e.getMessage());
			return map;
		}
	}
	private void confrimInsert(comentDto commentDto) {
		System.out.println("confrimInsert");
		String message=null;
		if(commentDto.getEmail()==null) {
			message="로그인 후 사용 부탁드립니다";
		}else if(commentDto.getComment()==null||commentDto.getComment().length()<=0) {
			message="댓글이 빈칸입니다";
		}else if(commentDto.getComment().length()>maxLength) {
			message="글자수가 "+maxLength+"를 초과합니다";
			System.out.println(commentDto.getComment().length());
		}else {
			System.out.println(commentDto.getComment().length());
			System.out.println("댓글 등록 유효성 통과");
			return;
		}
		throw new RuntimeException(message);
	}
	public Map<String, Object> updateComment(comentDto commentDto) {
		System.out.println("updateComment");
		Map<String, Object>map=new HashMap<>();
		try {
			comentDto orgin=comentDao.findByCid(commentDto.getCid());
			confrimUpdate(commentDto, orgin);
			commentDto.setCreated(utillService.makeToTimetamp(LocalDateTime.now()));
			List<String>originImages=utillService.getImgSrc(orgin.getComment());
			List<String>updateImages=utillService.getImgSrc(commentDto.getComment());
			utillService.deleteImage(originImages, updateImages, imgPath);
			comentDao.update(commentDto);
			map.put(flag, true);
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("updateComment error "+e.getMessage());
			map.put(flag, false);
			map.put("message", e.getMessage());
			return map;
		}
		
	}
	private void confrimUpdate(comentDto comentDto,comentDto oriComentDto) {
		System.out.println("confrimUpdate");
		String message=null;
		if(utillService.checkZero(oriComentDto.getCid())) {
			message="존재하지 않는 댓글입니다";
		}else if(!comentDto.getEmail().equals(oriComentDto.getEmail())) {
			message="작성자가 일치 하지 않습니다";
		}else{
			confrimInsert(comentDto);
			System.out.println("댓글 수정 유효성 통과");
			return;
		}
		throw new RuntimeException(message);
	}
	public int getTotalComentPage(int aid) {
		System.out.println("getTotalComentPage");
		int count=comentDao.countByAid(aid);
		return utillService.getTotalpages(count, pagesize);
	}
}
