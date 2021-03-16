package com.sysnik.selenium.stepConfiguraiton;

import java.math.BigInteger;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.AccountMasterEntity;
import com.sysnik.selenium.entity.SIMasterEntity;
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

public class StandingInstruction extends TestBase {
    
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
    private AccountMasterEntity accountMaster;
    private SIMasterEntity siMaster;
    
    @Then("^setup Standing Instruction Screen$")
    public void setup_Standing_Instruction_Screen() throws Throwable {
        dbHelper.executeQuery("DELETE FROM SI_MASTER WHERE FROM_ACCID IN (52537,52538,52539,52540)");
        dbHelper.executeQuery("DELETE FROM SI_MASTER WHERE STATUS='E' AND FROM_ACCID IN (52537,52538,52539,52540)");
    }
    
    @Given("^user enters \"([^\"]*)\" Debit Account Number$")
    public void user_enters_Debit_Account_Number(String arg1) throws Throwable {
        seleniumHelper.enterText("SIEntryScreen_fromAccNo", arg1);
    }
    
    @Then("^user enters \"([^\"]*)\" Credit Account Number$")
    public void user_enters_Credit_Account_Number(String arg1) throws Throwable {
        seleniumHelper.enterText("SIEntryScreen_toAccNo", arg1);
    }
    
    @Then("^user select SI Type \"([^\"]*)\" Fixed or Floating on SI Screen$")
    public void user_select_SI_Type_Fixed_or_Floating_on_SI_Screen(String arg1) throws Throwable {
        if ("F".equalsIgnoreCase(arg1)) {
            seleniumHelper.clickElement("SIEntryScreen_siTypeFixed");
        } else {
            seleniumHelper.clickElement("SIEntryScreen_siTypeFloating");
        }
    }
    
    @Then("^verify Debit Customer Name On Ui \"([^\"]*)\"$")
    public void verify_Debit_Customer_Name_On_Ui(String arg1) throws Throwable {
        assertionHelper.verifyTextEquals("Validate Debit Customer Name Of Ui in Cust_Master Table ",
                "SIEntryScreen_fromCustomerName", arg1);
    }
    
    @Then("^verify SI_MASTER table col Credit Account Num \"([^\"]*)\" and NextDueDate \"([^\"]*)\" and ExpiryDate \"([^\"]*)\" and SiType \"([^\"]*)\" and Amount \"([^\"]*)\" and DebitAccountNumber \"([^\"]*)\" and Flow \"([^\"]*)\" and DebitAccountBaseAmount \"([^\"]*)\" and MinimumSIAmount \"([^\"]*)\" and CreditAccountBaseAmount \"([^\"]*)\" and MaximumSIAmount \"([^\"]*)\"$")
    public void verify_SI_MASTER_table_col_Credit_Account_Num_and_NextDueDate_and_ExpiryDate_and_SiType_and_Amount_and_DebitAccountNumber_and_Flow_and_DebitAccountBaseAmount_and_MinimumSIAmount_and_CreditAccountBaseAmount_and_MaximumSIAmount(
            String arg1, String arg2, String arg3, String arg4, String arg5, String arg6, String arg7, String arg8,
            String arg9, String arg10, String arg11) throws Throwable {
        String SiNumber;
        if ("F".equalsIgnoreCase(arg4)) {
            if ("Entry".equalsIgnoreCase(arg7)) {
                SiNumber = cacheHelper.getCache("SINum_Fixed", cacheData);
            } else {
                SiNumber = cacheHelper.getCache("SINum_FixedRejection", cacheData);
            }
        } else {
            if ("Entry".equalsIgnoreCase(arg7)) {
                SiNumber = cacheHelper.getCache("SINum_Floating", cacheData);
            } else {
                SiNumber = cacheHelper.getCache("SINum_FloatingRejection", cacheData);
            }
        }
        BigInteger SiNum = new BigInteger(SiNumber);
        siMaster = sIMasterService.getSiDetailsBySiNumber(SiNum, property.getProperty("BranchCode"));
        BigInteger toAccId = accountService.getAccountMasterDetailsByAccNo(arg1).getAccId();
        BigInteger fromAccId = accountService.getAccountMasterDetailsByAccNo(arg6).getAccId();
        assertionHelper.verifyTwoTexts("Verifying Status of SI Number " + SiNumber + " in SI_Master Table ",
                siMaster.getStatus(), "E");
        assertionHelper.verifyTwoTexts("Validate From AccID in SI_Master Table", siMaster.getFromAccId().toString(),
                fromAccId.toString());
        assertionHelper.verifyTwoTexts("Validate To AccID in SI_Master Table", siMaster.getToAccId().toString(),
                toAccId.toString());
        assertionHelper.verifyTwoTexts("Validate Next Due Date in SI_Master Table",
                siMaster.getNextDueDate().toString(), arg2);
        
        assertionHelper.verifyTwoTexts("Validate Expiry Date in SI_Master Table", siMaster.getExpiryDt().toString(),
                arg3);
        assertionHelper.verifyTwoTexts("Validate First Due Date in SI_Master Table",
                siMaster.getFirstDueDate().toString(), arg2);
        if ("F".equalsIgnoreCase(arg4)) {
            assertionHelper.verifyTwoAmounts("Validate SI Trans Amount in SI_Master Table",
                    siMaster.getTransAmt().toString(), arg5);
            assertionHelper.verifyTwoTexts("Validate SI Frequency in SI_Master Table", siMaster.getSiFrequency(), "M1");
            assertionHelper.verifyTwoTexts("Validate SI Type in SI_Master Table", siMaster.getSiType().toString(), "F");
        } else {
            assertionHelper.verifyTwoTexts("Validate SI Type in SI_Master Table", siMaster.getSiType().toString(), "V");
            assertionHelper.verifyTwoAmounts("Validate SI Debit Account Base Amount in SI_Master Table",
                    siMaster.getBaseAmtDr().toString(), arg8);
            assertionHelper.verifyTwoAmounts("Validate SI Minimum Amount in SI_Master Table",
                    siMaster.getMinAmt().toString(), arg9);
            assertionHelper.verifyTwoAmounts("Validate SI Credit Account Base Amount in SI_Master Table",
                    siMaster.getBaseAmtCr().toString(), arg10);
            assertionHelper.verifyTwoAmounts("Validate SI Maximum Amount in SI_Master Table",
                    siMaster.getMaxAmt().toString(), arg11);
            assertionHelper.verifyTwoAmounts("Validate SI Trans Amount in SI_Master Table",
                    siMaster.getTransAmt().toString(), "0.00");
            assertionHelper.verifyTwoTexts("Validate SI Frequency in SI_Master Table", siMaster.getSiFrequency(), "M3");
            
        }
    }
    
