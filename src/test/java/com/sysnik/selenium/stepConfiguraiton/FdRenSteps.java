package com.sysnik.selenium.stepConfiguraiton;

import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.lang.reflect.Type;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import java.util.function.Function;

import org.openqa.selenium.By;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.FluentWait;
import org.openqa.selenium.support.ui.Wait;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.AccountMasterEntity;
import com.sysnik.selenium.entity.BranchParametersEntity;
import com.sysnik.selenium.entity.CustomerAccountEntity;
import com.sysnik.selenium.entity.CustomerMasterEntity;
import com.sysnik.selenium.entity.TransactionHeaderEntity;
import com.sysnik.selenium.entity.TransactionsDetailEntity;
import com.sysnik.selenium.fw.helper.AssertionHelper;
import com.sysnik.selenium.fw.helper.CacheHelper;
import com.sysnik.selenium.fw.helper.CommonMethodsForVerifications;
import com.sysnik.selenium.fw.helper.ConvertPropertyFileToMap;
import com.sysnik.selenium.fw.helper.DateHelper;
import com.sysnik.selenium.fw.helper.DbHelper;
import com.sysnik.selenium.fw.helper.DropDownHelper;
import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.fw.helper.RobotHelper;
import com.sysnik.selenium.fw.helper.SeleniumHelper;
import com.sysnik.selenium.fw.helper.WaitingHelper;
import com.sysnik.selenium.fw.testBase.TestBase;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import model.FdRen;

public class FdRenSteps extends TestBase {
    FdRen fdren = null;
    
    List<FdRen> fdrenList = null;
    Map<String, FdRen> fdrenMap = new HashMap<String, FdRen>();
    
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
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    FdAccountClosingStepDef fdAccountClosingStepDef = new FdAccountClosingStepDef();
    private CustomerAccountEntity custAcc;
    private CustomerMasterEntity custMaster;
    private AccountMasterEntity accMaster;
    private AccountMasterEntity renewalAccMaster;
    private TransactionHeaderEntity transHeader;
    private List<TransactionsDetailEntity> childTransDetailsList;
    private TransactionsDetailEntity transDetails;
    private BranchParametersEntity branchparam;
    
    @Given("^user opens a scenario for FD Renewal \"([^\"]*)\" \"([^\"]*)\"$")
    public FdRen test(String scenario,String path) {
        
        try {
            Reader reader = new FileReader("src/main/resources/JSON/"+path+".json");
            /*
             * ObjectMapper mapper = new ObjectMapper(); byte[] jsonMap; jsonMap = mapper.writeValueAsBytes(reader);
             */
            //lienDataList = gson.fromJson(reader, List.class);
            
            Type typeOfObjectsList = new TypeToken<ArrayList<FdRen>>() {
            }.getType();
            
            fdrenList = new Gson().fromJson(reader, typeOfObjectsList);
            
            //  lienDataList = mapper.readValue(reader, List.class);
            for (FdRen data : fdrenList) {
                fdrenMap.put(data.getScenario(), data);
                if (scenario.equalsIgnoreCase(data.getScenario())) {
                    
                    fdren = data;
                    
                }
            }
            
        } catch (IOException e) {
            e.printStackTrace();
        }
        return fdren;
    }
    
    @When("^user enters accNo Fd Renewal Entry screen$")
    public void user_enters_accNo_Fd_Renewal_Entry_screen() throws Throwable {
        seleniumHelper.enterText("FDRenewalScreen_accNumber", fdren.getAccNumber());
        
    }
    
    @Then("^Verify CustName PeriodInMonths PeriodInDays opngDate availableBal MatAmt MatDate payableAmt of AccNo$")
    public void verify_CustName_PeriodInMonths_PeriodInDays_opngDate_availableBal_MatAmt_MatDate_payableAmt_of_AccNo()
            throws Throwable {
        custAcc = customerAccountService.getCustomerAccDetailsByAccNumber(fdren.getAccNumber());
        custMaster = customerMasterService.getCustMasterDetailsByCustId(custAcc.getCustId());
        try {
            
            Wait<WebDriver> wait = new FluentWait<WebDriver>(d).withTimeout(30, TimeUnit.SECONDS)
                    .pollingEvery(5, TimeUnit.SECONDS).ignoring(NoSuchElementException.class)
                    .ignoring(StaleElementReferenceException.class);
            WebElement foo = wait.until(new Function<WebDriver, WebElement>() {
                public WebElement apply(WebDriver driver) {
                    return driver.findElement(By.xpath("//a[@id='accNumber']"));
                }
            });
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            
        }
        assertionHelper.verifyTwoTexts("Verifiying CUSTNAME on UI of accNo:" + fdren.getAccNumber(),
                seleniumHelper.getTextFromAnElement("FDRenewalScreen_custName"), custMaster.getCustName());
        assertionHelper.verifyTwoTexts("Verifiying DEPOSIT PERIOD IN MONTHS on UI of accNo:" + fdren.getAccNumber(),
                seleniumHelper.getTextFromAnElement("FDRenewalScreen_depPeriodMonths"), fdren.getDepPeriodMonths());
    }
    
