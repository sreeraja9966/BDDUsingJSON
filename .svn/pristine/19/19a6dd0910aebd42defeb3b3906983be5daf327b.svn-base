package com.sysnik.selenium.stepConfiguraiton;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.AccountMasterEntity;
import com.sysnik.selenium.entity.ChargesTypeDetailsEntity;
import com.sysnik.selenium.entity.ChequeBookInventoryEntity;
import com.sysnik.selenium.entity.ChequeBookMasterEntity;
import com.sysnik.selenium.entity.ChequeBookRequestEntity;
import com.sysnik.selenium.entity.CustomerMasterEntity;
import com.sysnik.selenium.entity.InstrumentTypesEntity;
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

public class ChequeBookIssue extends TestBase {
    
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
    
    private AccountMasterEntity accMaster;
    private CustomerMasterEntity custMaster;
    private ChequeBookRequestEntity chequeBookRequest;
    private InstrumentTypesEntity instrumentTypes;
    private ChequeBookInventoryEntity inventory;
    private ChargesTypeDetailsEntity chargesTypesDetails;
    private ChequeBookMasterEntity chequeBookMaster;
    
    @Then("^setup Cheque Book Issue Screen$")
    public void setup_Cheque_Book_Issue_Screen() throws Throwable {
        dbHelper.executeQuery(
                "DELETE FROM CHEQUE_BOOK_MASTER WHERE ACC_ID IN (52603, 52604, 52605, 52606, 52607, 52608, 50550, 52609)");
        dbHelper.executeQuery(
                "DELETE FROM CHEQUE_BOOK_DETAIL WHERE CHEQUE_BOOK_ID IN (SELECT ID FROM CHEQUE_BOOK_MASTER WHERE ACC_ID IN (52603, 52604, 52605, 52606, 52607, 52608, 50550, 52609))");
        dbHelper.executeQuery("UPDATE INVENTORY SET LAST_CHQ_NO=0 WHERE PRD_TYPE IN ('SB','CA','CC','OD')");
    }
    
    @Then("^user verify start number & end number No\\. of leaves \"([^\"]*)\" & No\\. of books \"([^\"]*)\" & prod type \"([^\"]*)\" On Ui$")
    public void user_verify_start_number_end_number_No_of_leaves_No_of_books_prod_type_On_Ui(Integer arg1, Integer arg2,
            String arg3) throws Throwable {
        Integer LastCheqNum = chequeBookInventoryService.getChequeBookInventoryDetails(arg3);
        Integer StartNum = LastCheqNum + 1;
        Integer Books = arg1 * arg2;
        Integer EndNum = LastCheqNum + Books;
        assertionHelper.verifyTextEquals("Verifying Start Number On Ui ", "ChequeBookIssueScreen_startNumber",
                StartNum.toString());
        assertionHelper.verifyTextEquals("Verifying End Number On Ui ", "ChequeBookIssueScreen_endNumber",
                EndNum.toString());
        cacheHelper.setCacheWithaString("FromNumber", StartNum.toString(), cacheData);
        cacheHelper.setCacheWithaString("ToNumber", EndNum.toString(), cacheData);
    }
    
    @Then("^user verify Cheque Book Charges \"([^\"]*)\" & No\\. of leaves \"([^\"]*)\" & No\\. of books \"([^\"]*)\" & CGST \"([^\"]*)\" & SGST \"([^\"]*)\" On Ui$")
    public void user_verify_Cheque_Book_Charges_No_of_leaves_No_of_books_CGST_SGST_On_Ui(String arg1, BigDecimal arg2,
            BigDecimal arg3, String arg4, String arg5) throws Throwable {
        
        chargesTypesDetails = chargesTypeDetailsService.getChargesTypesDeatilsData(arg1);
        BigDecimal chargesTypesDetailsAmount = chargesTypesDetails.getAmount();
        BigDecimal chequeBookCharges = chargesTypesDetailsAmount.multiply(arg3).multiply(arg2);
        
        assertionHelper.verifyAmountEquals("Verifying Cheque Book Charges On Ui ", "ChequeBookIssueScreen_chqChargeKey",
                chequeBookCharges.toString());
        assertionHelper.verifyAmountEquals("Verifying CGST Charges On Ui ", "ChequeBookIssueScreen_CGSTKey", arg4);
        assertionHelper.verifyAmountEquals("Verifying SGST Charges On Ui ", "ChequeBookIssueScreen_SGSTKey", arg5);
    }
    
    @Then("^user click on submit button of Cheque Book Issue$")
    public void user_click_on_submit_button_of_Cheque_Book_Issue() throws Throwable {
        seleniumHelper.clickElement("ChequeBookIssueScreen_SubmitButton");
        waitingHelper.sleep(3000);
    }
    
