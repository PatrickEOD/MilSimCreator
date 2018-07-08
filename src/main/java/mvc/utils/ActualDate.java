package mvc.utils;

import java.sql.Timestamp;
import java.time.LocalDateTime;

public class ActualDate {

	public static Timestamp getActualDate() {
		LocalDateTime ldt = LocalDateTime.now();
		return Timestamp.valueOf(ldt);
	}
}
