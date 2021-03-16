package com.sysnik.selenium.stepConfiguraiton;

import java.util.ArrayList;
import java.util.List;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.AccountMasterEntity;
import com.sysnik.selenium.entity.DisbursementScheduleEnity;
import com.sysnik.selenium.entity.LoanMasterEntity;
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

public class LoanDisbursementSchedule extends TestBase {
    
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
    private AccountMasterEntity accountMaster;
    private LoanMasterEntity loanMaster;
    
    @Then("^setup Loan Disbursement Schedule Screen$")
    public void setup_Loan_Disbursement_Schedule_Screen() throws Throwable {
        dbHelper.executeQuery("DELETE FROM LOAN_DISB_SCHEDULE WHERE STATUS='E' AND IS_DISBURESED='N'");
        dbHelper.executeQuery("DELETE FROM LOAN_DISB_SCHEDULE WHERE ENTERED_BY in (1,555)");
        dbHelper.executeQuery("DELETE FROM AUTH_TEMP WHERE USER_ID in (1,555)");
    }
    
    @Given("^user enters accNo \"([^\"]*)\" on Loan Disbursement Schedule Screen$")
    public void user_enters_accNo_on_Loan_Disbursement_Schedule_Screen(String arg1) throws Throwable {
        seleniumHelper.enterText("LoanDisbursementScheduleScreen_accNumber", arg1);
    }
    
    @Then("^user verify Sanctioned Amount \"([^\"]*)\" and DisbursedAmount \"([^\"]*)\"$")
    public void user_verify_Sanctioned_Amount_and_DisbursedAmount(String arg1, String arg2) throws Throwable {
        
        waitingHelper.sleep(3000);
        assertionHelper.verifyTextEquals("Verifying Sanctioned Amount on Ui", "LoanDisbursementScheduleScreen_sanAmt",
                arg1);
        assertionHelper.verifyTextEquals("Verifying Disbursed Amount on Ui", "LoanDisbursementScheduleScreen_disAmt",
                arg2);
    }
    
    @Then("^user enters Disbursement Date(\\d+) \"([^\"]*)\"$")
    public void user_enters_Disbursement_Date(int arg1, String arg2) throws Throwable {
        waitingHelper.sleep(3000);
        seleniumHelper.enterText("LoanDisbursementScheduleScreen_disbursementDate", arg2);
    }
    
    @Then("^user enters Disbursement Amount(\\d+) \"([^\"]*)\"$")
    public void user_enters_Disbursement_Amount(int arg1, String arg2) throws Throwable {
        seleniumHelper.enterText("LoanDisbursementScheduleScreen_disbursementAmt", arg2);
    }
    
    @Then("^user enter remark(\\d+) \"([^\"]*)\"$")
    public void user_enter_remark(int arg1, String arg2) throws Throwable {
        seleniumHelper.enterText("LoanDisbursementScheduleScreen_remark", arg2);
    }
    
    @Then("^user click on Add Record button of Loan Disbursement Schedule screen$")
    public void user_click_on_Add_Record_button_of_Loan_Disbursement_Schedule_screen() throws Throwable {
        seleniumHelper.clickElement("LoanDisbursementScheduleScreen_addDetailsButton");
    }
    
    @Then("^user click on submit button of Loan Disbursement Schedule screen$")
    public void user_click_on_submit_button_of_Loan_Disbursement_Schedule_screen() throws Throwable {
        
        seleniumHelper.clickElement("LoanDisbursementScheduleScreen_submitButton");
    }
    
