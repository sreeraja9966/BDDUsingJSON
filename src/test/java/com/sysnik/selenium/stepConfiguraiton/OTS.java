package com.sysnik.selenium.stepConfiguraiton;

import java.math.BigDecimal;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.AccountMasterEntity;
import com.sysnik.selenium.entity.CustomerAccountEntity;
import com.sysnik.selenium.entity.CustomerMasterEntity;
import com.sysnik.selenium.entity.LoanSettlementLogEntity;
import com.sysnik.selenium.entity.OtsIntWaiverLogEntity;
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

public class OTS extends TestBase {
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
    private LoanSettlementLogEntity loansettleLog;
    private OtsIntWaiverLogEntity otsIntWaiver;
    private AccountMasterEntity accMaster;
    private CustomerMasterEntity custMaster;
    private CustomerAccountEntity custAccount;
    
    @Then("^setup otsScreen$")
    public void setup_otsScreen() throws Throwable {
        
        dbHelper.executeQuery(
                "update account_master set CLOSE_DT=null, available_bal=-50000, ledger_bal=-50000, shadow_bal=0, status='A' where acc_no in( '101210102000000392','101210102000000393','101210102000000394','101210102000000416','101210102000000417','101210102000000418')");
        dbHelper.executeQuery(
                "update account_master set available_bal=50000, ledger_bal=50000, shadow_bal=0, status='A' where acc_no in('101210101100000836','101210101100000859')");
        dbHelper.executeQuery(
                "update loan_master set int_due='1000' where acc_id in('50584','50583','50581','50641','50642','50643')");
        dbHelper.executeQuery("DELETE FROM LOAN_SETTLEMENT_LOG");
        dbHelper.executeQuery("DELETE FROM OTS_INT_WAIVER_LOG");
        dbHelper.executeQuery(
                "Delete from CLOSED_ACCOUNTS WHERE ACC_ID IN ('50584','50583','50581','50641','50642','50643') ");
    }
    
    @When("^user enters loan \"([^\"]*)\"$")
    public void user_enters_loan(String arg1) throws Throwable {
        seleniumHelper.enterText("OneTimeSettlementEntry_accNo", arg1);
        waitingHelper.sleep(1000);
    }
    
    @When("^user click on General Info tab$")
    public void user_click_on_General_Info_tab() throws Throwable {
        seleniumHelper.clickElement("OneTimeSettlementEntry_generalInformationTab");
    }
    
    @Then("^verify following on ots screen \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\"$")
    public void verify(String arg1, String arg2, String arg3, String arg4, String arg5, String arg6, String arg7,
            String arg8) throws Throwable {
        assertionHelper.verifyTwoTexts("Verify CustomerName on UI",
                seleniumHelper.getTextFromAnElement("OneTimeSettlementEntry_custName"), arg1);
        assertionHelper.verifyTwoTexts("Verify AccOpenDate on UI",
                seleniumHelper.getTextFromAnElement("OneTimeSettlementEntry_openDt"), arg2);
        assertionHelper.verifyTwoTexts("Verify ExpDate on UI",
                seleniumHelper.getTextFromAnElement("OneTimeSettlementEntry_expiryDt"), arg3);
        assertionHelper.verifyTwoAmounts("Verify AvailableBal on UI",
                seleniumHelper.getTextFromAnElement("OneTimeSettlementEntry_availableBal"), arg4);
        assertionHelper.verifyTwoAmounts("Verify SancAmt on UI",
                seleniumHelper.getTextFromAnElement("OneTimeSettlementEntry_sanctionedAmt"), arg5);
        assertionHelper.verifyTwoTexts("Verify Period on UI",
                seleniumHelper.getTextFromAnElement("OneTimeSettlementEntry_period"), arg6);
        assertionHelper.verifyTwoAmounts("Verify OverDueAmt on UI",
                seleniumHelper.getTextFromAnElement("OneTimeSettlementEntry_overdueAmt"), arg7);
        assertionHelper.verifyTwoAmounts("Verify ReceivableAmt on UI",
                seleniumHelper.getTextFromAnElement("OneTimeSettlementEntry_receivableAmt"), arg8);
        
    }
    
    @When("^user click on Account Info tab$")
    public void user_click_on_Account_Info_tab() throws Throwable {
        seleniumHelper.clickElement("OneTimeSettlementEntry_accountInformationTab");
    }
    