    @When("^user click on interestInfoTab on Fd Renewal Entry screen$")
    public void user_click_on_interestInfoTab_on_Fd_Renewal_Entry_screen() throws Throwable {
        seleniumHelper.clickElement("FDRenewalScreen_interestInformationTab");
    }
    
    @Then("^Verify ROI AddROI ROIAfterAmt RmngIntAmt AftrMatAmt IntPaid IntProvision IntCap CashIntPayable$")
    public void verify_ROI_AddROI_ROIAfterAmt_RmngIntAmt_AftrMatAmt_IntPaid_IntProvision_IntCap_CashIntPayable()
            throws Throwable {
        assertionHelper.verifyTwoAmounts("verifying ROI on UI of accNo:" + fdren.getAccNumber(),
                seleniumHelper.getTextFromAnElement("FDRenewalScreen_intRoi"), fdren.getIntRoi());
        
        assertionHelper.verifyTwoAmounts("verifying Addtional ROI on UI of accNo:" + fdren.getAccNumber(),
                seleniumHelper.getTextFromAnElement("FDRenewalScreen_additionalIntRate"), fdren.getAdditionalIntRate());
        assertionHelper.verifyTwoAmounts("verifying ROI After MATURITY on UI of accNo:" + fdren.getAccNumber(),
                seleniumHelper.getTextFromAnElement("FDRenewalScreen_roiAfterMaturity"), fdren.getRoiAfterMaturity());
        assertionHelper.verifyTwoAmounts("verifying REMAINING INTEREST on UI of accNo:" + fdren.getAccNumber(),
                seleniumHelper.getTextFromAnElement("FDRenewalScreen_remainingIntAmt"), fdren.getRemainingIntAmt());
        
        assertionHelper.verifyTwoAmounts(
                "verifying AFTER MATURITY INTEREST on UI of accNo:" + fdren.getDepPeriodMonths(),
                seleniumHelper.getTextFromAnElement("FDRenewalScreen_afterMaturityInterest"),
                fdren.getAfterMaturityInterest());
        assertionHelper.verifyTwoAmounts("verifying INTEREST PAID on UI of accNo:" + fdren.getAccNumber(),
                seleniumHelper.getTextFromAnElement("FDRenewalScreen_intPaid"), fdren.getIntPaid());
        assertionHelper.verifyTwoAmounts("verifying INTEREST PROVISION on UI of accNo:" + fdren.getAccNumber(),
                seleniumHelper.getTextFromAnElement("FDRenewalScreen_intPayable"), fdren.getIntPayable());
        assertionHelper.verifyTwoAmounts("verifying INTEREST CAPITALIZE on UI of accNo:" + fdren.getAccNumber(),
                seleniumHelper.getTextFromAnElement("FDRenewalScreen_intCapitalize"), fdren.getIntCapitalize());
        assertionHelper.verifyTwoAmounts("verifying CASH INTEREST on UI of accNo:" + fdren.getAccNumber(),
                seleniumHelper.getTextFromAnElement("FDRenewalScreen_cashInterest"), fdren.getCashInterest());
        assertionHelper.verifyTwoAmounts("verifying CASH INTEREST on UI of accNo:" + fdren.getAccNumber(),
                seleniumHelper.getTextFromAnElement("FDRenewalScreen_cashInterest"), fdren.getCashInterest());
    }
    
    @When("^user click on TDSAndLoanInfoTab on Fd Renewal Entry screen$")
    public void user_click_on_TDSAndLoanInfoTab_on_Fd_Renewal_Entry_screen() throws Throwable {
        seleniumHelper.clickElement("FDRenewalScreen_tdsandLoanDetailsTab");
    }
    
    @Then("^Verify TDSDeductedAmt TDSAmt ExcessInt TDSRecovery TotalPayable on Fd Renewal Entry screen$")
    public void verify_TDSDeductedAmt_TDSAmt_ExcessInt_TDSRecovery_TotalPayable_on_Fd_Renewal_Entry_screen()
            throws Throwable {
        
        assertionHelper.verifyTwoAmounts("Verfiying TDS DEDUCTED ON ui for accNo:" + fdren.getAccNumber(),
                seleniumHelper.getTextFromAnElement("FDRenewalScreen_tdsDeducted"), fdren.getTdsDeducted());
        assertionHelper.verifyTwoAmounts("Verfiying TDS AMOUNT ON ui for accNo:" + fdren.getAccNumber(),
                seleniumHelper.getTextFromAnElement("FDRenewalScreen_tdsAmount"), fdren.getTdsAmount());
        assertionHelper.verifyTwoAmounts("Verfiying EXCESS INT RECEIVABLE ON ui for accNo:" + fdren.getAccNumber(),
                seleniumHelper.getTextFromAnElement("FDRenewalScreen_excessIntReceivable"),
                fdren.getExcessIntReceivable());
        assertionHelper.verifyTwoAmounts("Verfiying TDS RECOVERY ON ui for accNo:" + fdren.getAccNumber(),
                seleniumHelper.getTextFromAnElement("FDRenewalScreen_tdsRecovery"), fdren.getTdsRecovery());
        
    }
    
