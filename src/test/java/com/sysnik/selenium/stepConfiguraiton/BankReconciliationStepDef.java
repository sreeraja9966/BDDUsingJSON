package com.sysnik.selenium.stepConfiguraiton;

import java.util.Date;
import java.util.concurrent.TimeUnit;
import java.util.function.Function;

import org.openqa.selenium.By;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.FluentWait;
import org.openqa.selenium.support.ui.Wait;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.ReconTransactionEntity;
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

public class BankReconciliationStepDef extends TestBase {
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    FindElement findElement = AutomationObjectFactory.getFindElementInstance();
    ConvertPropertyFileToMap convertPropertyFileToMap = AutomationObjectFactory.getConvertPropertyFileToMapInstance();
    RobotHelper robotHelper = AutomationObjectFactory.getRobotHelperInstance();
    CommonMethodsForVerifications commonMethodsForVerifications = AutomationObjectFactory
            .getCommonMethodsForVerificationsInstance();
    SeleniumHelper seleniumHelper = AutomationObjectFactory.getSeleniumHelperInstance();
    DropDownHelper dropDownHelper = AutomationObjectFactory.getDropDownHelperInstance();
    WaitingHelper waitingHelper = AutomationObjectFactory.getWaitingHelperInstance();
    CacheHelper cacheHelper = AutomationObjectFactory.getCacheHelperInstance();
    AssertionHelper assertionHelper = AutomationObjectFactory.getAssertionHelperInstance();
    DbHelper dbHelper = AutomationObjectFactory.getDbHelperInstance();
    DateHelper dateHelper = AutomationObjectFactory.getDateHelperInstance();
    
    private ReconTransactionEntity reconTrans;
    
    @Then("^setup BRScreen$")
    public void setup_BRScreen() throws Throwable {
        dbHelper.executeQuery("Delete from RECONC_TRANSACTION");
    }
    
    @When("^user select group and part \"([^\"]*)\" \"([^\"]*)\"$")
    public void user_select_group_and_part(String arg1, String arg2) throws Throwable {
    	dropDownHelper.waitUntilSelectOptionsPopulated("BankReconciliation_GroupId");
    	dropDownHelper.SelectUsingVisibleText("BankReconciliation_GroupId", arg1);
        dropDownHelper.waitUntilSelectOptionsPopulated("BankReconciliation_partyId");
        dropDownHelper.SelectUsingVisibleText("BankReconciliation_partyId", arg2);
    }
    
    @When("^user enters following on bank reconciliation screen \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\"$")
    public void user_enters_following_on_bank_reconciliation_screen(String arg1, String arg2, String arg3, String arg4,
            String arg5, String arg6, String arg7, String arg8, String arg9, String arg10, String arg11, String arg12)
            throws Throwable {
        seleniumHelper.enterText("BankReconciliation_CBSDate", arg1);
        seleniumHelper.enterText("BankReconciliation_InputBranch", arg2);
        seleniumHelper.enterText("BankReconciliation_InstrNo", arg3);
        seleniumHelper.enterText("BankReconciliation_TransId", arg4);
        seleniumHelper.enterText("BankReconciliation_Amount", arg5);
        seleniumHelper.enterText("BankReconciliation_DrCrIndicator", arg6);
        seleniumHelper.enterText("BankReconciliation_BranchCode", arg7);
        seleniumHelper.enterText("BankReconciliation_AccNo", arg8);
        seleniumHelper.enterText("BankReconciliation_TransDate", arg9);
        seleniumHelper.enterText("BankReconciliation_TransTime", arg10);
        seleniumHelper.enterText("BankReconciliation_ATMId", arg11);
        seleniumHelper.enterText("BankReconciliation_Particular", arg12);
        
    }
    
    @When("^click on ADD record button on bank reconciliation Screen$")
    public void click_on_ADD_record_button_on_bank_reconciliation_Screen() throws Throwable {
        seleniumHelper.clickElement("BankReconciliation_AddRecordButton");
        waitingHelper.sleep(1500);
    }
    
    @When("^user click on submit on bank reconciliation Screen$")
    public void user_click_on_submit_on_bank_reconciliation_Screen() throws Throwable {
        seleniumHelper.clickElement("BankReconciliation_SubmitButton");
        waitingHelper.sleep(4500);
    }
    
    @Then("^verfiy RECONC_TRANSACTION table verify \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\"$")
    public void verfiy_RECONC_TRANSACTION_table_verify(String arg1, String arg2, String arg3, String arg4, String arg5,
            String arg6, String arg7, String arg8, String arg9, String arg10, String arg11, String arg12)
            throws Throwable {
        Date branchDate = branchParametersService.getBnrachLiveDate(property.getProperty("BranchCode"));
        String userId = property.getProperty("LogInUser");
        reconTrans = reconTransactionService.getReconTransDetailsByEntryDateAndEnterBy(branchDate, userId);
        
        // assertionHelper.verifyTwoTexts("Verifying CBS Date in Recon TransTable ", reconTrans.getColumn1(), arg1);
        assertionHelper.verifyTwoTexts("Verifying  InputBranch in TransTable ", reconTrans.getColumn2(), arg2);
        assertionHelper.verifyTwoTexts("Verifying  InstrumentNo in TransTable ", reconTrans.getColumn3(), arg3);
        assertionHelper.verifyTwoTexts("Verifying TransID in TransTable ", reconTrans.getColumn4(), arg4);
        assertionHelper.verifyTwoAmounts("Verifying Amount in TransTable ", reconTrans.getColumn5(), arg5);
        assertionHelper.verifyTwoTexts("Verifying EnteredAcntDrCrIndicator in  TransTable ", reconTrans.getColumn6(),
                arg6);
        assertionHelper.verifyTwoTexts("Verifying CustomerBranchCode in  TransTable ", reconTrans.getColumn7(), arg7);
        
        assertionHelper.verifyTwoTexts("Verifying CustomerAccountNo in  TransTable ", reconTrans.getColumn8(), arg8);
        //assertionHelper.verifyTwoTexts("Verifying TransactionDate in  TransTable ", reconTrans.getColumn9(), arg9);
        assertionHelper.verifyTwoTexts("Verifying TransactionTime in  TransTable ", reconTrans.getColumn10(), arg10);
        assertionHelper.verifyTwoTexts("Verifying ATMID in  TransTable ", reconTrans.getColumn11(), arg11);
        assertionHelper.verifyTwoTexts("Verifying Particulars in  TransTable ", reconTrans.getColumn12(), arg12);
        
    }
    
    @When("^user enter invalid value in \"([^\"]*)\" \"([^\"]*)\"$")
    public void user_enter_invalid_value_in(String arg1, String arg2) throws Throwable {
        seleniumHelper.enterTextWithoutTab(arg1, arg2);
        waitingHelper.sleep(1500);
        
    }
    
}
