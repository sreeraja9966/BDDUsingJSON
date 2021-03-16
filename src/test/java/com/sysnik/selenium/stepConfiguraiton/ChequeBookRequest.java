package com.sysnik.selenium.stepConfiguraiton;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.AccountMasterEntity;
import com.sysnik.selenium.entity.ChequeBookRequestEntity;
import com.sysnik.selenium.entity.CustomerMasterEntity;
import com.sysnik.selenium.entity.InstrumentTypesEntity;
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

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;

public class ChequeBookRequest extends TestBase {
    
    private static final String arg1 = null;
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
    
    private AccountMasterEntity accMaster;
    private CustomerMasterEntity custMaster;
    private ChequeBookRequestEntity chequeBookRequest;
    private InstrumentTypesEntity instrumentTypes;
    
    @Then("^setup Cheque Book Request Screen$")
    public void setup_Cheque_Book_Request_Screen() throws Throwable {
        dbHelper.executeQuery(
                "DELETE FROM CHEQUE_BOOK_REQUEST WHERE ACC_ID IN (52603, 52604, 52605, 52606, 52607, 52608, 50550, 52609)");
    }
    
    @Given("^User is on \"([^\"]*)\" \"([^\"]*)\" of Cheque Book screen$")
    public void user_is_on_of_Cheque_Book_screen(String arg1, String arg2) throws Throwable {
        d.navigate().refresh();
        seleniumHelper.searchMenu(arg1);
        seleniumHelper.clickElement(arg2);
    }
    
    @Then("^user enters account number \"([^\"]*)\" on Cheque Book Screen$")
    public void user_enters_account_number_on_Cheque_Book_Screen(String arg1) throws Throwable {
        seleniumHelper.enterText("ChequeBookRequestScreen_accNumber", arg1);
        waitingHelper.sleep(2000);
    }
    
    @Then("^user select No\\. of leaves \"([^\"]*)\" from dropdown$")
    public void user_select_No_of_leaves_from_dropdown(String arg1) throws Throwable {
        dropDownHelper.SelectUsingVisibleText("ChequeBookRequestScreen_numberOfLeaves", arg1);
    }
    
    @Then("^user select No\\. of books \"([^\"]*)\" from dropdown$")
    public void user_select_No_of_books_from_dropdown(String arg1) throws Throwable {
        dropDownHelper.SelectUsingVisibleText("ChequeBookRequestScreen_numberOfBooks", arg1);
    }
    
    @Then("^user select instrument types \"([^\"]*)\" from dropdown$")
    public void user_select_instrument_types_from_dropdown(String arg1) throws Throwable {
        dropDownHelper.SelectUsingVisibleText("ChequeBookRequestScreen_instType", arg1);
    }
    
    @Then("^user select mode of delivery \"([^\"]*)\" from dropdown$")
    public void user_select_mode_of_delivery_from_dropdown(String arg1) throws Throwable {
        dropDownHelper.SelectUsingVisibleText("ChequeBookRequestScreen_modeOfDelivery", arg1);
    }
    
    @Then("^user click on submit button of Cheque Book Request$")
    public void user_click_on_submit_button_of_Cheque_Book_Request() throws Throwable {
        seleniumHelper.clickElement("ChequeBookRequestScreen_SubmitButton");
        waitingHelper.sleep(3000);
    }
    
    @Then("^verify CHEQUE_BOOK_REQUEST table where Account Number \"([^\"]*)\" & No\\. of leaves \"([^\"]*)\" & No\\. of books \"([^\"]*)\" & mode of delivery \"([^\"]*)\" & account Type \"([^\"]*)\" & flow \"([^\"]*)\" & scenario \"([^\"]*)\" & InstrumentTypes \"([^\"]*)\"$")
    public void verify_CHEQUE_BOOK_REQUEST_table_where_Account_Number_No_of_leaves_No_of_books_mode_of_delivery_account_Type_flow_scenario_InstrumentTypes(
            String arg1, String arg2, String arg3, String arg4, String arg5, String arg6, String arg7, String arg8)
            throws Throwable {
        chequeBookRequest = chequeBookService.findchequeBookRequestDetailsUsingNumber(arg7);
        accMaster = accountService.getAccountMasterDetailsByAccNo(arg1);
        custMaster = customerMasterService.getCustMasterDetailsByCustId(accMaster.getCustId());
        instrumentTypes = instrumentTypesService.getInstrumentTypesAndDescDetails(arg5, arg8);
        
        if ("Entry".equalsIgnoreCase(arg6)) {
            
            assertionHelper.verifyTwoTexts("Validate Account Type ", accMaster.getAccType(), arg5);
            
            assertionHelper.verifyTwoTexts("Validate Account ID " + accMaster.getAccId() + " Status: ",
                    accMaster.getStatus(), "A");
            assertionHelper.verifyTwoTexts("Validate Customer ID " + custMaster.getCustId() + " Status: ",
                    custMaster.getStatus(), "A");
            
            assertionHelper.verifyTwoTexts(
                    "Validate Account ID " + chequeBookRequest.getAccID() + " Status in Cheque Book Request Table: ",
                    chequeBookRequest.getStatus(), "E");
            
            assertionHelper.verifyTwoTexts("Validate Number of Leaves in Cheque Book Request Table ",
                    chequeBookRequest.getNumberOfLeaves().toString(), arg2);
            
            assertionHelper.verifyTwoTexts("Validate Number of Books in Cheque Book Request Table ",
                    chequeBookRequest.getNumberOfBooks().toString(), arg3);
            
            assertionHelper.verifyTwoTexts("Validate Mode of Delivery in Cheque Book Request Table ",
                    chequeBookRequest.getModeOfDelivery(), arg4);
            
            assertionHelper.verifyTwoTexts("Validate Instrument Type in Cheque Book Request Table ",
                    chequeBookRequest.getInstType(), instrumentTypes.getInstType());
            
            assertionHelper.verifyTwoTexts("Validate Terminal ID in Cheque Book Request Table ",
                    chequeBookRequest.getTerminalId(), getSystemIP());
        }
    }
    
