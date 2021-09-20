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
}
