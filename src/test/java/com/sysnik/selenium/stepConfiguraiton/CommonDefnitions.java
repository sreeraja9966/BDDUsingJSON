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

public class CommonDefnitions extends TestBase {
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
    
    @Given("^User is on \"([^\"]*)\" \"([^\"]*)\"screen$")
    public void user_is_on_screen(String arg1, String arg2) throws Throwable {
        d.navigate().refresh();
        
        seleniumHelper.searchMenu(arg1);
        seleniumHelper.clickElement(arg2);
        
    }
    
    @Given("^user opens a testCase \"([^\"]*)\"$")
    public void user_opnes_a_testCase(String arg1) {
        reportHelper.ChildTest(arg1);
        
        waitingHelper.sleep(2000);
        
    }
    
    @Then("^user finds successMessage \"([^\"]*)\"$")
    public void user_finds_successMessage(String arg1) {
        waitingHelper.sleep(2500);
        commonMethodsForVerifications.verifyAndSubmitModel(arg1);
        waitingHelper.sleep(4500);
    }
    
    @When("^user click on voucherDisplayConfirm button$")
    public void user_click_on_voucherDisplayConfirm_button() {
        seleniumHelper.clickElement("Common_VoucherDisplayModelConfirmButton");
        waitingHelper.sleep(3500);
    }
    
    @Then("^store number on model with name \"([^\"]*)\"$")
    public void store_number_on_model_with_name(String arg1) {
        commonMethodsForVerifications.getAccountNumberModelResponse("InstrumentInventory_ModelNumber", arg1, cacheData);
        
    }
    
    @Then("^store number on model with name \"([^\"]*)\" and \"([^\"]*)\"$")
    public void store_number_on_model_with_name_and(String arg1, String arg2) {
        commonMethodsForVerifications.getAccountNumberModelResponse(arg2, arg1, cacheData);
        
    }
    
    @Then("^user finds validationMessage\"([^\"]*)\"$")
    public void user_finds_validationMessage(String arg1) {
        waitingHelper.sleep(3000);
        commonMethodsForVerifications.verifyAndSubmitModel(arg1);
    }
    
    @Then("^user closes testCase$")
    public void user_closes_testCase() {
        /*
         * waitingHelper.sleep(3000); reportHelper.endChild(); reportHelper.appendChild();
         * reportHelper.writeLogToReport();
         */
    }
    
    @When("^user select \"([^\"]*)\" from Reason Type  dropdown$")
    public void user_select_from_Reason_Type_dropdown(String arg1) throws Throwable {
        dropDownHelper.SelectUsingIndex("Common_RejectReason", 1);
        
    }
    
    @When("^user click on RejectionSave$")
    public void user_click_on_RejectionSave() throws Throwable {
        seleniumHelper.clickElement("Common_RejectSaveButton");
        waitingHelper.sleep(2000);
    }
    
    @Given("^User Tearup automation for Parent Report$")
    public void User_Tearup_automation_for_Instrument_Inventory_Entry() {
        reportHelper.endParent();
        reportHelper.writeLogToReport();
    }
    
    @When("^user select \"([^\"]*)\"$")
    public void user_select(String arg1) throws Throwable {
        if ("Cash".equalsIgnoreCase(arg1)) {
            //seleniumHelper.clickElement("CommonModeOfTransactionScreen_modeOfTransCASH");
        } else {
            seleniumHelper.clickElement("CommonModeOfTransactionScreen_modeOfTransTRANSFER");
        }
        
    }
    
    @Then("^observe transaction amount \"([^\"]*)\"$")
    public void observe_transaction_amount(String arg1) throws Throwable {
        assertionHelper.verifyTwoAmounts("Verifying transaction amount trans Mode Model",
                seleniumHelper.getTextFromAnElement("CommonModeOfTransactionScreen_transactionAmt"), arg1);
        
    }
    