    @Then("^user enters SI Debit Account Base Amount \"([^\"]*)\"$")
    public void user_enters_SI_Debit_Account_Base_Amount(String arg1) throws Throwable {
        
        seleniumHelper.enterText("SIEntryScreen_baseAmtDr", arg1);
    }
    
    @Then("^user enters Minimum SI Amount \"([^\"]*)\"$")
    public void user_enters_Minimum_SI_Amount(String arg1) throws Throwable {
        seleniumHelper.enterText("SIEntryScreen_minSIAmt", arg1);
    }
    
    @Then("^user enters SI Credit Account Base Amount \"([^\"]*)\"$")
    public void user_enters_SI_Credit_Account_Base_Amount(String arg1) throws Throwable {
        seleniumHelper.enterText("SIEntryScreen_baseAmtCr", arg1);
    }
    
    @Then("^user enters Maximum SI Amount \"([^\"]*)\"$")
    public void user_enters_Maximum_SI_Amount(String arg1) throws Throwable {
        seleniumHelper.enterText("SIEntryScreen_maxSIAmt", arg1);
    }
    
    @Given("^user select Si Number from Dropdown \"([^\"]*)\" and verify SI Number Modal Details and SiType \"([^\"]*)\" and Next Due Date \"([^\"]*)\" and Expiry Date \"([^\"]*)\" and Entered Date \"([^\"]*)\" and Frequency \"([^\"]*)\" and Credit Account Num \"([^\"]*)\" and Amount \"([^\"]*)\" and DebitAccountNumber \"([^\"]*)\"$")
    public void user_select_Si_Number_from_Dropdown_and_verify_SI_Number_Modal_Details_and_SiType_and_Next_Due_Date_and_Expiry_Date_and_Entered_Date_and_Frequency_and_Credit_Account_Num_and_Amount_and_DebitAccountNumber(
            String arg1, String arg2, String arg3, String arg4, String arg5, String arg6, String arg7, String arg8,
            String arg9) throws Throwable {
        
        String SiNumber = cacheHelper.getCache(arg1, cacheData);
        waitingHelper.sleep(3000);
        dropDownHelper.SelectUsingVisibleText("SIEntryScreen_siNumber", SiNumber);
        seleniumHelper.clickElement("SIEntryScreen_siNumberLink");
        assertionHelper.verifyTextEquals("Verifying SI Entered Date On Ui ", "SIEntryScreen_EnteredDate", arg5);
        assertionHelper.verifyTextEquals("Verifying SI Expired Date On Ui ", "SIEntryScreen_ExpiryDate", arg4);
        assertionHelper.verifyTextEquals("Verifying SI First Due Date On Ui ", "SIEntryScreen_FirstDueDate", arg3);
        assertionHelper.verifyTextEquals("Verifying SI Next Due Date On Ui ", "SIEntryScreen_NextDueDate", arg3);
        assertionHelper.verifyTextEquals("Verifying SI Frequency On Ui ", "SIEntryScreen_SIFrequency", arg6);
        assertionHelper.verifyTextEquals("Verifying SI Type On Ui ", "SIEntryScreen_SIType", arg2);
        seleniumHelper.clickElement("SIEntryScreen_okButton");
        assertionHelper.verifyTextEquals("Verifying SI Debit Account Number On Ui ", "SIEntryScreen_DebitAcNum", arg9);
        assertionHelper.verifyTextEquals("Verifying SI Credit Account Number On Ui ", "SIEntryScreen_CreditAcNum",
                arg7);
        assertionHelper.verifyTextEquals("Verifying SI Amount On Ui ", "SIEntryScreen_Amount", arg8);
        seleniumHelper.clickElement("SIEntryScreen_checkboxSi");
    }
    
