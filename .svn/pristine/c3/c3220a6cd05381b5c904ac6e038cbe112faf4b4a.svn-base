package com.sysnik.selenium.stepConfiguraiton;

import java.util.List;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.AccountMasterEntity;
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

public class FreezeCustomerAccount extends TestBase {
    
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
    private FreezeDetailsEntity freezeDetails;
    
    @Then("^setup Freeze Customer Screen$")
    public void setup_Freeze_Customer_Screen() throws Throwable {
        dbHelper.executeQuery(
                "UPDATE CUST_MASTER SET STATUS='A' WHERE STATUS='M' AND CUST_ID IN (4505,4506,4507,4568,4569,4570,4744,4745,4746,4747,4748,4749,4757, 4758, 4759, 4760, 4761, 4762, 4763, 4764, 4765, 4766, 4767, 4768,4775,4776)");
        dbHelper.executeQuery(
                "DELETE FROM FREEZE_DETAILS WHERE FREEZE_STATUS IN ('E','A') AND CUST_ID IN (4505,4506,4507,4568,4569,4570,4744,4745,4746,4747,4748,4749,4757, 4758, 4759, 4760, 4761, 4762, 4763, 4764, 4765, 4766, 4767, 4768,4775,4776)");
        dbHelper.executeQuery(
                "UPDATE CUST_MASTER SET FREEZE='N' WHERE CUST_ID IN (4505,4506,4507,4568,4569,4570,4744,4745,4746,4747,4748,4749,4757, 4758, 4759, 4760, 4761, 4762, 4763, 4764, 4765, 4766, 4767, 4768,4775,4776)");
        dbHelper.executeQuery(
                "DELETE FROM FREEZE_DETAILS WHERE FREEZE_REASON IN ('Total Freezed','Debit Freezed','Credit Freezed')");
    }
    
    @Then("^setup Freeze Customer Accounts Screen$")
    public void setup_Freeze_Customer_Accounts_Screen() throws Throwable {
        dbHelper.executeQuery(
                "UPDATE ACCOUNT_MASTER SET FREEZE='N', STATUS='A' WHERE CUST_ID IN (4514,4512,4513,4571,4572,4753,4573,4750,4751,4752,4754,4755,4756,4783,4784,4785,4786,4787,4788,4789,4790,4777, 4778, 4779, 4780, 4781, 4782)");
        dbHelper.executeQuery(
                "DELETE FROM FREEZE_DETAILS WHERE FREEZE_STATUS IN ('E','A') AND CUST_ID IN (4514,4512,4513,4571,4572,4573,4750,4751,4752,4753,4754,4755,4756,4783,4784,4785,4786,4787,4788,4789,4790,4777, 4778, 4779, 4780, 4781, 4782)");
    }
    
    @Then("^user enters customer number \"([^\"]*)\" on Freeze Customer Screen$")
    public void user_enters_customer_number_on_Freeze_Customer_Screen(String arg1) throws Throwable {
        
        seleniumHelper.enterText("FreezeCustomerAccountScreen_custNumber", arg1);
        waitingHelper.sleep(3000);
    }
    
    @Then("^verify customer number \"([^\"]*)\" Customer Name & Cust Category$")
    public void verify_customer_number_Customer_Name_Cust_Category(String arg1) throws Throwable {
        assertionHelper.verifyTextEquals("Validate Customer Name in Cust_Master Table- ",
                "FreezeCustomerAccountScreen_custName", customerMasterService.getCustomerDetailsUsingNumber(arg1));
        
        String CUST_CATEGORY = customerMasterService.getCustomerCatogeryBycustNumber(arg1);
        assertionHelper.verifyTextEquals("Validate Customer Category in Cust_Master Table- ",
                "FreezeCustomerAccountScreen_custCategory",
                lookupService.getLookdetailsByCodeAndType(CUST_CATEGORY, "CATEGORY").getDescription());
    }
    
