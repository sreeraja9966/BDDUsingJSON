package com.sysnik.selenium.workspace;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;

public class DatePlusDays {
	/*
	 * private static final String DATE_FORMAT = "yyyy/MM/dd HH:mm:ss"; private
	 * static final DateFormat dateFormat = new SimpleDateFormat(DATE_FORMAT);
	 * private static final DateTimeFormatter dateFormat8 =
	 * DateTimeFormatter.ofPattern(DATE_FORMAT);
	 */
    public static void main(String[] args) {
		/*
		 * // Get current date Date currentDate = new Date();
		 * System.out.println("date : " + dateFormat.format(currentDate));
		 * 
		 * // convert date to localdatetime LocalDateTime localDateTime =
		 * currentDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime();
		 * System.out.println("localDateTime : " + dateFormat8.format(localDateTime));
		 * 
		 * // plus one localDateTime = localDateTime.plusMonths(12).plusDays(1); //
		 * localDateTime =
		 * localDateTime.plusHours(1).plusMinutes(2).minusMinutes(1).plusSeconds(1);
		 * 
		 * // convert LocalDateTime to date Date currentDatePlusOneDay =
		 * Date.from(localDateTime.atZone(ZoneId.systemDefault()).toInstant());
		 * 
		 * System.out.println("\nOutput : " + dateFormat.format(currentDatePlusOneDay));
		 */
    	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String presentdate = "2020-02-20";
		//presentdate=dateHelper.convetDateIntoSpecificFormat(presentdate);
		LocalDate date = LocalDate.parse(presentdate,formatter);

		LocalDate reqDate = date.plusMonths(12);
		reqDate = reqDate.plusDays(0);
		System.out.println(reqDate);
    	
		String date1="2020-03-31";
		LocalDate futureDate = LocalDate.parse(date1).plusDays(5);
    	
    	
    	System.out.println(futureDate+"futureDatefutureDatefutureDatefutureDate");
    	
    	
    	
    	
    }


}