    @When("^user click on addRenualDetails on Fd Renewal Entry screen$")
    public void user_click_on_addRenualDetails_on_Fd_Renewal_Entry_screen() throws Throwable {
        seleniumHelper.clickElement("FDRenewalScreen_addRenualDetails");
    }
    
    @When("^user select Renewal Product from dropdown on Fd Renewal Entry screen$")
    public void user_select_Renewal_Product_from_dropdown_on_Fd_Renewal_Entry_screen() throws Throwable {
        
        dropDownHelper.SelectUsingVisibleText("FDRenewalScreen_renewalProduct", fdren.getRenewalProduct());
    }
    
    @When("^user enter renewal Amount on Fd Renewal Entry screen$")
    public void user_enter_renewal_Amount_on_Fd_Renewal_Entry_screen() throws Throwable {
        
        seleniumHelper.enterText("FDRenewalScreen_renewalAmt", fdren.getRenewalAmt());
    }
    
    @When("^select the option of Renewal accoutn option on Fd Renewal Entry screen$")
    public void select_the_option_of_Renewal_accoutn_option_on_Fd_Renewal_Entry_screen() throws Throwable {
        if ("N".equalsIgnoreCase(fdren.getRenewalWithOldNew())) {
            seleniumHelper.clickElement("FDRenewalScreen_renewalWithOldNewN");
        } else if ("Y".equalsIgnoreCase(fdren.getRenewalWithOldNew())) {
            seleniumHelper.clickElement("FDRenewalScreen_renewalWithOldNewY");
        }
        
    }
    
    @Then("^verify renewal Date on Fd Renewal Entry screen$")
    public void verify_renewal_Date_on_Fd_Renewal_Entry_screen() throws Throwable {
        
        assertionHelper.verifyTwoTexts("Verifying RENEWEAL DATE on UI of accNo: " + fdren.getAccNumber(),
                seleniumHelper.getTextFromAnElement("FDRenewalScreen_renewalDate"),
                dateHelper.convertDbDateToDDMMYYYY(fdren.getRenewalDate()));
        
    }
    
    @When("^enter renewal DepositPeriod in months on Fd Renewal Entry screen$")
    public void enter_renewal_DepositPeriod_in_months_on_Fd_Renewal_Entry_screen() throws Throwable {
        
        seleniumHelper.enterText("FDRenewalScreen_renewalMonth", fdren.getRenewalMonth());
    }
    
    @When("^enter renewal DepositPeriod in days on Fd Renewal Entry screen$")
    public void enter_renewal_DepositPeriod_in_days_on_Fd_Renewal_Entry_screen() throws Throwable {
        seleniumHelper.enterText("FDRenewalScreen_renewalDays", fdren.getRenewalDays());
    }
    
    @Then("^verify following renewal details RenewalROI RenewalAddtROI RenewalNewMatAmt RenewalMatDate on Fd Renewal Entry screen$")
    public void verify_following_renewal_details_RenewalROI_RenewalAddtROI_RenewalNewMatAmt_RenewalMatDate_on_Fd_Renewal_Entry_screen()
            throws Throwable {
        assertionHelper.verifyTwoAmounts("verifying RENEWAL ROI on ui of accNo: " + fdren.getAccNumber(),
                seleniumHelper.getTextFromAnElement("FDRenewalScreen_renewalRoi"), fdren.getRenewalRoi());
        assertionHelper.verifyTwoAmounts("verifying Addtional RENEWAL ROI on ui of accNo: " + fdren.getAccNumber(),
                seleniumHelper.getTextFromAnElement("FDRenewalScreen_renewalAdditionalROI"),
                fdren.getRenewalAdditionalROI());
        assertionHelper.verifyTwoAmounts(
                "verifying RENEWAL NEW MATURITY AMOUNT on ui of accNo: " + fdren.getAccNumber(),
                seleniumHelper.getTextFromAnElement("FDRenewalScreen_renewalMatAmt"), fdren.getRenewalMatAmt());
        assertionHelper.verifyTwoAmounts("verifying RENEWAL NEW MATURITY DATE on ui of accNo: " + fdren.getAccNumber(),
                seleniumHelper.getTextFromAnElement("FDRenewalScreen_renewalMatDate"),
                dateHelper.convertDbDateToDDMMYYYY(fdren.getRenewalMatDate()));
    }
    
    @Then("^verify payable amount on Fd Renewal Entry screen$")
    public void verify_payable_amount_on_Fd_Renewal_Entry_screen() throws Throwable {
        assertionHelper.verifyTwoAmounts("verifying PAYABLE AMOUNT on ui of accNo: " + fdren.getAccNumber(),
                
                seleniumHelper.getTextFromAnElement("FDRenewalScreen_payableAmtRenewal"), fdren.getPayableAmt());
    }
    
    @When("^user select ModeOfPayableRceivableAmt on Fd Renewal Entry screen$")
    public void user_select_ModeOfPayableRceivableAmt_on_Fd_Renewal_Entry_screen() throws Throwable {
        
        if ("cash".equalsIgnoreCase(fdren.getModeOfTrans())) {
            seleniumHelper.clickElement("CommonModeOfTransactionScreen_modeOfTransCASH");
        } else {
            seleniumHelper.clickElement("CommonModeOfTransactionScreen_modeOfTransTRANSFER");
        }
    }
    
