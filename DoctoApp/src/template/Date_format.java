package template;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Date_format {

	public static String tareek() {
		
		Date d = new Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		
		return df.format(d);
	}
	
}