    @Then("^user select \"([^\"]*)\" as Customer or Account$")
    public void user_select_as_Customer_or_Account(String arg1) throws Throwable {
        if ("Customer".equalsIgnoreCase(arg1)) {
            seleniumHelper.clickElement("FreezeCustomerAccountScreen_custFreezeY");
            
        } else {
            seleniumHelper.clickElement("FreezeCustomerAccountScreen_custFreezeN");
        }
    }
    
    @Then("^user select \"([^\"]*)\" as Customer or Account on Auth screen$")
    public void user_select_as_Customer_or_Account_on_Auth_screen(String arg1) throws Throwable {
        if ("Customer".equalsIgnoreCase(arg1)) {
            
            assertionHelper.verifyTextEquals("Verifying Select For Freeze On Ui ",
                    "FreezeCustomerAccountScreen_custAccFreezeC", arg1);
        } else {
            
            assertionHelper.verifyTextEquals("Verifying Select For Freeze On Ui ",
                    "FreezeCustomerAccountScreen_custAccFreezeA", arg1);
        }
    }
    
    @Then("^user verify customer type \"([^\"]*)\" Individual or Non individual$")
    public void user_verify_customer_type_Individual_or_Non_individual(String arg1) throws Throwable {
        if ("Individual".equalsIgnoreCase(arg1)) {
            
            assertionHelper.verifyTextEquals("Validate Customer Type On Ui ", "FreezeCustomerAccountScreen_customerInd",
                    arg1);
        } else {
            assertionHelper.verifyTextEquals("Validate Customer Type On Ui ", "FreezeCustomerAccountScreen_customerOrg",
                    arg1);
        }
    }
    
    @Then("^user select freeze type \"([^\"]*)\" from dropdown$")
    public void user_select_freeze_type_from_dropdown(String arg1) throws Throwable {
        dropDownHelper.selectByElement("FreezeCustomerAccountScreen_freezeType", arg1);
        
    }
    
    @Then("^user enters freeze reason \"([^\"]*)\"$")
    public void user_enters_freeze_reason(String arg1) throws Throwable {
        seleniumHelper.enterText("FreezeCustomerAccountScreen_freezeReason", arg1);
    }
    
    @Then("^user click on submit button$")
    public void user_click_on_submit_button() throws Throwable {
        waitingHelper.sleep(3000);
        seleniumHelper.clickElement("FreezeCustomerAccountScreen_SubmitButton");
        waitingHelper.sleep(3000);
    }
    
    @Then("^verify Cust_Master table status \"([^\"]*)\" & Freeze Value \"([^\"]*)\" & customer number \"([^\"]*)\"$")
    public void verify_Cust_Master_table_status_Freeze_Value_customer_number(String arg1, String arg2, String arg3)
            throws Throwable {
        custMaster = customerMasterService.findCustNumber(arg3);
        assertionHelper.verifyTwoTexts("Validate Customer Status in Cust_Master Table ", custMaster.getStatus(), arg1);
        assertionHelper.verifyTwoTexts("Validate Customer Freeze in Cust_Master Table ", custMaster.getFreeze(), arg2);
    }
    
    @Then("^verify Freeze_Details table Freeze status \"([^\"]*)\" & Freeze Type \"([^\"]*)\" & Freeze Reason \"([^\"]*)\" & customer number \"([^\"]*)\"$")
    public void verify_Freeze_Details_table_Freeze_status_Freeze_Type_Freeze_Reason_customer_number(String arg1,
            String arg2, String arg3, String arg4) throws Throwable {
        
        custMaster = customerMasterService.findCustNumber(arg4);
        freezeDetails = freezeDetailsService.getFrezzeDetailsByCustId(arg4);
        assertionHelper.verifyTwoTexts("Validate Freeze Status in Freeze_Details Table ",
                freezeDetails.getFreezeStatus(), arg1);
        assertionHelper.verifyTwoTexts("Validate Freeze Type in Freeze_Details Table ", freezeDetails.getFreezeType(),
                arg2);
        assertionHelper.verifyTwoTexts("Validate Freeze Reason in Freeze_Details Table ",
                freezeDetails.getFreezeReason(), arg3);
    }
    
