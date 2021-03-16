package com.sysnik.selenium.stepConfiguraiton;

import java.util.ArrayList;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.AccountMasterEntity;
import com.sysnik.selenium.entity.CustomerMasterEntity;
import com.sysnik.selenium.entity.FreezeDetailsEntity;
import com.sysnik.selenium.entity.SpInstructionDetailsEntity;
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

public class BlacklistCustomer extends TestBase {
    
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
    
    private CustomerMasterEntity custMaster;
    
    @Then("^setup Blacklist Customer Screen$")
    public void setup_Blacklist_Customer_Screen() throws Throwable {
        dbHelper.executeQuery("UPDATE CUST_MASTER SET STATUS='A' WHERE CUST_ID IN (4520,4521,4522,4523,4579,4524)");
        dbHelper.executeQuery(
                "UPDATE ACCOUNT_MASTER SET STATUS='A',FREEZE='N' WHERE CUST_ID IN (4520,4521,4522,4523,4579,4524)");
        dbHelper.executeQuery("DELETE FROM FREEZE_DETAILS WHERE CUST_ID IN (4520,4521,4522,4523,4579,4524)");
        dbHelper.executeQuery(
                "DELETE FROM SP_INSTRUCTION_DETAILS WHERE INSTRUCTION_DETAILS='B' AND CUST_ID IN (4520,4521,4522,4523,4579,4524)");
        dbHelper.executeQuery("DELETE FROM BLACK_LIST_MASTER WHERE CUST_ID IN (4520,4521,4522,4523,4579,4524)");
        dbHelper.executeQuery(
                "DELETE FROM BLACK_LIST_DETAILS WHERE BLACK_LIST_ID IN (SELECT ID FROM BLACK_LIST_MASTER WHERE CUST_ID IN (4520,4521,4522,4523,4579,4524))");
        dbHelper.executeQuery(
                "UPDATE ACCOUNT_MASTER SET FREEZE='C' WHERE ATM_FACILITY='N' AND CUST_ID IN (SELECT CUST_ID FROM CUST_MASTER WHERE CUST_NUMBER IN (0011000000001731,0011000000001733))");
    }
    
    @Then("^user enters customer number \"([^\"]*)\" on Blacklist Customer Entry Screen$")
    public void user_enters_customer_number_on_Blacklist_Customer_Entry_Screen(String arg1) throws Throwable {
        seleniumHelper.enterText("BlacklistCustomerScreen_custNumber", arg1);
        waitingHelper.sleep(3500);
    }
    
    @Then("^user verify Account Details of Blacklist Customer On Ui where xpath \"([^\"]*)\" & customer number \"([^\"]*)\"$")
    public void user_verify_Account_Details_of_Blacklist_Customer_On_Ui_where_xpath_customer_number(String arg1,
            String arg2) throws Throwable {
        int x = 1;
        int rowSize = 0;
        List<String> dbrecords = blackListMasterService.getCustomerAccountDetailsForUI(arg2);
        
        List<String> blackListingDetailsOnUI = new ArrayList<String>();
        List<String> blackListingDetailsInDB = blackListMasterService.getCustomerAccountDetailsForUI(arg2);
        List<WebElement> noOfrecordInTable = d.findElements(By.xpath(arg1 + "/table/tbody/tr/td[2]"));
        String accountType = null;
        String accountNumber = null;
        String accountBalance = null;
        List<String> storeUIList = new ArrayList<>();
        List<String> storeDBList = blackListMasterService.getCustomerAccountDetailsForUI(arg2);
        if (dbrecords.size() > 0) {
            rowSize = dbrecords.size();
        }
        for (WebElement accountMaster : noOfrecordInTable) {
            accountType = seleniumHelper.getTextFromAnElement((arg1 + "/table/tbody/tr[" + x + "]/td[1]"));
            accountNumber = seleniumHelper.getTextFromAnElement((arg1 + "/table/tbody/tr[" + x + "]/td[2]"));
            accountBalance = seleniumHelper.getTextFromAnElement((arg1 + "/table/tbody/tr[" + x + "]/td[3]"));
            
            blackListingDetailsOnUI.add(accountType + "_" + accountNumber);
            storeUIList.add(accountType + "_" + accountNumber);
            x++;
        }
        blackListingDetailsOnUI.retainAll(blackListingDetailsInDB);
        for (String xx : blackListingDetailsOnUI) {
            
            reportHelper.writeLogInCaseOfPassInChildTest("Record found on UI matched with DB Values: " + xx);
        }
        blackListingDetailsInDB.removeAll(storeUIList);
        for (String zz : blackListingDetailsInDB) {
            if (blackListingDetailsInDB.size() > 0) {
                reportHelper.writeLogInCaseOfFailInChildTest("Record Not found on UI  " + zz);
            }
        }
        storeUIList.removeAll(storeDBList);
        for (String qq : storeUIList) {
            if (storeUIList.size() > 0)
                reportHelper.writeLogInCaseOfFailInChildTest("Record Not found in DB " + qq);
        }
    }
    
