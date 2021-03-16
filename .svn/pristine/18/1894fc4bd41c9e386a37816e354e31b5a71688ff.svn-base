package com.sysnik.selenium.stepConfiguraiton;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.math.RoundingMode;
import java.util.List;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.AccountMasterEntity;
import com.sysnik.selenium.entity.ClosedAccountsEntity;
import com.sysnik.selenium.entity.CustomerMasterEntity;
import com.sysnik.selenium.entity.DepositIntpaymentHistoryEntity;
import com.sysnik.selenium.entity.DepositMasterEntity;
import com.sysnik.selenium.entity.LienEarMarkEntity;
import com.sysnik.selenium.entity.TdsDeductedDetailsEntity;
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

import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class FdAccountClosingStepDef extends TestBase {
    
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
    private DepositMasterEntity depMaster;
    private TransactionHeaderEntity transHeader;
    private List<TransactionHeaderEntity> transHeaderList;
    private List<TransactionsDetailEntity> transDetails;
    private DepositIntpaymentHistoryEntity depositIntpaymentHis;
    private ClosedAccountsEntity closedAcc;
    private LienEarMarkEntity lien;
    private TdsDeductedDetailsEntity tdsDetails;
    
    @Then("^setup FixedDepositPrematureClosing Screen$")
    public void setUFixedDepositPreMatClosingScreen() {
        dbHelper.executeQuery(
                "update ACCOUNT_MASTER SET CLOSE_DT =NULL, STATUS ='A', OPEN_DT ='2019-06-23', SHADOW_BAL =0, LEDGER_BAL =50000, AVAILABLE_BAL=50000 WHERE ACC_NO IN ('101210105550000028','101210105550000029','101210105550000030')");
        
        dbHelper.executeQuery(
                "UPDATE ACCOUNT_MASTER SET CLOSE_DT =NULL, STATUS ='A', LEDGER_BAL =-10000, AVAILABLE_BAL =-10000 WHERE ACC_NO IN('101210104100000255','101210104100000254')");
        
        dbHelper.executeQuery(
                "UPDATE DEPOSIT_MASTER SET INT_PAID=0, MATURITY_DT ='2020-06-23' WHERE ACC_ID IN (52680,52682,52687)");
        dbHelper.executeQuery("DELETE FROM CLOSED_ACCOUNTS WHERE ACC_ID IN (52680,52682,52687,52685,52686)");
        dbHelper.executeQuery(
                "UPDATE LIEN_EARMARK SET REL_AUTH_BY =NULL, REL_BY=NULL, RELEASE_DATE=NULL, STATUS ='A' WHERE DEPOSIT_ACC_ID=52682");
        
        dbHelper.executeQuery("update token_master set status='A' WHERE TOKEN_NUMBER IN(1)");
    }
    
    @When("^user enters accNo \"([^\"]*)\" Fd Closing Entry screen$")
    public void user_enters_accNo_Fd_Closing_Entry_screen(String arg1) throws Throwable {
        seleniumHelper.enterText("FdClosureScreen_accNumber", arg1);
        waitingHelper.sleep(3000);
    }
    
    @Then("^Verify CustName PeriodInMonths PeriodInDays opngDate availableBal MatAmt MatDate payableAmt of AccNo \"([^\"]*)\"$")
    public void verify_CustName_PeriodInMonths_PeriodInDays_opngDate_availableBal_MatAmt_MatDate_payableAmt(String arg1)
            throws Throwable {
        accMaster = accountService.getAccountMasterDetailsByAccNo(arg1);
        custMaster = customerMasterService.getCustMasterDetailsByCustId(accMaster.getCustId());
        depMaster = depositMasterService.getDepositMasterDetailsByAccId(accMaster.getAccId());
        assertionHelper.verifyTwoTexts("Verifying Cust Name on UI",
                seleniumHelper.getTextFromAnElement("FdClosureScreen_custName"), custMaster.getCustName());
        assertionHelper.verifyTwoTexts("Verifying Acc Opng Date on UI",
                seleniumHelper.getTextFromAnElement("FdClosureScreen_openDt"),
                dateHelper.convertDbDateToDDMMYYYY(accMaster.getOpenDt() + ""));
        assertionHelper.verifyTwoAmounts("Verifying available Balance on UI",
                seleniumHelper.getTextFromAnElement("FdClosureScreen_availableBal"), accMaster.getAvailableBal() + "");
        
        assertionHelper.verifyTwoTexts("Verifying Deposit Period in Months on UI",
                seleniumHelper.getTextFromAnElement("FdClosureScreen_depPeriodMonths"),
                depMaster.getDepPeriodMonths() + "");
        assertionHelper.verifyTwoTexts("Verifying Deposit Period in Days on UI",
                seleniumHelper.getTextFromAnElement("FdClosureScreen_depPeriodDays"),
                depMaster.getDepPeriodDays() + "");
        assertionHelper.verifyTwoAmounts("Verifying Maturity Amount on UI",
                seleniumHelper.getTextFromAnElement("FdClosureScreen_matAmt"), depMaster.getMatAmt() + "");
        assertionHelper.verifyTwoTexts("Verifying Acc Maturity Date on UI",
                seleniumHelper.getTextFromAnElement("FdClosureScreen_maturityDt"),
                dateHelper.convertDbDateToDDMMYYYY(depMaster.getMaturityDt() + ""));
    }
    
    @When("^user click on interestInfoTab$")
    public void user_click_on_interestInfoTab() throws Throwable {
        seleniumHelper.clickElement("FdClosureScreen_interestInformationTab");
    }
    
    @Then("^Verify ROI \"([^\"]*)\" AddROI \"([^\"]*)\" ROIAfterAmt \"([^\"]*)\" RmngIntAmt \"([^\"]*)\" AftrMatAmt \"([^\"]*)\" IntPaid \"([^\"]*)\" IntProvision \"([^\"]*)\" IntCap \"([^\"]*)\" CashIntPayable \"([^\"]*)\"$")
    public void verify_ROI_AddROI_ROIAfterAmt_RmngIntAmt_AftrMatAmt_IntPaid_IntProvision_IntCap_CashIntPayable(
            String arg1, String arg2, String arg3, String arg4, String arg5, String arg6, String arg7, String arg8,
            String arg9) throws Throwable {
        assertionHelper.verifyTwoTexts("Verifying ROI on UI",
                seleniumHelper.getTextFromAnElement("FdClosureScreen_intRoi"), arg1);
        assertionHelper.verifyTwoTexts("Verifying Addtional ROI on UI",
                seleniumHelper.getTextFromAnElement("FdClosureScreen_additionalIntRate"), arg2);
        assertionHelper.verifyTwoTexts("Verifying ROI after maturity on UI",
                seleniumHelper.getTextFromAnElement("FdClosureScreen_roiAfterMaturity"), arg3);
        assertionHelper.verifyTwoAmounts("Verifying Remaining interest amount on UI",
                seleniumHelper.getTextFromAnElement("FdClosureScreen_remainingIntAmt"), arg4);
        assertionHelper.verifyTwoAmounts("Verifying After maturity interest on UI",
                seleniumHelper.getTextFromAnElement("FdClosureScreen_afterMaturityInterest"), arg5);
        assertionHelper.verifyTwoAmounts("Verifying interest paid on UI",
                seleniumHelper.getTextFromAnElement("FdClosureScreen_intPaid"), arg6);
        assertionHelper.verifyTwoAmounts("Verifying interest provision on UI",
                seleniumHelper.getTextFromAnElement("FdClosureScreen_intPayable"), arg7);
        assertionHelper.verifyTwoAmounts("Verifying interest captilised on UI",
                seleniumHelper.getTextFromAnElement("FdClosureScreen_intCapitalize"), arg8);
        assertionHelper.verifyTwoAmounts("Verifying cash interest payable on UI",
                seleniumHelper.getTextFromAnElement("FdClosureScreen_cashInterest"), arg9);
    }
    
    @Then("^Verify ROI \"([^\"]*)\" AddROI \"([^\"]*)\" preMatROI \"([^\"]*)\" PreMatIntAmt \"([^\"]*)\" PenalIR \"([^\"]*)\" IntPaid \"([^\"]*)\" IntProvision \"([^\"]*)\" IntCap \"([^\"]*)\" PreMatPeriod \"([^\"]*)\" CashIntPayable \"([^\"]*)\"$")
    public void verify_ROI_AddROI_preMatROI_PreMatIntAmt_PenalIR_IntPaid_IntProvision_IntCap_PreMatPeriod_CashIntPayable(
            String arg1, String arg2, String arg3, String arg4, String arg5, String arg6, String arg7, String arg8,
            String arg9, String arg10) throws Throwable {
        assertionHelper.verifyTwoAmounts("Verifying ROI on UI",
                seleniumHelper.getTextFromAnElement("FdClosureScreen_intRoi"), arg1);
        assertionHelper.verifyTwoAmounts("Verifying Addtional ROI on UI",
                seleniumHelper.getTextFromAnElement("FdClosureScreen_additionalIntRate"), arg2);
        assertionHelper.verifyTwoAmounts("Verifying Pre Mature ROI on UI",
                seleniumHelper.getTextFromAnElement("FdClosureScreen_prematureRateofInterest"), arg3);
        
        assertionHelper.verifyTwoAmounts("Verifying Pre Mature Int Amount on UI",
                seleniumHelper.getTextFromAnElement("FdClosureScreen_prematureInterestAmount"), arg4);
        assertionHelper.verifyTwoAmounts("Verifying Penal Int Rate on UI",
                seleniumHelper.getTextFromAnElement("FdClosureScreen_penalRoi"), arg5);
        assertionHelper.verifyTwoAmounts("Verifying Int Paid on UI",
                seleniumHelper.getTextFromAnElement("FdClosureScreen_intPaid"), arg6);
        assertionHelper.verifyTwoAmounts("Verifying interest provision on UI",
                seleniumHelper.getTextFromAnElement("FdClosureScreen_intPayable"), arg7);
        assertionHelper.verifyTwoAmounts("Verifying interest captilised on UI",
                seleniumHelper.getTextFromAnElement("FdClosureScreen_intCapitalize"), arg8);
        assertionHelper.verifyTwoAmounts("Verifying Pre Mature Period on UI",
                seleniumHelper.getTextFromAnElement("FdClosureScreen_prematurePeriod"), arg9);
        assertionHelper.verifyTwoAmounts("Verifying cash interest payable on UI",
                seleniumHelper.getTextFromAnElement("FdClosureScreen_cashInterest"), arg10);
        
    }
    
    @When("^user click on TDSAndLoanInfoTab$")
    public void user_click_on_TDSAndLoanInfoTab() throws Throwable {
        seleniumHelper.clickElement("FdClosureScreen_tdsandLoanDetailsTab");
    }
    
    @Then("^Verify TDSDeductedAmt \"([^\"]*)\" TDSAmt \"([^\"]*)\" ExcessInt \"([^\"]*)\" TDSRecovery \"([^\"]*)\" TotalPayable \"([^\"]*)\"$")
    public void verify_TDSDeductedAmt_TDSAmt_ExcessInt_TDSRecovery_TotalPayable_TotalRecv(String arg1, String arg2,
            String arg3, String arg4, String arg5) throws Throwable {
        assertionHelper.verifyTwoAmounts("Verifying TDS Dedcuted amount on UI",
                seleniumHelper.getTextFromAnElement("FdClosureScreen_tdsDeducted"), arg1);
        assertionHelper.verifyTwoAmounts("Verifying TDS amount on UI",
                seleniumHelper.getTextFromAnElement("FdClosureScreen_tdsAmount"), arg2);
        assertionHelper.verifyTwoAmounts("Verifying Excess Int amount on UI",
                seleniumHelper.getTextFromAnElement("FdClosureScreen_excessIntReceivable"), arg3);
        assertionHelper.verifyTwoAmounts("Verifying TDS Recovery amount on UI",
                seleniumHelper.getTextFromAnElement("FdClosureScreen_tdsRecovery"), arg4);
        assertionHelper.verifyTwoAmounts("Verifying Total Payable amount on UI",
                seleniumHelper.getTextFromAnElement("FdClosureScreen_payableAmt"), arg5);
        
    }
    
    @When("^click on submit button on Td Closing Screen$")
    public void click_on_submit_button_on_Td_Closing_Screen() throws Throwable {
        seleniumHelper.clickElement("FdClosureScreen_submitButton");
        waitingHelper.sleep(3000);
    }
    
    @When("^click on Rejection button on Td Closing Screen$")
    public void click_on_Rejection_button_on_Td_Closing_Screen() throws Throwable {
        seleniumHelper.clickElement("FdClosureAuthScreen_Rejectbutton");
        waitingHelper.sleep(3000);
    }
    
    @Then("verify Child Voucher details in Transaction_Header table TRANS_AMT \"([^\"]*)\" and Status \"([^\"]*)\"  where Parent voucher_num \"([^\"]*)\"$")
    public void childVoucherDetails(String arg1, String arg2, String arg3) {
        String vouchNo = cacheHelper.getCache(arg3, cacheData);
        transHeader = transactionHeaderService.getTransactionDetailsUsingParentVoucher(Long.parseLong(vouchNo));
        
        assertionHelper.verifyTwoTexts("Verifying Status of child Voucher of ID:" + transHeader.getId(),
                transHeader.getStatus(), arg2);
        assertionHelper.verifyTwoTexts("Verifying TransType of child Voucher of ID:" + transHeader.getId(),
                transHeader.getTransType(), "T");
        assertionHelper.verifyTwoTexts("Verifying OperatorId of child Voucher of ID:" + transHeader.getId(),
                transHeader.getOperatorId(), property.getProperty("LogInUser"));
        assertionHelper.verifyTwoTexts("Verifying Operator IP of child Voucher of ID:" + transHeader.getId(),
                transHeader.getOperatorIp(), getSystemIP());
        
    }
    
    @Then("verify Dr Cr amount of Child Voucher details in Transaction_Details table where voucher_num \"([^\"]*)\"$")
    public void childVoucherInDetailsTable(String arg1) {
        String vouchNo = cacheHelper.getCache(arg1, cacheData);
        transHeader = transactionHeaderService.getTransactionDetailsUsingParentVoucher(Long.parseLong(vouchNo));
        transDetails = transactionsDetailService
                .getListOfTransDetailsRecordsByIdAndDrCr(new BigInteger(transHeader.getId() + ""), "C");
        BigDecimal creditAmount = new BigDecimal(0);
        BigDecimal debitAmount = new BigDecimal(0);
        for (TransactionsDetailEntity C : transDetails) {
            
            creditAmount = creditAmount.add(C.getTransactionAmount());
        }
        transDetails = transactionsDetailService
                .getListOfTransDetailsRecordsByIdAndDrCr(new BigInteger(transHeader.getId() + ""), "D");
        for (TransactionsDetailEntity D : transDetails) {
            debitAmount = debitAmount.add(D.getTransactionAmount());
        }
        BigDecimal diffAmount = new BigDecimal(0);
        diffAmount = debitAmount.subtract(creditAmount);
        assertionHelper.verifyTwoAmounts(
                "Verifying Difference Between Cr & Dr of Child Voucher of ID:: " + transHeader.getId(), "0",
                diffAmount + "");
    }
    
    @Then("^Verify DepositInterestHistory Table with AccNo \"([^\"]*)\" IntAmt \"([^\"]*)\" Status \"([^\"]*)\"$")
    public void Deposit_Int_history(String arg1, String arg2, String arg3) {
        accMaster = accountService.getAccountMasterDetailsByAccNo(arg1);
        depositIntpaymentHis = depositInterestHistoryService.getDepositInterestHistoryByAccId(accMaster.getAccId());
        
        assertionHelper.verifyTwoAmounts("Verifying Int Amount in Deposit Int History Table with AccNo:" + arg1,
                depositIntpaymentHis.getInterestAmount() + "", arg2);
        /*
         * assertionHelper.verifyTwoTexts("Verifying TransCode in Deposit Int His table of accNo:" + arg1,
         * depositIntpaymentHis.getTransCode(), "TdAcctCloser");
         */
        assertionHelper.verifyTwoTexts("Verifying Status in Deposit Int His table of accNo:" + arg1,
                depositIntpaymentHis.getStatus(), arg3);
        assertionHelper.verifyTwoTexts("Verifying CustId in Deposit Int His table of accNo:" + arg1,
                depositIntpaymentHis.getCustomerId() + "", accMaster.getCustId() + "");
    }
    
    @Then("Verify ClosedAccount Table with AccNo \"([^\"]*)\"$")
    public void closeAccountVerfication(String arg1) {
        accMaster = accountService.getAccountMasterDetailsByAccNo(arg1);
        closedAcc = closedAccountService.getClosedAccDetailsUsingAccId(accMaster.getAccId());
        
        assertionHelper.verifyTwoTexts("Verifying Closed Date in Closed Account Table of AccNo:" + arg1,
                dateHelper.convertDbDateToDDMMYYYY(closedAcc.getCloseDt() + ""),
                dateHelper.convertDbDateToDDMMYYYY(branchParametersService
                        .getBnrachDetailsByBranchCode(property.getProperty("BranchCode")).getCurrentDate() + ""));
    }
    
    @Then("verify Child Voucher details in Transaction_Header table with Parent voucher_num \"([^\"]*)\" TRANS_AMT \"([^\"]*)\"$")
    public void childVoucherHedarVefiricationForTDClosing(String arg1, String arg2) {
        String vouchNo = cacheHelper.getCache(arg1, cacheData);
        transHeaderList = transactionHeaderService.getTransactionDetailsListUsingParentVoucher(Long.parseLong(vouchNo),
                "T");
        BigDecimal transAmt = new BigDecimal("0");
        for (TransactionHeaderEntity t : transHeaderList) {
            transAmt = transAmt.add(t.getTransactionAmount());
        }
        assertionHelper.verifyTwoAmounts("Verifying Total Trans Amount of Child Voucher", transAmt + "", arg2);
        
    }
    
    @Then("verify Dr Cr amount of Child Voucher details in Transaction_Details table InTdClsong where voucher_num \"([^\"]*)\"$")
    public void childVoucherInDetailsTableInTdClsong(String arg1) {
        String vouchNo = cacheHelper.getCache(arg1, cacheData);
        transHeaderList = transactionHeaderService.getTransactionDetailsListUsingParentVoucher(Long.parseLong(vouchNo),
                "T");
        for (TransactionHeaderEntity t : transHeaderList) {
            transDetails = transactionsDetailService
                    .getListOfTransDetailsRecordsByIdAndDrCr(new BigInteger(t.getId() + ""), "C");
            BigDecimal creditAmount = new BigDecimal(0);
            BigDecimal debitAmount = new BigDecimal(0);
            for (TransactionsDetailEntity C : transDetails) {
                
                creditAmount = creditAmount.add(C.getTransactionAmount());
            }
            transDetails = transactionsDetailService
                    .getListOfTransDetailsRecordsByIdAndDrCr(new BigInteger(t.getId() + ""), "D");
            for (TransactionsDetailEntity D : transDetails) {
                debitAmount = debitAmount.add(D.getTransactionAmount());
            }
            BigDecimal diffAmount = new BigDecimal(0);
            diffAmount = debitAmount.subtract(creditAmount);
            assertionHelper.verifyTwoAmounts(
                    "Verifying Difference Between Cr & Dr of Child Voucher of ID:: " + t.getId(), "0", diffAmount + "");
        }
    }
    
    @Then("verify TransAmt \"([^\"]*)\" TokenNo \"([^\"]*)\" and Remarks \"([^\"]*)\" on TD Closure Auth")
    public void verify_TransAmt_TokenNo_Remarks_ONFDAuth(String arg1, String arg2, String arg3) {
        assertionHelper.verifyTwoAmounts("Verifying Trans Amount on UI",
                seleniumHelper.getTextFromAnElement("CommonModeOfTransactionScreen_transactionAmt"), arg1);
        assertionHelper.verifyTwoTexts("Verify TokenNo on UI",
                seleniumHelper.getTextFromAnElement("CommonModeOfTransactionScreen_tokenNumber"), arg2);
        assertionHelper.verifyTwoTexts("Verify remarks on UI",
                seleniumHelper.getTextFromAnElement("CommonModeOfTransactionScreen_remark"), arg3);
    }
    
    @When("^user select accNo \"([^\"]*)\" on Fd Closure Auth$")
    public void user_select_accNo_on_Fd_Closure_Auth(String arg1) {
        dropDownHelper.SelectUsingVisibleText("FdClosureAuthScreen_accNumber", arg1);
        waitingHelper.sleep(2000);
    }
    
    @Then("Verify Lien Table status col \"([^\"]*)\" with depAcc \"([^\"]*)\" loanAcc \"([^\"]*)\"$")
    public void lienDetails(String arg1, String arg2, String arg3) {
        
        lien = lienMarkService.getLienDetailsByDepoAndLoanaccId(
                accountService.getAccountMasterDetailsByAccNo(arg2).getAccId(),
                accountService.getAccountMasterDetailsByAccNo(arg3).getAccId());
        if ("C".equalsIgnoreCase(arg1)) {
            assertionHelper.verifyTwoTexts("Verifying Status in Lien Table of DepAcc" + arg2 + " & loanAcc" + arg3,
                    lien.getStatus(), "C");
            if (lien.getReleaseDate() != null) {
                
                assertionHelper
                        .verifyTwoTexts("Verifying Relase Date in Lien Table of DepAcc" + arg2 + " & loanAcc" + arg3,
                                dateHelper.convertDbDateToDDMMYYYY(lien.getReleaseDate() + ""),
                                dateHelper.convertDbDateToDDMMYYYY(branchParametersService
                                        .getBnrachDetailsByBranchCode(property.getProperty("BranchCode"))
                                        .getCurrentDate() + ""));
            } else {
                reportHelper.writeLogInCaseOfFailInChildTest("Release Date is Null for " + arg2 + " & loanAcc" + arg3);
            }
            assertionHelper.verifyTwoTexts("Verifying Rel By in Lien Table of DepAcc" + arg2 + " & loanAcc" + arg3,
                    lien.getRelBy(), property.getProperty("LogInUser"));
            assertionHelper.verifyTwoTexts("Verifying Rel Auth By in Lien Table of DepAcc" + arg2 + " & loanAcc" + arg3,
                    lien.getRelAuthBy(), property.getProperty("LogInUser"));
        } else {
            String date = null;
            if (lien.getReleaseDate() != null) {
                
            } else {
                date = "NoDate";
            }
            assertionHelper.verifyTwoTexts("Verifying Status in Lien Table of DepAcc" + arg2 + " & loanAcc" + arg3,
                    lien.getStatus(), arg1);
            assertionHelper.verifyTwoTexts("Verifying Relase Date in Lien Table of DepAcc" + arg2 + " & loanAcc" + arg3,
                    date, "NoDate");
            
        }
    }
    
    @Then("verify TDSDEDUCTEDDETAILS table status \"([^\"]*)\" intAmt \"([^\"]*)\" tdsAmt \"([^\"]*)\" TransCode \"([^\"]*)\" where accNo \"([^\"]*)\"$")
    public void verifyTDSDEDUCTEDDETAILSTable(String arg1, String arg2, String arg3, String arg4, String arg5) {
        
        accMaster = accountService.getAccountMasterDetailsByAccNo(arg5);
        tdsDetails = tdsDeductedDetailsService.getTdsDeductedDetailsByAccId(accMaster.getAccId());
        assertionHelper.verifyTwoTexts("Verifying Staus in TDS Deducted Details of AccId: " + accMaster.getAccId(),
                tdsDetails.getStatus(), arg1);
        assertionHelper.verifyTwoTexts("Verifying TransCode in TDS Deducted Details of AccId: " + accMaster.getAccId(),
                tdsDetails.getTransCode(), arg4);
        
        assertionHelper.verifyTwoTexts("Verifying CustId in TDS Deducted Details of AccId: " + accMaster.getAccId(),
                tdsDetails.getCustId() + "", accMaster.getCustId() + "");
        Double tdsAmt = Double.parseDouble(arg3);
        BigDecimal bd = new BigDecimal(tdsAmt).setScale(2, RoundingMode.HALF_EVEN);
        
        assertionHelper.verifyTwoAmounts(
                "Verifying TDS Amount in TDS Deducted Details of AccId: " + accMaster.getAccId(),
                tdsDetails.getTdsAmt() + "", bd + "");
        
        assertionHelper.verifyTwoAmounts(
                "Verifying interest Amount in TDS Deducted Details of AccId: " + accMaster.getAccId(),
                tdsDetails.getNewInterest() + "", arg2);
        
    }
}
