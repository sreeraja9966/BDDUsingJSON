package com.sysnik.selenium.fw.helper;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;

import com.aventstack.extentreports.ExtentReports;
import com.aventstack.extentreports.ExtentTest;
import com.aventstack.extentreports.MediaEntityBuilder;
import com.aventstack.extentreports.Status;
import com.aventstack.extentreports.reporter.ExtentHtmlReporter;
import com.aventstack.extentreports.reporter.configuration.Theme;
import com.sysnik.selenium.fw.testBase.TestBase;

public class ReportHelper extends TestBase {
    ExtentHtmlReporter htmlReporter;
    static ExtentReports report;
    static ExtentTest logger;
    static ExtentTest child;
    static String nameOfTheReport = null;
    DateHelper dateHelper = new DateHelper();
    private static final Logger log = Logger.getLogger(ReportHelper.class);
    
    public void setReportName(String nameOfTheRepor) {
        nameOfTheReport = nameOfTheRepor;
        log.info("----------->    method called");
        htmlReporter = new ExtentHtmlReporter(relativePath() + "\\Reports/" + nameOfTheReport + ".html");
        report = new ExtentReports();
        report.attachReporter(htmlReporter);
        htmlReporter.config().setDocumentTitle("AUTOMATION REPORT");
        // Name of the report
        htmlReporter.config().setReportName("SYSNIK AUTOMATION REPORT");
        // Dark Theme
        htmlReporter.config().setTheme(Theme.DARK);
    }
    
    public void startTest(String testName) {
        
        logger = report.createTest(testName);
        
    }
    
    public void ChildTest(String testName) {
        log.info("Creating a child test with name " + testName);
        child = logger.createNode(testName);
        
    }
    
    public void writeLogToReport() {
        log.info("Writting log to report");
        report.flush();
    }
    
    public void appendToExstingReport(String path) {
        
        startTest(path);
        log.info(path + "   testcase is appended");
        
    }
    
    public void writeLogInfo(String stepDetails) {
        logger.log(Status.INFO, stepDetails);
    }
    
    public void writeLogInfoInChildTest(String stepDetails) {
        try {
            child.log(Status.INFO, stepDetails);
        } catch (Exception e) {
            log.error(e);
        }
    }
    
    public void writeLogInCaseOfPass(String stepDetails) {
        logger.log(Status.PASS, stepDetails);
    }
    
    public void writeLogInCaseOfPassInChildTest(String stepDetails) {
        child.log(Status.PASS, stepDetails);
    }
    
    public void writeLogInCaseOfFail(String stepDetails) {
        logger.log(Status.FAIL, stepDetails);
    }
    
    public void writeLogInCaseOfFailInChildTest(String stepDetails) {
        child.log(Status.FAIL, stepDetails);
    }
    
    public void writeLogInCaseOfSkip(String stepDetails) {
        logger.log(Status.SKIP, stepDetails);
    }
    
    public void writeLogInCaseOfSkipInChildTest(String stepDetails) {
        child.log(Status.SKIP, stepDetails);
    }
    
    public void endChild() {
        log.info("End of Child");
        report.flush();
        
    }
    
    public void appendChild() {
        log.info("Child appended");
        report.flush();
        
    }
    
    public void endParent() {
        
        report.flush();
        
    }
    
    public void addScreenShotInReport(String name) {
        String destination = null;
        
        //The below method will save the screen shot in d drive with name "screenshot.png"
        log.info("--------->addingScreenShotInReport");
        
        try {
            File scr = ((TakesScreenshot) d).getScreenshotAs(OutputType.FILE);
            
            String date = dateHelper.getSystemDate("yyyy/MM/dd/hh/mm/ss/");
            
            destination = "screenShots/" + date + name + ".png";
            File finalDestination = new File(relativePath() + "\\Reports\\screenShots/" + date + name + ".png");
            FileUtils.copyFile(scr, finalDestination);
        } catch (Exception e) {
            log.error(e);
        }
        
        try {
            logger.log(Status.INFO, "ScreentShot ::" + name + " " + logger.addScreenCaptureFromPath(destination));
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    
    public void addScreenShotInReportInCaseOfChild(String name) {
        String destination = null;
        
        //The below method will save the screen shot in d drive with name "screenshot.png"
        log.info("--------->addingScreenShotInReport");
        
        try {
            File scr = ((TakesScreenshot) d).getScreenshotAs(OutputType.FILE);
            
            log.info(scr);
            
            String date = dateHelper.getSystemDate("yyyy/MM/dd/hh/mm/ss/");
            
            destination = "screenShots/" + date + name + ".png";
            
            File finalDestination = new File(relativePath() + "\\Reports\\screenShots/" + date + name + ".png");
            FileUtils.copyFile(scr, finalDestination);
        } catch (Exception e) {
            log.error(e);
        }
        
        try {
            child.log(Status.INFO, "ScreentShot ::" + name + " " + child.addScreenCaptureFromPath(destination));
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    
    public void addScreenShotInCaseOfFailInReport(String name) {
        String destination = null;
        
        log.info("--------->addingScreenShotInReport");
        
        try {
            File scr = ((TakesScreenshot) d).getScreenshotAs(OutputType.FILE);
            
            String date = dateHelper.getSystemDate("yyyy/MM/dd/hh/mm/ss/");
            
            destination = "screenShots/" + date + name + ".png";
            File finalDestination = new File(relativePath() + "\\Reports\\screenShots/" + date + name + ".png");
            FileUtils.copyFile(scr, finalDestination);
        } catch (Exception e) {
            log.error(e);
        }
        
        try {
            logger.log(Status.FAIL, "ScreentShot ::" + name + " " + logger.addScreenCaptureFromPath(destination));
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    
    public void addScreenShotInCaseOfFailInReportInChild(String name) {
        /*
         * String destination =null; String name2=null; String date=null; //The below method will save the screen shot
         * in d drive with name "screenshot.png" log.info("--------->addingScreenShotInReport");
         * 
         * 
         * 
         * try { File scr = ((TakesScreenshot)d).getScreenshotAs(OutputType.FILE);
         * 
         * 
         * date=seleniumHelper.getSystemDate("yyyy/MM/dd/hh/mm/ss/");
         * 
         * 
         * 
         * name2=seleniumHelper.filterSpleChar(name); destination ="screenShots/"+date+name2+".png"; File
         * finalDestination = new File(relativePath()+"\\Reports\\screenShots/"+date+name2+".png");
         * FileUtils.copyFile(scr, finalDestination); } catch (Exception e) { log.error(e); }
         */
        Base64Image base64Image = new Base64Image();
        try {
            child.log(Status.FAIL, "ScreenShot",
                    MediaEntityBuilder.createScreenCaptureFromBase64String(base64Image.getBase64Image(name)).build());
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
    }
}