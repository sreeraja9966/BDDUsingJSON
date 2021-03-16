package com.sysnik.selenium.workspace;

import java.time.LocalDate;
import java.time.YearMonth;
import java.time.temporal.ChronoUnit;
import java.time.temporal.IsoFields;

public class QuaterDate {
public static void main(String[] args) {

LocalDate today = LocalDate.parse("2020-03-31");
// get previous quarter
LocalDate previousQuarter = today.plus(0, IsoFields.QUARTER_YEARS);
// get last day in previous quarter
long lastDayOfQuarter = IsoFields.DAY_OF_QUARTER.rangeRefinedBy(previousQuarter).getMaximum();

// get the date corresponding to the last day of quarter
LocalDate lastDayInPreviousQuarter = previousQuarter.with(IsoFields.DAY_OF_QUARTER, lastDayOfQuarter);
System.out.println(lastDayInPreviousQuarter);
long monthsBetween = ChronoUnit.MONTHS.between(
	     YearMonth.from(LocalDate.parse("2016-08-31")), 
	     YearMonth.from(LocalDate.parse("2016-11-30")));
	System.out.println(monthsBetween); //3
}
}