    @Then("^user verify Cust Name & DOB & Category where customer number \"([^\"]*)\"$")
    public void user_verify_Cust_Name_DOB_Category_where_customer_number(String arg1) throws Throwable {
        assertionHelper.verifyTextEquals("Validate Customer Name On Ui: ", "BlacklistCustomerScreen_customerName",
                customerMasterService.getCustomerDetailsUsingNumber(arg1));
        
        assertionHelper.verifyCalendarText("Validate Customer Date Of Birth On Ui: ",
                "BlacklistCustomerScreen_dateOfBirth", customerMasterService.getCustomerDateOfBirthUsingNumber(arg1));
        
        String CUST_CATEGORY = customerMasterService.getCustomerCatogeryBycustNumber(arg1);
        assertionHelper.verifyTextEquals("Validate Customer Category On Ui: ",
                "BlacklistCustomerScreen_customerCategory",
                lookupService.getLookdetailsByCodeAndType(CUST_CATEGORY, "CATEGORY").getDescription());
    }
    
    @Then("^user enters blacklist reason \"([^\"]*)\"$")
    public void user_enters_blacklist_reason(String arg1) throws Throwable {
        seleniumHelper.enterText("BlacklistCustomerScreen_reason", arg1);
    }
    
    @Then("^user click on Submit button on Blacklist Customer Entry$")
    public void user_click_on_Submit_button_on_Blacklist_Customer_Entry() throws Throwable {
        seleniumHelper.clickElement("BlacklistCustomerScreen_submit");
        waitingHelper.sleep(3000);
    }
    
    @Then("^verify BLACK_LIST_MASTER table where customer number \"([^\"]*)\"$")
    public void verify_BLACK_LIST_MASTER_table_where_customer_number(String arg1) throws Throwable {
        blackListMasterService.blacklistCustomerEntryVerification(arg1);
    }
    
    @Then("^verify BLACK_LIST_DETAILS table where customer number \"([^\"]*)\"$")
    public void verify_BLACK_LIST_DETAILS_table_where_customer_number(String arg1) throws Throwable {
        blackListMasterService.verifyBlacklistDetailsTableData(arg1);
    }
    
    @Then("^verify FREEZE_DETAILS table where customer number \"([^\"]*)\"$")
    public void verify_FREEZE_DETAILS_table_where_customer_number(String arg1) throws Throwable {
        
        List<FreezeDetailsEntity> freezeDetailsList = new ArrayList<>();
        freezeDetailsList = freezeDetailsService.getBlacklistFrezzeDetailsByCustId(arg1);
        
        for (FreezeDetailsEntity objFreezeDetails : freezeDetailsList) {
            assertionHelper.verifyTwoTexts(
                    "Validate freeze type of AccId " + objFreezeDetails.getAccId() + " in Freeze_Details table ",
                    objFreezeDetails.getFreezeType(), "D");
            
            assertionHelper.verifyTwoTexts(
                    "Validate freeze status of AccId " + objFreezeDetails.getAccId() + " in Freeze_Details table ",
                    objFreezeDetails.getFreezeStatus(), "E");
            
            assertionHelper.verifyTwoTexts(
                    "Validate freeze reason of AccId " + objFreezeDetails.getAccId() + " in Freeze_Details table ",
                    objFreezeDetails.getFreezeReason(), "B");
            
        }
    }
    
