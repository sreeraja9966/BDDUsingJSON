package com.sysnik.selenium.stepConfiguraiton;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.CustomerDeleteEntity;
import com.sysnik.selenium.entity.CustomerMasterEntity;
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

public class DeleteCustomer extends TestBase {
    
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
    
    private CustomerMasterEntity custMaster;
    private CustomerDeleteEntity custDelete;
    
    @Then("^setup Delete Customer Screen$")
    public void setup_Delete_Customer_Screen() throws Throwable {
        
        dbHelper.executeQuery("DELETE FROM CUSTOMER_DELETE WHERE CUST_ID IN (4801,4802,4803,4804)");
        dbHelper.executeQuery("UPDATE CUST_MASTER SET STATUS='A' WHERE CUST_ID IN (4801,4802,4803,4804)");
    }
    
    @Then("^user enters customer number \"([^\"]*)\" on Delete Customer Entry Screen$")
    public void user_enters_customer_number_on_Delete_Customer_Entry_Screen(String arg1) throws Throwable {
        seleniumHelper.enterText("CustomerDeleteScreen_custNumber", arg1);
    }
    
    @Then("^verify customer type \"([^\"]*)\" On Ui of Delete Customer Entry Screen$")
    public void verify_customer_type_On_Ui_of_Delete_Customer_Entry_Screen(String arg1) throws Throwable {
        if ("Individual".equalsIgnoreCase(arg1)) {
            assertionHelper.verifyTextEquals("Verifying Customer Type On Ui ",
                    "CustomerDeleteScreen_customerIndividual", arg1);
        } else {
            
            assertionHelper.verifyTextEquals("Verifying Customer Type On Ui ",
                    "CustomerDeleteScreen_customerOrgnizaion", arg1);
        }
    }
    
    @Then("^verify customer category on Ui where customer number \"([^\"]*)\" of Delete Customer Entry Screen$")
    public void verify_customer_category_on_Ui_where_customer_number_of_Delete_Customer_Entry_Screen(String arg1)
            throws Throwable {
        String CUST_CATEGORY = customerMasterService.getCustomerCatogeryBycustNumber(arg1);
        assertionHelper.verifyTextEquals("Validate Customer Category in Cust_Master Table- ",
                "CustomerDeleteScreen_custCategory",
                lookupService.getLookdetailsByCodeAndType(CUST_CATEGORY, "CATEGORY").getDescription());
    }
    
    @Then("^user enters reason \"([^\"]*)\" on Delete Customer Entry Screen$")
    public void user_enters_reason_on_Delete_Customer_Entry_Screen(String arg1) throws Throwable {
        seleniumHelper.enterText("CustomerDeleteScreen_reasonForDelete", arg1);
    }
    
    @Then("^verify customer Delete Account Info Verification on Ui where customer number \"([^\"]*)\"$")
    public void verify_customer_Delete_Account_Info_Verification_on_Ui_where_customer_number(String arg1)
            throws Throwable {
        dbHelper.verifyUiTextWithDb("//div[@id='accounts']/table/tbody/tr[1]/td[2]",
                "SELECT ACC_NO FROM ACCOUNT_MASTER "
                        + "WHERE ACC_NO IN (SELECT ACC_NO FROM CUSTOMER_ACCOUNT WHERE CUST_ID IN "
                        + "(SELECT CUST_ID FROM CUST_MASTER WHERE CUST_NUMBER ='" + arg1 + "'))");
        
        dbHelper.verifyUiTextWithDb("//div[@id='accounts']/table/tbody/tr[1]/td[3]",
                "SELECT CUST_NAME FROM CUST_MASTER WHERE CUST_NUMBER ='" + arg1 + "'");
        
        dbHelper.verifyUiTextWithDb("//div[@id='accounts']/table/tbody/tr[1]/td[6]",
                "SELECT STATUS FROM ACCOUNT_MASTER "
                        + "WHERE ACC_NO IN (SELECT ACC_NO FROM CUSTOMER_ACCOUNT WHERE CUST_ID IN "
                        + "(SELECT CUST_ID FROM CUST_MASTER WHERE CUST_NUMBER ='" + arg1 + "'))");
    }
    
    @Then("^user click on Delete button$")
    public void user_click_on_Delete_button() throws Throwable {
        seleniumHelper.clickElement("CustomerDeleteScreen_submit");
        seleniumHelper.clickElement("CustomerDeleteScreen_confirm");
        waitingHelper.sleep(2000);
    }
    
    @Then("^verify CUST_MASTER table where customer number \"([^\"]*)\" after Delete Customer Entry$")
    public void verify_CUST_MASTER_table_where_customer_number_after_Delete_Customer_Entry(String arg1)
            throws Throwable {
        custMaster = customerMasterService.getCustomerUsingNumber(arg1);
        assertionHelper.verifyTwoTexts("Verifying Customer Status in CUST_MASTER Tbale: ", custMaster.getStatus(), "C");
    }
    
    @Then("^verify CUSTOMER_DELETE & CUST_MASTER table where customer number \"([^\"]*)\" & Reason \"([^\"]*)\" & Flow \"([^\"]*)\"$")
    public void verify_CUSTOMER_DELETE_CUST_MASTER_table_where_customer_number_Reason_Flow(String arg1, String arg2,
            String arg3) throws Throwable {
        custDelete = customerDeleteService.customerDeleteEntryVerification(arg1, arg2, arg3);
    }
    
    @Then("^user select customer number \"([^\"]*)\" on Delete Customer Entry Screen$")
    public void user_select_customer_number_on_Delete_Customer_Entry_Screen(String arg1) throws Throwable {
        dropDownHelper.SelectUsingVisibleText("CustomerDeleteScreen_custNum", arg1);
    }
    
    @Then("^verify reason on Ui where customer number \"([^\"]*)\" of Delete Customer Entry Screen$")
    public void verify_reason_on_Ui_where_customer_number_of_Delete_Customer_Entry_Screen(String arg1)
            throws Throwable {
        
        assertionHelper.verifyTextEquals("Verifying Customer Delete Reason On Ui: ",
                "CustomerDeleteScreen_reasonForDelete", arg1);
    }
    
    @Then("^user click on Authorize button$")
    public void user_click_on_Authorize_button() throws Throwable {
        seleniumHelper.clickElement("CustomerDeleteScreen_authorize");
        seleniumHelper.clickElement("CustomerDeleteScreen_confirm");
        waitingHelper.sleep(2000);
    }
    
    @Then("^user click on Reject button$")
    public void user_click_on_Reject_button() throws Throwable {
        seleniumHelper.clickElement("CustomerDeleteScreen_reject");
        seleniumHelper.clickElement("CustomerDeleteScreen_confirm");
        waitingHelper.sleep(2000);
    }
    
}