    @Then("^verify LOAN_DISB_SCHEDULE table where accNo \"([^\"]*)\" and DisbursementDate(\\d+) \"([^\"]*)\" and DisbursementAmount(\\d+) \"([^\"]*)\" and remark(\\d+) \"([^\"]*)\"  and DisbursementDate(\\d+) \"([^\"]*)\" and DisbursementAmount(\\d+) \"([^\"]*)\" and remark(\\d+) \"([^\"]*)\" and DisbursementDate(\\d+) \"([^\"]*)\" and DisbursementAmount(\\d+) \"([^\"]*)\" and remark(\\d+) \"([^\"]*)\"$")
    public void verify_LOAN_DISB_SCHEDULE_table_where_accNo_and_DisbursementDate_and_DisbursementAmount_and_remark_and_DisbursementDate_and_DisbursementAmount_and_remark_and_DisbursementDate_and_DisbursementAmount_and_remark(
            String arg1, int arg2, String arg3, int arg4, String arg5, int arg6, String arg7, int arg8, String arg9,
            int arg10, String arg11, int arg12, String arg13, int arg14, String arg15, int arg16, String arg17,
            int arg18, String arg19) throws Throwable {
        
        accountMaster = accountService.getAccountMasterDetailsByAccNo(arg1);
        loanMaster = loanMasterService.getCustLoanMasterDetailsByAccNumber(arg1);
        List<DisbursementScheduleEnity> disScheduleList = new ArrayList<DisbursementScheduleEnity>();
        disScheduleList = disbursementScheduleService.getDisbScheduleData(arg1);
        
        String EntryDate = disScheduleList.get(0).getEntryDate().toString();
        String Edate = EntryDate.substring(0, 10);
        String ed = dateHelper.convetDateIntoSpecificFormat(Edate);
        
        assertionHelper.verifyTwoTexts("Validate Entry Date In LOAN_DISB_SCHEDULE table: ", ed,
                dateHelper.convetDateIntoSpecificFormat(
                        branchParametersService.getBnrachLiveDate(property.getProperty("BranchCode")).toString()));
        
        assertionHelper.verifyTwoTexts("Validate " + arg7 + " Disb. Status In LOAN_DISB_SCHEDULE Table: ",
                disScheduleList.get(0).getStatus(), "E");
        
        assertionHelper.verifyTwoTexts("Validate Is_Disbursed Value In LOAN_DISB_SCHEDULE Table: ",
                disScheduleList.get(0).getIsDisbursed(), "N");
        
        String DisbDate = disScheduleList.get(0).getDisbDate().toString();
        String Ddate = DisbDate.substring(0, 10);
        String dd = dateHelper.convetDateIntoSpecificFormat(Ddate);
        assertionHelper.verifyTwoTexts("Validate Disb. Date In LOAN_DISB_SCHEDULE table: ", dd,
                dateHelper.convetDateIntoSpecificFormat(arg3));
        
        assertionHelper.verifyTwoAmounts("Validate Disb. Amount In LOAN_DISB_SCHEDULE table: ",
                disScheduleList.get(0).getDisbAmt().toString(), arg5 + "");
        
        assertionHelper.verifyTwoTexts("Validate Disb. Remark In LOAN_DISB_SCHEDULE table: ",
                disScheduleList.get(0).getRemark(), arg7 + "");
        
        assertionHelper.verifyTwoTexts("Validate " + arg13 + " Disb. Status In LOAN_DISB_SCHEDULE Table: ",
                disScheduleList.get(1).getStatus(), "E");
        
        assertionHelper.verifyTwoTexts("Validate Is_Disbursed In LOAN_DISB_SCHEDULE Table: ",
                disScheduleList.get(1).getIsDisbursed(), "N");
        
        String DisbDate1 = disScheduleList.get(1).getDisbDate().toString();
        String Ddate1 = DisbDate1.substring(0, 10);
        String dd1 = dateHelper.convetDateIntoSpecificFormat(Ddate1);
        assertionHelper.verifyTwoTexts("Validate Disb. Date In LOAN_DISB_SCHEDULE table: ", dd1,
                dateHelper.convetDateIntoSpecificFormat(arg9));
        
        assertionHelper.verifyTwoAmounts("Validate Disb. Amount In LOAN_DISB_SCHEDULE Table: ",
                disScheduleList.get(1).getDisbAmt().toString(), arg11 + "");
        
        assertionHelper.verifyTwoTexts("Validate Disb. Remark In LOAN_DISB_SCHEDULE Table: ",
                disScheduleList.get(1).getRemark(), arg13 + "");
        
        assertionHelper.verifyTwoTexts("Validate " + arg19 + " Disb. Status In LOAN_DISB_SCHEDULE Table: ",
                disScheduleList.get(2).getStatus(), "E");
        
        assertionHelper.verifyTwoTexts("Validate Is_Disbursed In LOAN_DISB_SCHEDULE Table: ",
                disScheduleList.get(2).getIsDisbursed(), "N");
        String DisbDate2 = disScheduleList.get(2).getDisbDate().toString();
        String Ddate2 = DisbDate2.substring(0, 10);
        String dd2 = dateHelper.convetDateIntoSpecificFormat(Ddate2);
        assertionHelper.verifyTwoTexts("Validate Disb. Date In LOAN_DISB_SCHEDULE table: ", dd2,
                dateHelper.convetDateIntoSpecificFormat(arg15));
        
        assertionHelper.verifyTwoAmounts("Validate Disb. Amount In LOAN_DISB_SCHEDULE Table: ",
                disScheduleList.get(2).getDisbAmt().toString(), arg17 + "");
        
        assertionHelper.verifyTwoTexts("Validate Disb. Remark In LOAN_DISB_SCHEDULE Table: ",
                disScheduleList.get(2).getRemark(), arg19 + "");
    }
    
