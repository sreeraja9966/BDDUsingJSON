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
import com.sysnik.selenium.entity.AccountMasterEntity;
import com.sysnik.selenium.entity.TransDocumentDetailsEntity;
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
import cucumber.api.java.en.When;

public class CashDepositDefnition extends TestBase {
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
    private TransDocumentDetailsEntity transDocDetails;
    
    @Then("^setup CashDeposit Screen$")
    public void setup_CashDeposit_Screen() throws Throwable {
        
        dbHelper.executeQuery(
                "update account_master SET SHADOW_BAL =0, LEDGER_BAL =100000, AVAILABLE_BAL =100000 WHERE ACC_NO IN ('101210101100000816','101210101100000823','101210101100000824','101210101200000146','101210101100000860','101210101200000151','101210101100000862','101210101100000861','101210101100000863','101210101100000864','101210201100000013')");
        dbHelper.executeQuery(
                "update account_master SET SHADOW_BAL =0, LEDGER_BAL =0, AVAILABLE_BAL =0 WHERE ACC_NO IN ('101210106060000004','101210105900000242','101210102000000379','101210105930000100','101210105200000226','101210105930000101','101210105930000102','101210102000000419')");
        
    }
    
    @When("^user enters accNo \"([^\"]*)\" and transaction Amount \"([^\"]*)\" on cashDeposit screen$")
    public void user_enters_on_cashDeposit_screen(String arg1, String arg2) throws Throwable {
        dbHelper.executeQuery("UPDATE SP_INSTRUCTION_DETAILS SET START_DATE =NULL");
        dbHelper.executeQuery(
                "UPDATE ALL_LIMIT_MASTER SET LMT_VAL =100000000, UN_UTILISED_COUNT =100, UN_UTILISED_LIMIT =10000000 WHERE ACTIVITY ='E' AND TRANSCODE ='CashDeposite' ");
        accMaster = accountService.getAccountMasterDetailsByAccNo(arg1);
        waitingHelper.sleep(1000);
        seleniumHelper.enterText("TellerDepositScreen_accNo", arg1);
        waitingHelper.sleep(3000);
        if ("FD".equalsIgnoreCase(accMaster.getAccType())) {
            
        } else {
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
            seleniumHelper.enterText("TellerDepositScreen_totalTransAmt", arg2);
            waitingHelper.sleep(1000);
        }
        
    }
    
    @When("^user enters accNo \"([^\"]*)\" on cashDeposit screen$")
    public void user_enters_accNo(String arg1) throws Throwable {
        seleniumHelper.enterText("TellerDepositScreen_accNo", arg1);
        waitingHelper.sleep(3000);
    }
    
    @When("^click on addDetails button on cashDeposit screen$")
    public void click_on_addDetails_button_on_cashDeposit_screen() throws Throwable {
        seleniumHelper.clickElement("TellerDepositScreen_addDetailsButton");
        waitingHelper.sleep(1500);
    }
    
    @When("^click on submit button on cashDeposit screen$")
    public void click_on_submit_button_on_cashDeposit_screen() throws Throwable {
        seleniumHelper.clickElement("CashDepositScreen_SubmitButton");
        waitingHelper.sleep(3000);
    }
    
    @When("^user click on ThirdPartyDepositor option$")
    public void user_click_on_ThirdPartyDepositor_option() throws Throwable {
        
        seleniumHelper.clickElement("CashDepositScreen_ThirdPartyRadio");
    }
    
    @When("^user enter depositorName \"([^\"]*)\"$")
    public void user_enter_depositorName(String arg1) throws Throwable {
        
        seleniumHelper.enterText("CashDepositScreen_depositorName", arg1);
    }
    
    @When("^user enter document number \"([^\"]*)\"$")
    public void user_enter_document_number(String arg1) throws Throwable {
        dropDownHelper.SelectUsingVisibleText("CashDepositScreen_identityCardDropDown", "PAN_CARD");
        seleniumHelper.enterText("CashDepositScreen_identityCardNumber", arg1);
        
    }
    
