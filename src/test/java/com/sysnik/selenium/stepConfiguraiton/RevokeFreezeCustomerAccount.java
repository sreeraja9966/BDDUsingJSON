package com.sysnik.selenium.stepConfiguraiton;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.CustomerMasterEntity;
import com.sysnik.selenium.entity.FreezeDetailsEntity;
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

import cucumber.api.java.en.Then;

public class RevokeFreezeCustomerAccount extends TestBase {
    
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
    
    private CustomerMasterEntity custMaster;
    private FreezeDetailsEntity freezeDetails;
    
    @Then("^setup Revoke Freeze Customer Screen$")
    public void setup_Revoke_Freeze_Customer_Screen() throws Throwable {
        dbHelper.executeQuery("UPDATE FREEZE_DETAILS SET FREEZE_STATUS='A' where FREEZE_STATUS='D' AND FREEZE_BY=555");
        dbHelper.executeQuery("UPDATE FREEZE_DETAILS SET FREEZE_STATUS='A' where FREEZE_STATUS='K' AND FREEZE_BY=555");
    }
    
    @Then("^setup Revoke Freeze Customer Account Screen$")
    public void setup_Revoke_Freeze_Customer_Account_Screen() throws Throwable {
        dbHelper.executeQuery("UPDATE FREEZE_DETAILS SET FREEZE_STATUS='A' where FREEZE_STATUS='D' AND FREEZE_BY=555");
        dbHelper.executeQuery("UPDATE FREEZE_DETAILS SET FREEZE_STATUS='A' where FREEZE_STATUS='K' AND FREEZE_BY=555");
    }
    
    @Then("^user enters customer number \"([^\"]*)\" on Revoke Freeze Customer Screen$")
    public void user_enters_customer_number_on_Revoke_Freeze_Customer_Screen(String arg1) throws Throwable {
        seleniumHelper.enterText("RevokeFreezeCustomerAccountScreen_custNumber", arg1);
    }
    
    @Then("^user select batch number \"([^\"]*)\" from dropdown of Revoke Freeze Customer Screen$")
    public void user_select_batch_number_from_dropdown_of_Revoke_Freeze_Customer_Screen(String arg1) throws Throwable {
        dropDownHelper.SelectUsingVisibleText("RevokeFreezeCustomerAccountScreen_batchNumber", arg1);
    }
    
    @Then("^user click on authorize button of Revoke Freeze Customer Auth Screen$")
    public void user_click_on_authorize_button_of_Revoke_Freeze_Customer_Auth_Screen() throws Throwable {
        seleniumHelper.clickElement("RevokeFreezeCustomerAccountScreen_AuthorizeButton");
    }
    
    @Then("^user click on reject button of Revoke Freeze Customer Auth Screen$")
    public void user_click_on_reject_button_of_Revoke_Freeze_Customer_Auth_Screen() throws Throwable {
        seleniumHelper.clickElement("RevokeFreezeCustomerAccountScreen_RejectButton");
    }
    
    @Then("^user select \"([^\"]*)\" as Customer or Account on Revoke screen$")
    public void user_select_as_Customer_or_Account_on_Revoke_screen(String arg1) throws Throwable {
        if ("Customer".equalsIgnoreCase(arg1)) {
            assertionHelper.verifyTextEquals("Verifying Select For Revoke On Ui ",
                    "RevokeFreezeCustomerAccountScreen_custAccFreezeC", arg1);
        } else {
            assertionHelper.verifyTextEquals("Verifying Select For Revoke On Ui ",
                    "RevokeFreezeCustomerAccountScreen_custAccFreezeA", arg1);
        }
    }
    