    @Then("^user enters TokenNumber \"([^\"]*)\"$")
    public void user_enters_TokenNumber(String arg1) throws Throwable {
        seleniumHelper.enterText("CommonModeOfTransactionScreen_tokenNumber", arg1);
    }
    
    @Then("^user enters Remark \"([^\"]*)\"$")
    public void user_enters_Remark(String arg1) throws Throwable {
        seleniumHelper.enterText("CommonModeOfTransactionScreen_remark", arg1);
    }
    
    @When("^user enter transfer account Number in ModeOfPayable Screen \"([^\"]*)\"$")
    public void user_enter_transfer_account_Number_in_ModeOfPayable_Screen(String arg1) throws Throwable {
        seleniumHelper.enterText("CommonModeOfTransactionScreen_transferAccNumber", arg1);
        waitingHelper.sleep(2000);
    }
    
    @When("^observe name of account holder in ModeOfPayable Screen \"([^\"]*)\"$")
    public void observe_name_of_account_holder_in_ModeOfPayable_Screen(String arg1) throws Throwable {
        assertionHelper.verifyTwoTexts("Verfying CustName of Transfer account",
                seleniumHelper.getTextFromAnElement("CommonModeOfTransactionScreen_transferAccHolderName"), arg1);
    }
    
    @Then("^observe transfer transaction amount \"([^\"]*)\"$")
    public void observe_transfer_transaction_amount(String arg1) throws Throwable {
        assertionHelper.verifyTwoAmounts("Verifying transfer transaction amount trans Mode Model",
                seleniumHelper.getTextFromAnElement("CommonModeOfTransactionScreen_transferTransactionAmt"), arg1);
    }
    
    @When("^user enters TransferRemark \"([^\"]*)\"$")
    public void user_enters_TransferRemark(String arg1) throws Throwable {
        seleniumHelper.enterText("CommonModeOfTransactionScreen_transferRemark", arg1);
    }
    
    @When("^click on ADD record button in ModeOfPayable Screen$")
    public void click_on_ADD_record_button_in_ModeOfPayable_Screen() throws Throwable {
        waitingHelper.sleep(1500);
        seleniumHelper.clickElement("CommonModeOfTransactionScreen_AddDetailsButton");
        waitingHelper.sleep(1500);
    }
    
    @Then("^verify validation Message on Get Call \"([^\"]*)\" \"([^\"]*)\"$")
    public void verify_validationMessage_on_Get_call(String arg1, String arg2) throws Throwable {
        waitingHelper.sleep(1500);
        assertionHelper.verifyTwoTexts("Verifying Validation Message ", seleniumHelper.getTextFromAnElement(arg1),
                arg2);
    }
    