    @Given("^user select Account Number \"([^\"]*)\" on Loan Disbursement Schedule Auth Screen$")
    public void user_select_Account_Number_on_Loan_Disbursement_Schedule_Auth_Screen(String arg1) throws Throwable {
        waitingHelper.sleep(3000);
        dropDownHelper.SelectUsingVisibleText("LoanDisbursementScheduleScreen_accNum", arg1);
    }
    
    @Then("^user verify Disbursement Details of Ui \"([^\"]*)\" and \"([^\"]*)\"$")
    public void user_verify_Disbursement_Details_of_Ui_and(String arg1, String arg2) throws Throwable {
        
        dbHelper.verifyUiAmountWithDb(arg2 + "/table/tbody/tr[1]/td[2]",
                "SELECT TOP 1 disb_amount FROM LOAN_DISB_SCHEDULE "
                        + "WHERE ACC_ID IN (SELECT ACC_ID FROM LOAN_DISB_SCHEDULE WHERE ACC_ID IN"
                        + "(SELECT ACC_ID FROM ACCOUNT_MASTER  WHERE ACC_NO='" + arg1 + "'))");
        
        dbHelper.verifyUiDateWithDB(arg2 + "/table/tbody/tr[1]/td[1]",
                "SELECT TOP 1 disb_date FROM LOAN_DISB_SCHEDULE "
                        + "WHERE ACC_ID IN (SELECT ACC_ID FROM LOAN_DISB_SCHEDULE WHERE ACC_ID IN"
                        + "(SELECT ACC_ID FROM ACCOUNT_MASTER  WHERE ACC_NO='" + arg1 + "'))");
        
        dbHelper.verifyUiTextWithDb(arg2 + "/table/tbody/tr[1]/td[3]",
                "SELECT TOP 1 remark FROM LOAN_DISB_SCHEDULE "
                        + "WHERE ACC_ID IN (SELECT ACC_ID FROM LOAN_DISB_SCHEDULE WHERE ACC_ID IN"
                        + "(SELECT ACC_ID FROM ACCOUNT_MASTER  WHERE ACC_NO='" + arg1 + "'))");
    }
    
    @Then("^user verify Disbursement New Details of Ui \"([^\"]*)\" and \"([^\"]*)\"$")
    public void user_verify_Disbursement_New_Details_of_Ui_and(String arg1, String arg2) throws Throwable {
        
        assertionHelper.verifyTextEquals("Verifying Sanctioned Amount on Ui",
                "LoanDisbursementScheduleScreen_newDisbursedDate", arg1);
        
        assertionHelper.verifyTextEquals("Verifying Sanctioned Amount on Ui",
                "LoanDisbursementScheduleScreen_newDisbursedAmount", arg2);
    }
    
