package utill;

import java.io.File;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import enums.StringsEnums;

public class utillService {
	
	
	
	public static Timestamp makeToTimetamp(LocalDateTime localDateTime) {
		return Timestamp.valueOf(localDateTime);
	}
    public static int getTotalpages(int totalCount,int pagesize) {
        System.out.println("getTotalpages");
        int totalpage=0;
        totalpage=totalCount/pagesize;
        if(totalCount%pagesize>0){
            totalpage++;
        }
        System.out.println(totalpage+"전체페이지");
        if(totalpage==0){
            totalpage=1;
        }
        System.out.println(totalpage+" 전체 페이지");
        return totalpage;
    }
    public static List<String> getImgSrc(String text) {
    	System.out.println("getImgSrc");
    	List<String>array=new ArrayList<>();
    	Pattern nonValidPattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");
		Matcher matcher = nonValidPattern.matcher(text);
		while (matcher.find()) {
			array.add(matcher.group(1));
		}
		return array;
	}
    public static void deletefile(String path) {
    	System.out.println("deletefile");
    	System.out.println("삭제 경로 "+path);
    	File file = new File(path);
    	if( file.exists() ){ 
    		if(file.delete()){ 
    			System.out.println("파일삭제 성공"); 
    		}else{ 
    			System.out.println("파일삭제 실패"); 
    		} 
    	}else{ 
    	System.out.println("파일이 존재하지 않습니다."); 
    	} 
	}
    public static Map<String, Integer> getPagingStartEnd(int nowPage,int pagesize) {
    	int start=0;
    	Map<String, Integer>map=new HashMap<>();
    	if(nowPage!=1) {
    		start=(nowPage-1)*pagesize+1;
		}
		map.put(StringsEnums.start.getString(), start);
		map.put(StringsEnums.end.getString(), start+pagesize);
		return map;
	}
}