    @Then("^user verify account number \"([^\"]*)\" & Cust Name \"([^\"]*)\" & No\\. of leaves \"([^\"]*)\" & No\\. of books \"([^\"]*)\" & mode of delivery \"([^\"]*)\" On Ui of Cheque Book Request Approve or Cancel$")
    public void user_verify_account_number_Cust_Name_No_of_leaves_No_of_books_mode_of_delivery_On_Ui_of_Cheque_Book_Request_Approve_or_Cancel(
            String arg1, String arg2, String arg3, String arg4, String arg5) throws Throwable {
        assertionHelper.verifyTextEquals("Verifying Account Number On Ui ", "ChequeBookRequestScreen_accNo", arg1);
        assertionHelper.verifyTextEquals("Verifying Customer Name On Ui ", "ChequeBookRequestScreen_CustName", arg2);
        assertionHelper.verifyTextEquals("Verifying Number Of Leaves On Ui ", "ChequeBookRequestScreen_NumOfLeaves",
                arg3);
        assertionHelper.verifyTextEquals("Verifying Number Of Books On Ui ", "ChequeBookRequestScreen_NumOfBooks",
                arg4);
        assertionHelper.verifyTextEquals("Verifying Mode Of Delivery On Ui ", "ChequeBookRequestScreen_delivery", arg5);
    }
    
    @Then("^user click select for cheque book checkbox on Ui$")
    public void user_click_select_for_cheque_book_checkbox_on_Ui() throws Throwable {
        waitingHelper.sleep(3000);
        seleniumHelper.clickElement("ChequeBookRequestScreen_selectChequeBook");
    }
    
    @Then("^user select cancellation reason \"([^\"]*)\" from dropdown$")
    public void user_select_cancellation_reason_from_dropdown(String arg1) throws Throwable {
        dropDownHelper.SelectUsingVisibleText("ChequeBookRequestScreen_reasonForRejection", arg1);
    }
    
    @Then("^user click on Approve button of Cheque Book Request Approve/Cancel$")
    public void user_click_on_Approve_button_of_Cheque_Book_Request_Approve_Cancel() throws Throwable {
        seleniumHelper.clickElement("ChequeBookRequestScreen_Approve");
        waitingHelper.sleep(3000);
    }
    
    @Then("^verify CHEQUE_BOOK_REQUEST table where Account Number \"([^\"]*)\" & scenario \"([^\"]*)\"$")
    public void verify_CHEQUE_BOOK_REQUEST_table_where_Account_Number_scenario(String arg1, String arg2)
            throws Throwable {
        chequeBookRequest = chequeBookService.findchequeBookRequestDetailsUsingNumber(arg2);
        assertionHelper.verifyTwoTexts(
                "Validate Account ID " + chequeBookRequest.getAccID() + " Status in Cheque Book Request Table: ",
                chequeBookRequest.getStatus(), "A");
    }
    
    @Then("^user click on Cancel button of Cheque Book Request Approve/Cancel$")
    public void user_click_on_Cancel_button_of_Cheque_Book_Request_Approve_Cancel() throws Throwable {
        seleniumHelper.clickElement("ChequeBookRequestScreen_Cancel");
        waitingHelper.sleep(3000);
    }
    
    @Then("^verify CHEQUE_BOOK_REQUEST table where scenario \"([^\"]*)\" & cancellation reason \"([^\"]*)\"$")
    public void verify_CHEQUE_BOOK_REQUEST_table_where_scenario_cancellation_reason(String arg1, String arg2)
            throws Throwable {
        chequeBookRequest = chequeBookService.findchequeBookRequestDetailsUsingNumber(arg1);
        assertionHelper.verifyTwoTexts(
                "Validate Account ID " + chequeBookRequest.getAccID() + " Status in Cheque Book Request Table: ",
                chequeBookRequest.getStatus(), "C");
        assertionHelper.verifyTwoTexts(
                "Validate Account ID " + chequeBookRequest.getAccID()
                        + " Cancellation Reason in Cheque Book Request Table: ",
                chequeBookRequest.getReasonForRejection(), "CHREQCO");
    }
    
}
