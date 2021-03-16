package com.sysnik.selenium.workspace;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.sysnik.selenium.fw.testBase.TestBase;

public class StringToDate extends TestBase {
public static void main(String[] args) throws ParseException {
	String input = "23/02/2020 00:00:00.0";
	DateFormat inputFormatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss.SSS");
	Date date = inputFormatter.parse(input);

	DateFormat outputFormatter = new SimpleDateFormat("yyyy-MM-dd");
	String output = outputFormatter.format(date); // Output : 01/20/2012
	System.out.println(output+"******************");

}	}