    @Then("^verify LOAN_DISB_SCHEDULE table where accNo \"([^\"]*)\" and flag \"([^\"]*)\"$")
    public void verify_LOAN_DISB_SCHEDULE_table_where_accNo_and_flag(String arg1, String arg2) throws Throwable {
        
        List<DisbursementScheduleEnity> disScheduleList = new ArrayList<DisbursementScheduleEnity>();
        disScheduleList = disbursementScheduleService.getDisbScheduleData(arg1);
        
        if ("Auth".equals(arg2)) {
            assertionHelper.verifyTwoTexts(
                    "Validate " + disScheduleList.get(0).getRemark() + " " + disScheduleList.get(0).getAccId()
                            + " Disbursement Schedule Status In LOAN_DISB_SCHEDULE Table: ",
                    disScheduleList.get(0).getStatus(), "A");
            assertionHelper.verifyTwoTexts(
                    "Validate " + disScheduleList.get(1).getRemark() + " " + disScheduleList.get(1).getAccId()
                            + " Disbursement Schedule Status In LOAN_DISB_SCHEDULE Table: ",
                    disScheduleList.get(1).getStatus(), "A");
            assertionHelper.verifyTwoTexts(
                    "Validate " + disScheduleList.get(2).getRemark() + " " + disScheduleList.get(2).getAccId()
                            + " Disbursement Schedule Status In LOAN_DISB_SCHEDULE Table: ",
                    disScheduleList.get(2).getStatus(), "A");
        } else {
            assertionHelper.verifyTwoTexts(
                    "Validate " + disScheduleList.get(0).getRemark() + " " + disScheduleList.get(0).getAccId()
                            + " Disbursement Schedule Status In LOAN_DISB_SCHEDULE Table: ",
                    disScheduleList.get(0).getStatus(), "R");
            assertionHelper.verifyTwoTexts(
                    "Validate " + disScheduleList.get(1).getRemark() + " " + disScheduleList.get(1).getAccId()
                            + " Disbursement Schedule Status In LOAN_DISB_SCHEDULE Table: ",
                    disScheduleList.get(1).getStatus(), "R");
            assertionHelper.verifyTwoTexts(
                    "Validate " + disScheduleList.get(2).getRemark() + " " + disScheduleList.get(2).getAccId()
                            + " Disbursement Schedule Status In LOAN_DISB_SCHEDULE Table: ",
                    disScheduleList.get(2).getStatus(), "R");
        }
    }
    
    @Then("^user click on table record \"([^\"]*)\"$")
    public void user_click_on_table_record(String arg1) throws Throwable {
        seleniumHelper.clickElement(arg1);
        waitingHelper.sleep(2000);
    }
    
    @Then("^user click on Update button of Loan Disbursement Schedule Modification screen$")
    public void user_click_on_Update_button_of_Loan_Disbursement_Schedule_Modification_screen() throws Throwable {
        
        seleniumHelper.clickElement("LoanDisbursementScheduleScreen_addDetailsButton");
        waitingHelper.sleep(3000);
    }
    
    @Then("^verify LOAN_DISB_SCHEDULE table after modification where accNo \"([^\"]*)\" and remark(\\d+) \"([^\"]*)\"  and remark(\\d+) \"([^\"]*)\" and remark(\\d+) \"([^\"]*)\"$")
    public void verify_LOAN_DISB_SCHEDULE_table_after_modification_where_accNo_and_remark_and_remark_and_remark(
            String arg1, int arg2, String arg3, int arg4, String arg5, int arg6, String arg7) throws Throwable {
        
        List<DisbursementScheduleEnity> disScheduleList = new ArrayList<DisbursementScheduleEnity>();
        disScheduleList = disbursementScheduleService.getDisbScheduleData(arg1);
        
        assertionHelper.verifyTwoTexts("Validate " + arg3 + " Disb. Status In LOAN_DISB_SCHEDULE Table: ",
                disScheduleList.get(0).getStatus(), "M");
        assertionHelper.verifyTwoTexts("Validate " + arg5 + " Disb. Status In LOAN_DISB_SCHEDULE Table: ",
                disScheduleList.get(1).getStatus(), "M");
        assertionHelper.verifyTwoTexts("Validate " + arg7 + " Disb. Status In LOAN_DISB_SCHEDULE Table: ",
                disScheduleList.get(2).getStatus(), "M");
    }
    
    @Then("^user verify Sanctioned Amount \"([^\"]*)\" and DisbursedAmount \"([^\"]*)\" on mod auth screen$")
    public void user_verify_Sanctioned_Amount_and_DisbursedAmount_on_mod_auth_screen(String arg1, String arg2)
            throws Throwable {
        waitingHelper.sleep(3000);
        assertionHelper.verifyTextEquals("Verifying Sanctioned Amount on Ui",
                "LoanDisbursementScheduleScreen_installAmt", arg1);
        assertionHelper.verifyTextEquals("Verifying Disbursed Amount on Ui",
                "LoanDisbursementScheduleScreen_disbursedAmount", arg2);
    }
    