    @Then("^verify customer number \"([^\"]*)\" & freeze type \"([^\"]*)\" & freeze reason \"([^\"]*)\" on Revoke Entry Ui$")
    public void verify_customer_number_freeze_type_freeze_reason_on_Ui(String arg1, String arg2, String arg3)
            throws Throwable {
        
        String CUST_CATEGORY = customerMasterService.getCustomerCatogeryBycustNumber(arg1);
        assertionHelper.verifyTextEquals("Validate Customer Category On Ui:  ",
                "FreezeCustomerAccountScreen_custCategory",
                lookupService.getLookdetailsByCodeAndType(CUST_CATEGORY, "CATEGORY").getDescription());
        waitingHelper.sleep(3000);
        assertionHelper.verifyTwoTexts("Validate Customer Freeze Type On Ui  ",
                dropDownHelper.getSelectedValue("FreezeCustomerAccountScreen_freezeType"), arg2);
        
        assertionHelper.verifyTextEquals("Validate Customer Freeze Reason On Ui:  ",
                "FreezeCustomerAccountScreen_freezeReason", arg3);
        
    }
    
    @Then("^user select customer number \"([^\"]*)\" on Revoke Freeze Customer Auth Screen$")
    public void user_select_customer_number_on_Revoke_Freeze_Customer_Auth_Screen(String arg1) throws Throwable {
        
        dropDownHelper.SelectUsingVisibleText("RevokeFreezeCustomerAccountScreen_custNumAuth", arg1);
    }
    
    @Then("^user click on submit button of Revoke Freeze Customer Screen$")
    public void user_click_on_submit_button_of_Revoke_Freeze_Customer_Screen() throws Throwable {
        waitingHelper.sleep(3000);
        seleniumHelper.clickElement("RevokeFreezeCustomerAccountScreen_SubmitButton");
        waitingHelper.sleep(3000);
    }
    
    @Then("^verify customer number \"([^\"]*)\" & freeze type \"([^\"]*)\" & freeze reason \"([^\"]*)\" & Revoke Date on Revoke Auth Ui$")
    public void verify_customer_number_freeze_type_freeze_reason_Revoke_Date_on_Revoke_Auth_Ui(String arg1, String arg2,
            String arg3) throws Throwable {
        String CUST_CATEGORY = customerMasterService.getCustomerCatogeryBycustNumber(arg1);
        assertionHelper.verifyTextEquals("Validate Customer Category On Ui:  ",
                "FreezeCustomerAccountScreen_custCategory",
                lookupService.getLookdetailsByCodeAndType(CUST_CATEGORY, "CATEGORY").getDescription());
        waitingHelper.sleep(3000);
        assertionHelper.verifyTwoTexts("Validate Customer Freeze Type On Ui  ",
                dropDownHelper.getSelectedValue("FreezeCustomerAccountScreen_freezeType"), arg2);
        
        assertionHelper.verifyTextEquals("Validate Customer Freeze Reason On Ui:  ",
                "FreezeCustomerAccountScreen_freezeReason", arg3);
        
        assertionHelper.verifyCalendarText("Validate Revoke Date On Ui:  ",
                "RevokeFreezeCustomerAccountScreenAuth_RevokeDate",
                branchParametersService.getBnrachLiveDate(property.getProperty("BranchCode")).toString());
    }
    
    @Then("^verify Freeze_Details table Freeze status \"([^\"]*)\" & customer number \"([^\"]*)\" after revoke entry$")
    public void verify_Freeze_Details_table_Freeze_status_customer_number_after_revoke_entry(String arg1, String arg2)
            throws Throwable {
        freezeDetails = freezeDetailsService.getRevokeDetailsByCustId(arg2);
        assertionHelper.verifyTwoTexts("Validate Revoke Freeze Status in Freeze_Details Table ",
                freezeDetails.getFreezeStatus(), arg1);
        assertionHelper.verifyTwoTexts("Validate Revoke Date in Freeze_Details Table ",
                freezeDetails.getRevokeDate().toString(),
                branchParametersService.getBnrachLiveDate(property.getProperty("BranchCode")).toString()
                        + " 00:00:00.0");
    }
    
}
