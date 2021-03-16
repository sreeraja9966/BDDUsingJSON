package com.sysnik.selenium.stepConfiguraiton;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.GroupMasterEntity;
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
import cucumber.api.java.en.When;

public class BankreconDateChange extends TestBase {
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
    private GroupMasterEntity groupMaster;
    
    @Then("^setup BRSDateChange Screen$")
    public void setup_BRSDateChange_Screen() throws Throwable {
        dbHelper.executeQuery("UPDATE GROUP_MASTER SET RECON_UPTO ='2018-08-22'");
    }
    
    @When("^user select group \"([^\"]*)\"$")
    public void user_select_group(String arg1) throws Throwable {
        dropDownHelper.SelectUsingVisibleText("BankReconciliationDateMarking_Group", arg1);
    }
    
    @Then("^verify ReconTillDate with GROUP_MASTER table col RECON_UPTO \"([^\"]*)\"$")
    public void verify_ReconTillDate_with_GROUP_MASTER_table_col_RECON_UPTO(String arg1) throws Throwable {
        groupMaster = groupMasterService.getGroupMasterByGroupName(arg1);
        
        assertionHelper.verifyTwoTexts("Matching Recon Date with Group Master Table",
                seleniumHelper.getTextFromAnElement("BankReconciliationDateMarking_ReconDate"),
                dateHelper.convertDbDateToDDMMYYYY(groupMaster.getReconUpToDate() + ""));
    }
    
    @Then("^user select new recon date from calender \"([^\"]*)\"$")
    public void user_select_new_recon_date_from_calender(String arg1) throws Throwable {
        seleniumHelper.enterText("BankReconciliationDateMarking_NewReconDate", arg1);
    }
    
    @When("^user click on submit on bank reconciliation date marking Screen$")
    public void user_click_on_submit_on_bank_reconciliation_date_marking_Screen() throws Throwable {
        seleniumHelper.clickElement("BankReconciliationDateMarking_SubmitButton");
        waitingHelper.sleep(2500);
    }
    
    @Then("^verfiy GROUP_MASTER table col RECON_UPTO \"([^\"]*)\" where GroupID \"([^\"]*)\"$")
    public void verfiy_GROUP_MASTER_table_col_RECON_UPTO_where_GroupID(String arg1, String arg2) throws Throwable {
        groupMaster = groupMasterService.getGroupMasterByGroupName(arg2);
        assertionHelper.verifyTwoTexts("Matching Recon Date with Group Master Table", arg1,
                dateHelper.convertDbDateToDDMMYYYY(groupMaster.getReconUpToDate() + ""));
    }
    
}
