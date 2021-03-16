package com.sysnik.selenium.stepConfiguraiton;

import java.math.BigInteger;

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

public class InstrumentInventory extends TestBase {
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    FindElement findElement = AutomationObjectFactory.getFindElementInstance();
    DateHelper dateHelper = AutomationObjectFactory.getDateHelperInstance();
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
    
    @Given("^User starts a parentReport \"([^\"]*)\"$")
    public void user_starts_a_parentReport(String arg1) throws Throwable {
        reportHelper.appendToExstingReport(arg1);
        reportHelper.writeLogToReport();
        waitingHelper.sleep(3000);
        
    }
    
    @Then("^setup instrument inventory screen$")
    public void setup_instrument_inventory_screen() {
        dbHelper.executeQuery("DELETE FROM INVENTORY_BOOKWISE WHERE STARTNO in(11230,5000000)");
        dbHelper.executeQuery("DELETE FROM INVENTORY_BOOKWISE_log");
        
    }
    
    @Given("^User is on Instrument Inventory Entry screen$")
    public void user_is_on_Instrument_Inventory_Entry_screen() {
        d.navigate().refresh();
        waitingHelper.sleep(3000);
        seleniumHelper.searchMenu("Instrument Inventory");
        seleniumHelper.clickElement("Menu_InstrumentInventoryEntry");
    }
    
    @When("^user select \"([^\"]*)\" from Instrument Type dropdown$")
    public void user_select_from_Instrument_Type_dropdown(String arg1) {
        waitingHelper.sleep(3000);
        dropDownHelper.SelectUsingVisibleText("InstrumentInventory_InstType", arg1);
        waitingHelper.sleep(3000);
    }
    
    @Then("^Verify \"([^\"]*)\" in Inventroy Branch-wise filed$")
    public void verify_in_Inventroy_Branch_wise_filed(String arg1) {
        /*
         * dropDownHelper.SelectUsingVisibleText("InstrumentInventory_instrumentBranch", arg1);
         * dropDownHelper.SelectUsingIndex("InstrumentInventory_instrumentBranch", 1);
         */
    }
    
    @When("^user select \"([^\"]*)\" from Number Of Instrument dropdown$")
    public void user_select_from_Number_Of_Instrument_dropdown(String arg1) {
        dropDownHelper.SelectUsingVisibleText("InstrumentInventory_noOfLeaves", arg1);
        
    }
    
    @When("^user entres \"([^\"]*)\"$")
    public void user_entres(String arg1) {
        seleniumHelper.enterText("InstrumentInventory_noOfBooks", arg1);
    }
    
    @When("^user select \"([^\"]*)\" from Prefix dropdown$")
    public void user_select_from_Prefix_dropdown(String arg1) {
        dropDownHelper.SelectUsingVisibleText("InstrumentInventory_prefix", arg1);
    }
    
    @When("^user select \"([^\"]*)\" from Sufix dropdown$")
    public void user_select_from_Sufix_dropdown(String arg1) {
        dropDownHelper.SelectUsingVisibleText("InstrumentInventory_suffix", arg1);
    }
    
    @When("^user entres startNumber \"([^\"]*)\"$")
    public void user_entres_startNumber(String arg1) {
        seleniumHelper.enterText("InstrumentInventory_startNumber", arg1);
    }
    
    @Then("^Verify \"([^\"]*)\"  in End number filed$")
    public void verify_in_End_number_filed(String arg1) {
        assertionHelper.verifyTwoTexts("Verifying End Number on UI",
                seleniumHelper.getTextFromAnElement("InstrumentInventory_endNumber"), arg1);
    }
    
    @When("^user entres Remarks \"([^\"]*)\"$")
    public void user_entres_Remarks(String arg1) {
        seleniumHelper.enterText("InstrumentInventory_remark", arg1);
    }
    
    @When("^user click on submitButton$")
    public void user_click_on_submitButton() {
        seleniumHelper.clickElement("InstrumentInventory_submitButton");
        waitingHelper.sleep(4500);
    }
    
    @Then("^verify INVENTORYBOOKWISE tables status column \"([^\"]*)\" where series \"([^\"]*)\" and bacthNo \"([^\"]*)\" and startNo \"([^\"]*)\"$")
    public void verify_INVENTORYBOOKWISE_tables_status_column_where_series_and_bacthNo_and_startNo(String arg1,
            String arg2, String arg3, String arg4) throws Throwable {
        String status = iNVENTORYBOOKWISEService.getInvBookDetailsByBatchNoAndSeriesAndStartNo(
                new BigInteger(cacheHelper.getCache(arg3, cacheData)), arg2, Integer.valueOf(arg4)).getBookStatus();
        
        assertionHelper.verifyTwoTexts("Verifying status in iNVENTORYBOOKWISE table", status, arg1);
        
    }
    
    @Then("^verify INVENTORYBOOKWISE tables status column \"([^\"]*)\" where series \"([^\"]*)\" and startNo \"([^\"]*)\"$")
    public void verify_INVENTORYBOOKWISE_tables_status_column_where_series_and_startNo(String arg1, String arg2,
            String arg3) throws Throwable {
        String status = iNVENTORYBOOKWISEService.getInvBookDetailsSeriesAndStartNo(arg2, Integer.parseInt(arg3))
                .getBookStatus();
        
        assertionHelper.verifyTwoTexts("Verifying status in iNVENTORYBOOKWISE table", status, arg1);
        
    }
    
