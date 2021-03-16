package com.sysnik.selenium.stepConfiguraiton;

import java.math.BigInteger;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.function.Function;

import org.openqa.selenium.By;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.FluentWait;
import org.openqa.selenium.support.ui.Wait;
import org.springframework.beans.factory.annotation.Autowired;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.AccountMasterEntity;
import com.sysnik.selenium.entity.BranchParametersEntity;
import com.sysnik.selenium.entity.ChequeBookDetailEntity;
import com.sysnik.selenium.entity.TransDocumentDetailsEntity;
import com.sysnik.selenium.entity.TransactionHeaderEntity;
import com.sysnik.selenium.entity.TransactionsDetailEntity;
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
import com.sysnik.selenium.repository.TransactionHeaderRepo;

import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class CashWithdrawalStepConfig extends TestBase {
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
    @Autowired
    private TransactionHeaderRepo transHeadRepo;
    private AccountMasterEntity accMaster;
    private TransDocumentDetailsEntity transDocDetails;
    private TransactionHeaderEntity transHeader;
    private ChequeBookDetailEntity cheqDetails;
    private BranchParametersEntity branchparameter;
    private TransactionHeaderEntity iBTtransHeader;
    private List<TransactionsDetailEntity> iBTTransDetails;
    private List<TransactionsDetailEntity> transDetails;
    
    @Then("^setup CashWithdrawal Screen$")
    public void setup_CashWithdrawal_Screen() throws Throwable {
        dbHelper.executeQuery(
                "update account_master SET SHADOW_BAL =0, LEDGER_BAL =10000, AVAILABLE_BAL =10000 WHERE ACC_NO IN ('101210101100000816','101210101100000826','101210101100000865','101210101100000866','101210101200000146','101210101100000821','101210101100000822','101210101100000823','101210201100000013','101210101100000864')");
        dbHelper.executeQuery(
                "update account_master SET SHADOW_BAL =0, LEDGER_BAL =0, AVAILABLE_BAL =0 WHERE ACC_NO IN ('101210106060000004','101210105900000242','101210102000000379','101210102000000420','101210102000000391')");
        
        dbHelper.executeQuery(
                "UPDATE CHEQUE_BOOK_DETAIL SET PAID_DATE =NULL, TRANS_ID =NULL , STATUS='I' WHERE INSTR_NO IN(100000,100050,100101,100025)");
        
        dbHelper.executeQuery(
                "update token_master set status='A' where TOKEN_NUMBER IN(51,52,53,54,55,56,57,58,59,60) and BRANCH_CODE =2101");
        dbHelper.executeQuery("update token_master set status='C' where token_number=99");
        
    }
    
    @When("^user enters accNo \"([^\"]*)\" and transaction Amount \"([^\"]*)\" on cashWithdrawal screen$")
    public void user_enters_on_cashWithdrawal_screen(String arg1, String arg2) throws Throwable {
        dbHelper.executeQuery("UPDATE SP_INSTRUCTION_DETAILS SET START_DATE =NULL");
        dbHelper.executeQuery(
                "UPDATE ALL_LIMIT_MASTER SET LMT_VAL =100000000, UN_UTILISED_COUNT =100, UN_UTILISED_LIMIT =10000000 WHERE ACTIVITY ='E' AND TRANSCODE ='CashWthdrwal' ");
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
    
    @When("^user enters accNo \"([^\"]*)\" on cashWithdrawal screen$")
    public void user_enters_accNo_on_cashWithdrawal_screen(String arg1) throws Throwable {
        seleniumHelper.enterText("TellerDepositScreen_accNo", arg1);
        waitingHelper.sleep(3000);
    }
    
    @When("^user selects \"([^\"]*)\" and instrument No \"([^\"]*)\"$")
    public void user_selects_and_instrument_No(String arg1, String arg2) throws Throwable {
        dropDownHelper.SelectUsingVisibleText("TellerDepositScreen_instrType", arg1);
        seleniumHelper.enterText("TellerDepositScreen_instrNumber", arg2);
    }
    
    @When("^user selects currency \"([^\"]*)\"$")
    public void user_selects_currency(String arg1) throws Throwable {
        dropDownHelper.SelectUsingVisibleText("TellerDepositScreen_currency", arg1);
        
    }
    
    @When("^enter token number \"([^\"]*)\"$")
    public void enter_token_number(String arg1) throws Throwable {
        seleniumHelper.enterText("TellerDepositScreen_TokenEntry", arg1);
    }
    
    @When("^click on addDetails button on cashWithdrawal screen$")
    public void click_on_addDetails_button_on_cashWithdrawal_screen() throws Throwable {
        seleniumHelper.clickElement("CashWithdrawlScreen_addDetailsButton");
        waitingHelper.sleep(1500);
    }
    
    @Then("^verify CHEQUEBOOKDETAIL table status col \"([^\"]*)\" transId and paidDate where \"([^\"]*)\" and instrument No \"([^\"]*)\" and vouchNo \"([^\"]*)\" and TransType \"([^\"]*)\"$")
    public void verify_CHEQUEBOOKDETAIL_table_status_col_transId_and_paidDate_where_and_instrument_No_and_vouchNo(
            String arg1, String arg2, String arg3, String arg4, String arg5) throws Throwable {
        if ("WITHDRAWAL SLIP - 99".equalsIgnoreCase(arg2) || "99".equalsIgnoreCase(arg2)) {
            
        } else {
            String vouchNo = cacheHelper.getCache(arg4, cacheData);
            transHeader = transactionHeaderService
                    .getTransactionHeaderdetailsByVoucherNumberAndTransType(Long.parseLong(vouchNo), arg5);
            
            cheqDetails = chequeBookService.getChqDetailsInfoByInstrumentNo(arg3,
                    new BigInteger(transHeader.getId() + ""));
            assertionHelper.verifyTwoTexts(
                    "Verifying status in ChqBook Details table of IntrNo:" + arg3 + " transId:" + transHeader.getId(),
                    cheqDetails.getStatus(), arg1);
            assertionHelper.verifyTwoTexts(
                    "Verifying PaidDate in ChqBook Details table of IntrNo:" + arg3 + " transId:" + transHeader.getId(),
                    dateHelper.convertDbDateToDDMMYYYY(cheqDetails.getPaidDate() + ""),
                    dateHelper.convertDbDateToDDMMYYYY(
                            branchParametersService.getBnrachLiveDate(property.getProperty("BranchCode")) + ""));
            
        }
    }
    
    @Then("verify Transaction tables in case of IBT using \"([^\"]*)\"\"([^\"]*)\"\"([^\"]*)\"\"([^\"]*)\"\"([^\"]*)\"\"([^\"]*)\"$")
    public void verifyIBT(String arg1, String arg2, String arg3, String arg4, String arg5, String arg6) {
        String vouchNo = cacheHelper.getCache(arg2, cacheData);
        String childStatus = arg5;
        
        transHeader = transactionHeaderService
                .getTransactionHeaderdetailsByVoucherNumberAndTransType(Long.parseLong(vouchNo), arg1);
        iBTtransHeader = transactionHeaderService
                .getTransactionDetailsUsingId(Long.parseLong(transHeader.getId() + "") - 1);
        
        assertionHelper.verifyTwoTexts("Verifying Stauts of IBT Transaction with ID :" + iBTtransHeader.getId(),
                iBTtransHeader.getStatus(), childStatus);
        assertionHelper.verifyTwoTexts("Verifying TRNSTYPE of IBT Transaction with ID :" + iBTtransHeader.getId(),
                iBTtransHeader.getTransType(), "T");
        assertionHelper.verifyTwoTexts("Verifying IP of IBT Transaction with ID :" + iBTtransHeader.getId(),
                iBTtransHeader.getOperatorIp(), getSystemIP());
        assertionHelper.verifyTwoTexts("Verifying OpertorId of IBT Transaction with ID :" + iBTtransHeader.getId(),
                iBTtransHeader.getOperatorId(), property.getProperty("LogInUser"));
        assertionHelper.verifyTwoTexts("Verifying TransDate of IBT Transaction with ID :" + iBTtransHeader.getId(),
                dateHelper.convertDbDateToDDMMYYYY(iBTtransHeader.getTransactionDate() + ""),
                dateHelper.convertDbDateToDDMMYYYY(
                        branchParametersService.getBnrachLiveDate(property.getProperty("BranchCode")) + ""));
        assertionHelper.verifyTwoTexts("Verifying IBT BranchCode", iBTtransHeader.getBranchCode(),
                property.getProperty("IBTBranchCode"));
        assertionHelper.verifyTwoAmounts("Verifying trans Amount", iBTtransHeader.getTransactionAmount() + "", arg3);
        transDetails = transactionsDetailService
                .getListOfTransDetailsRecordsById(new BigInteger(transHeader.getId() + ""));
        if ("W".equalsIgnoreCase(arg1)) {
            assertionHelper.verifyTwoTexts(
                    "Verifying CrDr TransDetails table of TransId:" + transDetails.get(0).getId(),
                    transDetails.get(0).getDrCr(), "D");
            
        } else {
            
            assertionHelper.verifyTwoTexts("Verifying TransDetails of TransId:" + transDetails.get(0).getId(),
                    transDetails.get(0).getDrCr(), "C");
            
        }
        assertionHelper.verifyTwoTexts(
                "Verifying Remarks of IBT Transactions in Details table of Id:" + transDetails.get(0).getId(),
                transDetails.get(0).getRemark(), "IBT transaction {}" + arg4);
        iBTTransDetails = transactionsDetailService
                .getListOfTransDetailsRecordsById(new BigInteger(iBTtransHeader.getId() + ""));
        
        for (TransactionsDetailEntity tdetails : iBTTransDetails) {
            
            assertionHelper.verifyTwoAmounts("Verifying TransAmt of IBT in Details Table of Id" + tdetails.getId(),
                    tdetails.getTransactionAmount() + "", arg3);
            if ("2".equals(tdetails.getTransactionNumber() + "")) {
                branchparameter = branchParametersService
                        .getBnrachDetailsByBranchCode(property.getProperty("IBTBranchCode"));
                assertionHelper.verifyTwoTexts(
                        "Verifying Transcode of IBT Transaction in Details Table of Id:" + tdetails.getId(),
                        tdetails.getTransactionMode(), branchparameter.getIbtTranscode());
                assertionHelper.verifyTwoTexts(
                        "Verifying Remarks of IBT Transactions in Details table of Id:" + tdetails.getId(),
                        tdetails.getRemark(), "IBT transaction {}" + arg4);
                assertionHelper.verifyTwoTexts(
                        "Verifying AccNo of IBT Transactions in Details table of Id:" + tdetails.getId(),
                        tdetails.getAccountNumber(), "0");
                if ("W".equalsIgnoreCase(arg1)) {
                    assertionHelper.verifyTwoTexts("Verfiying CrDr in Details table of TransId:" + tdetails.getId(),
                            tdetails.getDrCr(), "C");
                } else {
                    assertionHelper.verifyTwoTexts("Verfiying CrDr in Details table of TransId:" + tdetails.getId(),
                            tdetails.getDrCr(), "D");
                    
                }
            } else {
                branchparameter = branchParametersService
                        .getBnrachDetailsByBranchCode(property.getProperty("BranchCode"));
                assertionHelper.verifyTwoTexts(
                        "Verifying Transcode of IBT Transaction in Details Table of Id:" + tdetails.getId(),
                        tdetails.getTransactionMode(), arg6);
                if ("W".equalsIgnoreCase(arg1)) {
                    assertionHelper.verifyTwoTexts("Verfiying CrDr in Details table of TransId:" + tdetails.getId(),
                            tdetails.getDrCr(), "D");
                    assertionHelper.verifyTwoTexts(
                            "Verifying Remarks of IBT Transactions in Details table of Id:" + tdetails.getId(),
                            tdetails.getRemark(), "By Cash");
                    
                } else {
                    assertionHelper.verifyTwoTexts(
                            "Verifying Remarks of IBT Transactions in Details table of Id:" + tdetails.getId(),
                            tdetails.getRemark(), "By Cash");
                    assertionHelper.verifyTwoTexts("Verfiying CrDr in Details table of TransId:" + tdetails.getId(),
                            tdetails.getDrCr(), "C");
                }
            }
        }
        
    }
    
    @Then("^verify BranchCode \"([^\"]*)\" Name \"([^\"]*)\" \"([^\"]*)\" InstDate \"([^\"]*)\" DrCr Remarks$")
    public void verify_BranchCode_AccNo_Name_InstNo_InstType_InstDate_TransAmt_DrCr_Remarks(String arg1, String arg2,
            String arg3, String arg4) throws Throwable {
        
        branchparameter = branchParametersService.getBnrachDetailsByBranchCode(property.getProperty("BranchCode"));
        assertionHelper.verifyTwoTexts("Verifying BranchCode on UI",
                seleniumHelper.getTextFromAnElement("CashWithdrawalAuthScreen_BranchCode"),
                property.getProperty("BranchCode"));
        assertionHelper.verifyTwoTexts("Verifying AccNo on UI",
                seleniumHelper.getTextFromAnElement("CashWithdrawalAuthScreen_AccNo"), arg1);
        assertionHelper.verifyTwoTexts("Verifying Cust Name ",
                seleniumHelper.getTextFromAnElement("CashWithdrawalAuthScreen_Name"),
                customerMasterService
                        .getCustMasterDetailsByCustId(accountService.getAccountMasterDetailsByAccNo(arg1).getCustId())
                        .getCustName());
        assertionHelper.verifyTwoTexts("Verifying Instr No on UI",
                seleniumHelper.getTextFromAnElement("CashWithdrawalAuthScreen_InstrNo"), arg2);
        assertionHelper.verifyTwoTexts("Verifying Instr Type on UI",
                seleniumHelper.getTextFromAnElement("CashWithdrawalAuthScreen_InstrType"), arg3);
        assertionHelper.verifyTwoTexts("Verifying Instr Date on UI",
                seleniumHelper.getTextFromAnElement("CashWithdrawalAuthScreen_InstrDate"),
                dateHelper.convertDbDateToDDMMYYYY(branchparameter.getCurrentDate() + ""));
        assertionHelper.verifyTwoAmounts("Verifying transAmt No on UI",
                seleniumHelper.getTextFromAnElement("CashWithdrawalAuthScreen_TransAmt"), arg4);
        assertionHelper.verifyTwoTexts("Verifying DrCr on UI",
                seleniumHelper.getTextFromAnElement("CashWithdrawalAuthScreen_DrCr"), "D");
        assertionHelper.verifyTwoTexts("Verifying Remarks on UI",
                seleniumHelper.getTextFromAnElement("CashWithdrawalAuthScreen_Remarks"), "By Cash");
    }
    
    @Then("^user Enter and verify Payment screen with vouchNo \"([^\"]*)\" with \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\"$")
    public void payment(String arg1, String arg2, String arg3, String arg4, String arg5, String arg6, String arg7,
            String arg8, String arg9, String arg10, String arg11, String arg12, String arg13, String arg14,
            String arg15, String arg16, String arg17, String arg18, String arg19) {
        d.navigate().refresh();
        seleniumHelper.searchMenu("payment withdrawal");
        seleniumHelper.clickElement("Menu_CashPayment");
        String vouchNo = cacheHelper.getCache(arg1, cacheData);
        transHeader = transactionHeaderService
                .getTransactionHeaderdetailsByVoucherNumberAndTransType(Long.parseLong(vouchNo), "W");
        seleniumHelper.clickElement("CashPaymentScreen_voucherRadio");
        seleniumHelper.enterText("CashPaymentScreen_voucherInput", vouchNo);
        seleniumHelper.clickElement("CashPaymentScreen_getListButton");
        waitingHelper.sleep(2000);
        seleniumHelper.clickElement("//div[@class='table-responsive']/table/tbody/tr[1]/td[1]/a");
        commonMethodsForVerifications.verifyAndSubmitModel("Voucher details get successfully.");
        assertionHelper.verifyTwoAmounts("Verifying Voucher No Payment Screen",
                seleniumHelper.getTextFromAnElement("CashPaymentScreen_voucherNumber"), vouchNo);
        assertionHelper.verifyTwoAmounts("Verifying Token No Payment Screen",
                seleniumHelper.getTextFromAnElement("CashPaymentScreen_tokenNumber"),
                transHeader.getTokenNumber() + "");
        assertionHelper.verifyTwoAmounts("Verifying Trams Amount Payment Screen",
                seleniumHelper.getTextFromAnElement("CashPaymentScreen_transAmt"),
                transHeader.getTransactionAmount() + "");
        dbHelper.executeQuery(
                "UPDATE USERWISE_DENOM SET DENOM_QTY =1000 WHERE USER_ID =" + property.getProperty("LogInUser"));
        
        waitingHelper.sleep(2500);
        seleniumHelper.enterText("CashPaymentScreen_voucherInput", vouchNo);
        seleniumHelper.enterText("CashReceiptScreen_2000DenomFrom", arg2);
        seleniumHelper.enterText("CashReceiptScreen_500DenomFrom", arg3);
        seleniumHelper.enterText("CashReceiptScreen_200DenomFrom", arg4);
        seleniumHelper.enterText("CashReceiptScreen_100DenomFrom", arg5);
        seleniumHelper.enterText("CashReceiptScreen_50DenomFrom", arg6);
        seleniumHelper.enterText("CashReceiptScreen_20DenomFrom", arg7);
        seleniumHelper.enterText("CashReceiptScreen_10DenomFrom", arg8);
        seleniumHelper.enterText("CashReceiptScreen_1DenomFrom", arg9);
        seleniumHelper.enterText("CashReceiptScreen_0.1DenomFrom", arg10);
        
        seleniumHelper.enterText("CashReceiptScreen_2000DenomTo", arg11);
        seleniumHelper.enterText("CashReceiptScreen_500DenomTo", arg12);
        seleniumHelper.enterText("CashReceiptScreen_200DenomTo", arg13);
        seleniumHelper.enterText("CashReceiptScreen_100DenomTo", arg14);
        seleniumHelper.enterText("CashReceiptScreen_50DenomTo", arg15);
        seleniumHelper.enterText("CashReceiptScreen_20DenomTo", arg16);
        seleniumHelper.enterText("CashReceiptScreen_10DenomTo", arg17);
        seleniumHelper.enterText("CashReceiptScreen_1DenomTo", arg18);
        seleniumHelper.enterText("CashReceiptScreen_0.1DenomTo", arg19);
        seleniumHelper.clickElement("CashPaymentScreen_submitButton");
        waitingHelper.sleep(2500);
        commonMethodsForVerifications.verifyAndSubmitModel(" Withdrawal payment successfully.");
        
    }
    
    @Then("^user Enter and verify Payment screen with vouchNo \"([^\"]*)\" with \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" while Reject$")
    public void paymentRejection(String arg1, String arg2, String arg3, String arg4, String arg5, String arg6,
            String arg7, String arg8, String arg9, String arg10, String arg11, String arg12, String arg13, String arg14,
            String arg15, String arg16, String arg17, String arg18, String arg19) {
        d.navigate().refresh();
        seleniumHelper.searchMenu("payment withdrawal");
        seleniumHelper.clickElement("Menu_CashPayment");
        String vouchNo = cacheHelper.getCache(arg1, cacheData);
        transHeader = transactionHeaderService
                .getTransactionHeaderdetailsByVoucherNumberAndTransType(Long.parseLong(vouchNo), "W");
        seleniumHelper.clickElement("CashPaymentScreen_voucherRadio");
        seleniumHelper.enterText("CashPaymentScreen_voucherInput", vouchNo);
        seleniumHelper.clickElement("CashPaymentScreen_getListButton");
        waitingHelper.sleep(2000);
        seleniumHelper.clickElement("//div[@class='table-responsive']/table/tbody/tr[1]/td[1]/a");
        commonMethodsForVerifications.verifyAndSubmitModel("Voucher details get successfully.");
        assertionHelper.verifyTwoAmounts("Verifying Voucher No Payment Screen",
                seleniumHelper.getTextFromAnElement("CashPaymentScreen_voucherNumber"), vouchNo);
        assertionHelper.verifyTwoAmounts("Verifying Token No Payment Screen",
                seleniumHelper.getTextFromAnElement("CashPaymentScreen_tokenNumber"),
                transHeader.getTokenNumber() + "");
        assertionHelper.verifyTwoAmounts("Verifying Trams Amount Payment Screen",
                seleniumHelper.getTextFromAnElement("CashPaymentScreen_transAmt"),
                transHeader.getTransactionAmount() + "");
        dbHelper.executeQuery(
                "UPDATE USERWISE_DENOM SET DENOM_QTY =1000 WHERE USER_ID =" + property.getProperty("LogInUser"));
        
        waitingHelper.sleep(2500);
        seleniumHelper.enterText("CashPaymentScreen_voucherInput", vouchNo);
        seleniumHelper.enterText("CashReceiptScreen_2000DenomFrom", arg2);
        seleniumHelper.enterText("CashReceiptScreen_500DenomFrom", arg3);
        seleniumHelper.enterText("CashReceiptScreen_200DenomFrom", arg4);
        seleniumHelper.enterText("CashReceiptScreen_100DenomFrom", arg5);
        seleniumHelper.enterText("CashReceiptScreen_50DenomFrom", arg6);
        seleniumHelper.enterText("CashReceiptScreen_20DenomFrom", arg7);
        seleniumHelper.enterText("CashReceiptScreen_10DenomFrom", arg8);
        seleniumHelper.enterText("CashReceiptScreen_1DenomFrom", arg9);
        seleniumHelper.enterText("CashReceiptScreen_0.1DenomFrom", arg10);
        
        seleniumHelper.enterText("CashReceiptScreen_2000DenomTo", arg11);
        seleniumHelper.enterText("CashReceiptScreen_500DenomTo", arg12);
        seleniumHelper.enterText("CashReceiptScreen_200DenomTo", arg13);
        seleniumHelper.enterText("CashReceiptScreen_100DenomTo", arg14);
        seleniumHelper.enterText("CashReceiptScreen_50DenomTo", arg15);
        seleniumHelper.enterText("CashReceiptScreen_20DenomTo", arg16);
        seleniumHelper.enterText("CashReceiptScreen_10DenomTo", arg17);
        seleniumHelper.enterText("CashReceiptScreen_1DenomTo", arg18);
        seleniumHelper.enterText("CashReceiptScreen_0.1DenomTo", arg19);
        seleniumHelper.clickElement("CashPaymentScreen_rejectButton");
        waitingHelper.sleep(2500);
        commonMethodsForVerifications.verifyAndSubmitModel("Successfully Rejected.");
        
    }
}