    @Then("^user select customer number \"([^\"]*)\" from dropdown of Freeze Customer Screen$")
    public void user_select_customer_number_from_dropdown_of_Freeze_Customer_Screen(String arg1) throws Throwable {
        
        dropDownHelper.SelectUsingVisibleText("FreezeCustomerAccountScreen_custNumAuth", arg1);
    }
    
    @Then("^user select batch number \"([^\"]*)\" from dropdown of Freeze Customer Screen$")
    public void user_select_batch_number_from_dropdown_of_Freeze_Customer_Screen(String arg1) throws Throwable {
        dropDownHelper.SelectUsingVisibleText("FreezeCustomerAccountAuthScreen_batchNumber", arg1);
    }
    
    @Then("^verify customer number \"([^\"]*)\" & freeze type \"([^\"]*)\" & freeze reason \"([^\"]*)\" on Ui$")
    public void verify_customer_number_freeze_type_freeze_reason_on_Ui(String arg1, String arg2, String arg3)
            throws Throwable {
        assertionHelper.verifyTextEquals("Validate Customer Name in Cust_Master Table- ",
                "FreezeCustomerAccountScreen_custName", customerMasterService.getCustomerDetailsUsingNumber(arg1));
        
        String CUST_CATEGORY = customerMasterService.getCustomerCatogeryBycustNumber(arg1);
        assertionHelper.verifyTextEquals("Validate Customer Category in Cust_Master Table- ",
                "FreezeCustomerAccountScreen_custCategory",
                lookupService.getLookdetailsByCodeAndType(CUST_CATEGORY, "CATEGORY").getDescription());
        waitingHelper.sleep(3000);
        assertionHelper.verifyTwoTexts("Validate Customer Freeze Type in Freeze_Details Table- ",
                dropDownHelper.getSelectedValue("FreezeCustomerAccountScreen_freezeType"), arg2);
        
        assertionHelper.verifyTextEquals("Validate Freeze Reason in Freeze_Details Table- ",
                "FreezeCustomerAccountScreen_freezeReason", arg3);
    }
    
    @Then("^user click on authorize button of Freeze Customer Screen$")
    public void user_click_on_authorize_button_of_Freeze_Customer_Screen() throws Throwable {
        seleniumHelper.clickElement("FreezeCustomerAccountScreen_AuthorizeButton");
        waitingHelper.sleep(3000);
    }
    
    @Then("^user click on reject button of Freeze Customer Screen$")
    public void user_click_on_reject_button_of_Freeze_Customer_Screen() throws Throwable {
        seleniumHelper.clickElement("FreezeCustomerAccountScreen_RejectButton");
        waitingHelper.sleep(3000);
    }
    
    @Then("^verify Cust_Master table status \"([^\"]*)\" & customer number \"([^\"]*)\"$")
    public void verify_Cust_Master_table_status_customer_number(String arg1, String arg2) throws Throwable {
        custMaster = customerMasterService.findCustNumber(arg2);
        assertionHelper.verifyTwoTexts("Validate Customer Status in Cust_Master Table ", custMaster.getStatus(), arg1);
    }
    
    @Then("^verify Freeze_Details table Freeze status \"([^\"]*)\" & customer number \"([^\"]*)\"$")
    public void verify_Freeze_Details_table_Freeze_status_customer_number(String arg1, String arg2) throws Throwable {
        freezeDetails = freezeDetailsService.getFrezzeDetailsByCustId(arg2);
        assertionHelper.verifyTwoTexts("Validate Freeze Status in Freeze_Details Table ",
                freezeDetails.getFreezeStatus(), arg1);
    }
    
    @Then("^user select slider button$")
    public void user_select_slider_button() throws Throwable {
        seleniumHelper.clickElement("FreezeCustomerAccountScreen_switch");
        waitingHelper.sleep(3000);
    }
    
    @Then("^store Account_Master table customer number \"([^\"]*)\" Status & freeze value before entry$")
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
    
    @Then("^verify Account_Master table customer number \"([^\"]*)\" & FreezeStatus \"([^\"]*)\" & freeze \"([^\"]*)\" value after entry$")
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
    
}