    @Then("^observe transaction amount on Fd Renewal Entry screen$")
    public void observe_transaction_amount_on_Fd_Renewal_Entry_screen() throws Throwable {
        assertionHelper.verifyTwoAmounts("Verifying Transaction Amount on UI of accNo: " + fdren.getAccNumber(),
                seleniumHelper.getTextFromAnElement("CommonModeOfTransactionScreen_transactionAmt"),
                fdren.getTransactionAmount());
    }
    
    @When("^user enters TokenNumber on Fd Renewal Entry screen$")
    public void user_enters_TokenNumber_on_Fd_Renewal_Entry_screen() throws Throwable {
        seleniumHelper.enterText("CommonModeOfTransactionScreen_tokenNumber", fdren.getTokenNumber());
    }
    
    @When("^user enters Remark on Fd Renewal Entry screen$")
    public void user_enters_Remark_on_Fd_Renewal_Entry_screen() throws Throwable {
        seleniumHelper.enterText("CommonModeOfTransactionScreen_remark", fdren.getRemark());
    }
    
    @When("^click on submit button on Td Closing Screen on Fd Renewal Entry screen$")
    public void click_on_submit_button_on_Td_Closing_Screen_on_Fd_Renewal_Entry_screen() throws Throwable {
        seleniumHelper.clickElement("FDRenewalScreen_submitButton");
    }
    
    @When("^user click on voucherDisplayConfirm button on Fd Renewal Entry screen$")
    public void user_click_on_voucherDisplayConfirm_button_on_Fd_Renewal_Entry_screen() throws Throwable {
        seleniumHelper.clickElement("FDRenewalScreen_submitButton");
    }
    
    @Then("^user finds successMessage on Fd Renewal Entry screen$")
    public void user_finds_successMessage_on_Fd_Renewal_Entry_screen() throws Throwable {
        commonMethodsForVerifications.verifyAndSubmitModel(fdren.getSuccessMessag());
    }
    