    @Given("^user select Si Number from Dropdown \"([^\"]*)\" and verify Floating SI Number Modal Details and SiType \"([^\"]*)\" and Next Due Date \"([^\"]*)\" and Expiry Date \"([^\"]*)\" and Entered Date \"([^\"]*)\" and Frequency \"([^\"]*)\" and Credit Account Num \"([^\"]*)\" and Amount \"([^\"]*)\" and DebitAccountNumber \"([^\"]*)\" and DebitAccountBaseAmount \"([^\"]*)\" and MinimumSIAmount \"([^\"]*)\" and CreditAccountBaseAmount \"([^\"]*)\" and MaximumSIAmount \"([^\"]*)\"$")
    public void user_select_Si_Number_from_Dropdown_and_verify_Floating_SI_Number_Modal_Details_and_SiType_and_Next_Due_Date_and_Expiry_Date_and_Entered_Date_and_Frequency_and_Credit_Account_Num_and_Amount_and_DebitAccountNumber_and_DebitAccountBaseAmount_and_MinimumSIAmount_and_CreditAccountBaseAmount_and_MaximumSIAmount(
            String arg1, String arg2, String arg3, String arg4, String arg5, String arg6, String arg7, String arg8,
            String arg9, String arg10, String arg11, String arg12, String arg13) throws Throwable {
        String SiNumber = cacheHelper.getCache(arg1, cacheData);
        waitingHelper.sleep(3000);
        dropDownHelper.SelectUsingVisibleText("SIEntryScreen_siNumber", SiNumber);
        seleniumHelper.clickElement("SIEntryScreen_siNumberLink");
        assertionHelper.verifyTextEquals("Verifying SI Entered Date On Ui ", "SIEntryScreen_EnteredDate", arg5);
        assertionHelper.verifyTextEquals("Verifying SI Expired Date On Ui ", "SIEntryScreen_ExpiryDate", arg4);
        assertionHelper.verifyTextEquals("Verifying SI First Due Date On Ui ", "SIEntryScreen_FirstDueDate", arg3);
        assertionHelper.verifyTextEquals("Verifying SI Next Due Date On Ui ", "SIEntryScreen_NextDueDate", arg3);
        assertionHelper.verifyTextEquals("Verifying SI Frequency On Ui ", "SIEntryScreen_SIFrequency", arg6);
        assertionHelper.verifyTextEquals("Verifying SI Type On Ui ", "SIEntryScreen_SIType", arg2);
        assertionHelper.verifyTextEquals("Verifying SI Credit Account Base Amount On Ui ",
                "SIEntryScreen_CreditAccountBaseAmount", arg12);
        assertionHelper.verifyTextEquals("Verifying SI Debit Account Base Amount On Ui ",
                "SIEntryScreen_DeditAccountBaseAmount", arg10);
        assertionHelper.verifyTextEquals("Verifying SI Maximum SI Amount On Ui ", "SIEntryScreen_MaximumSIAmount",
                arg13);
        assertionHelper.verifyTextEquals("Verifying SI Minimum SI Amount On Ui ", "SIEntryScreen_MinimumSIAmount",
                arg11);
        seleniumHelper.clickElement("SIEntryScreen_okButton");
        assertionHelper.verifyTextEquals("Verifying SI Debit Account Number On Ui ", "SIEntryScreen_DebitAcNum", arg9);
        assertionHelper.verifyTextEquals("Verifying SI Credit Account Number On Ui ", "SIEntryScreen_CreditAcNum",
                arg7);
        assertionHelper.verifyTextEquals("Verifying SI Amount On Ui ", "SIEntryScreen_Amount", arg8);
        seleniumHelper.clickElement("SIEntryScreen_checkboxSi");
    }
    