    @Then("^verify \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\"$")
    public void verify(String arg1, String arg2, String arg3, String arg4, String arg5, String arg6, String arg7,
            String arg8, String arg9) throws Throwable {
        assertionHelper.verifyTwoAmounts("Verify ROI on UI",
                seleniumHelper.getTextFromAnElement("OneTimeSettlementEntry_intRoi"), arg1);
        assertionHelper.verifyTwoAmounts("Verify PenalROI on UI",
                seleniumHelper.getTextFromAnElement("OneTimeSettlementEntry_penalRoi"), arg2);
        assertionHelper.verifyTwoAmounts("Verify IntDue on UI",
                seleniumHelper.getTextFromAnElement("OneTimeSettlementEntry_intDue"), arg3);
        assertionHelper.verifyTwoTexts("Verify AssetsClassification on UI",
                seleniumHelper.getTextFromAnElement("OneTimeSettlementEntry_npaClassification"), arg4);
        assertionHelper.verifyTwoAmounts("Verify PAReserve on UI",
                seleniumHelper.getTextFromAnElement("OneTimeSettlementEntry_paReserve"), arg5);
        assertionHelper.verifyTwoAmounts("Verify PenalInt on UI",
                seleniumHelper.getTextFromAnElement("OneTimeSettlementEntry_penalIntpay"), arg6);
        assertionHelper.verifyTwoAmounts("Verify NPAInt on UI",
                seleniumHelper.getTextFromAnElement("OneTimeSettlementEntry_NpaInt"), arg7);
        assertionHelper.verifyTwoAmounts("Verify IntReceivable on UI",
                seleniumHelper.getTextFromAnElement("OneTimeSettlementEntry_IntRecivable"), arg8);
        assertionHelper.verifyTwoAmounts("Verify PayableAmt on UI",
                seleniumHelper.getTextFromAnElement("OneTimeSettlementEntry_payableAmt"), arg9);
    }
    
    @When("^user click on Interest Calculation Tab$")
    public void user_click_on_Interest_Calculation_Tab() throws Throwable {
        seleniumHelper.clickElement("OneTimeSettlementEntry_newInterestCalculationYesTab");
    }
    
    @Then("^user select \"([^\"]*)\" as Y$")
    public void user_select_as_Y(String arg1) throws Throwable {
        if ("Y".equalsIgnoreCase(arg1)) {
            seleniumHelper.clickElement("OneTimeSettlementEntry_NewIntCalculationYes");
        } else {
            seleniumHelper.clickElement("OneTimeSettlementEntry_NewIntCalculationNo");
        }
    }
    
    @Then("^user select From Date \"([^\"]*)\" To Date \"([^\"]*)\"$")
    public void user_select_From_Date_To_Date(String arg1, String arg2) throws Throwable {
        seleniumHelper.enterText("OneTimeSettlementEntry_NewIntCalculationFromDate", arg1);
        seleniumHelper.enterText("OneTimeSettlementEntry_NewIntCalculationToDate", arg2);
        
    }
    
    @Then("^user select \"([^\"]*)\" simple or compound$")
    public void user_select_simple_or_compound(String arg1) throws Throwable {
        if ("Simple".equalsIgnoreCase(arg1)) {
            seleniumHelper.clickElement("OneTimeSettlementEntry_NewIntCalculationTypeSimple");
        } else {
            seleniumHelper.clickElement("OneTimeSettlementEntry_NewIntCalculationTypeCompound");
        }
    }
    
    @Then("^user enters new Rate of interest \"([^\"]*)\"$")
    public void user_enters_new_Rate_of_interest(String arg1) throws Throwable {
        seleniumHelper.enterText("OneTimeSettlementEntry_NewROI", arg1);
    }
    
    @Then("^click on ADD record button$")
    public void click_on_ADD_record_button() throws Throwable {
        seleniumHelper.clickElement("OneTimeSettlementEntry_addRecordButton");
        waitingHelper.sleep(2500);
    }
    
    @Then("^observe \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\"$")
    public void observe(String arg1, String arg2, String arg3) throws Throwable {
        assertionHelper.verifyTwoAmounts("Verifying TotalInt on UI",
                seleniumHelper.getTextFromAnElement("OneTimeSettlementEntry_totalInterest"), arg1);
        assertionHelper.verifyTwoAmounts("Verifying IntWaiver on UI",
                seleniumHelper.getTextFromAnElement("OneTimeSettlementEntry_InterestWaiver"), arg2);
        assertionHelper.verifyTwoAmounts("Verifying ReceivableAmt on UI",
                seleniumHelper.getTextFromAnElement("OneTimeSettlementEntry_receivableAmt21"), arg3);
    }
    