    @Then("^verify INVENTORYBOOKWISELog tables status column \"([^\"]*)\" where series \"([^\"]*)\" and bacthNo \"([^\"]*)\" and startNo \"([^\"]*)\"$")
    public void verify_INVENTORYBOOKWISELog_tables_status_column_where_series_and_bacthNo_and_startNo(String arg1,
            String arg2, String arg3, String arg4) throws Throwable {
        String status = iNVENTORYBOOKWISELogService.getInvBookLogDetailsByBatchNoAndSeriesAndStartNo(
                new BigInteger(cacheHelper.getCache(arg3, cacheData)), arg2, Integer.valueOf(arg4)).getBookStatus();
        
        assertionHelper.verifyTwoTexts("Verifying status in iNVENTORYBOOKWISELog table", status, arg1);
        
    }
    
    @Given("^User is on Instrument Inventory Authorization screen$")
    public void user_is_on_Instrument_Inventory_Authorization_screen() throws Throwable {
        d.navigate().refresh();
        waitingHelper.sleep(3000);
        seleniumHelper.searchMenu("Instrument Inventory");
        seleniumHelper.clickElement("Menu_InstrumentInventoryAuth");
    }
    
    @Then("^Verify \"([^\"]*)\" on Instrument Type filed$")
    public void verify_on_Instrument_Type_filed(String arg1) throws Throwable {
        assertionHelper.verifyTwoTexts("Verifying Instrument Field on UI",
                seleniumHelper.getTextFromAnElement("InstrumentInventoryAuthorization_InstrType"), arg1);
    }
    
    @Then("^Verify \"([^\"]*)\" in Inventry Branch Wise filed$")
    public void verify_in_Inventry_Branch_Wise_filed(String arg1) throws Throwable {
        assertionHelper.verifyTwoTexts("Verifying Inventry Type Field on UI",
                seleniumHelper.getTextFromAnElement("InstrumentInventoryAuthorization_InventryBranchWise"), arg1);
    }
    
    @Then("^Verify Batch No in Batch Number filed\"([^\"]*)\"$")
    public void verify_Batch_No_in_Batch_Number_filed(String arg1) throws Throwable {
        assertionHelper.verifyTwoTexts("Verifying Batch Number Field on UI",
                seleniumHelper.getTextFromAnElement("InstrumentInventoryAuthorization_BatchNo"),
                cacheHelper.getCache(arg1, cacheData));
    }
    
    @Then("^Verify \"([^\"]*)\" in Quantity Of Book filed$")
    public void verify_in_Quantity_Of_Book_filed(String arg1) throws Throwable {
        assertionHelper.verifyTwoTexts("Verifying Quantity Of Book  Field on UI",
                seleniumHelper.getTextFromAnElement("InstrumentInventoryAuthorization_QuantofBooks"), arg1);
    }
    
    @Then("^Verify \"([^\"]*)\" in Number of Instrument  filed$")
    public void verify_in_Number_of_Instrument_filed(String arg1) throws Throwable {
        assertionHelper.verifyTwoTexts("Verifying  Number of Instrument  Field on UI",
                seleniumHelper.getTextFromAnElement("InstrumentInventoryAuthorization_NoofInstrum"), arg1);
    }
    
    @Then("^Verify \"([^\"]*)\" in Prefix filed$")
    public void verify_in_Prefix_filed(String arg1) throws Throwable {
        assertionHelper.verifyTwoTexts("Verifying  Prefix  Field on UI",
                seleniumHelper.getTextFromAnElement("InstrumentInventoryAuthorization_Prefix"), arg1);
    }
    
    @Then("^Verify \"([^\"]*)\" in Sufix filed$")
    public void verify_in_Sufix_filed(String arg1) throws Throwable {
        assertionHelper.verifyTwoTexts("Verifying  Sufix on UI",
                seleniumHelper.getTextFromAnElement("InstrumentInventoryAuthorization_Sufix"), arg1);
    }
    
    @Then("^Verify \"([^\"]*)\" in Start Number filed$")
    public void verify_in_Start_Number_filed(String arg1) throws Throwable {
        assertionHelper.verifyTwoTexts("Verifying  Start Number  Field on UI",
                seleniumHelper.getTextFromAnElement("InstrumentInventoryAuthorization_StartNo"), arg1);
    }
    
    @Then("^Verify \"([^\"]*)\" in End Number filed$")
    public void verify_in_End_Number_filed(String arg1) throws Throwable {
        assertionHelper.verifyTwoTexts("Verifying End Number Field on UI",
                seleniumHelper.getTextFromAnElement("InstrumentInventoryAuthorization_EndNo"), arg1);
    }
    
    @Then("^Verify \"([^\"]*)\" in Remarks filed$")
    public void verify_in_Remarks_filed(String arg1) throws Throwable {
        assertionHelper.verifyTwoTexts("Verifying Remarks Field on UI",
                seleniumHelper.getTextFromAnElement("InstrumentInventoryAuthorization_Remarks"), arg1);
    }
    
    @Then("^user select Authorize checkbox from available record on screen$")
    public void user_select_Authorize_checkbox_from_available_record_on_screen() throws Throwable {
        waitingHelper.sleep(2500);
        seleniumHelper.clickElement("InstrumentInventoryAuthorization_CheckBox");
    }
    
    @When("^user click on Authorize$")
    public void user_click_on_Authorize() throws Throwable {
        seleniumHelper.clickElement("InstrumentInventoryAuthorization_AuthButton");
        waitingHelper.sleep(4000);
    }
    
    @When("^user click on RejectButton$")
    public void user_click_on_RejectButton() throws Throwable {
        seleniumHelper.clickElement("InstrumentInventoryAuthorization_RejectButton");
        waitingHelper.sleep(4000);
    }
    
}
