package com.sysnik.selenium.stepConfiguraiton;

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

public class TellerDepositDefnition extends TestBase {
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
    private TransDocumentDetailsEntity transDocDetails;
    
    @Then("^setup TellerDeposit Screen$")
    public void setup_TellerDeposit_Screen() throws Throwable {
        
        dbHelper.executeQuery(
                "update account_master SET SHADOW_BAL =0, LEDGER_BAL =100000, AVAILABLE_BAL =100000 WHERE ACC_NO IN ('101210101100000816','101210101100000823','101210101100000824','101210101200000146','101210101100000860','101210101200000151','101210101100000862','101210101100000861','101210101100000863','101210101100000864')");
        dbHelper.executeQuery(
                "update account_master SET SHADOW_BAL =0, LEDGER_BAL =0, AVAILABLE_BAL =0 WHERE ACC_NO IN ('101210106060000004','101210105900000242','101210102000000379','101210105930000100','101210105200000226','101210105930000101','101210105930000102','101210102000000419')");
        
    }
    
    @When("^user enters accNo \"([^\"]*)\" and transaction Amount \"([^\"]*)\" on TellerDeposit screen$")
    public void user_enters_on_cashDeposit_screen(String arg1, String arg2) throws Throwable {
        dbHelper.executeQuery("UPDATE SP_INSTRUCTION_DETAILS SET START_DATE =NULL");
        dbHelper.executeQuery(
                "UPDATE ALL_LIMIT_MASTER SET LMT_VAL =100000000, UN_UTILISED_COUNT =100, UN_UTILISED_LIMIT =10000000 WHERE ACTIVITY ='A' AND TRANSCODE in('TellCshDepst','TellCashWith') ");
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
            seleniumHelper.enterText("TellerDepositScreen_TransAmt", arg2);
            waitingHelper.sleep(1000);
        }
        
    }
    
    @When("^user click on denomination tab of teller screen$")
    public void user_click_on_denomination_tab_of_teller_screen() throws Throwable {
        seleniumHelper.clickElement("TellerDepositScreen_denomTab");
    }
    
    @When("^click on submit button on TellerDeposit with Denom screen$")
    public void click_on_submit_button_on_TellerDeposit_with_Denom_screen() throws Throwable {
        seleniumHelper.clickElement("TellerDepositScreen_submitButtonWithDenom");
    }
    
    @When("^user enter document number \"([^\"]*)\" on Teller Screen$")
    public void user_enter_document_number_Teller(String arg1) throws Throwable {
        dropDownHelper.SelectUsingVisibleText("CashDepositScreen_identityCardDropDown", "PAN_CARD");
        seleniumHelper.enterText("CashDepositScreen_identityCardNumber", arg1);
        
    }
}