    @Then("^verify SP_INSTRUCTION_DETAILS table where customer number \"([^\"]*)\"$")
    public void verify_SP_INSTRUCTION_DETAILS_table_where_customer_number(String arg1) throws Throwable {
        List<SpInstructionDetailsEntity> spInstructionDetailsList = new ArrayList<>();
        spInstructionDetailsList = spInstructionDetailsService.getBlacklistSpInstructionDetailsByCustId(arg1);
        
        for (SpInstructionDetailsEntity objSpInsDetails : spInstructionDetailsList) {
            assertionHelper.verifyTwoTexts("Validate Applicable_For of AccId " + objSpInsDetails.getAccId()
                    + " in SP_Instruction_Details table ", objSpInsDetails.getApplicableFor(), "C");
            
            assertionHelper.verifyTwoTexts("Validate Instruction_Details of AccId " + objSpInsDetails.getAccId()
                    + " in SP_Instruction_Details table ", objSpInsDetails.getInstructionDetails(), "B");
            
            assertionHelper.verifyTwoTexts(
                    "Validate Entered_Date of AccId " + objSpInsDetails.getAccId()
                            + " in SP_Instruction_Details table  ",
                    objSpInsDetails.getEnteredDate().toString(),
                    branchParametersService.getBnrachLiveDate(property.getProperty("BranchCode")).toString());
        }
    }
    
    @Then("^store Account_Master table customer number \"([^\"]*)\" Status & freeze value before blacklist entry$")
    public void store_Account_Master_table_customer_number_Status_freeze_value_before_entry(String arg1)
            throws Throwable {
        String custNumber = arg1;
        List<AccountMasterEntity> accMasterList = freezeDetailsService.getCustomerAccountDetails(custNumber);
        for (AccountMasterEntity objAccMaster : accMasterList) {
            cacheHelper.setCacheWithaString(objAccMaster.getAccId() + "_" + " status", objAccMaster.getStatus() + "",
                    cacheData);
            cacheHelper.setCacheWithaString(objAccMaster.getAccId() + "_" + " freeze", objAccMaster.getFreeze() + "",
                    cacheData);
        }
    }
    
    @Then("^verify Account_Master table customer number \"([^\"]*)\" & FreezeStatus \"([^\"]*)\" & freeze \"([^\"]*)\" value after blacklist entry$")
    public void verify_Account_Master_table_customer_number_FreezeStatus_freeze_value_after_entry(String arg1,
            String arg2, String arg3) throws Throwable {
        List<AccountMasterEntity> accMasterList = freezeDetailsService.getCustomerAccountDetails(arg1);
        for (AccountMasterEntity objAccMaster : accMasterList) {
            if (!objAccMaster.getAccId().equals(freezeDetailsService.getFrezzeDetailsByCustId(arg1).getAccId())) {
                assertionHelper.verifyTwoTexts(
                        "Account Status in Account_Master Table After Freeze Entry of AccId " + objAccMaster.getAccId(),
                        objAccMaster.getStatus(),
                        cacheHelper.getCache(objAccMaster.getAccId() + "_" + " status", cacheData));
                assertionHelper.verifyTwoTexts(
                        "Account Freeze Value in Account_Master Table After Freeze Entry of AccId "
                                + objAccMaster.getAccId(),
                        objAccMaster.getFreeze(),
                        cacheHelper.getCache(objAccMaster.getAccId() + "_" + " freeze", cacheData));
            } else {
                assertionHelper.verifyTwoTexts(
                        "Account Status in Account_Master Table After Freeze Entry of AccId " + objAccMaster.getAccId(),
                        objAccMaster.getStatus(), arg2);
                assertionHelper
                        .verifyTwoTexts("Account Freeze Value in Account_Master Table After Freeze Entry of AccId "
                                + objAccMaster.getAccId(), objAccMaster.getFreeze(), arg3);
            }
        }
    }
    
    @Then("^user select customer number \"([^\"]*)\" from dropdown of Blacklist Customer Entry Auth$")
    public void user_select_customer_number_from_dropdown_of_Blacklist_Customer_Entry_Auth(String arg1)
            throws Throwable {
        dropDownHelper.SelectUsingVisibleText("BlacklistCustomerScreen_custNum", arg1);
        waitingHelper.sleep(3500);
    }
    