    @Then("^verify TRANSDOCUMENTDETAILS table status \"([^\"]*)\" docno \"([^\"]*)\" depositorName \"([^\"]*)\" where voucher_num \"([^\"]*)\" and tranType \"([^\"]*)\"$")
    public void verify_TRANSDOCUMENTDETAILS_table_status_docno_depositorName_where_voucher_num_and_tranType(String arg1,
            String arg2, String arg3, String arg4, String arg5) throws Throwable {
        String vouchNo = cacheHelper.getCache(arg4, cacheData);
        transDocDetails = transDocumentService.getTransaDocDetailsByvoucherNumberAndTransType(new BigInteger(vouchNo),
                arg5);
        assertionHelper.verifyTwoTexts("Verifying stauts in transDoc table of voucherNo :" + arg4,
                transDocDetails.getStatus(), arg1);
        assertionHelper.verifyTwoTexts("Verifying docNo in transDoc table of voucherNo :" + arg4,
                transDocDetails.getDocNumer(), arg2);
        assertionHelper.verifyTwoTexts("Verifying depositorName in transDoc table of voucherNo :" + arg4,
                transDocDetails.getDocHolderName(), arg3);
    }
    
    @When("^user upload a document$")
    public void user_upload_a_document() throws Throwable {
        seleniumHelper.clickElement("CashDepositScreen_identityCardNumber");
        
        robotHelper.pressTab();
        robotHelper.pressEnter();
        
        try {
            robotHelper.fileUploadUsingRobot(relativePath() + "\\src\\main\\resources\\signature\\download.jpg");
        } catch (Exception e) {
            reportHelper.writeLogInCaseOfFail("File not Found in the mentioned path=====>" + relativePath()
                    + "\\src\\main\\resources\\signature\\download.jpg");
        }
    }
    
    @When("^enter voucher No on deposit auth screen \"([^\"]*)\"$")
    public void enter_voucher_No_deposit_auth_screen(String arg1) throws Throwable {
        dbHelper.executeQuery(
                "UPDATE ALL_LIMIT_MASTER SET LMT_VAL =100000000, UN_UTILISED_COUNT =100, UN_UTILISED_LIMIT =10000000 WHERE ACTIVITY ='A' AND TRANSCODE in('CashDeposite','CashWithAuth') ");
        String vouchNo = cacheHelper.getCache(arg1, cacheData);
        dropDownHelper.SelectUsingVisibleText("CashDepositAuthScreen_VoucherNo", vouchNo);
        waitingHelper.sleep(1500);
    }
    
    @Then("^verfiy branchCode \"([^\"]*)\" accNo \"([^\"]*)\" transAmt \"([^\"]*)\" name \"([^\"]*)\" docNo \"([^\"]*)\" DrCr \"([^\"]*)\" on deposit auth screen$")
    public void verfiy_branchCode_accNo_transAmt_name_docNo_DrCr_on_deposit_auth_screen(String arg1, String arg2,
            String arg3, String arg4, String arg5, String arg6) throws Throwable {
        assertionHelper.verifyTwoTexts("Verifying BranchCode on Deposit Auth screen",
                seleniumHelper.getTextFromAnElement("CashDepositAuthScreen_BranchCode"), arg1);
        assertionHelper.verifyTwoTexts("Verifying AccNo on Deposit Auth screen",
                seleniumHelper.getTextFromAnElement("CashDepositAuthScreen_AccountNoInTable"), arg2);
        assertionHelper.verifyTwoAmounts("Verifying Trans Amount on Deposit Auth screen",
                seleniumHelper.getTextFromAnElement("CashDepositAuthScreen_transAmtInTable"), arg3);
        assertionHelper.verifyTwoTexts("Verifying Name on Deposit Auth screen",
                seleniumHelper.getTextFromAnElement("CashDepositAuthScreen_NameInTable"), arg4);
        /*
         * assertionHelper.verifyTwoTexts("Verifying DocType on Deposit Auth screen",
         * seleniumHelper.getTextFromAnElement("CashDepositAuthScreen_DocTypeInTable"), arg5);
         */
        assertionHelper.verifyTwoTexts("Verifying DocNo on Deposit Auth screen",
                seleniumHelper.getTextFromAnElement("CashDepositAuthScreen_DocNoInTable"), arg5);
        assertionHelper.verifyTwoTexts("Verifying DrCr on Deposit Auth screen",
                seleniumHelper.getTextFromAnElement("CashDepositAuthScreen_DrCrInTable"), arg6);
        
    }
    
    @When("^user click on auth button on deposit auth screen$")
    public void user_click_on_auth_button_on_deposit_auth_screen() throws Throwable {
        seleniumHelper.clickElement("CashDepositAuthScreen_AuthButton");
        waitingHelper.sleep(3000);
    }
    
    @When("^user click on reject button on deposit auth screen$")
    public void user_click_on_reject_button_on_deposit_auth_screen() throws Throwable {
        seleniumHelper.clickElement("CashDepositAuthScreen_RejectButton");
        waitingHelper.sleep(3000);
    }
    
}