    @Then("^verfiy account_master table for FD Renewal at level \"([^\"]*)\"$")
    public void verfiy_account_master_table_for_FD_Renewal_at_level(String arg1) throws Throwable {
        
        accMaster = accountService.getAccountMasterDetailsByAccNo(fdren.getAccNumber());
        if ("entry".equalsIgnoreCase(arg1)) {
            assertionHelper.verifyTwoAmounts(
                    "Verifying AVAILABLE_BALANCE in accountMaster for accNo:" + fdren.getAccNumber(),
                    accMaster.getAvailableBal() + "", fdren.getAvailableBal());
            assertionHelper.verifyTwoAmounts(
                    "Verifying LEDGER_BALANCE in accountMaster for accNo:" + fdren.getAccNumber(),
                    accMaster.getLedgerBal() + "", fdren.getAvailableBal());
            
            if ("Y".equalsIgnoreCase(fdren.getRenewalWithOldNew())) {
                assertionHelper.verifyTwoTexts("verifying STATUS of accountMaster for accNo:" + fdren.getAccNumber(),
                        accMaster.getStatus(), "C");
            } else {
                assertionHelper.verifyTwoTexts("verifying STATUS of accountMaster for accNo:" + fdren.getAccNumber(),
                        accMaster.getStatus(), "N");
            }
            
        } else if ("auth".equalsIgnoreCase(arg1)) {
            branchparam = branchParametersService.getBnrachDetailsByBranchCode(property.getProperty("BranchCode"));
            if ("Y".equalsIgnoreCase(branchparam.getDenominationYN())) {
                if ("Y".equalsIgnoreCase(fdren.getRenewalWithOldNew())) {
                    assertionHelper.verifyTwoTexts(
                            "verifying STATUS of accountMaster for accNo:" + fdren.getAccNumber(),
                            accMaster.getStatus(), "C");
                } else {
                    assertionHelper.verifyTwoTexts(
                            "verifying STATUS of accountMaster for accNo:" + fdren.getAccNumber(),
                            accMaster.getStatus(), "A");
                }
            } else {
                if ("Y".equalsIgnoreCase(fdren.getRenewalWithOldNew())) {
                    assertionHelper.verifyTwoAmounts(
                            "Verifying AVAILABLE_BALANCE in accountMaster for accNo:" + fdren.getAccNumber(),
                            accMaster.getAvailableBal() + "", "0");
                    assertionHelper.verifyTwoAmounts(
                            "Verifying LEDGER_BALANCE in accountMaster for accNo:" + fdren.getAccNumber(),
                            accMaster.getLedgerBal() + "", "0");
                    assertionHelper.verifyTwoTexts(
                            "verifying STATUS of accountMaster for accNo:" + fdren.getAccNumber(),
                            accMaster.getStatus(), "C");
                    renewalAccMaster = accountService
                            .getAccountMasterDetailsByAccNo(cacheData.get(fdren.getRenewalAccCacheKey()));
                    assertionHelper.verifyTwoAmounts(
                            "Verifying AVAILABLE_BALANCE in accountMaster for accNo:" + fdren.getAccNumber(),
                            renewalAccMaster.getAvailableBal() + "", fdren.getRenewalAmt());
                    assertionHelper.verifyTwoAmounts(
                            "Verifying LEDGER_BALANCE in accountMaster for accNo:" + fdren.getAccNumber(),
                            renewalAccMaster.getLedgerBal() + "", fdren.getRenewalAmt());
                    assertionHelper.verifyTwoTexts(
                            "verifying STATUS of accountMaster for accNo:" + fdren.getAccNumber(),
                            renewalAccMaster.getStatus(), "A");
                } else {
                    assertionHelper.verifyTwoAmounts(
                            "Verifying AVAILABLE_BALANCE in accountMaster for accNo:" + fdren.getAccNumber(),
                            accMaster.getAvailableBal() + "", fdren.getRenewalAmt());
                    assertionHelper.verifyTwoAmounts(
                            "Verifying LEDGER_BALANCE in accountMaster for accNo:" + fdren.getAccNumber(),
                            accMaster.getLedgerBal() + "", fdren.getRenewalAmt());
                    assertionHelper.verifyTwoTexts(
                            "verifying STATUS of accountMaster for accNo:" + fdren.getAccNumber(),
                            accMaster.getStatus(), "A");
                }
            }
        } else if ("payment".equalsIgnoreCase(arg1)) {
            if ("Y".equalsIgnoreCase(fdren.getRenewalWithOldNew())) {
                assertionHelper.verifyTwoAmounts(
                        "Verifying AVAILABLE_BALANCE in accountMaster for accNo:" + fdren.getAccNumber(),
                        accMaster.getAvailableBal() + "", "0");
                assertionHelper.verifyTwoAmounts(
                        "Verifying LEDGER_BALANCE in accountMaster for accNo:" + fdren.getAccNumber(),
                        accMaster.getLedgerBal() + "", "0");
                assertionHelper.verifyTwoTexts("verifying STATUS of accountMaster for accNo:" + fdren.getAccNumber(),
                        accMaster.getStatus(), "C");
                renewalAccMaster = accountService
                        .getAccountMasterDetailsByAccNo(cacheData.get(fdren.getRenewalAccCacheKey()));
                assertionHelper.verifyTwoAmounts(
                        "Verifying AVAILABLE_BALANCE in accountMaster for accNo:" + renewalAccMaster.getAccNo(),
                        renewalAccMaster.getAvailableBal() + "", fdren.getRenewalAmt());
                assertionHelper.verifyTwoAmounts(
                        "Verifying LEDGER_BALANCE in accountMaster for accNo:" + renewalAccMaster.getAccNo(),
                        renewalAccMaster.getLedgerBal() + "", fdren.getRenewalAmt());
                assertionHelper.verifyTwoTexts(
                        "verifying STATUS of accountMaster for accNo:" + renewalAccMaster.getAccNo(),
                        renewalAccMaster.getStatus(), "A");
            } else {
                assertionHelper.verifyTwoAmounts(
                        "Verifying AVAILABLE_BALANCE in accountMaster for accNo:" + fdren.getAccNumber(),
                        accMaster.getAvailableBal() + "", fdren.getRenewalAmt());
                assertionHelper.verifyTwoAmounts(
                        "Verifying LEDGER_BALANCE in accountMaster for accNo:" + fdren.getAccNumber(),
                        accMaster.getLedgerBal() + "", fdren.getRenewalAmt());
                assertionHelper.verifyTwoTexts("verifying STATUS of accountMaster for accNo:" + fdren.getAccNumber(),
                        accMaster.getStatus(), "A");
            }
        }
    }
    
