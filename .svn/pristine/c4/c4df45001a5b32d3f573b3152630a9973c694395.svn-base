package com.sysnik.selenium.stepConfiguraiton;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.fw.helper.BrowserHelper;
import com.sysnik.selenium.fw.helper.ConvertPropertyFileToMap;
import com.sysnik.selenium.fw.helper.DbHelper;
import com.sysnik.selenium.fw.helper.FindElement;
import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.fw.helper.SeleniumHelper;
import com.sysnik.selenium.fw.helper.WaitingHelper;
import com.sysnik.selenium.fw.testBase.TestBase;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class LoginSteps extends TestBase {
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    FindElement findElement = AutomationObjectFactory.getFindElementInstance();
    SeleniumHelper seleniumHelper = AutomationObjectFactory.getSeleniumHelperInstance();
    ConvertPropertyFileToMap convertPropertyFileToMap = AutomationObjectFactory.getConvertPropertyFileToMapInstance();
    WaitingHelper waitingHelper = AutomationObjectFactory.getWaitingHelperInstance();
    DbHelper dbHelper = AutomationObjectFactory.getDbHelperInstance();
    BrowserHelper browserHelper = AutomationObjectFactory.getBrowserHelperInstance();
    
    //@Given("^Open the chrome and launch the application with \"(.*)\"$")
    @Given("^user open chrome browser with \"([^\"]*)\"$")
    public void with(String arg1) throws Throwable {
        // Write code here that turns the phrase above into concrete actions
        reportHelper.setReportName("BDD");
        dbHelper.connectionEstablishmentWithDb();
        convertPropertyFileToMap.convertToMap(xpathLocatorMap);
        strartBrowser("Chrome");
        reportHelper.appendToExstingReport("Login ");
        reportHelper.ChildTest("Login Verification");
        d.navigate().to(property.getProperty("ApplicationURL"));
        
    }
    
    @When("^Enter \"([^\"]*)\" the \"([^\"]*)\" and \"([^\"]*)\"$")
    public void enter_the_and(String arg1, String arg2, String arg3) throws Throwable {
        // Write code here that turns the phrase above into concrete actions
        //seleniumHelper.enterText("Login_BankCode", property.getProperty("BankCode"));
        seleniumHelper.enterText("Login_userId", property.getProperty("LogInUser"));
        waitingHelper.sleep(3000);
        seleniumHelper.enterText("Login_password", arg3);
        
    }
    
    @Then("^click on login$")
    public void click_on_login() throws Throwable {
        seleniumHelper.clickElement("Login_loginButton");
        waitingHelper.sleep(3000);
        browserHelper.switchToNewWindow();
        browserHelper.maximize();
    }
}
