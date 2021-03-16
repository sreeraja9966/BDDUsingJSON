package com.sysnik.selenium.stepConfiguraiton;

import java.math.BigInteger;
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
import com.sysnik.selenium.entity.BranchParametersEntity;
import com.sysnik.selenium.entity.TransactionHeaderEntity;
import com.sysnik.selenium.entity.TransactionsDetailEntity;
import com.sysnik.selenium.fw.helper.AssertionHelper;
import com.sysnik.selenium.fw.helper.CacheHelper;
import com.sysnik.selenium.fw.helper.DateHelper;
import com.sysnik.selenium.fw.helper.DbHelper;
import com.sysnik.selenium.fw.helper.DropDownHelper;
import com.sysnik.selenium.fw.helper.SeleniumHelper;
import com.sysnik.selenium.fw.helper.WaitingHelper;
import com.sysnik.selenium.fw.testBase.TestBase;

import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class AcToAcTransferStepDef extends TestBase {
    
    SeleniumHelper seleniumHelper = AutomationObjectFactory.getSeleniumHelperInstance();
    DropDownHelper dropDownHelper = AutomationObjectFactory.getDropDownHelperInstance();
    WaitingHelper waitingHelper = AutomationObjectFactory.getWaitingHelperInstance();
    CacheHelper cacheHelper = AutomationObjectFactory.getCacheHelperInstance();
    AssertionHelper assertionHelper = AutomationObjectFactory.getAssertionHelperInstance();
    DbHelper dbHelper = AutomationObjectFactory.getDbHelperInstance();
    DateHelper dateHelper = AutomationObjectFactory.getDateHelperInstance();
    private TransactionHeaderEntity transHeader;
    private TransactionsDetailEntity transDetails;
    private BranchParametersEntity branchparameter;
    
    @When("^user select \"([^\"]*)\" radio button on transfer screen$")
    public void user_select_radio_button_on_transfer_screen(String arg1) throws Throwable {
        if ("credit".equalsIgnoreCase(arg1)) {
            seleniumHelper.clickElement("AcToAcTransferScreen_CreditRadioButton");
        } else {
            seleniumHelper.clickElement("AcToAcTransferScreen_DebitRadioButton");
        }
    }
    
    @When("^user enter debitAccNo \"([^\"]*)\" on transfer screen$")
    public void user_enter_debitAccNo_on_transfer_screen(String arg1) throws Throwable {
        dbHelper.executeQuery(
                "UPDATE ALL_LIMIT_MASTER SET LMT_VAL =100000000, UN_UTILISED_COUNT =100, UN_UTILISED_LIMIT =10000000 WHERE ACTIVITY ='E' AND TRANSCODE ='TransfrDebit' ");
        
        seleniumHelper.enterText("AcToAcTransferScreen_AccountNumTextBox", arg1);
        
        //waitingHelper.sleep(2500);
    }
    
    @When("^user enter debitTransAmt \"([^\"]*)\" on transfer screen$")
    public void user_enter_debitTransAmt_on_transfer_screen(String arg1) throws Throwable {
        try {
            
            Wait<WebDriver> wait = new FluentWait<WebDriver>(d).withTimeout(30, TimeUnit.SECONDS)
                    .pollingEvery(5, TimeUnit.SECONDS).ignoring(NoSuchElementException.class)
                    .ignoring(StaleElementReferenceException.class);
            WebElement foo = wait.until(new Function<WebDriver, WebElement>() {
                public WebElement apply(WebDriver driver) {
                    return driver.findElement(By.xpath("//a[@id='accNo']"));
                }
            });
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            
        }
        seleniumHelper.enterText("AcToAcTransferScreen_TransactionAmount", arg1);
    }
    
    @When("^user enter creditAccNo \"([^\"]*)\" on transfer screen$")
    public void user_enter_creditAccNo_on_transfer_screen(String arg1) throws Throwable {
        dbHelper.executeQuery(
                "UPDATE ALL_LIMIT_MASTER SET LMT_VAL =100000000, UN_UTILISED_COUNT =100, UN_UTILISED_LIMIT =10000000 WHERE ACTIVITY ='E' AND TRANSCODE ='TransfCredit'");
        seleniumHelper.enterText("AcToAcTransferScreen_AccountNumTextBox", arg1);
        waitingHelper.sleep(2500);
    }
    
    @When("^user enter creditTransAmt \"([^\"]*)\" on transfer screen$")
    public void user_enter_creditTransAmt_on_transfer_screen(String arg1) throws Throwable {
        try {
            
            Wait<WebDriver> wait = new FluentWait<WebDriver>(d).withTimeout(30, TimeUnit.SECONDS)
                    .pollingEvery(5, TimeUnit.SECONDS).ignoring(NoSuchElementException.class)
                    .ignoring(StaleElementReferenceException.class);
            WebElement foo = wait.until(new Function<WebDriver, WebElement>() {
                public WebElement apply(WebDriver driver) {
                    return driver.findElement(By.xpath("//a[@id='accNo']"));
                }
            });
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            
        }
        
        seleniumHelper.enterText("AcToAcTransferScreen_TransactionAmount", arg1);
    }
    
    @When("^user click on transfer Submit button$")
    public void user_click_on_transfer_Submit_button() throws Throwable {
        seleniumHelper.clickElement("AcToAcTransferScreen_SubmitButton");
        waitingHelper.sleep(2500);
    }
    
    @Then("^verify Transaction_details table \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" where voucher_num \"([^\"]*)\" and tranType \"([^\"]*)\" and \"([^\"]*)\"$")
    public void verify_Transaction_details_table_where_voucher_num_and_tranType(String arg1, String arg2, String arg3,
            String arg4, String arg5, String arg6) throws Throwable {
        String voucherNumber = cacheHelper.getCache(arg4, cacheData);
        transHeader = transactionHeaderService
                .getTransactionHeaderdetailsByVoucherNumberAndTransType(Long.parseLong(voucherNumber), arg5);
        transDetails = transactionsDetailService
                .getTransDetailsInfoByIdAndAccountNumber(new BigInteger(transHeader.getId() + ""), arg3);
        branchparameter = branchParametersService.getBnrachDetailsByBranchCode(property.getProperty("BranchCode"));
        String remarks = "To Account " + arg3;
        String transCode = "TransfCredit";
        String instNo = "0";
        if ("D".equalsIgnoreCase(arg6)) {
            remarks = "From Account " + arg3;
            transCode = "TransfrDebit";
            instNo = arg2;
        }
        assertionHelper.verifyTwoAmounts(
                "Verifying Trans Amount in transaDetails of TransId:" + transDetails.getId() + " and AccNo: " + arg3,
                transDetails.getTransactionAmount() + "", arg1);
        assertionHelper.verifyTwoTexts(
                "Verifying Intrst No in Trans Details of TransId:" + transDetails.getId() + " and AccNo: " + arg3,
                transDetails.getInstrumentNumber() + "", instNo);
        if ("D".equalsIgnoreCase(arg6)) {
            assertionHelper.verifyTwoTexts(
                    "Verifying  Intrst Date  in TransDetails of TransId:" + transDetails.getId() + " and AccNo: "
                            + arg3,
                    dateHelper.convertDbDateToYYYYMMDD(transDetails.getInstrumentDate() + ""),
                    dateHelper.convertDbDateToYYYYMMDD(branchparameter.getCurrentDate() + ""));
        }
        assertionHelper.verifyTwoTexts(
                "Verifying Remarks in transDetails  of TransId:" + transDetails.getId() + " and AccNo: " + arg3,
                transDetails.getRemark() + "", remarks);
        assertionHelper.verifyTwoTexts(
                "Verifying DrCr in transDetails  of TransId:" + transDetails.getId() + " and AccNo: " + arg3,
                transDetails.getDrCr() + "", arg6);
        
        assertionHelper.verifyTwoTexts(
                "Verifying TransCode in transDetails  of TransId:" + transDetails.getId() + " and AccNo: " + arg3,
                transDetails.getTransactionMode() + "", transCode);
    }
    
    @When("^user select toekn number \"([^\"]*)\" from AcToAcTransfer screen$")
    public void user_select_toekn_number_from_AcToAcTransfer_screen(String arg1) throws Throwable {
        dbHelper.executeQuery(
                "UPDATE ALL_LIMIT_MASTER SET LMT_VAL =100000000, UN_UTILISED_COUNT =100, UN_UTILISED_LIMIT =10000000 WHERE ACTIVITY ='A' AND TRANSCODE in('TransfrDebit','TransfCredit') ");
        
        String vouchNo = cacheHelper.getCache(arg1, cacheData);
        dropDownHelper.SelectUsingVisibleText("AcToAcTransferAuthScreen_VouchNo", vouchNo);
        waitingHelper.sleep(2000);
    }
    
    @When("^user lick on Auth button on AcToAcTransfer screen$")
    public void user_lick_on_Auth_button_on_AcToAcTransfer_screen() throws Throwable {
        seleniumHelper.clickElement("AcToAcTransferAuthScreen_Submit");
        waitingHelper.sleep(3000);
    }
    
}