    @Then("^verify Transaction_Header table for FD Renewal at level \"([^\"]*)\"$")
    public void verify_Transaction_Header_table_for_FD_Renewal_at_level(String arg1) throws Throwable {
        if ("cash".equalsIgnoreCase(fdren.getModeOfTrans())) {
            transHeader = transactionHeaderService.getTransactionHeaderdetailsByVoucherNumberAndTransType(
                    Long.parseLong(cacheData.get(fdren.getCacheKey())), "W");
            branchparam = branchParametersService.getBnrachDetailsByBranchCode(property.getProperty("BranchCode"));
            assertionHelper.verifyTwoAmounts(
                    "Verifying WITHDRAWAL AMOUNT in TRANS_HEADER of VoucherNo:" + cacheData.get(fdren.getCacheKey()),
                    transHeader.getTransactionAmount() + "", fdren.getTransHeader().getParentVoucherTransAmount());
            assertionHelper.verifyTwoTexts(
                    "Matching TRANS_DATE with BRANCHDATE VoucherNo:" + cacheData.get(fdren.getCacheKey()),
                    dateHelper.convertDbDateToDDMMYYYY(transHeader.getTransactionDate() + ""),
                    dateHelper.convertDbDateToDDMMYYYY(branchparam.getCurrentDate() + ""));
            
            if ("entry".equalsIgnoreCase(arg1)) {
                assertionHelper.verifyTwoTexts(
                        "Verfiying STATUS in TRANSHEADER of VoucherNo:" + cacheData.get(fdren.getCacheKey()),
                        transHeader.getStatus(), "E");
                assertionHelper.verifyTwoTexts("Verfiying OPERATOR IP ADDRESS in TRANSHEADER of VoucherNo:"
                        + cacheData.get(fdren.getCacheKey()), transHeader.getOperatorIp(), getSystemIP());
                assertionHelper.verifyTwoTexts(
                        "Verfiying OPERATOR ID in TRANSHEADER of VoucherNo:" + cacheData.get(fdren.getCacheKey()),
                        transHeader.getOperatorId(), property.getProperty("LogInUser"));
            } else if ("auth".equalsIgnoreCase(arg1)) {
                assertionHelper.verifyTwoTexts(
                        "Verfiying STATUS in TRANSHEADER of VoucherNo:" + cacheData.get(fdren.getCacheKey()),
                        transHeader.getStatus(), "P");
                assertionHelper.verifyTwoTexts("Verfiying AUTHORIZE IP ADDRESS in TRANSHEADER of VoucherNo:"
                        + cacheData.get(fdren.getCacheKey()), transHeader.getAuthorizeIp(), getSystemIP());
                assertionHelper.verifyTwoTexts(
                        "Verfiying AUTHORIZE ID in TRANSHEADER of VoucherNo:" + cacheData.get(fdren.getCacheKey()),
                        transHeader.getAuthorizeId(), property.getProperty("LogInUser"));
            } else if ("payment".equalsIgnoreCase(arg1)) {
                assertionHelper.verifyTwoTexts(
                        "Verfiying STATUS in TRANSHEADER of VoucherNo:" + cacheData.get(fdren.getCacheKey()),
                        transHeader.getStatus(), "A");
            } else if ("reject".equalsIgnoreCase(arg1)) {
                assertionHelper.verifyTwoTexts(
                        "Verfiying STATUS in TRANSHEADER of VoucherNo:" + cacheData.get(fdren.getCacheKey()),
                        transHeader.getStatus(), "R");
                assertionHelper.verifyTwoTexts("Verfiying AUTHORIZE IP ADDRESS in TRANSHEADER of VoucherNo:"
                        + cacheData.get(fdren.getCacheKey()), transHeader.getAuthorizeIp(), getSystemIP());
                assertionHelper.verifyTwoTexts(
                        "Verfiying AUTHORIZE ID in TRANSHEADER of VoucherNo:" + cacheData.get(fdren.getCacheKey()),
                        transHeader.getAuthorizeId(), property.getProperty("LogInUser"));
            }
            assertionHelper.verifyTwoTexts(
                    "Verfiying TOKEN NO in TRANSHEADER of VoucherNo:" + cacheData.get(fdren.getCacheKey()),
                    transHeader.getTokenNumber() + "", fdren.getTokenNumber());
            reportHelper.writeLogInfoInChildTest(
                    "****************VERFIYING CHILD VOUCHER TRANS HEADER************************");
            transHeader = transactionHeaderService
                    .getTransactionDetailsUsingParentVoucher(Long.parseLong(cacheData.get(fdren.getCacheKey())));
            assertionHelper.verifyTwoAmounts(
                    "Verifying RENEWAL AMOUNT in TRANS_HEADER of ParentVoucherNo:" + cacheData.get(fdren.getCacheKey()),
                    transHeader.getTransactionAmount() + "", fdren.getTransHeader().getChildVoucherTransAmount());
            assertionHelper.verifyTwoTexts(
                    "Matching TRANS_DATE with BRANCHDATE ParentVoucherNo:" + cacheData.get(fdren.getCacheKey()),
                    dateHelper.convertDbDateToDDMMYYYY(transHeader.getTransactionDate() + ""),
                    dateHelper.convertDbDateToDDMMYYYY(branchparam.getCurrentDate() + ""));
            if ("entry".equalsIgnoreCase(arg1)) {
                assertionHelper.verifyTwoTexts(
                        "Verfiying STATUS in TRANSHEADER of ParentVoucherNo:" + cacheData.get(fdren.getCacheKey()),
                        transHeader.getStatus(), "E");
                assertionHelper.verifyTwoTexts("Verfiying OPERATOR IP ADDRESS in TRANSHEADER of VoucherNo:"
                        + cacheData.get(fdren.getCacheKey()), transHeader.getOperatorIp(), getSystemIP());
                assertionHelper.verifyTwoTexts(
                        "Verfiying OPERATOR ID in TRANSHEADER of ParentVoucherNo:" + cacheData.get(fdren.getCacheKey()),
                        transHeader.getOperatorId(), property.getProperty("LogInUser"));
            } else if ("auth".equalsIgnoreCase(arg1)) {
                assertionHelper.verifyTwoTexts(
                        "Verfiying STATUS in TRANSHEADER of VoucherNo:" + cacheData.get(fdren.getCacheKey()),
                        transHeader.getStatus(), "P");
                assertionHelper.verifyTwoTexts("Verfiying AUTHORIZE IP ADDRESS in TRANSHEADER of ParentVoucherNo:"
                        + cacheData.get(fdren.getCacheKey()), transHeader.getAuthorizeIp(), getSystemIP());
                assertionHelper.verifyTwoTexts(
                        "Verfiying AUTHORIZE ID in TRANSHEADER of ParentVoucherNo:"
                                + cacheData.get(fdren.getCacheKey()),
                        transHeader.getAuthorizeId(), property.getProperty("LogInUser"));
            } else if ("payment".equalsIgnoreCase(arg1)) {
                assertionHelper.verifyTwoTexts(
                        "Verfiying STATUS in TRANSHEADER of ParentVoucherNo:" + cacheData.get(fdren.getCacheKey()),
                        transHeader.getStatus(), "A");
            } else if ("reject".equalsIgnoreCase(arg1)) {
                assertionHelper.verifyTwoTexts(
                        "Verfiying STATUS in TRANSHEADER of ParentVoucherNo:" + cacheData.get(fdren.getCacheKey()),
                        transHeader.getStatus(), "R");
                assertionHelper.verifyTwoTexts("Verfiying AUTHORIZE IP ADDRESS in TRANSHEADER of ParentVoucherNo:"
                        + cacheData.get(fdren.getCacheKey()), transHeader.getAuthorizeIp(), getSystemIP());
                assertionHelper.verifyTwoTexts(
                        "Verfiying AUTHORIZE ID in TRANSHEADER of ParentVoucherNo:"
                                + cacheData.get(fdren.getCacheKey()),
                        transHeader.getAuthorizeId(), property.getProperty("LogInUser"));
            }
        }
        
        else if ("transfer".equalsIgnoreCase(fdren.getModeOfTrans())) {
            
        }
    }
    