    @Then("^verify LOAN_DISB_SCHEDULE table after mod auth where flag \"([^\"]*)\" and Modified Disbursement Date \"([^\"]*)\" and Modified Disbursement Amount \"([^\"]*)\" and remark(\\d+) \"([^\"]*)\"  and remark(\\d+) \"([^\"]*)\" and remark(\\d+) \"([^\"]*)\" and accNo \"([^\"]*)\" and DisbursementAmount \"([^\"]*)\" and DisbursementDate \"([^\"]*)\"$")
    public void verify_LOAN_DISB_SCHEDULE_table_after_mod_auth_where_flag_and_Modified_Disbursement_Date_and_Modified_Disbursement_Amount_and_remark_and_remark_and_remark_and_accNo_and_DisbursementAmount_and_DisbursementDate(
            String arg1, String arg2, String arg3, int arg4, String arg5, int arg6, String arg7, int arg8, String arg9,
            String arg10, String arg11, String arg12) throws Throwable {
        
        List<DisbursementScheduleEnity> disScheduleList = new ArrayList<DisbursementScheduleEnity>();
        disScheduleList = disbursementScheduleService.getDisbScheduleData(arg10);
        
        if ("Auth".equalsIgnoreCase(arg1)) {
            assertionHelper.verifyTwoTexts("Validate " + arg5 + " Disb. Status In LOAN_DISB_SCHEDULE Table: ",
                    disScheduleList.get(0).getStatus(), "A");
            assertionHelper.verifyTwoTexts("Validate " + arg7 + " Disb. Status In LOAN_DISB_SCHEDULE Table: ",
                    disScheduleList.get(1).getStatus(), "A");
            assertionHelper.verifyTwoTexts("Validate " + arg9 + " Disb. Status In LOAN_DISB_SCHEDULE Table: ",
                    disScheduleList.get(2).getStatus(), "A");
            
            String DisbDate = disScheduleList.get(0).getDisbDate().toString();
            String Ddate = DisbDate.substring(0, 10);
            String dd = dateHelper.convetDateIntoSpecificFormat(Ddate);
            
            assertionHelper.verifyTwoTexts("Validate " + arg5 + " Modified Disb. Date In LOAN_DISB_SCHEDULE Table: ",
                    dd, arg12);
            assertionHelper.verifyTwoTexts("Validate " + arg5 + " Modified Disb. Amount In LOAN_DISB_SCHEDULE Table: ",
                    disScheduleList.get(0).getDisbAmt().toString(), arg11);
        }
        if ("EntryReject".equalsIgnoreCase(arg1)) {
            
            assertionHelper.verifyTwoTexts("Validate " + arg5 + " Disb. Status In LOAN_DISB_SCHEDULE Table: ",
                    disScheduleList.get(0).getStatus(), "E");
            assertionHelper.verifyTwoTexts("Validate " + arg7 + " Disb. Status In LOAN_DISB_SCHEDULE Table: ",
                    disScheduleList.get(1).getStatus(), "E");
            assertionHelper.verifyTwoTexts("Validate " + arg9 + " Disb. Status In LOAN_DISB_SCHEDULE Table: ",
                    disScheduleList.get(2).getStatus(), "E");
        }
        if ("ModAuthReject".equalsIgnoreCase(arg1)) {
            
            assertionHelper.verifyTwoTexts("Validate " + arg5 + " Disb. Status In LOAN_DISB_SCHEDULE Table: ",
                    disScheduleList.get(0).getStatus(), "A");
            assertionHelper.verifyTwoTexts("Validate " + arg7 + " Disb. Status In LOAN_DISB_SCHEDULE Table: ",
                    disScheduleList.get(1).getStatus(), "A");
            assertionHelper.verifyTwoTexts("Validate " + arg9 + " Disb. Status In LOAN_DISB_SCHEDULE Table: ",
                    disScheduleList.get(2).getStatus(), "A");
        }
        
    }
    
}
