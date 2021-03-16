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

public class DeceasedCustomer extends TestBase {
    
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
    
    @Then("^setup Deceased Customer Screen$")
    public void setup_Deceased_Customer_Screen() throws Throwable {
        dbHelper.executeQuery("UPDATE CUST_MASTER SET STATUS='A' WHERE CUST_ID IN(4525,4526,4527,4528)");
        dbHelper.executeQuery("DELETE FROM DEATH_MARKING WHERE CUST_ID IN(4525,4526,4527,4528)");
        dbHelper.executeQuery(
                "DELETE FROM DEATH_CLAIM_DETAILS WHERE DEATH_MARK_ID IN (SELECT ID FROM DEATH_MARKING WHERE CUST_ID IN (4525,4526,4527,4528))");
        dbHelper.executeQuery(
                "DELETE FROM FREEZE_DETAILS WHERE FREEZE_REASON='Death' AND CUST_ID IN(4525,4526,4527,4528)");
        dbHelper.executeQuery("UPDATE ACCOUNT_MASTER SET FREEZE='N', STATUS='A' WHERE CUST_ID IN(4525,4526,4527,4528)");
        dbHelper.executeQuery(
                "DELETE FROM SP_INSTRUCTION_DETAILS WHERE INSTRUCTION_DETAILS='Death' AND CUST_ID IN (4525,4526,4527,4528)");
        dbHelper.executeQuery("Delete from DOCUMENTS_DETAILS WHERE STATUS='E'");
    }
    
    @Then("^user enters customer number \"([^\"]*)\" on Deceased Customer Entry Screen$")
    public void user_enters_customer_number_on_Deceased_Customer_Entry_Screen(String arg1) throws Throwable {
        seleniumHelper.enterText("DeceasedMarkCustomerScreen_custNumber", arg1);
        waitingHelper.sleep(4000);
    }
    
    @Then("^user verify Cust Name & DOB On Ui of Deceased Customer Entry Screen where customer number \"([^\"]*)\"$")
    public void user_verify_Cust_Name_DOB_On_Ui_of_Deceased_Customer_Entry_Screen_where_customer_number(String arg1)
            throws Throwable {
        assertionHelper.verifyTextEquals("Validate Customer Name in Cust_Master Table: ",
                "DeceasedMarkCustomerScreen_customerName", customerMasterService.getCustomerDetailsUsingNumber(arg1));
        
        assertionHelper.verifyCalendarText("Validate Customer DOB in Cust_Master Table: ",
                "DeathMarkCustomerScreen_dateOfBirth", customerMasterService.getCustomerDateOfBirthUsingNumber(arg1));
    }
    
    @Then("^user enters date of death \"([^\"]*)\"$")
    public void user_enters_date_of_death(String arg1) throws Throwable {
        seleniumHelper.enterText("DeathMarkCustomerScreen_deathDate", arg1);
    }
    
    @Then("^user select document from dropdown$")
    public void user_select_document_from_dropdown() throws Throwable {
        waitingHelper.sleep(3500);
        seleniumHelper.clickElement("DeathMarkCustomerScreen_documentType");
        seleniumHelper.clickElement("DeathMarkCustomerScreen_docType");
    }
    
    @Then("^user verify cust category On Ui where customer number \"([^\"]*)\"$")
    public void user_verify_cust_category_On_Ui_where_customer_number(String arg1) throws Throwable {
        
        String CUST_CATEGORY = customerMasterService.getCustomerCatogeryBycustNumber(arg1);
        assertionHelper.verifyTextEquals("Validate Customer Category in Cust_Master Table- ",
                "DeathMarkCustomerScreen_customerCategory",
                lookupService.getLookdetailsByCodeAndType(CUST_CATEGORY, "CATEGORY").getDescription());
    }
    
    @Then("^user click on Claimant Detail tab$")
    public void user_click_on_Claimant_Detail_tab() throws Throwable {
        seleniumHelper.clickElement("DeathMarkCustomerScreen_claimantDetailTab");
    }
    