    @Then("^user verify cust Name & DOB & Category & Reason \"([^\"]*)\"$")
    public void user_verify_cust_Name_DOB_Category_Reason(String arg1) throws Throwable {
        custMaster = customerMasterService.getCustomerUsingNumber(arg1);
        assertionHelper.verifyTextEquals("Validate Customer Name On Ui: ", "BlacklistCustomerScreen_customerName",
                customerMasterService.getCustomerDetailsUsingNumber(arg1));
        assertionHelper.verifyCalendarText("Validate Date Of Birth On Ui ", "BlacklistCustomerScreen_dateOfBirth",
                customerMasterService.getCustomerDateOfBirthUsingNumber(arg1));
        String CUST_CATEGORY = customerMasterService.getCustomerCatogeryBycustNumber(arg1);
        assertionHelper.verifyTextEquals("Validate Customer Category On Ui: ",
                "BlacklistCustomerScreen_customerCategory",
                lookupService.getLookdetailsByCodeAndType(CUST_CATEGORY, "CATEGORY").getDescription());
        assertionHelper.verifyTextEquals("Validate Reason On Ui: ", "BlacklistCustomerScreen_reason",
                blackListMasterService.getReasonByCustomerId(arg1));
    }
    
    @Then("^user click on Authorize button of Blacklist Customer Entry Auth$")
    public void user_click_on_Authorize_button_of_Blacklist_Customer_Entry_Auth() throws Throwable {
        seleniumHelper.clickElement("ChequeBookRequestScreen_Authorize");
    }
    
    @Then("^verify BLACK_LIST_MASTER & BLACK_LIST_DETAILS table where customer number \"([^\"]*)\" & Flag \"([^\"]*)\" After Auth$")
    public void verify_BLACK_LIST_MASTER_BLACK_LIST_DETAILS_table_where_customer_number_Flag_After_Auth(String arg1,
            String arg2) throws Throwable {
        blackListMasterService.blacklistCustomerAuthVerification(arg1, arg2);
    }
    
    @Then("^user click on Reject button of Blacklist Customer Entry Auth$")
    public void user_click_on_Reject_button_of_Blacklist_Customer_Entry_Auth() throws Throwable {
        seleniumHelper.clickElement("BlacklistCustomerScreen_reject");
    }
    
    @Then("^verify CUST_MASTER table where customer number \"([^\"]*)\"$")
    public void verify_CUST_MASTER_table_where_customer_number(String arg1) throws Throwable {
        custMaster = customerMasterService.getCustomerUsingNumber(arg1);
        assertionHelper.verifyTwoTexts("Validate Customer Status in Cust_Master Table After Rejection: ",
                custMaster.getStatus(), "A");
    }
    
    @Then("^verify BLACK_LIST_MASTER & BLACK_LIST_DETAILS table where customer number \"([^\"]*)\" & Flag \"([^\"]*)\" After Reject$")
    public void verify_BLACK_LIST_MASTER_BLACK_LIST_DETAILS_table_where_customer_number_Flag_After_Reject(String arg1,
            String arg2) throws Throwable {
        blackListMasterService.blacklistCustomerRejectVerification(arg1, arg2);
    }
    
    @Then("^verify FREEZE_DETAILS table where customer number \"([^\"]*)\" & Flow \"([^\"]*)\" After Auth & Reject$")
    public void verify_FREEZE_DETAILS_table_where_customer_number_Flow_After_Auth_Reject(String arg1, String arg2)
            throws Throwable {
        List<FreezeDetailsEntity> freezeDetailsList = new ArrayList<>();
        freezeDetailsList = freezeDetailsService.getBlacklistFrezzeDetailsByCustId(arg1);
        for (FreezeDetailsEntity objFreezeDetails : freezeDetailsList) {
            if ("Auth".equalsIgnoreCase(arg2)) {
                assertionHelper.verifyTwoTexts(
                        "Validate freeze status of AccId " + objFreezeDetails.getAccId() + " in Freeze_Details table ",
                        objFreezeDetails.getFreezeStatus(), "A");
            } else {
                assertionHelper.verifyTwoTexts(
                        "Validate freeze status of AccId " + objFreezeDetails.getAccId() + " in Freeze_Details table ",
                        objFreezeDetails.getFreezeStatus(), "R");
            }
        }
    }
}