package com.sysnik.selenium.stepConfiguraiton;

import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.fw.testBase.TestBase;

import cucumber.api.java.After;

public class Hooks extends TestBase {
    
    ReportHelper reportHelper = new ReportHelper();
    
    @After("~@setUp")
    public void endChild() {
        log.info("**********Log Check*************");
        reportHelper.endChild();
        reportHelper.appendChild();
        reportHelper.writeLogToReport();
    }
    
}