    @Then("^user select existing customer \"([^\"]*)\" or Non Customer \"([^\"]*)\" radio button$")
    public void user_select_existing_customer_or_Non_Customer_radio_button(String arg1, String arg2) throws Throwable {
        if ("Existing Customer".equalsIgnoreCase(arg1)) {
            seleniumHelper.clickElement("DeathMarkCustomerScreen_existingCustomer");
        } else {
            seleniumHelper.clickElement("DeathMarkCustomerScreen_nonCustomer");
        }
    }
    
    @Then("^user enters cust number of Claimant where customer number \"([^\"]*)\"$")
    public void user_enters_cust_number_of_Claimant_where_customer_number(String arg1) throws Throwable {
        seleniumHelper.enterText("DeathMarkCustomerScreen_claimantCustNumber", arg1);
    }
    
    @Then("^user enters remark \"([^\"]*)\" on Deceased Customer Entry Screen$")
    public void user_enters_remark_on_Deceased_Customer_Entry_Screen(String arg1) throws Throwable {
        seleniumHelper.enterText("DeathMarkCustomerScreen_remark", arg1);
    }
    
    @Then("^user click on Submit button of Deceased Customer Entry Screen$")
    public void user_click_on_Submit_button_of_Deceased_Customer_Entry_Screen() throws Throwable {
        seleniumHelper.clickElement("DeathMarkCustomerScreen_submit");
        waitingHelper.sleep(3000);
    }
    
    @Then("^user enters cust name of Claimant where customer name \"([^\"]*)\"$")
    public void user_enters_cust_name_of_Claimant_where_customer_name(String arg1) throws Throwable {
        seleniumHelper.enterText("DeathMarkCustomerScreen_claimantName", arg1);
    }
    
    @Then("^user enters cust address of Claimant where customer address \"([^\"]*)\"$")
    public void user_enters_cust_address_of_Claimant_where_customer_address(String arg1) throws Throwable {
        seleniumHelper.enterText("DeathMarkCustomerScreen_claimantAddress", arg1);
    }
    
    @Then("^user enters cust contact of Claimant where customer contact \"([^\"]*)\"$")
    public void user_enters_cust_contact_of_Claimant_where_customer_contact(String arg1) throws Throwable {
        seleniumHelper.enterText("DeathMarkCustomerScreen_claimantContact", arg1);
    }
    
    @Then("^verify customer Accounts Details Ui Verification where xpath \"([^\"]*)\" & customer number \"([^\"]*)\"$")
    public void verify_customer_Accounts_Details_Ui_Verification_where_xpath_customer_number(String arg1, String arg2)
            throws Throwable {
        int x = 1;
        int rowSize = 0;
        List<String> dbrecords = deathMarkingService.getCustomerAccountDetailsForUI(arg2);
        
        List<String> customerAccountDetailsOnUI = new ArrayList<String>();
        List<String> customerAccountDetailsInDB = deathMarkingService.getCustomerAccountDetailsForUI(arg2);
        List<WebElement> noOfrecordInTable = d.findElements(By.xpath(arg1 + "/table/tbody/tr/td[3]"));
        String accountType = null;
        String accountNumber = null;
        String accountBalance = null;
        List<String> storeUIList = new ArrayList<>();
        List<String> storeDBList = deathMarkingService.getCustomerAccountDetailsForUI(arg2);
        if (dbrecords.size() > 0) {
            rowSize = dbrecords.size();
        }
        for (WebElement accountMaster : noOfrecordInTable) {
            accountType = seleniumHelper.getTextFromAnElement((arg1 + "/table/tbody/tr[" + x + "]/td[1]"));
            accountNumber = seleniumHelper.getTextFromAnElement((arg1 + "/table/tbody/tr[" + x + "]/td[2]"));
            accountBalance = seleniumHelper.getTextFromAnElement((arg1 + "/table/tbody/tr[" + x + "]/td[3]"));
            
            customerAccountDetailsOnUI.add(accountType + "_" + accountNumber);
            storeUIList.add(accountType + "_" + accountNumber);
            x++;
        }
        
        customerAccountDetailsOnUI.retainAll(customerAccountDetailsInDB);
        for (String xx : customerAccountDetailsOnUI) {
            
            reportHelper.writeLogInCaseOfPassInChildTest(
                    "Account Details Record Found On UI Matched With DB Values: " + xx);
        }
        customerAccountDetailsInDB.removeAll(storeUIList);
        for (String yy : customerAccountDetailsInDB) {
            if (customerAccountDetailsInDB.size() > 0) {
                reportHelper.writeLogInCaseOfFailInChildTest("Record Not found on UI  " + yy);
            }
        }
        storeUIList.removeAll(storeDBList);
        for (String zz : storeUIList) {
            if (storeUIList.size() > 0)
                reportHelper.writeLogInCaseOfFailInChildTest("Record Not found in DB " + zz);
        }
    }
    