    @Then("^user click on submit on ots Screen$")
    public void user_click_on_submit_on_ots_Screen() throws Throwable {
        seleniumHelper.clickElement("OneTimeSettlementEntry_submitButton");
        waitingHelper.sleep(3000);
    }
    
    @Then("^verify LOAN_SETTLEMENT_LOG table col ACTUAL_INT_AMT \"([^\"]*)\" INT_WAIVER_AMT \"([^\"]*)\" RECIEVABLE_AMT \"([^\"]*)\" Status \"([^\"]*)\" where accNo \"([^\"]*)\"$")
    public void verify_LOAN_SETTLEMENT_LOG_table_col_ACTUAL_INT_AMT_INT_WAIVER_AMT_RECIEVABLE_AMT_Status_where_accNo(
            String arg1, String arg2, String arg3, String arg4, String arg5) throws Throwable {
        loansettleLog = lOANSETTLEMENTLOGService.getLoanSettleLogDetailsByaccNo(arg5);
        assertionHelper.verifyTwoAmounts("Verify actualInt in LoanSettleLog with accNo: " + arg5,
                loansettleLog.getActualInterestAmount() + "", arg1);
        assertionHelper.verifyTwoAmounts("Verify WaiverInt in LoanSettleLog with accNo: " + arg5,
                loansettleLog.getInterestWaiverAmount() + "", arg2);
        assertionHelper.verifyTwoTexts("Verify Status in LoanSettleLog with accNo: " + arg5, loansettleLog.getStatus(),
                arg4);
        
    }
    
    @Then("^verify OTS_INT_WAIVER_LOG table col INT_TYPE \"([^\"]*)\" FROM_DATE \"([^\"]*)\" TO_DATE \"([^\"]*)\" where accNo \"([^\"]*)\"$")
    public void verify_OTS_INT_WAIVER_LOG_table_col_INT_TYPE_FROM_DATE_TO_DATE_where_accNo(String arg1, String arg2,
            String arg3, String arg4) throws Throwable {
        otsIntWaiver = oTSINTWAIVERLOGService.getOTSWaiverLogDetailsByaccNo(arg4);
        String intType = "C";
        if ("Simple".equalsIgnoreCase(arg1)) {
            intType = "S";
        }
        assertionHelper.verifyTwoTexts("Verfying intType in OTS Table with accNo : " + arg4, otsIntWaiver.getIntType(),
                intType);
    }
    
    @When("^user enters Interest waiver amount \"([^\"]*)\"$")
    public void user_enters_Interest_waiver_amount(String arg1) throws Throwable {
        seleniumHelper.enterText("OneTimeSettlementEntry_InterestWaiverwithFlagN", arg1);
    }
    
    @Then("^observe receivable amount \"([^\"]*)\"$")
    public void observe_receivable_amount(String arg1) throws Throwable {
        assertionHelper.verifyTwoAmounts("Verfiying Receivable amount on UI :",
                seleniumHelper.getTextFromAnElement("OneTimeSettlementEntry_receivableAmtwithFlagN"), arg1);
    }
    
    @When("^user selects loanAcc in OTS Auth Screen \"([^\"]*)\"$")
    public void user_selects_loanAcc_in_OTS_Auth_Screen(String arg1) throws Throwable {
        accMaster = accountService.getAccountMasterDetailsByAccNo(arg1);
        custMaster = customerMasterService.getCustMasterDetailsByCustId(accMaster.getCustId());
        loansettleLog = lOANSETTLEMENTLOGService.getLoanSettleLogDetailsByaccNo(arg1);
        custAccount = customerAccountService.getCustomerAccDetailsByAccNumber(arg1);
        String amount = loansettleLog.getRecievableAmount().setScale(2, BigDecimal.ROUND_HALF_EVEN) + "";
        if (amount.contains(".00")) {
            amount = amount.replace(".00", "");
        }
        String custName = custMaster.getCustName();
        waitingHelper.sleep(2500);
        dropDownHelper.SelectUsingVisibleText("OneTimeSettlementAuth_accNo",
                custAccount.getUserAccNo() + " - " + custName + " - " + amount);
        waitingHelper.sleep(2500);
    }
    
    @When("^user click on ots auth button$")
    public void user_click_on_ots_auth_button() throws Throwable {
        seleniumHelper.clickElement("OneTimeSettlementAuth_AuthButton");
        waitingHelper.sleep(2500);
    }
    
    @When("^user click on ots reject button$")
    public void user_click_on_ots_reject_button() throws Throwable {
        seleniumHelper.clickElement("OneTimeSettlementAuth_RejectButton");
        waitingHelper.sleep(2500);
    }
}