    @Then("^verify Transaction_Details table for FD Renewal at level \"([^\"]*)\"$")
    public void verify_Transaction_Details_table_for_FD_Renewal_at_level(String arg1) throws Throwable {
        transHeader = transactionHeaderService.getTransactionHeaderdetailsByVoucherNumberAndTransType(
                Long.parseLong(cacheData.get(fdren.getCacheKey())), "W");
        transDetails = transactionsDetailService.getTransDetailsInfoByIdAndAccountNumber(
                new BigInteger(transHeader.getId() + ""), fdren.getAccNumber());
        
        branchParametersService.getBnrachDetailsByBranchCode(property.getProperty("BranchCode"));
        assertionHelper.verifyTwoAmounts(
                "Verifying WITHDRAWAL AMOUNT in TRANS_DETAILS of VoucherNo:" + cacheData.get(fdren.getCacheKey()),
                transDetails.getTransactionAmount() + "", fdren.getTransHeader().getParentVoucherTransAmount());
        assertionHelper.verifyTwoAmounts(
                "Verifying TRANSCODE TRANS_DETAILS of VoucherNo:" + cacheData.get(fdren.getCacheKey()),
                transDetails.getTransactionMode() + "", "TdActRenewal");
        assertionHelper.verifyTwoAmounts(
                "Verifying CrDr TRANS_DETAILS of VoucherNo:" + cacheData.get(fdren.getCacheKey()),
                transDetails.getDrCr() + "", "D");
        reportHelper.writeLogInfoInChildTest(
                "****************VERFIYING CHILD VOUCHER TRANS DETAILS************************");
        transHeader = transactionHeaderService
                .getTransactionDetailsUsingParentVoucher(Long.parseLong(cacheData.get(fdren.getCacheKey())));
        childTransDetailsList = transactionsDetailService
                .getListOfTransDetailsRecordsByIdAndDrCr(new BigInteger(transHeader.getId() + ""), "C");
        BigDecimal creditAmount = new BigDecimal(0);
        BigDecimal debitAmount = new BigDecimal(0);
        for (TransactionsDetailEntity detailsList : childTransDetailsList) {
            
            creditAmount = creditAmount.add(detailsList.getTransactionAmount());
        }
        childTransDetailsList = transactionsDetailService
                .getListOfTransDetailsRecordsByIdAndDrCr(new BigInteger(transHeader.getId() + ""), "D");
        for (TransactionsDetailEntity D : childTransDetailsList) {
            debitAmount = debitAmount.add(D.getTransactionAmount());
        }
        BigDecimal diffAmount = new BigDecimal(0);
        diffAmount = debitAmount.subtract(creditAmount);
        assertionHelper.verifyTwoAmounts(
                "Verifying Difference Between Cr & Dr of Child Voucher of ID:: " + transHeader.getId(), "0",
                diffAmount + "");
    }
    