    @Then("^verify customer Documents Details Ui Verification where xpath \"([^\"]*)\" & customer number \"([^\"]*)\"$")
    public void verify_customer_Documents_Details_Ui_Verification_where_xpath_customer_number(String arg1, String arg2)
            throws Throwable {
        int x = 1;
        int rowSize = 0;
        List<String> dbrecords = documentDetailsService.getCustomerDocDescriptionForUI(arg2);
        
        List<String> customerDocumentDetailsOnUI = new ArrayList<String>();
        List<String> customerDocumentDetailsInDB = documentDetailsService.getCustomerDocDescriptionForUI(arg2);
        List<WebElement> noOfrecordInTable = d.findElements(By.xpath(arg1 + "/table/tbody/tr/td[3]"));
        String docDescription = null;
        List<String> storeUIList = new ArrayList<>();
        List<String> storeDBList = documentDetailsService.getCustomerDocDescriptionForUI(arg2);
        if (dbrecords.size() > 0) {
            rowSize = dbrecords.size();
        }
        for (WebElement accountMaster : noOfrecordInTable) {
            docDescription = seleniumHelper.getTextFromAnElement((arg1 + "/table/tbody/tr[" + x + "]/td[2]"));
            customerDocumentDetailsOnUI.add(docDescription);
            storeUIList.add(docDescription);
            x++;
        }
        
        customerDocumentDetailsOnUI.retainAll(customerDocumentDetailsInDB);
        for (String xx : customerDocumentDetailsOnUI) {
            reportHelper.writeLogInCaseOfPassInChildTest(
                    "Document Details Record Found On UI Matched With DB Values: " + xx);
        }
        customerDocumentDetailsInDB.removeAll(storeUIList);
        for (String yy : customerDocumentDetailsInDB) {
            if (customerDocumentDetailsInDB.size() > 0) {
                reportHelper.writeLogInCaseOfFailInChildTest("Record Not found on UI  " + yy);
            }
        }
        storeUIList.removeAll(storeDBList);
        for (String zz : storeUIList) {
            if (storeUIList.size() > 0)
                reportHelper.writeLogInCaseOfFailInChildTest("Record Not found in DB " + zz);
        }
        
    }
    
    @Then("^verify DEATH_MARKING & DEATH_CLAIM_DETAILS & ACCOUNT_MASTER table where customer number \"([^\"]*)\" and claimant \"([^\"]*)\"$")
    public void verify_DEATH_MARKING_DEATH_CLAIM_DETAILS_ACCOUNT_MASTER_table_where_customer_number_and_claimant(
            String arg1, String arg2) throws Throwable {
        deathMarkingService.deathMarkEntryVerification(arg1, arg2);
    }
    
    @Then("^verify FREEZE_DETAILS where customer number \"([^\"]*)\"$")
    public void verify_FREEZE_DETAILS_where_customer_number(String arg1) throws Throwable {
        
        List<FreezeDetailsEntity> freezeDetailsList = new ArrayList<>();
        freezeDetailsList = deathMarkingService.getDeceasedFrezzeDetailsByCustId(arg1);
        
        for (FreezeDetailsEntity objFreezeDetails : freezeDetailsList) {
            assertionHelper.verifyTwoTexts(
                    "Validate freeze type of Acc_ID " + objFreezeDetails.getAccId() + " in Freeze_Details table ",
                    objFreezeDetails.getFreezeType(), "T");
            
            assertionHelper.verifyTwoTexts(
                    "Validate freeze status of Acc_ID " + objFreezeDetails.getAccId() + " in Freeze_Details table ",
                    objFreezeDetails.getFreezeStatus(), "E");
            
            assertionHelper.verifyTwoTexts(
                    "Validate freeze reason of Acc_ID " + objFreezeDetails.getAccId() + " in Freeze_Details table ",
                    objFreezeDetails.getFreezeReason(), "Death");
        }
    }
    