    @Then("^verify CHEQUE_BOOK_MASTER table where Account Number \"([^\"]*)\" & scenario \"([^\"]*)\" & InstrumentTypes \"([^\"]*)\" & prod type \"([^\"]*)\" & InstTypeDB \"([^\"]*)\" & status \"([^\"]*)\" & No\\. of books \"([^\"]*)\"$")
    public void verify_CHEQUE_BOOK_MASTER_table_where_Account_Number_scenario_InstrumentTypes_prod_type_InstTypeDB_status_No_of_books(
            String arg1, String arg2, String arg3, String arg4, String arg5, String arg6, String arg7)
            throws Throwable {
        
        List<ChequeBookMasterEntity> chequeBookMasterList = new ArrayList<>();
        chequeBookMasterList = chequeBookService.findchequeBookMasterDetailsUsingAccNoAndStatus(arg1, arg6);
        instrumentTypes = instrumentTypesService.getInstrumentTypesAndDescDetails(arg4, arg3);
        String FromNum = cacheHelper.getCache("FromNumber", cacheData);
        String ToNum1 = cacheHelper.getCache("ToNumber", cacheData);
        if ("1".equals(arg7)) {
            assertionHelper.verifyTwoTexts("Validate Account ID " + chequeBookMasterList.get(0).getAccID()
                    + " Status in Cheque Book Master Table ", chequeBookMasterList.get(0).getStatus(), "E");
            
            assertionHelper.verifyTwoTexts("Validate From Number in Cheque Book Master Table ",
                    chequeBookMasterList.get(0).getFromNo() + "", FromNum);
            assertionHelper.verifyTwoTexts("Validate To Number in Cheque Book Master Table ",
                    chequeBookMasterList.get(0).getEndNo() + "", ToNum1);
        } else {
            assertionHelper.verifyTwoTexts("Validate Account ID " + chequeBookMasterList.get(0).getAccID()
                    + " Status in Cheque Book Master Table ", chequeBookMasterList.get(0).getStatus(), "E");
            
            cacheHelper.setCacheWithaString("FromNum1", chequeBookMasterList.get(1).getFromNo() + "", cacheData);
            cacheHelper.setCacheWithaString("ToNum", chequeBookMasterList.get(0).getEndNo() + "", cacheData);
            
            assertionHelper.verifyTwoTexts("Validate First Book From Number in Cheque Book Master Table ",
                    chequeBookMasterList.get(0).getFromNo() + "", FromNum);
            assertionHelper.verifyTwoTexts("Validate First Book To Number in Cheque Book Master Table ",
                    chequeBookMasterList.get(0).getEndNo() + "", cacheHelper.getCache("ToNum", cacheData));
            assertionHelper.verifyTwoTexts("Validate Second Book From Number in Cheque Book Master Table ",
                    chequeBookMasterList.get(1).getFromNo() + "", cacheHelper.getCache("FromNum1", cacheData));
            assertionHelper.verifyTwoTexts("Validate Second Book To Number in Cheque Book Master Table ",
                    chequeBookMasterList.get(1).getEndNo() + "", ToNum1);
        }
        assertionHelper.verifyTwoTexts("Validate Instrument Types in Cheque Book Master Table ",
                instrumentTypes.getInstType(), arg5);
    }
    
    @Then("^user select batch number from dropdown of Cheque Book Issue Auth screen where batch number \"([^\"]*)\" & account num \"([^\"]*)\"$")
    public void user_select_batch_number_from_dropdown_of_Cheque_Book_Issue_Auth_screen_where_batch_number_account_num(
            String arg1, String arg2) throws Throwable {
        
        dropDownHelper.SelectUsingVisibleText("ChequeBookIssueScreen_chequeBatchNo", arg1 + " - " + arg2);
    }
    
    @Then("^user verify account number \"([^\"]*)\" & Cust Name \"([^\"]*)\" & Date Of Issue \"([^\"]*)\" On Ui of Cheque Book Issue Auth Screen$")
    public void user_verify_account_number_Cust_Name_Date_Of_Issue_On_Ui_of_Cheque_Book_Issue_Auth_Screen(String arg1,
            String arg2, String arg3) throws Throwable {
        
        cacheHelper.setCache("FromNumberUi", "ChequeBookIssueScreen_FromNumUi", cacheData);
        cacheHelper.setCache("ToNumberUi", "ChequeBookIssueScreen_ToNumUi", cacheData);
        assertionHelper.verifyTextEquals("Verifying Account Number On Ui ", "ChequeBookIssueScreen_accNoUi", arg1);
        assertionHelper.verifyTextEquals("Verifying Customer Name On Ui ", "ChequeBookIssueScreen_CustNameUi", arg2);
        assertionHelper.verifyTextEquals("Verifying Date Of Issue On Ui ", "ChequeBookIssueScreen_DateOfIssueUi",
                dateHelper.getSystemDate("DD/MM/YYYY"));
        assertionHelper.verifyTextEquals("Verifying From Number On Ui ", "ChequeBookIssueScreen_FromNumUi",
                cacheHelper.getCache("FromNumberUi", cacheData));
        assertionHelper.verifyTextEquals("Verifying To Number On Ui ", "ChequeBookIssueScreen_ToNumUi",
                cacheHelper.getCache("ToNumberUi", cacheData));
    }
    
    @Then("^user click select for cheque book checkbox on Cheque Book Issue Auth Screen Ui$")
    public void user_click_select_for_cheque_book_checkbox_on_Cheque_Book_Issue_Auth_Screen_Ui() throws Throwable {
        
        seleniumHelper.clickElement("ChequeBookIssueScreen_selectChequeBook");
        
    }
    
    @Then("^user click on Authorize button of Cheque Book Issue Auth Screen$")
    public void user_click_on_Authorize_button_of_Cheque_Book_Issue_Auth_Screen() throws Throwable {
        seleniumHelper.clickElement("ChequeBookIssueScreen_AuthButton");
    }
    
}