    @Given("^user Enter FromDenom for \"([^\"]*)\" with \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\"$")
    public void user_Enter_FromDenom_for_with(String arg1, String arg2, String arg3, String arg4, String arg5,
            String arg6, String arg7, String arg8, String arg9, String arg10, String arg11, String arg12, String arg13,
            String arg14, String arg15, String arg16, String arg17, String arg18, String arg19) throws Throwable {
        d.navigate().refresh();
        seleniumHelper.searchMenu("cash receipt");
        seleniumHelper.clickElement("Menu_CashReceiptEntry");
        waitingHelper.sleep(2500);
        dbHelper.executeQuery(
                "UPDATE USERWISE_DENOM SET DENOM_QTY =1000 WHERE USER_ID =" + property.getProperty("LogInUser"));
        dropDownHelper.SelectUsingVisibleText("CashReceiptScreen_VoucherNumberDropDown",
                cacheHelper.getCache(arg1, cacheData));
        waitingHelper.sleep(2500);
        seleniumHelper.enterText("CashReceiptScreen_2000DenomFrom", arg2);
        seleniumHelper.enterText("CashReceiptScreen_500DenomFrom", arg3);
        seleniumHelper.enterText("CashReceiptScreen_200DenomFrom", arg4);
        seleniumHelper.enterText("CashReceiptScreen_100DenomFrom", arg5);
        seleniumHelper.enterText("CashReceiptScreen_50DenomFrom", arg6);
        seleniumHelper.enterText("CashReceiptScreen_20DenomFrom", arg7);
        seleniumHelper.enterText("CashReceiptScreen_10DenomFrom", arg8);
        seleniumHelper.enterText("CashReceiptScreen_1DenomFrom", arg9);
        seleniumHelper.enterText("CashReceiptScreen_0.1DenomFrom", arg10);
        
        seleniumHelper.enterText("CashReceiptScreen_2000DenomTo", arg11);
        seleniumHelper.enterText("CashReceiptScreen_500DenomTo", arg12);
        seleniumHelper.enterText("CashReceiptScreen_200DenomTo", arg13);
        seleniumHelper.enterText("CashReceiptScreen_100DenomTo", arg14);
        seleniumHelper.enterText("CashReceiptScreen_50DenomTo", arg15);
        seleniumHelper.enterText("CashReceiptScreen_20DenomTo", arg16);
        seleniumHelper.enterText("CashReceiptScreen_10DenomTo", arg17);
        seleniumHelper.enterText("CashReceiptScreen_1DenomTo", arg18);
        seleniumHelper.enterText("CashReceiptScreen_0.1DenomTo", arg19);
        seleniumHelper.clickElement("CashReceiptScreen_SubmitButton");
        waitingHelper.sleep(2500);
        commonMethodsForVerifications.verifyAndSubmitModel("Denomination Entered Successfully.");
        waitingHelper.sleep(4500);
        
    }
    
    @When("^user enter denominations \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\"$")
    public void user_enter_denominations(String arg1, String arg2, String arg3, String arg4, String arg5, String arg6,
            String arg7, String arg8, String arg9, String arg10, String arg11, String arg12, String arg13, String arg14,
            String arg15, String arg16, String arg17, String arg18) throws Throwable {
        dbHelper.executeQuery(
                "UPDATE USERWISE_DENOM SET DENOM_QTY =1000 WHERE USER_ID =" + property.getProperty("LogInUser"));
        
        seleniumHelper.enterText("CashReceiptScreen_2000DenomFrom", arg1);
        seleniumHelper.enterText("CashReceiptScreen_500DenomFrom", arg2);
        seleniumHelper.enterText("CashReceiptScreen_200DenomFrom", arg3);
        seleniumHelper.enterText("CashReceiptScreen_100DenomFrom", arg4);
        seleniumHelper.enterText("CashReceiptScreen_50DenomFrom", arg5);
        seleniumHelper.enterText("CashReceiptScreen_20DenomFrom", arg6);
        seleniumHelper.enterText("CashReceiptScreen_10DenomFrom", arg7);
        seleniumHelper.enterText("CashReceiptScreen_1DenomFrom", arg8);
        seleniumHelper.enterText("CashReceiptScreen_0.1DenomFrom", arg9);
        
        seleniumHelper.enterText("CashReceiptScreen_2000DenomTo", arg10);
        seleniumHelper.enterText("CashReceiptScreen_500DenomTo", arg11);
        seleniumHelper.enterText("CashReceiptScreen_200DenomTo", arg12);
        seleniumHelper.enterText("CashReceiptScreen_100DenomTo", arg13);
        seleniumHelper.enterText("CashReceiptScreen_50DenomTo", arg14);
        seleniumHelper.enterText("CashReceiptScreen_20DenomTo", arg15);
        seleniumHelper.enterText("CashReceiptScreen_10DenomTo", arg16);
        seleniumHelper.enterText("CashReceiptScreen_1DenomTo", arg17);
        seleniumHelper.enterText("CashReceiptScreen_0.1DenomTo", arg18);
        waitingHelper.sleep(2500);
    }
    
}