    @Then("^Verify DepositInterestHistory Table for FD Renewal at level \"([^\"]*)\"$")
    public void verify_DepositInterestHistory_Table_for_FD_Renewal_at_level(String level) throws Throwable {
        branchparam = branchParametersService.getBnrachDetailsByBranchCode(property.getProperty("BranchCode"));
        if ("entry".equalsIgnoreCase(level)) {
            fdAccountClosingStepDef.Deposit_Int_history(fdren.getAccNumber(), fdren.getTotalIntPaid(), "E");
        } else if ("auth".equalsIgnoreCase(level)) {
            if ("Y".equalsIgnoreCase(branchparam.getDenominationYN()))
                fdAccountClosingStepDef.Deposit_Int_history(fdren.getAccNumber(), fdren.getTotalIntPaid(), "E");
            else {
                fdAccountClosingStepDef.Deposit_Int_history(fdren.getAccNumber(), fdren.getTotalIntPaid(), "A");
            }
            
        } else if ("reject".equalsIgnoreCase(level)) {
            fdAccountClosingStepDef.Deposit_Int_history(fdren.getAccNumber(), fdren.getTotalIntPaid(), "R");
        } else if ("payment".equalsIgnoreCase(level)) {
            fdAccountClosingStepDef.Deposit_Int_history(fdren.getAccNumber(), fdren.getTotalIntPaid(), "A");
        }
    }
    
    /*
     * @Then("^verify DEPOSIT RENEWAL HISTORY table for FD Renewal at level \"([^\"]*)\"$") public void
     * verify_DEPOSIT_RENEWAL_HISTORY_table_for_FD_Renewal_at_level(String arg1) throws Throwable { accMaster =
     * accountService.getAccountMasterDetailsByAccNo(fdren.getAccNumber()); depositRenewal =
     * depositRenewalHistoryService.getRenewalDetailsByAccNo(accMaster.getAccId() + "");
     * depositMasterService.getDepositMasterDetailsByAccId(accMaster.getAccId()); for (DepositRenewalHistoryEntity
     * depRenList : depositRenewal) {
     * assertionHelper.verifyTwoAmounts("MATCHING INSTALmENT AMOUNT IN RENEWAL TABLE of accNo: "+fdren.
     * getAccDetails().getAccNo(), actualText, expectedText) } }
     */
    
    @Then("^verify TOKENMASTER table for FD Renewal at level \"([^\"]*)\"$")
    public void verify_TOKENMASTER_table_for_FD_Renewal_at_level(String arg1) throws Throwable {
        String tokenStatus = tokenMasterService.getStatusByTokenNumber(Integer.parseInt(fdren.getTokenNumber()));
        if ("entry".equalsIgnoreCase(arg1)) {
            assertionHelper.verifyTwoTexts(
                    "Verfiying STATUS of TOKENMASTER of voucherNo:" + cacheData.get(fdren.getCacheKey()), tokenStatus,
                    "C");
        } else if ("auth".equalsIgnoreCase(arg1)) {
            assertionHelper.verifyTwoTexts(
                    "Verfiying STATUS of TOKENMASTER of voucherNo:" + cacheData.get(fdren.getCacheKey()), tokenStatus,
                    "C");
        } else if ("reject".equalsIgnoreCase(arg1)) {
            assertionHelper.verifyTwoTexts(
                    "Verfiying STATUS of TOKENMASTER of voucherNo:" + cacheData.get(fdren.getCacheKey()), tokenStatus,
                    "A");
        } else if ("payment".equalsIgnoreCase(arg1)) {
            assertionHelper.verifyTwoTexts(
                    "Verfiying STATUS of TOKENMASTER of voucherNo:" + cacheData.get(fdren.getCacheKey()), tokenStatus,
                    "A");
        }
    }
    
    @When("^user select the accNO from dropdown of FD Renewal Auth screen$")
    public void user_select_the_accNO_from_dropdown_of_FD_Renewal_Auth_screen() throws Throwable {
        custAcc = customerAccountService.getCustomerAccDetailsByAccNumber(fdren.getAccNumber());
        dropDownHelper.selectByElement("FDRenewalScreenAuth_accDropdown",
                custAcc.getUserAccNo() + " - " + custAcc.getAccNo());
    }
    
    @Then("^Verify Closed Account Table$")
    public void closedAccountValidation() {
        fdAccountClosingStepDef.closeAccountVerfication(fdren.getAccNumber());
    }
    
    @Then("^Verify Payment Screen Flow$")
    public void cashPayment() {
        CashWithdrawalStepConfig cashWithdrawalStepConfig = new CashWithdrawalStepConfig();
        
        cashWithdrawalStepConfig.payment(fdren.getCacheKey(), fdren.getDenomModel().getTwoThousandFromDenom(),
                fdren.getDenomModel().getFiveHundredFromDenom(), fdren.getDenomModel().getTwoHundredFromDenom(),
                fdren.getDenomModel().getHundredFromDenom(), fdren.getDenomModel().getFiftyFromDenom(),
                fdren.getDenomModel().getTwentyFromDenom(), fdren.getDenomModel().getTenFromDenom(),
                fdren.getDenomModel().getOneRupeeFromDenom(), fdren.getDenomModel().getPaiseFromDenom(),
                fdren.getDenomModel().getTwoThousandToDenom(), fdren.getDenomModel().getFiveHundredToDenom(),
                fdren.getDenomModel().getTwoHundredToDenom(), fdren.getDenomModel().getHundredToDenom(),
                fdren.getDenomModel().getFiftyToDenom(), fdren.getDenomModel().getTwentyToDenom(),
                fdren.getDenomModel().getTenToDenom(), fdren.getDenomModel().getOneRupeeToDenom(),
                fdren.getDenomModel().getPaiseToDenom());
    }
    
}
