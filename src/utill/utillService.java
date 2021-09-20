package utill;

import java.sql.Timestamp;
import java.time.LocalDateTime;

public class utillService {
	
	public static LocalDateTime getNow() {
		return LocalDateTime.now();
	}
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
    public static int getFirst(int page,int pagesize) {
        return (page-1)*pagesize+1;
    }
    public static int getEnd(int fisrt,int pagesize) {
        return fisrt+pagesize-1;
    }
}