    @Then("^store Account Status Freeze Value Before Deceased Entry where customer number \"([^\"]*)\"$")
    public void store_Account_Status_Freeze_Value_Before_Deceased_Entry_where_customer_number(String arg1)
            throws Throwable {
        List<AccountMasterEntity> accMasterList = deathMarkingService.getDeceasedCustomerAccountDetails(arg1);
        
        for (AccountMasterEntity objAccMaster : accMasterList) {
            cacheHelper.setCacheWithaString(objAccMaster.getAccId() + "_" + " status", objAccMaster.getStatus() + "",
                    cacheData);
            cacheHelper.setCacheWithaString(objAccMaster.getAccId() + "_" + " freeze", objAccMaster.getFreeze() + "",
                    cacheData);
        }
    }
    
    @Then("^verify Account_Master table customer number \"([^\"]*)\" & FreezeStatus \"([^\"]*)\" & freeze \"([^\"]*)\" value after Deceased entry$")
    public void verify_Account_Master_table_customer_number_FreezeStatus_freeze_value_after_Deceased_entry(String arg1,
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
    
    @Then("^verify SP_INSTRUCTION_DETAILS table where customer number \"([^\"]*)\" after Deceased Customer Entry$")
    public void verify_SP_INSTRUCTION_DETAILS_table_where_customer_number_after_Deceased_Customer_Entry(String arg1)
            throws Throwable {
        
        List<SpInstructionDetailsEntity> spInstructionDetailsList = new ArrayList<>();
        spInstructionDetailsList = spInstructionDetailsService.getBlacklistSpInstructionDetailsByCustId(arg1);
        
        for (SpInstructionDetailsEntity objSpInsDetails : spInstructionDetailsList) {
            assertionHelper.verifyTwoTexts("Validate Applicable_For of AccId " + objSpInsDetails.getAccId()
                    + " in SP_Instruction_Details table ", objSpInsDetails.getApplicableFor(), "C");
            
            assertionHelper.verifyTwoTexts("Validate Instruction_Details of AccId " + objSpInsDetails.getAccId()
                    + " in SP_Instruction_Details table ", objSpInsDetails.getInstructionDetails(), "Death");
            
            assertionHelper.verifyTwoTexts(
                    "Validate Entered_Date of AccId " + objSpInsDetails.getAccId()
                            + " in SP_Instruction_Details table  ",
                    objSpInsDetails.getEnteredDate().toString(),
                    branchParametersService.getBnrachLiveDate(property.getProperty("BranchCode")).toString());
        }
    }
    
    @Then("^user select customer number \"([^\"]*)\" on Deceased Customer Entry Auth Screen$")
    public void user_select_customer_number_on_Deceased_Customer_Entry_Auth_Screen(String arg1) throws Throwable {
        dropDownHelper.SelectUsingVisibleText("DeceasedMarkCustomerScreen_custNum", arg1);
        waitingHelper.sleep(3000);
    }
    
    @Then("^user verify cust death date \"([^\"]*)\" On Ui where customer number \"([^\"]*)\"$")
    public void user_verify_cust_death_date_On_Ui_where_customer_number(String arg1, String arg2) throws Throwable {
        assertionHelper.verifyCalendarText("Verifying Death Date On Ui ", "DeathMarkCustomerScreen_deathDate", arg1);
    }
    
    @Then("^verify select existing customer \"([^\"]*)\" or Non Customer \"([^\"]*)\" On Ui$")
    public void verify_select_existing_customer_or_Non_Customer_On_Ui(String arg1, String arg2) throws Throwable {
        if ("Existing Customer".equalsIgnoreCase(arg1)) {
            assertionHelper.verifyTextEquals("Verifying Selected Claimant Deatils On Ui ",
                    "DeathMarkCustomerScreen_existingCustomer", arg1);
        } else {
            assertionHelper.verifyTextEquals("Verifying Selected Claimant Deatils On Ui ",
                    "DeathMarkCustomerScreen_nonCustomer", arg2);
        }
    }
    
    @Then("^verify cust number of Claimant where customer number \"([^\"]*)\" & remark \"([^\"]*)\" On Ui$")
    public void verify_cust_number_of_Claimant_where_customer_number_remark_On_Ui(String arg1, String arg2)
            throws Throwable {
        
        assertionHelper.verifyTextEquals("Verifying Claimant Customer Number On Ui ",
                "DeathMarkCustomerScreen_claimantCustNumber", arg1);
        assertionHelper.verifyTextEquals("Verifying Remark On Ui ", "DeathMarkCustomerScreen_remark", arg2);
    }
    
    @Then("^verify cust name of Claimant where customer name \"([^\"]*)\" & customer address \"([^\"]*)\" & customer contact \"([^\"]*)\" & remark \"([^\"]*)\" On Ui$")
    public void verify_cust_name_of_Claimant_where_customer_name_customer_address_customer_contact_remark_On_Ui(
            String arg1, String arg2, String arg3, String arg4) throws Throwable {
        assertionHelper.verifyTextEquals("Verifying Claimant Customer Name On Ui ",
                "DeathMarkCustomerScreen_claimantName", arg1);
        
        assertionHelper.verifyTextEquals("Verifying Claimant Customer Address On Ui ",
                "DeathMarkCustomerScreen_claimantAddress", arg2);
        assertionHelper.verifyTextEquals("Verifying Claimant Customer Contact On Ui ",
                "DeathMarkCustomerScreen_claimantContact", arg3);
        assertionHelper.verifyTextEquals("Verifying Remark On Ui ", "DeathMarkCustomerScreen_remark", arg4);
        
    }
    
    @Then("^user click on Authorize button of Deceased Customer Entry Auth Screen$")
    public void user_click_on_Authorize_button_of_Deceased_Customer_Entry_Auth_Screen() throws Throwable {
        
        seleniumHelper.clickElement("DeathMarkCustomerScreen_authorize");
    }
    
    @Then("^verify DEATH_MARKING & DEATH_CLAIM_DETAILS & ACCOUNT_MASTER table where customer number \"([^\"]*)\" & flow \"([^\"]*)\"$")
    public void verify_DEATH_MARKING_DEATH_CLAIM_DETAILS_ACCOUNT_MASTER_table_where_customer_number_flow(String arg1,
            String arg2) throws Throwable {
        deathMarkingService.validateDeathMarkAndDeathDetailsTableDataAfterAuth(arg1, arg2);
        
    }
    
    @Then("^verify FREEZE_DETAILS table where customer number \"([^\"]*)\" & flow \"([^\"]*)\"$")
    public void verify_FREEZE_DETAILS_table_where_customer_number_flow(String arg1, String arg2) throws Throwable {
        
        List<FreezeDetailsEntity> freezeDetailsList = new ArrayList<>();
        freezeDetailsList = deathMarkingService.getDeceasedFrezzeDetailsByCustId(arg1);
        
        if ("Auth".equalsIgnoreCase(arg2)) {
            for (FreezeDetailsEntity objFreezeDetails : freezeDetailsList) {
                assertionHelper.verifyTwoTexts(
                        "Validate Freeze status of Acc_ID " + objFreezeDetails.getAccId() + " in Freeze_Details table ",
                        objFreezeDetails.getFreezeStatus(), "A");
                
                assertionHelper.verifyTwoTexts(
                        "Validate Freeze type of Acc_ID " + objFreezeDetails.getAccId() + " in Freeze_Details table ",
                        objFreezeDetails.getFreezeType(), "T");
            }
        }
        if ("Reject".equalsIgnoreCase(arg2)) {
            for (FreezeDetailsEntity objFreezeDetails : freezeDetailsList) {
                assertionHelper.verifyTwoTexts(
                        "Validate Freeze status of Acc_ID " + objFreezeDetails.getAccId() + " in Freeze_Details table ",
                        objFreezeDetails.getFreezeStatus(), "R");
                
                assertionHelper.verifyTwoTexts(
                        "Validate Freeze type of Acc_ID " + objFreezeDetails.getAccId() + " in Freeze_Details table ",
                        objFreezeDetails.getFreezeType(), "N");
            }
        }
        
    }
    
    @Then("^user click on Reject button of Deceased Customer Entry Auth Screen$")
    public void user_click_on_Reject_button_of_Deceased_Customer_Entry_Auth_Screen() throws Throwable {
        seleniumHelper.clickElement("DeathMarkCustomerScreen_reject");
    }
    
}