    @Given("^user click on Authorize Button$")
    public void user_click_on_Authorize_Button() throws Throwable {
        seleniumHelper.clickElement("SIEntryScreen_AuthorizeButton");
    }
    
    @Given("^user select reject reason \"([^\"]*)\" from dropdown$")
    public void user_select_reject_reason_from_dropdown(String arg1) throws Throwable {
        dropDownHelper.SelectUsingVisibleText("SIEntryScreen_rejectReason", arg1);
    }
    
    @Given("^user click on Reject Button$")
    public void user_click_on_Reject_Button() throws Throwable {
        seleniumHelper.clickElement("SIEntryScreen_RejectButton");
    }
    
    @Then("^verify SI_MASTER table where Si Number \"([^\"]*)\" and Flow \"([^\"]*)\" and SiType \"([^\"]*)\"$")
    public void verify_SI_MASTER_table_where_Si_Number_and_Flow_and_SiType(String arg1, String arg2, String arg3)
            throws Throwable {
        
        String SiNumber;
        if ("Auth".equalsIgnoreCase(arg2)) {
            if ("F".equalsIgnoreCase(arg3)) {
                SiNumber = cacheHelper.getCache("SINum_Fixed", cacheData);
                BigInteger SiNum = new BigInteger(SiNumber);
                siMaster = sIMasterService.getSiDetailsBySiNumber(SiNum, property.getProperty("BranchCode"));
                
                assertionHelper.verifyTwoTexts("Verifying Status of SI Number " + SiNumber + " in SI_Master Table ",
                        siMaster.getStatus(), "A");
            } else {
                SiNumber = cacheHelper.getCache("SINum_Floating", cacheData);
                BigInteger SiNum = new BigInteger(SiNumber);
                siMaster = sIMasterService.getSiDetailsBySiNumber(SiNum, property.getProperty("BranchCode"));
                
                assertionHelper.verifyTwoTexts("Verifying Status of SI Number " + SiNumber + " in SI_Master Table ",
                        siMaster.getStatus(), "A");
            }
        } else {
            if ("F".equalsIgnoreCase(arg3)) {
                SiNumber = cacheHelper.getCache("SINum_FixedRejection", cacheData);
                BigInteger SiNum = new BigInteger(SiNumber);
                siMaster = sIMasterService.getSiDetailsBySiNumber(SiNum, property.getProperty("BranchCode"));
                
                assertionHelper.verifyTwoTexts("Verifying Status of SI Number " + SiNumber + " in SI_Master Table ",
                        siMaster.getStatus(), "R");
                assertionHelper.verifyTwoTexts(
                        "Verifying Cancel Date of SI Number " + SiNumber + " in SI_Master Table ",
                        siMaster.getSiCancelledDate().toString(), dateHelper.getSystemDate("YYYY-MM-DD"));
                assertionHelper.verifyTwoTexts(
                        "Verifying Rejection Reason of SI Number " + SiNumber + " in SI_Master Table ",
                        siMaster.getReasonCode(), "R05");
            } else {
                SiNumber = cacheHelper.getCache("SINum_FloatingRejection", cacheData);
                BigInteger SiNum = new BigInteger(SiNumber);
                siMaster = sIMasterService.getSiDetailsBySiNumber(SiNum, property.getProperty("BranchCode"));
                
                assertionHelper.verifyTwoTexts("Verifying Status of SI Number " + SiNumber + " in SI_Master Table ",
                        siMaster.getStatus(), "R");
                assertionHelper.verifyTwoTexts(
                        "Verifying Cancel Date of SI Number " + SiNumber + " in SI_Master Table ",
                        siMaster.getSiCancelledDate().toString(), dateHelper.getSystemDate("YYYY-MM-DD"));
                assertionHelper.verifyTwoTexts(
                        "Verifying Rejection Reason of SI Number " + SiNumber + " in SI_Master Table ",
                        siMaster.getReasonCode(), "R02");
            }
            
        }
    }
}
