package com.sysnik.selenium.fw.helper;

import org.apache.log4j.Logger;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.fw.testBase.TestBase;

public class FindElement extends TestBase {
    private static final Logger logger = Logger.getLogger(FindElement.class);
    
    WaitingHelper waitingHelper = AutomationObjectFactory.getWaitingHelperInstance();
    JsWaiter jsWaiter = AutomationObjectFactory.getJsWaiterInstance();
    
    public WebElement searchClickableElement(By xpath) {
        ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
        try {
            /*
             * jsWaiter.setDriver(d); jsWaiter.waitAllRequest();
             */
            
        } catch (Exception e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }
        try {
            log.info("In searchClickableElement Method");
            if (isElementPresent(xpath)) {
                return d.findElement(xpath);
            } else {
                reportHelper.writeLogInCaseOfFailInChildTest("ELEMENT NOT FOUND" + xpath);
                reportHelper.addScreenShotInCaseOfFailInReportInChild("ELEMENT NOT FOUND" + xpath);
            }
        } catch (Exception e) {
            log.error(e);
            reportHelper.writeLogInCaseOfFailInChildTest("ELEMENT NOT FOUND" + xpath);
            reportHelper.addScreenShotInCaseOfFailInReportInChild("ELEMENT NOT FOUND" + xpath);
        }
        return null;
    }
    
    public boolean isElementPresent(By element) {
        
        try {
            log.info("In try block of isELement Present");
            return waitingHelper.waitForElementVisible(element, 3, 10);
        } catch (Exception e) {
            
            e.printStackTrace();
            return false;
        }
    }
    
}
