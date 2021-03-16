package com.sysnik.selenium.fw.helper;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.YearMonth;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.time.temporal.IsoFields;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebElement;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.fw.testBase.TestBase;

public class DateHelper extends TestBase {
    FindElement findElement = new FindElement();
    ConvertPropertyFileToMap convertPropertyFileToMap = AutomationObjectFactory.getConvertPropertyFileToMapInstance();
    
    public String getSystemTime() {
        DateFormat dateFormat = new SimpleDateFormat("hh:mm:ss");
        Date date = new Date();
        
        return dateFormat.format(date);
    }
    
    public String getSystemTimeWithSplChar() {
        DateFormat dateFormat = new SimpleDateFormat("hh:mm:ss");
        Date date = new Date();
        String reqDate = dateFormat.format(date).replace(":", "");
        return reqDate;
    }
    
    public String getCurrentDay() {
        //Create a Calendar Object
        Calendar calendar = Calendar.getInstance(TimeZone.getDefault());
        
        //Get Current Day as a number
        int todayInt = calendar.get(Calendar.DAY_OF_MONTH);
        System.out.println("Today Int: " + todayInt + "\n");
        
        //Integer to String Conversion
        String todayStr = Integer.toString(todayInt);
        System.out.println("Today Str: " + todayStr + "\n");
        
        return todayStr;
    }
    
    public String getSystemDate(String sampleDateFormat) {
        DateFormat dateFormat = null;
        Date date = null;
        try {
            String date1 = sampleDateFormat.toLowerCase();
            String date2 = null;
            String date3 = null;
            if (date1.contains("mm")) {
                date2 = date1.replace("mm", "MM");
                date3 = date2.replace("m", "M");
                
            }
            dateFormat = new SimpleDateFormat(date3);
            date = new Date();
            
        } catch (Exception e) {
            log.error(e);
        }
        
        return dateFormat.format(date);
    }
    
    public void enterSystemDate(String xpath, String dateFormat) {
        try {
            
            xpath = convertPropertyFileToMap.getPropertyFromMap(xpath, xpathLocatorMap);
            log.info("systemdate-->" + getSystemDate(dateFormat));
            findElement.searchClickableElement(By.xpath(xpath)).sendKeys(getSystemDate(dateFormat));
        } catch (Exception e) {
            log.error(e);
        }
        
    }
    
    public void enterStaticDateForCBSCalender(String xpath) {
        try {
            xpath = convertPropertyFileToMap.getPropertyFromMap(xpath, xpathLocatorMap);
            findElement.searchClickableElement(By.xpath(xpath)).clear();
            findElement.searchClickableElement(By.xpath(xpath)).sendKeys("13" + "Jan" + Keys.ARROW_RIGHT + "2018");
            
        } catch (Exception e) {
            log.error(e);
        }
        
    }
    
    public void enterCurrentDate(String dateEntryLocation, String fulltableLoactor) {
        /**
         * Auto pic the current Day from the calender
         */
        String today = getCurrentDay();
        findElement.searchClickableElement(By.xpath(dateEntryLocation)).click();
        log.info(dateEntryLocation + "----------->clicked");
        WebElement dateWidgetFrom = findElement.searchClickableElement(By.xpath(fulltableLoactor));
        List<WebElement> columns = dateWidgetFrom.findElements(By.tagName("td"));
        for (WebElement cell : columns) {
            if (cell.getText().equals(today)) {
                cell.click();
                break;
            }
        }
        
    }
    
    public String convetDateIntoSpecificFormat(String startDateString) {
        
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        DateTimeFormatter formatter1 = DateTimeFormatter.ofPattern("yyyy/MM/dd");
        DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        log.info(startDateString + "(-----)" + startDateString.charAt(4) + "***********");
        if ("-".equals(startDateString.charAt(4) + "")) {
            return startDateString;
        } else if ("/".equals(startDateString.charAt(4) + "")) {
            return LocalDate.parse(startDateString, formatter1).format(formatter2);
        }
        return LocalDate.parse(startDateString, formatter).format(formatter2);
        
    }
    
    public LocalDate getQuaterDate(String date, int qh) {
        
        LocalDate today = LocalDate.parse(date);
        // get previous quarter
        LocalDate previousQuarter = today.plus(qh, IsoFields.QUARTER_YEARS);
        // get last day in previous quarter
        long lastDayOfQuarter = IsoFields.DAY_OF_QUARTER.rangeRefinedBy(previousQuarter).getMaximum();
        
        // get the date corresponding to the last day of quarter
        return previousQuarter.with(IsoFields.DAY_OF_QUARTER, lastDayOfQuarter);
    }
    
    public Long diffbetweenDatesInMonths(String date1, String date2) {
        long monthsBetween = ChronoUnit.MONTHS.between(YearMonth.from(LocalDate.parse(date1)),
                YearMonth.from(LocalDate.parse(date2)));
        return monthsBetween;
        
    }
    
    public String convertDbDateToDDMMYYYY(String dbDate) {
        String splitedDate = null;
        if (dbDate.contains(":")) {
            splitedDate = dbDate.substring(0, 10);
            
        } else {
            splitedDate = dbDate;
        }
        if (splitedDate.contains("-")) {
            splitedDate = splitedDate.replace("-", "/");
        }
        Date date = null;
        try {
            date = new SimpleDateFormat("yyyy/MM/dd").parse(splitedDate);
        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        String formatter = new SimpleDateFormat("dd/MM/yyyy").format(date);
        return formatter;
        
    }
    
    public String convertDbDateToYYYYMMDD(String dbDate) {
        String splitedDate = null;
        if (dbDate.contains(":")) {
            splitedDate = dbDate.substring(0, 10);
            
        } else {
            splitedDate = dbDate;
        }
        if (splitedDate.contains("-")) {
            splitedDate = splitedDate.replace("-", "/");
        }
        return splitedDate;
        
    }
    
}
