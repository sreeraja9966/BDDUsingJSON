package com.sysnik.selenium.stepConfiguraiton;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.apiActions.LogoutUserApi;
import com.sysnik.selenium.fw.helper.EmailHelper;
import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.fw.helper.WaitingHelper;
import com.sysnik.selenium.fw.testBase.TestBase;

import cucumber.api.java.en.Given;

public class TearUpStepConfig extends TestBase {
    LogoutUserApi logoutUserApi = new LogoutUserApi();
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    WaitingHelper waitingHelper = AutomationObjectFactory.getWaitingHelperInstance();
    EmailHelper emailHelper=AutomationObjectFactory.getEmailHelperInstance();
    
    @Given("^User Should get logoutFrom Cbs application$")
    public void user_Should_get_logoutFrom_Cbs_application() throws Throwable {
        
        logoutUserApi.logOutUserApiCall();
        waitingHelper.sleep(3000);
        reportHelper.writeLogInCaseOfPassInChildTest("UserLoged Out");
       // emailHelper.sendReport("qateam@sysnik.com,tl@sysnik.com, dev@sysnik.com, uiux@sysnik.com, managers@sysnik.com", "BDD", "");
    }
    
}
