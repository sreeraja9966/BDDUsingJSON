package com.sysnik.selenium.stepConfiguraiton;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.fw.helper.AssertionHelper;
import com.sysnik.selenium.fw.helper.CacheHelper;
import com.sysnik.selenium.fw.helper.CommonMethodsForVerifications;
import com.sysnik.selenium.fw.helper.ConvertPropertyFileToMap;
import com.sysnik.selenium.fw.helper.DbHelper;
import com.sysnik.selenium.fw.helper.DropDownHelper;
import com.sysnik.selenium.fw.helper.FindElement;
import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.fw.helper.RobotHelper;
import com.sysnik.selenium.fw.helper.SeleniumHelper;
import com.sysnik.selenium.fw.helper.WaitingHelper;
import com.sysnik.selenium.fw.testBase.TestBase;

import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class MarkLastInventoryDefnitions extends TestBase {
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
    
    @When("^user select \"([^\"]*)\" from StartNumber dropdown on Lost screen$")
    public void user_select_from_StartNumber_dropdown_on_Lost_screen(String arg1) throws Throwable {
        dropDownHelper.SelectUsingVisibleText("MarkLostInventory_startNo", arg1);
    }
    
    @When("^user select \"([^\"]*)\" from End Number dropdown on Lost screen$")
    public void user_select_from_End_Number_dropdown_on_Lost_screen(String arg1) throws Throwable {
        dropDownHelper.SelectUsingVisibleText("MarkLostInventory_endNumber", arg1);
    }
    
    @When("^user entres \"([^\"]*)\" enter remark on Lost screen$")
    public void user_entres_enter_remark_on_Lost_screen(String arg1) throws Throwable {
        seleniumHelper.enterText("MarkLostInventory_remark", arg1);
    }
    
    @When("^user click on submit button on Lost screen$")
    public void user_click_on_submit_button_on_Lost_screen() throws Throwable {
        seleniumHelper.clickElement("MarkLostInventory_submit");
        waitingHelper.sleep(3000);
    }
    
    @When("^user select Authorize checkbox from available record on Lost Auth screen$")
    public void user_select_Authorize_checkbox_from_available_record_on_Lost_Auth_screen() throws Throwable {
        seleniumHelper.clickElement("MarkLostInventoryAuth_checkBox");
        waitingHelper.sleep(1200);
    }
    
    @When("^user click on Authorize on Mark Lost Auth screen$")
    public void user_click_on_Authorize_on_Mark_Lost_Auth_screen() throws Throwable {
        seleniumHelper.clickElement("MarkLostInventoryAuth_AuthButton");
        waitingHelper.sleep(3200);
    }
    
    @When("^user click on Rejection on Mark Lost Auth screen$")
    public void user_click_on_Rejection_on_Mark_Lost_Auth_screen() throws Throwable {
        seleniumHelper.clickElement("MarkLostInventoryAuth_RejectButton");
        waitingHelper.sleep(3200);
    }
    
    @Then("^Verify \"([^\"]*)\" on Instrument Type filed on Mark Lost Inventory$")
    public void verify_on_Instrument_Type_filed(String arg1) throws Throwable {
        waitingHelper.sleep(8000);
        assertionHelper.verifyTwoTexts("Verifying Instrument Field on UI",
                seleniumHelper.getTextFromAnElement("MarkLostInventoryAuthorization_InstrType"), arg1);
    }
    
    @Then("^Verify \"([^\"]*)\" in Inventry Branch Wise filed on Mark Lost Inventory$")
    public void verify_in_Inventry_Branch_Wise_filed(String arg1) throws Throwable {
        assertionHelper.verifyTwoTexts("Verifying Inventry Type Field on UI",
                seleniumHelper.getTextFromAnElement("MarkLostInventoryAuthorization_InventryBranchWise"), arg1);
    }
    
    @Then("^Verify Batch No in Batch Number filed\"([^\"]*)\" on Mark Lost Inventory$")
    public void verify_Batch_No_in_Batch_Number_filed(String arg1) throws Throwable {
        assertionHelper.verifyTwoTexts("Verifying Batch Number Field on UI",
                seleniumHelper.getTextFromAnElement("MarkLostInventoryAuthorization_BatchNo"),
                cacheHelper.getCache(arg1, cacheData));
    }
    
    @Then("^Verify \"([^\"]*)\" in Quantity Of Book filed on Mark Lost Inventory$")
    public void verify_in_Quantity_Of_Book_filed(String arg1) throws Throwable {
        assertionHelper.verifyTwoTexts("Verifying Quantity Of Book  Field on UI",
                seleniumHelper.getTextFromAnElement("MarkLostInventoryAuthorization_QuantofBooks"), arg1);
    }
    
    @Then("^Verify \"([^\"]*)\" in Number of Instrument  filed on Mark Lost Inventory$")
    public void verify_in_Number_of_Instrument_filed(String arg1) throws Throwable {
        assertionHelper.verifyTwoTexts("Verifying  Number of Instrument  Field on UI",
                seleniumHelper.getTextFromAnElement("MarkLostInventoryAuthorization_NoofInstrum"), arg1);
    }
    
    @Then("^Verify \"([^\"]*)\" in Prefix filed on Mark Lost Inventory$")
    public void verify_in_Prefix_filed(String arg1) throws Throwable {
        assertionHelper.verifyTwoTexts("Verifying  Prefix  Field on UI",
                seleniumHelper.getTextFromAnElement("MarkLostInventoryAuthorization_Prefix"), arg1);
    }
    
    @Then("^Verify \"([^\"]*)\" in Sufix filed on Mark Lost Inventory$")
    public void verify_in_Sufix_filed(String arg1) throws Throwable {
        assertionHelper.verifyTwoTexts("Verifying  Sufix on UI",
                seleniumHelper.getTextFromAnElement("MarkLostInventoryAuthorization_Sufix"), arg1);
    }
    
    @Then("^Verify \"([^\"]*)\" in Start Number filed on Mark Lost Inventory$")
    public void verify_in_Start_Number_filed(String arg1) throws Throwable {
        assertionHelper.verifyTwoTexts("Verifying  Start Number  Field on UI",
                seleniumHelper.getTextFromAnElement("MarkLostInventoryAuthorization_StartNo"), arg1);
    }
    
    @Then("^Verify \"([^\"]*)\" in End Number filed on Mark Lost Inventory$")
    public void verify_in_End_Number_filed(String arg1) throws Throwable {
        assertionHelper.verifyTwoTexts("Verifying End Number Field on UI",
                seleniumHelper.getTextFromAnElement("MarkLostInventoryAuthorization_EndNo"), arg1);
    }
    
    @Then("^Verify \"([^\"]*)\" in Remarks filed on Mark Lost Inventory$")
    public void verify_in_Remarks_filed(String arg1) throws Throwable {
        assertionHelper.verifyTwoTexts("Verifying Remarks Field on UI",
                seleniumHelper.getTextFromAnElement("MarkLostInventoryAuthorization_Remarks"), arg1);
    }
    
}
