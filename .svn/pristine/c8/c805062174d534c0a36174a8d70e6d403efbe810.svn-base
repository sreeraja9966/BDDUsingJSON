package com.sysnik.selenium.stepConfiguraiton;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.fw.helper.AssertionHelper;
import com.sysnik.selenium.fw.helper.CacheHelper;
import com.sysnik.selenium.fw.helper.CommonMethodsForVerifications;
import com.sysnik.selenium.fw.helper.ConvertPropertyFileToMap;
import com.sysnik.selenium.fw.helper.DateHelper;
import com.sysnik.selenium.fw.helper.DbHelper;
import com.sysnik.selenium.fw.helper.DropDownHelper;
import com.sysnik.selenium.fw.helper.FindElement;
import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.fw.helper.RobotHelper;
import com.sysnik.selenium.fw.helper.SeleniumHelper;
import com.sysnik.selenium.fw.helper.WaitingHelper;
import com.sysnik.selenium.fw.testBase.TestBase;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class SavingsAccountSteps extends TestBase {
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    FindElement findElement = AutomationObjectFactory.getFindElementInstance();
    SeleniumHelper seleniumHelper = AutomationObjectFactory.getSeleniumHelperInstance();
    ConvertPropertyFileToMap convertPropertyFileToMap = AutomationObjectFactory.getConvertPropertyFileToMapInstance();
    RobotHelper robotHelper = AutomationObjectFactory.getRobotHelperInstance();
    DropDownHelper dropDownHelper = AutomationObjectFactory.getDropDownHelperInstance();
    AssertionHelper assertionHelper = AutomationObjectFactory.getAssertionHelperInstance();
    CacheHelper cacheHelper = AutomationObjectFactory.getCacheHelperInstance();
    DbHelper dbHelper = AutomationObjectFactory.getDbHelperInstance();
    CommonMethodsForVerifications commonMethodsForVerifications = AutomationObjectFactory
            .getCommonMethodsForVerificationsInstance();
    WaitingHelper waitingHelper = AutomationObjectFactory.getWaitingHelperInstance();
    DateHelper dateHelper = AutomationObjectFactory.getDateHelperInstance();
    
    @Given("^User is on sb account opng screen$")
    public void user_is_on_sb_account_opng_screen() throws Throwable {
        reportHelper.appendToExstingReport("Savings");
        
        seleniumHelper.searchMenu("CASA Account Opening");
        seleniumHelper.clickElement("Menu_CASAAccountOpening");
    }
    
    @Given("^user opnes a \"([^\"]*)\"$")
    public void user_opnes_a(String arg1) throws Throwable {
        reportHelper.ChildTest(arg1);
        
    }
    
    @Given("^user select \"([^\"]*)\" from accType dropdown$")
    public void user_select_from_accType_dropdown(String arg1) throws Throwable {
        Thread.sleep(1500);
        dropDownHelper.SelectUsingVisibleText("DDAcountOpeningScreen_AccountType", arg1);
        Thread.sleep(1500);
    }
    
    @Given("^user select \"([^\"]*)\" from product dropdown$")
    public void user_select_from_product_dropdown(String arg1) throws Throwable {
        dropDownHelper.SelectUsingVisibleText("DDAcountOpeningScreen_ProductName", arg1);
    }
    
    @Given("^user entres \"([^\"]*)\" \"([^\"]*)\"$")
    public void user_entres(String arg1, String arg2) throws Throwable {
        seleniumHelper.enterText("DDAcountOpeningScreen_CustomerNumber", arg2);
        if ("Y".equalsIgnoreCase(arg1)) {
            Thread.sleep(3000);
            commonMethodsForVerifications
                    .verifyAndConfirmModel("The Entered customer is MINOR Do u want to continue !");
            //robotHelper.pressEsc();
        }
        
        Thread.sleep(3000);
    }
    
    @Given("^user select \"([^\"]*)\" from nature of acc dropdown$")
    public void user_select_from_nature_of_acc_dropdown(String arg1) throws Throwable {
        dropDownHelper.SelectUsingVisibleText("DDAcountOpeningScreen_NatureOfAcc", arg1);
    }
    
    @When("^user click on OperatingDetails tab$")
    public void user_click_on_OperatingDetails_tab() throws Throwable {
        seleniumHelper.clickElement("DDAcountOpeningScreen_openingDetailsTab");
    }
    
    @Then("^Verify \"([^\"]*)\" in category field$")
    public void verify_in_category_field(String arg1) throws Throwable {
        assertionHelper.verifyTwoTexts("Verifying Cust cat ", arg1,
                seleniumHelper.getTextFromAnElement("DDAcountOpeningScreen_custCategory"));
    }
    
    @Then("^select \"([^\"]*)\" from oprtInst dropdown$")
    public void select_from_oprtInst_dropdown(String arg1) throws Throwable {
        dropDownHelper.SelectUsingVisibleText("DDAcountOpeningScreen_operatingInstruction", arg1);
    }
    
    @Then("^click on notificationdetails tab$")
    public void click_on_notificationdetails_tab() throws Throwable {
        seleniumHelper.clickElement("DDAcountOpeningScreen_notificationDetailsTab");
    }
    
    @Then("^click on emaiNotificaiton No$")
    public void click_on_emaiNotificaiton_No() throws Throwable {
        seleniumHelper.clickElement("DDAcountOpeningScreen_emailNotificationN");
    }
    
    @Then("^click on smsNotificaioton No$")
    public void click_on_smsNotificaioton_No() throws Throwable {
        seleniumHelper.clickElement("DDAcountOpeningScreen_smsFacilityN");
    }
    
    @When("^user click on submit$")
    public void user_click_on_submit() throws Throwable {
        seleniumHelper.clickElement("DDAcountOpeningScreen_SubmitButton");
        Thread.sleep(6000);
    }
    
    @Then("^user finds \"([^\"]*)\"$")
    public void user_finds(String arg1) throws Throwable {
        commonMethodsForVerifications.verifyAndSubmitModel(arg1);
        
    }
    
}
