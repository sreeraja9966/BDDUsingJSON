package com.sysnik.selenium.stepConfiguraiton;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.AccountMasterEntity;
import com.sysnik.selenium.entity.DisbursementScheduleEnity;
import com.sysnik.selenium.entity.LoanDisbursementEntity;
import com.sysnik.selenium.entity.LoanMasterEntity;
import com.sysnik.selenium.entity.RepaymentScheduleEntity;
import com.sysnik.selenium.entity.RepaymentScheduleTempEntity;
import com.sysnik.selenium.entity.TransactionEntity;
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

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;

public class LoanDisbursement extends TestBase {
    
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    FindElement findElement = AutomationObjectFactory.getFindElementInstance();
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
    private AccountMasterEntity accountMaster;
    private LoanMasterEntity loanMaster;
    private LoanDisbursementEntity loanDisb;
    private TransactionHeaderEntity transHeader;
    private TransactionsDetailEntity transDeatils;
    private TransactionEntity transactions;
    
    @Then("^setup Loan Disbursement Screen$")
    public void setup_Loan_Disbursement_Screen() throws Throwable {
        dbHelper.executeQuery(
                "UPDATE LOAN_DISB_SCHEDULE SET DISB_DATE='2020-02-23' WHERE ACC_ID IN (50656,50657,50658,50751,50752,50662,50691,50722,50756,50785,50663,50692,50723,50757,50786,50664,50693,50724,50758,50787,52656,52657,52659,52661,52665,52668,52669,52670,52671,52672,52656,52657,52659,52661,52665,52646,52648,52652,52655,52662)");
        dbHelper.executeQuery(
                "DELETE FROM LOAN_DISBURSEMENT WHERE ACC_ID IN (50656,50657,50658,50751,50752,50662,50691,50722,50756,50785,50663,50692,50723,50757,50786,50664,50693,50724,50758,50787,52656,52657,52659,52661,52665,52668,52669,52670,52671,52672,52656,52657,52659,52661,52665,52646,52648,52652,52655,52662)");
        dbHelper.executeQuery(
                "DELETE FROM REPAYMENT_SCHEDULE WHERE ACC_ID IN (50656,50657,50658,50751,50752,50662,50691,50722,50756,50785,50663,50692,50723,50757,50786,50664,50693,50724,50758,50787,52656,52657,52659,52661,52665,52668,52669,52670,52671,52672,52656,52657,52659,52661,52665,52646,52648,52652,52655,52662) ");
        dbHelper.executeQuery("UPDATE TOKEN_MASTER SET STATUS='A' WHERE STATUS='C' AND BRANCH_CODE='2101'");
        dbHelper.executeQuery(
                "DELETE FROM REPAYMENT_SCHEDULE_TEMP WHERE ACC_ID IN (50656,50657,50658,50751,50752,50662,50691,50722,50756,50785,50663,50692,50723,50757,50786,50664,50693,50724,50758,50787,52656,52657,52659,52661,52665,52668,52669,52670,52671,52672,52656,52657,52659,52661,52665,52646,52648,52652,52655,52662)");
        dbHelper.executeQuery(
                "UPDATE LOAN_DISB_SCHEDULE SET IS_DISBURESED='N' WHERE ENTERED_BY in (1,555) AND ACC_ID IN (50656,50657,50658,50751,50752,50662,50691,50722,50756,50785,50663,50692,50723,50757,50786,50664,50693,50724,50758,50787,52656,52657,52659,52661,52665,52668,52669,52670,52671,52672,52656,52657,52659,52661,52665,52646,52648,52652,52655,52662)");
        dbHelper.executeQuery(
                "UPDATE ACCOUNT_MASTER SET SHADOW_BAL='0', AVAILABLE_BAL='0', LEDGER_BAL='0',PROD_INSERT_YN='N' WHERE ACC_ID IN (50656,50657,50658,50751,50752,50662,50691,50722,50756,50785,50663,50692,50723,50757,50786,50664,50693,50724,50758,50787,52656,52657,52659,52661,52665,52668,52669,52670,52671,52672,52656,52657,52659,52661,52665,52646,52648,52652,52655,52662,52673,52674,52675,52676,52677)");
        dbHelper.executeQuery(
                "UPDATE LOAN_MASTER SET DISBURSED_AMT='0', FIRST_DISBURSEMENT_DT=NULL WHERE ACC_ID IN (50656,50657,50658,50751,50752,50662,50691,50722,50756,50785,50663,50692,50723,50757,50786,50664,50693,50724,50758,50787,52656,52657,52659,52661,52665,52668,52669,52670,52671,52672,52656,52657,52659,52661,52665,52646,52648,52652,52655,52662)");
        dbHelper.executeQuery(
                "UPDATE USERWISE_DENOM SET DENOM_QTY =1000 WHERE USER_ID =" + property.getProperty("LogInUser"));
        dbHelper.executeQuery("UPDATE TRANSACTION_HEADER SET STATUS='R' WHERE STATUS='P' AND OPERATOR_ID in (1,555)");
        
        dbHelper.executeQuery(
                "UPDATE ALL_LIMIT_MASTER SET LMT_VAL=100000000, UN_UTILISED_LIMIT=100000000, MAX_COUNT=1000, UN_UTILISED_COUNT=1000 WHERE TRANSCODE='CashWithAuth' AND VALUE IN ('101','2101')");
    }
    
    @Given("^user enters accNo \"([^\"]*)\" on Loan Disbursement Screen$")
    public void user_enters_accNo_on_Loan_Disbursement_Screen(String arg1) throws Throwable {
        seleniumHelper.enterText("LoanDisbursementScreen_accNumber", arg1);
        waitingHelper.sleep(4000);
    }
    
    @Then("^user verify firstPaymentDue \"([^\"]*)\" and Disbursement Date \"([^\"]*)\" and Disbursement Amount \"([^\"]*)\"$")
    public void user_verify_firstPaymentDue_and_Disbursement_Date_and_Disbursement_Amount(String arg1, String arg2,
            String arg3) throws Throwable {
        assertionHelper.verifyTextEquals("Verify First Payment Due On Ui ", "LoanDisbursementScreen_firstPaymentDue",
                arg1);
        assertionHelper.verifyTextEquals("Verify Disbursement Date On Ui ", "LoanDisbursementScreen_disbursementDate",
                arg2);
        assertionHelper.verifyTextEquals("Verify Disbursement Amount On Ui ", "LoanDisbursementScreen_disbursementAmt",
                arg3);
    }
    
    @Then("^user select margin Yes or No \"([^\"]*)\"$")
    public void user_select_margin_Yes_or_No(String arg1) throws Throwable {
        if ("Yes".equalsIgnoreCase(arg1)) {
            seleniumHelper.clickElement("LoanDisbursementScreen_marginFlagY");
        } else {
            seleniumHelper.clickElement("LoanDisbursementScreen_marginFlagN");
        }
    }
    
    @Then("^user select disbursement through Cash or Transfer \"([^\"]*)\"$")
    public void user_select_disbursement_through_Cash_or_Transfer(String arg1) throws Throwable {
        if ("Cash".equalsIgnoreCase(arg1)) {
            seleniumHelper.clickElement("LoanDisbursementScreen_disbursementModecash");
        } else {
            seleniumHelper.clickElement("LoanDisbursementScreen_disbursementModetransfer");
        }
    }
    
    @Then("^user enters transfer account number \"([^\"]*)\"$")
    public void user_enters_transfer_account_number(String arg1) throws Throwable {
        seleniumHelper.enterText("LoanDisbursementScreen_transferAccNumber", arg1);
    }
    
    @Then("^verify account holder name On Ui \"([^\"]*)\"$")
    public void verify_account_holder_name_On_Ui(String arg1) throws Throwable {
        assertionHelper.verifyTextEquals("Verify Transfer Account Holder Name On Ui  ",
                "LoanDisbursementScreen_transferAccHolderName", arg1);
    }
    
    @Then("^click on Add Record Button of Loan disb entry screen$")
    public void click_on_Add_Record_Button_of_Loan_disb_entry_screen() throws Throwable {
        seleniumHelper.clickElement("LoanDisbursementScreen_transferAddDetails");
    }
    
    @Then("^user verify transaction amount same as Disbursement Amount \"([^\"]*)\"$")
    public void user_verify_transaction_amount_same_as_Disbursement_Amount(String arg1) throws Throwable {
        assertionHelper.verifyTextEquals("Verify Transaction Amount On Ui ", "LoanDisbursementScreen_transAmount",
                arg1);
    }
    
    @Then("^user enters token number \"([^\"]*)\"$")
    public void user_enters_token_number(String arg1) throws Throwable {
        seleniumHelper.enterText("LoanDisbursementScreen_tokenNumber", arg1);
    }
    
    @Then("^user enters remark \"([^\"]*)\"$")
    public void user_enters_remark(String arg1) throws Throwable {
        seleniumHelper.enterText("LoanDisbursementScreen_remark", arg1);
    }
    
    @Then("^user click on Amortization Schedule button \"([^\"]*)\"$")
    public void user_click_on_Amortization_Schedule_button(String arg1) throws Throwable {
        seleniumHelper.clickElement("LoanDisbursementScreen_amortizationScheduleButton");
        waitingHelper.sleep(3000);
        commonMethodsForVerifications.verifyAndSubmitModel(arg1);
    }
    
    @Then("^user click on verify button of Loan Disbursement screen$")
    public void user_click_on_verify_button_of_Loan_Disbursement_screen() throws Throwable {
        seleniumHelper.clickElement("LoanDisbursementScreen_verifyVoucherButton");
    }
    
    @Then("^user click on confirm button$")
    public void user_click_on_confirm_button() throws Throwable {
        seleniumHelper.clickElement("LoanDisbursementScreen_confirmButton");
        waitingHelper.sleep(3000);
    }
    
    @Then("^verify LOAN_DISB_SCHEDULE table where accNo \"([^\"]*)\" and remark \"([^\"]*)\" and flow \"([^\"]*)\"$")
    public void verify_LOAN_DISB_SCHEDULE_table_where_accNo_and_remark_and_flow(String arg1, String arg2, String arg3)
            throws Throwable {
        List<DisbursementScheduleEnity> disbScheduleList = new ArrayList<>();
        disbScheduleList = disbursementScheduleService.getDisbScheduleData(arg1);
        if ("Entry".equalsIgnoreCase(arg3)) {
            if ("First".equalsIgnoreCase(arg2)) {
                assertionHelper.verifyTwoTexts("Verifying IS Disbursed Flag In Loan Disb Schedule Table ",
                        disbScheduleList.get(0).getIsDisbursed(), "Y");
            } else {
                assertionHelper.verifyTwoTexts("Verifying IS Disbursed Flag In Loan Disb Schedule Table ",
                        disbScheduleList.get(1).getIsDisbursed(), "Y");
            }
        } else {
            assertionHelper.verifyTwoTexts("Verifying IS Disbursed Flag In Loan Disb Schedule Table ",
                    disbScheduleList.get(1).getIsDisbursed(), "N");
        }
    }
    
    @Then("^verify LOAN_DISBURSEMENT table where accNo \"([^\"]*)\" and voucher Number \"([^\"]*)\" and remark \"([^\"]*)\" and Disbursement Date \"([^\"]*)\" and Disbursement Amount \"([^\"]*)\"$")
    public void verify_LOAN_DISBURSEMENT_table_where_accNo_and_voucher_Number_and_remark_and_Disbursement_Date_and_Disbursement_Amount(
            String arg1, String arg2, String arg3, String arg4, String arg5) throws Throwable {
        
        if ("First".equalsIgnoreCase(arg3)) {
            String VouchNum1 = cacheHelper.getCache(arg2, cacheData);
            BigInteger vNo1 = new BigInteger(VouchNum1);
            loanDisb = loanDisbursementService.getLoanDisbDatails(arg1, vNo1);
            assertionHelper.verifyTwoTexts("Validate Status in LOAN_DISBURSEMENT Table: ", loanDisb.getStatus(), "E");
            assertionHelper.verifyTwoTexts("Validate Disb. Date of LOAN_DISBURSEMENT Table: ", arg4 + " 00:00:00.0",
                    loanDisb.getDisbDate().toString());
            assertionHelper.verifyTwoTexts("Validate Disb. Amount of LOAN_DISBURSEMENT Table: ", arg5,
                    loanDisb.getDisbAmt().toString());
        } else {
            String VouchNum2 = cacheHelper.getCache(arg2, cacheData);
            BigInteger vNo2 = new BigInteger(VouchNum2);
            loanDisb = loanDisbursementService.getLoanDisbDatails(arg1, vNo2);
            assertionHelper.verifyTwoTexts("Validate Status in LOAN_DISBURSEMENT Table: ", loanDisb.getStatus(), "E");
            assertionHelper.verifyTwoTexts("Validate Disb. Date of LOAN_DISBURSEMENT Table: ", arg4 + " 00:00:00.0",
                    loanDisb.getDisbDate().toString());
            assertionHelper.verifyTwoTexts("Validate Disb. Amount of LOAN_DISBURSEMENT Table: ", arg5,
                    loanDisb.getDisbAmt().toString());
        }
    }
    
    @Then("^verify TOKEN_MASTER table where token number \"([^\"]*)\"$")
    public void verify_TOKEN_MASTER_table_where_token_number(String arg1) throws Throwable {
        int token = Integer.parseInt(arg1);
        String tokenStatus = tokenMasterService.getStatusByTokenNumber(token);
        assertionHelper.verifyTwoTexts("Verifying Token Status in Token Master Table ", tokenStatus, "C");
    }
    
    @Then("^verify ACCOUNT_MASTER table where accNo \"([^\"]*)\" and remark \"([^\"]*)\" and ShadowBal \"([^\"]*)\" and AvailableBal \"([^\"]*)\" and LedgerBal \"([^\"]*)\" and ProdInstYN \"([^\"]*)\"$")
    public void verify_ACCOUNT_MASTER_table_where_accNo_and_remark_and_ShadowBal_and_AvailableBal_and_LedgerBal_and_ProdInstYN(
            String arg1, String arg2, String arg3, String arg4, String arg5, String arg6) throws Throwable {
        
        if ("First".equalsIgnoreCase(arg2)) {
            accountMaster = accountService.getAccountMasterDetailsByAccNo(arg1);
            assertionHelper.verifyTwoTexts(
                    "Verifying Shadow Balance in ACCOUNT_MASTER Table " + accountMaster.getAccId() + "",
                    accountMaster.getShadowBal().toString(), arg3);
            assertionHelper.verifyTwoTexts("Verifying Available Balance in ACCOUNT_MASTER Table ",
                    accountMaster.getAvailableBal().toString(), arg4);
            assertionHelper.verifyTwoTexts("Verifying Ledger Balance in ACCOUNT_MASTER Table ",
                    accountMaster.getLedgerBal().toString(), arg5);
            
        } else {
            dbHelper.executeQuery(
                    "UPDATE ACCOUNT_MASTER SET AVAILABLE_BAL='0', LEDGER_BAL='0',PROD_INSERT_YN='N' WHERE ACC_ID IN (50656,50657,50658,50751,50752,50663,50692,50723,50757,50786,50664,50693,50724,50758,50787)");
            waitingHelper.sleep(3000);
            accountMaster = accountService.getAccountMasterDetailsByAccNo(arg1);
            assertionHelper.verifyTwoTexts("Verifying Shadow Balance in ACCOUNT_MASTER Table ",
                    accountMaster.getShadowBal().toString(), arg3);
            assertionHelper.verifyTwoTexts("Verifying Available Balance in ACCOUNT_MASTER Table ",
                    accountMaster.getAvailableBal().toString(), arg4);
            assertionHelper.verifyTwoTexts("Verifying Ledger Balance in ACCOUNT_MASTER Table ",
                    accountMaster.getLedgerBal().toString(), arg5);
        }
        assertionHelper.verifyTwoTexts("Verifying Product Insert Y/N Flag in ACCOUNT_MASTER Table ",
                accountMaster.getProdInsertYesNo(), arg6);
    }
    
    @Then("^verify REPAYMENT_SCHEDULE and REPAYMENT_SCHEDULE_TEMP table where accNo \"([^\"]*)\" and remark \"([^\"]*)\" and scenario \"([^\"]*)\"$")
    public void verify_REPAYMENT_SCHEDULE_and_REPAYMENT_SCHEDULE_TEMP_table_where_accNo_and_remark_and_scenario(
            String arg1, String arg2, String arg3) throws Throwable {
        List<RepaymentScheduleEntity> repaymentScheduleList = new ArrayList<RepaymentScheduleEntity>();
        repaymentScheduleList = repaymentScheduleService.getLoanRepaymentScheduleData(arg1);
        List<RepaymentScheduleTempEntity> repaymentScheduleTempList = new ArrayList<RepaymentScheduleTempEntity>();
        repaymentScheduleTempList = repaymentScheduleTempService.getLoanRepaymentScheduleTempData(arg1);
        
        if ("First".equalsIgnoreCase(arg2)) {
            for (RepaymentScheduleEntity repaySchedule : repaymentScheduleList) {
                
                cacheHelper.setCacheWithaString(arg3 + "_" + "paymentDate", repaySchedule.getPaymentDate() + "",
                        cacheData);
                cacheHelper.setCacheWithaString(arg3 + "_" + "installmentNum", repaySchedule.getInstallmentNo() + "",
                        cacheData);
                assertionHelper.verifyTwoTexts("Validate Installment Number in REPAYMENT_SCHEDULE Table: ",
                        repaySchedule.getInstallmentNo().toString(),
                        cacheHelper.getCache(arg3 + "_installmentNum", cacheData));
                assertionHelper.verifyTwoTexts(
                        "Validate ACC_ID of LOAN_DISBURSEMENT Table with REPAYMENT_SCHEDULE Table: ",
                        loanDisb.getAccId().toString(), repaySchedule.getAccId().toString());
                
                assertionHelper.verifyTwoTexts("Validate Installment Type in REPAYMENT_SCHEDULE Table: ",
                        repaySchedule.getInstallmentType(), "EMI");
                
                assertionHelper.verifyTwoTexts("Validate Installment Date in REPAYMENT_SCHEDULE Table: ",
                        repaySchedule.getPaymentDate().toString(),
                        cacheHelper.getCache(arg3 + "_paymentDate", cacheData));
                
                BigDecimal openingBal = repaySchedule.getOpeningBal();
                BigDecimal prinAmt = repaySchedule.getPrincipleAmt();
                BigDecimal clsAmt = openingBal.subtract(prinAmt);
                BigDecimal installAmt = repaySchedule.getInstallAmt();
                BigDecimal instAmt = installAmt.subtract(prinAmt);
                
                assertionHelper.verifyTwoTexts("Validate Interest Amount in REPAYMENT_SCHEDULE Table: ",
                        installAmt.subtract(prinAmt).toString(), instAmt.toString());
                
                assertionHelper.verifyTwoTexts("Validate Closing Balance in REPAYMENT_SCHEDULE Table: ",
                        openingBal.subtract(prinAmt).toString(), clsAmt.toString());
                
                assertionHelper.verifyTwoTexts("Validate Installment Amount in REPAYMENT_SCHEDULE Table: ",
                        prinAmt.add(instAmt).toString(), installAmt.toString());
            }
        } else {
            
            for (RepaymentScheduleTempEntity repayScheduleTemp : repaymentScheduleTempList) {
                
                cacheHelper.setCacheWithaString(arg3 + "_" + "paymentDate", repayScheduleTemp.getPaymentDate() + "",
                        cacheData);
                
                cacheHelper.setCacheWithaString(arg3 + "_" + "installmentNum",
                        repayScheduleTemp.getInstallmentNo() + "", cacheData);
                
                assertionHelper.verifyTwoTexts("Validate Installment Number in REPAYMENT_SCHEDULE_TEMP Table: ",
                        repayScheduleTemp.getInstallmentNo().toString(),
                        cacheHelper.getCache(arg3 + "_installmentNum", cacheData));
                
                assertionHelper.verifyTwoTexts(
                        "Validate Acc_Id of LOAN_DISBURSEMENT Table with REPAYMENT_SCHEDULE_TEMP Table: ",
                        loanDisb.getAccId().toString(), repayScheduleTemp.getAccId().toString());
                
                assertionHelper.verifyTwoTexts("Validate Installment Type in REPAYMENT_SCHEDULE_TEMP Table: ",
                        repayScheduleTemp.getInstallmentType(), "EMI");
                
                assertionHelper.verifyTwoTexts("Validate Installment Date in REPAYMENT_SCHEDULE Table: ",
                        repayScheduleTemp.getPaymentDate().toString(),
                        cacheHelper.getCache(arg3 + "_paymentDate", cacheData));
                
                BigDecimal openingBal = repayScheduleTemp.getOpeningBal();
                BigDecimal prinAmt = repayScheduleTemp.getPrincipleAmt();
                BigDecimal clsAmt = openingBal.subtract(prinAmt);
                BigDecimal installAmt = repayScheduleTemp.getInstallAmt();
                BigDecimal instAmt = installAmt.subtract(prinAmt);
                
                assertionHelper.verifyTwoTexts("Validate Interest Amount in REPAYMENT_SCHEDULE_TEMP Table: ",
                        installAmt.subtract(prinAmt).toString(), instAmt.toString());
                
                assertionHelper.verifyTwoTexts("Validate Closing Balance in REPAYMENT_SCHEDULE_TEMP Table: ",
                        openingBal.subtract(prinAmt).toString(), clsAmt.toString());
                
                assertionHelper.verifyTwoTexts("Validate Installment Amount in REPAYMENT_SCHEDULE_TEMP Table: ",
                        prinAmt.add(instAmt).toString(), installAmt.toString());
            }
        }
    }
    
    @Given("^user select accNo \"([^\"]*)\" from Loan Disbursement Auth Screen$")
    public void user_select_accNo_from_Loan_Disbursement_Auth_Screen(String arg1) throws Throwable {
        
        dropDownHelper.SelectUsingVisibleText("LoanDisbursementScreen_accNum", arg1);
    }
    
    @Given("^user select voucher number from dropdown \"([^\"]*)\"$")
    public void user_select_voucher_number_from_dropdown(String arg1) throws Throwable {
        String VouchNum = cacheHelper.getCache(arg1, cacheData);
        waitingHelper.sleep(3000);
        dropDownHelper.SelectUsingVisibleText("LoanDisbursementScreen_vouchNumber", VouchNum);
        
    }
    
    @Then("^user verify Disbursement Date \"([^\"]*)\" and Disbursement Amount \"([^\"]*)\" and margin \"([^\"]*)\" and paymentMode \"([^\"]*)\" and remark \"([^\"]*)\"$")
    public void user_verify_Disbursement_Date_and_Disbursement_Amount_and_margin_and_paymentMode_and_remark(String arg1,
            String arg2, String arg3, String arg4, String arg5) throws Throwable {
        
        waitingHelper.sleep(3000);
        assertionHelper.verifyTextEquals("Verify Disbursement Date On Ui ", "LoanDisbursementScreen_disbursementDate",
                arg1);
        assertionHelper.verifyTextEquals("Verify Disbursement Amount On Ui ",
                "LoanDisbursementScreen_disbursementAmount", arg2);
        assertionHelper.verifyTextEquals("Verify Margin On Ui ", "LoanDisbursementScreen_marginFlagN", arg3);
        if ("Cash".equalsIgnoreCase(arg4)) {
            assertionHelper.verifyTextEquals("Verify Payment Mode On Ui ", "LoanDisbursementScreen_disbPaymentModeCash",
                    arg4);
            assertionHelper.verifyTextEquals("Verify Remark On Ui ", "LoanDisbursementScreen_remark", arg5);
        } else {
            assertionHelper.verifyTextEquals("Verify Payment Mode On Ui ",
                    "LoanDisbursementScreen_disbursementModeTransfer", arg4);
            
        }
        
    }
    
    @Then("^verify LOAN_DISBURSEMENT table where accNo \"([^\"]*)\" and voucher Number \"([^\"]*)\" and remark \"([^\"]*)\" and flow \"([^\"]*)\"$")
    public void verify_LOAN_DISBURSEMENT_table_where_accNo_and_voucher_Number_and_remark_and_flow(String arg1,
            String arg2, String arg3, String arg4) throws Throwable {
        
        String vouchNo = cacheHelper.getCache(arg2, cacheData);
        BigInteger vNo = new BigInteger(vouchNo);
        loanDisb = loanDisbursementService.getLoanDisbDatails(arg1, vNo);
        if ("Auth".equalsIgnoreCase(arg4)) {
            assertionHelper.verifyTwoTexts("Validate Status in LOAN_DISBURSEMENT Table: ", loanDisb.getStatus(), "A");
        } else {
            assertionHelper.verifyTwoTexts("Validate Status in LOAN_DISBURSEMENT Table: ", loanDisb.getStatus(), "R");
        }
    }
    
    @Then("^verify TOKEN_MASTER table where token number \"([^\"]*)\" after auth$")
    public void verify_TOKEN_MASTER_table_where_token_number_after_auth(String arg1) throws Throwable {
        
        int token = Integer.parseInt(arg1);
        String tokenStatus = tokenMasterService.getStatusByTokenNumber(token);
        assertionHelper.verifyTwoTexts("Verifying " + token + " Token Status in Token Master Table ", tokenStatus, "A");
    }
    
    @Then("^verify LOAN_MASTER table where accNo \"([^\"]*)\" and remark \"([^\"]*)\" and disbDateDb \"([^\"]*)\" and disbAmountDb \"([^\"]*)\"$")
    public void verify_LOAN_MASTER_table_where_accNo_and_remark_and_disbDateDb_and_disbAmountDb(String arg1,
            String arg2, String arg3, String arg4) throws Throwable {
        
        loanMaster = loanMasterService.getCustLoanMasterDetailsByAccNumber(arg1);
        if ("First".equalsIgnoreCase(arg2)) {
            assertionHelper.verifyTwoTexts("Validate First Disbursement Date in LOAN_MASTER Table: ",
                    loanMaster.getFirstDisDt().toString(), arg3 + " 00:00:00.0");
            assertionHelper.verifyTwoTexts("Validate Disbursed Amount of LOAN_MASTER Table: ", arg4,
                    loanMaster.getDisAmt().toString());
        } else {
            assertionHelper.verifyTwoTexts("Validate Disbursed Amount of LOAN_MASTER Table: ", arg4,
                    loanMaster.getDisAmt().toString());
        }
    }
    
    @Then("^verify Transaction_Header table TRANS_AMT \"([^\"]*)\" where voucher num \"([^\"]*)\" and transType \"([^\"]*)\" and flow \"([^\"]*)\"$")
    public void verify_Transaction_Header_table_TRANS_AMT_where_voucher_num_and_transType_and_flow(String arg1,
            String arg2, String arg3, String arg4) throws Throwable {
        
        String vouchNum = cacheHelper.getCache(arg2, cacheData);
        transHeader = transactionHeaderService
                .getTransactionHeaderdetailsByVoucherNumberAndTransType(Long.valueOf(vouchNum), arg3);
        assertionHelper.verifyTwoAmounts("Verifying Tranasction amount ", transHeader.getTransactionAmount() + "",
                arg1);
        if ("Entry".equalsIgnoreCase(arg4)) {
            String status = "E";
            if ("D".equalsIgnoreCase(arg3)) {
                status = "N";
            }
            assertionHelper.verifyTwoTexts("Verifying Status in Header table of voucherNo :" + vouchNum,
                    transHeader.getStatus(), status);
            assertionHelper.verifyTwoTexts("Verifying IP address in Header Table of voucherNo :" + vouchNum,
                    transHeader.getOperatorIp(), getSystemIP());
            
        } else if ("Auth".equalsIgnoreCase(arg4)) {
            assertionHelper.verifyTwoTexts("Verifying Status in Header table of voucherNo :" + vouchNum,
                    transHeader.getStatus(), "A");
            assertionHelper.verifyTwoTexts("Verifying IP address in Header Table of voucherNo :" + vouchNum,
                    transHeader.getAuthorizeIp(), getSystemIP());
        } else if ("CashPaymentAuth".equalsIgnoreCase(arg4)) {
            assertionHelper.verifyTwoTexts("Verifying Status in Header table of voucherNo :" + vouchNum,
                    transHeader.getStatus(), "A");
            assertionHelper.verifyTwoTexts("Verifying IP address in Header Table of voucherNo :" + vouchNum,
                    transHeader.getAuthorizeIp(), getSystemIP());
        } else if ("CashPaymentReject".equalsIgnoreCase(arg4)) {
            assertionHelper.verifyTwoTexts("Verifying Status in Header table of voucherNo :" + vouchNum,
                    transHeader.getStatus(), "R");
            assertionHelper.verifyTwoTexts("Verifying IP address in Header Table of voucherNo :" + vouchNum,
                    transHeader.getAuthorizeIp(), getSystemIP());
        } else {
            assertionHelper.verifyTwoTexts("Verifying Status in Header table of voucherNo :" + vouchNum,
                    transHeader.getStatus(), "R");
            assertionHelper.verifyTwoTexts("Verifying IP address in Header Table of voucherNo :" + vouchNum,
                    transHeader.getAuthorizeIp(), getSystemIP());
        }
        
    }
    
    @Then("^verify ACCOUNT_MASTER table where accNo \"([^\"]*)\" and remark \"([^\"]*)\" and ShadowBal \"([^\"]*)\" and AvailableBal \"([^\"]*)\" and LedgerBal \"([^\"]*)\" and ProdInstYN \"([^\"]*)\" after Auth and flow \"([^\"]*)\"$")
    public void verify_ACCOUNT_MASTER_table_where_accNo_and_remark_and_ShadowBal_and_AvailableBal_and_LedgerBal_and_ProdInstYN_after_Auth_and_flow(
            String arg1, String arg2, String arg3, String arg4, String arg5, String arg6, String arg7) {
        if ("Auth".equalsIgnoreCase(arg7)) {
            if ("First".equalsIgnoreCase(arg2)) {
                accountMaster = accountService.getAccountMasterDetailsByAccNo(arg1);
                assertionHelper.verifyTwoTexts("Verifying Shadow Balance in ACCOUNT_MASTER Table ",
                        accountMaster.getShadowBal().toString(), arg3);
                assertionHelper.verifyTwoTexts("Verifying Available Balance in ACCOUNT_MASTER Table ",
                        accountMaster.getAvailableBal().toString(), arg4);
                assertionHelper.verifyTwoTexts("Verifying Ledger Balance in ACCOUNT_MASTER Table ",
                        accountMaster.getLedgerBal().toString(), arg5);
                
            } else {
                accountMaster = accountService.getAccountMasterDetailsByAccNo(arg1);
                assertionHelper.verifyTwoTexts("Verifying Shadow Balance in ACCOUNT_MASTER Table ",
                        accountMaster.getShadowBal().toString(), arg3);
                assertionHelper.verifyTwoTexts("Verifying Available Balance in ACCOUNT_MASTER Table ",
                        accountMaster.getAvailableBal().toString(), arg4);
                assertionHelper.verifyTwoTexts("Verifying Ledger Balance in ACCOUNT_MASTER Table ",
                        accountMaster.getLedgerBal().toString(), arg5);
            }
        }
        if ("Auth".equalsIgnoreCase(arg7)) {
            assertionHelper.verifyTwoTexts("Verifying Product Insert Y/N Flag in ACCOUNT_MASTER Table ",
                    accountMaster.getProdInsertYesNo(), arg6);
        } else {
            
            if ("First".equalsIgnoreCase(arg2)) {
                accountMaster = accountService.getAccountMasterDetailsByAccNo(arg1);
                assertionHelper.verifyTwoTexts("Verifying Shadow Balance in ACCOUNT_MASTER Table ",
                        accountMaster.getShadowBal().toString(), arg3);
                assertionHelper.verifyTwoTexts("Verifying Available Balance in ACCOUNT_MASTER Table ",
                        accountMaster.getAvailableBal().toString(), arg4);
                assertionHelper.verifyTwoTexts("Verifying Ledger Balance in ACCOUNT_MASTER Table ",
                        accountMaster.getLedgerBal().toString(), arg5);
                
            } else {
                accountMaster = accountService.getAccountMasterDetailsByAccNo(arg1);
                assertionHelper.verifyTwoTexts("Verifying Shadow Balance in ACCOUNT_MASTER Table ",
                        accountMaster.getShadowBal().toString(), arg3);
                assertionHelper.verifyTwoTexts("Verifying Available Balance in ACCOUNT_MASTER Table ",
                        accountMaster.getAvailableBal().toString(), arg4);
                assertionHelper.verifyTwoTexts("Verifying Ledger Balance in ACCOUNT_MASTER Table ",
                        accountMaster.getLedgerBal().toString(), arg5);
            }
            assertionHelper.verifyTwoTexts("Verifying Product Insert Y/N Flag in ACCOUNT_MASTER Table ",
                    accountMaster.getProdInsertYesNo(), arg6);
        }
        
    }
    
    @Then("^verify REPAYMENT_SCHEDULE table where accNo \"([^\"]*)\" and remark \"([^\"]*)\" and scenario \"([^\"]*)\"$")
    public void verify_REPAYMENT_SCHEDULE_table_where_accNo_and_remark_and_scenario(String arg1, String arg2,
            String arg3) throws Throwable {
        
        List<RepaymentScheduleEntity> repaymentScheduleList = new ArrayList<RepaymentScheduleEntity>();
        repaymentScheduleList = repaymentScheduleService.getLoanRepaymentScheduleData(arg1);
        
        if ("First".equalsIgnoreCase(arg2)) {
            
            assertionHelper.verifyTwoTexts("Validate Status in REPAYMENT_SCHEDULE Table After Auth: ",
                    repaymentScheduleList.get(0).getStatus(), "A");
        } else {
            assertionHelper.verifyTwoTexts("Validate Status in REPAYMENT_SCHEDULE Table After Auth: ",
                    repaymentScheduleList.get(0).getStatus(), "A");
            for (RepaymentScheduleEntity repaySchedule : repaymentScheduleList) {
                cacheHelper.setCacheWithaString(arg3 + "_" + "paymentDate", repaySchedule.getPaymentDate() + "",
                        cacheData);
                
                cacheHelper.setCacheWithaString(arg3 + "_" + "installmentNum", repaySchedule.getInstallmentNo() + "",
                        cacheData);
                
                assertionHelper.verifyTwoTexts("Validate Installment Number in REPAYMENT_SCHEDULE Table: ",
                        repaySchedule.getInstallmentNo().toString(),
                        cacheHelper.getCache(arg3 + "_installmentNum", cacheData));
                
                assertionHelper.verifyTwoTexts(
                        "Validate ACC_ID of LOAN_DISBURSEMENT Table with REPAYMENT_SCHEDULE Table: ",
                        loanDisb.getAccId().toString(), repaySchedule.getAccId().toString());
                
                assertionHelper.verifyTwoTexts("Validate Installment Type in REPAYMENT_SCHEDULE Table: ",
                        repaySchedule.getInstallmentType(), "EMI");
                
                assertionHelper.verifyTwoTexts("Validate Installment Date in REPAYMENT_SCHEDULE Table: ",
                        repaySchedule.getPaymentDate().toString(),
                        cacheHelper.getCache(arg3 + "_paymentDate", cacheData));
                
                BigDecimal openingBal = repaySchedule.getOpeningBal();
                BigDecimal prinAmt = repaySchedule.getPrincipleAmt();
                BigDecimal clsAmt = openingBal.subtract(prinAmt);
                BigDecimal installAmt = repaySchedule.getInstallAmt();
                BigDecimal instAmt = installAmt.subtract(prinAmt);
                
                assertionHelper.verifyTwoTexts("Validate Interest Amount in REPAYMENT_SCHEDULE Table: ",
                        installAmt.subtract(prinAmt).toString(), instAmt.toString());
                
                assertionHelper.verifyTwoTexts("Validate Closing Balance in REPAYMENT_SCHEDULE Table: ",
                        openingBal.subtract(prinAmt).toString(), clsAmt.toString());
                
                assertionHelper.verifyTwoTexts("Validate Installment Amount in REPAYMENT_SCHEDULE Table: ",
                        prinAmt.add(instAmt).toString(), installAmt.toString());
            }
        }
        
    }
    
    @Then("^verify Transactions table after Auth TRANS_AMT \"([^\"]*)\" accNo \"([^\"]*)\"  where voucher_num \"([^\"]*)\" and tranType \"([^\"]*)\" and flow \"([^\"]*)\"$")
    public void verify_Transactions_table_after_Auth_TRANS_AMT_accNo_where_voucher_num_and_tranType_and_flow(
            String arg1, String arg2, String arg3, String arg4, String arg5) throws Throwable {
        
        String vouchNo = cacheHelper.getCache(arg3, cacheData);
        long vNum = Long.parseLong(vouchNo);
        transHeader = transactionHeaderService.getTransactionHeaderdetailsByVoucherNumberAndTransType(vNum, arg4);
        transactions = transactionService.getTransactionInfoByvoucherNumberAndAccountNumber(vNum, arg2);
        if ("Auth".equalsIgnoreCase(arg5)) {
            assertionHelper.verifyTwoTexts("Verifying Status in Transactions Table After Auth of voucherNo: " + vouchNo,
                    transactions.getStatus(), "A");
        } else {
            assertionHelper.verifyTwoTexts(
                    "Verifying Status in Transactions Table After Rejection of voucherNo: " + vouchNo,
                    transactions.getStatus(), "R");
        }
        assertionHelper.verifyTwoTexts("Verifying Transaction Amount in Transactions Table of voucherNo: " + vouchNo,
                transactions.getTransactionAmount().toString(), arg1);
    }
    
    @Then("^user click on Reject button of Loan Disbursement screen$")
    public void user_click_on_Reject_button_of_Loan_Disbursement_screen() throws Throwable {
        
        seleniumHelper.clickElement("DDAcountAuthorizationScreen_rejectBtn");
    }
    
    @Then("^verify Transaction_Header table TRANS_AMT \"([^\"]*)\" where voucher num \"([^\"]*)\" and transType \"([^\"]*)\" and flow \"([^\"]*)\" with Denom Y$")
    public void verify_Transaction_Header_table_TRANS_AMT_where_voucher_num_and_transType_and_flow_with_Denom_Y(
            String arg1, String arg2, String arg3, String arg4) throws Throwable {
        
        String vouchNum = cacheHelper.getCache(arg2, cacheData);
        transHeader = transactionHeaderService
                .getTransactionHeaderdetailsByVoucherNumberAndTransType(Long.valueOf(vouchNum), arg3);
        assertionHelper.verifyTwoAmounts("Verifying Tranasction amount ", transHeader.getTransactionAmount() + "",
                arg1);
        
        assertionHelper.verifyTwoTexts("Verifying Status in Header table of voucherNo :" + vouchNum,
                transHeader.getStatus(), "P");
        assertionHelper.verifyTwoTexts("Verifying IP address in Header Table of voucherNo :" + vouchNum,
                transHeader.getOperatorIp(), getSystemIP());
    }
    
    @Given("^user select voucher radio button on Withdrawal Payment Entry Screen$")
    public void user_select_voucher_radio_button_on_Withdrawal_Payment_Entry_Screen() throws Throwable {
        
    }
    
    @Given("^user enters voucher num \"([^\"]*)\" on Withdrawal Payment Entry Screen$")
    public void user_enters_voucher_num_on_Withdrawal_Payment_Entry_Screen(String arg1) throws Throwable {
        seleniumHelper.clickElement("CashPaymentScreen_voucherRadio");
        String VouchNum = cacheHelper.getCache(arg1, cacheData);
        seleniumHelper.enterText("CashPaymentScreen_voucherInput", VouchNum);
        waitingHelper.sleep(3000);
        seleniumHelper.clickElement("CashPaymentScreen_getListButton");
        seleniumHelper.clickElement("//div[@class='table-responsive']/table/tbody/tr[1]/td[1]/a");
        commonMethodsForVerifications.verifyAndSubmitModel("Voucher details get successfully.");
    }
    
    @Given("^user click on Get All List button$")
    public void user_click_on_Get_All_List_button() throws Throwable {
        
    }
    
    @Given("^user click on voucher number path from table \"([^\"]*)\"$")
    public void user_click_on_voucher_number_path_from_table(String arg1) throws Throwable {
        
    }
    
    @Then("^user verify voucher number \"([^\"]*)\" & token Num \"([^\"]*)\" & Voucher Amount \"([^\"]*)\" on Ui$")
    public void user_verify_voucher_number_token_Num_Voucher_Amount_on_Ui(String arg1, String arg2, String arg3)
            throws Throwable {
        String vouchNum = cacheHelper.getCache(arg1, cacheData);
        assertionHelper.verifyTwoTexts("Verifying Voucher Number on Payment Screen ",
                seleniumHelper.getTextFromAnElement("CashPaymentScreen_voucherNumber"), vouchNum);
        assertionHelper.verifyTwoTexts("Verifying Token Number on Payment Screen ",
                seleniumHelper.getTextFromAnElement("CashPaymentScreen_tokenNumber"), arg2);
        assertionHelper.verifyTwoAmounts("Verifying Trans Amount on Payment Screen ",
                seleniumHelper.getTextFromAnElement("CashPaymentScreen_transAmt"), arg3);
    }
    
    @Then("^user click on Submit button of Withdrawal Payment Entry Screen$")
    public void user_click_on_Submit_button_of_Withdrawal_Payment_Entry_Screen() throws Throwable {
        seleniumHelper.clickElement("CashPaymentScreen_submitButton");
        waitingHelper.sleep(2500);
        commonMethodsForVerifications.verifyAndSubmitModel("Withdrawal payment successfully.");
    }
    
    @Then("^verify Transactions table after Auth TRANS_AMT \"([^\"]*)\" accNo \"([^\"]*)\"  where voucher_num \"([^\"]*)\" and tranType \"([^\"]*)\" and flow \"([^\"]*)\" with Denom Y$")
    public void verify_Transactions_table_after_Auth_TRANS_AMT_accNo_where_voucher_num_and_tranType_and_flow_with_Denom_Y(
            String arg1, String arg2, String arg3, String arg4, String arg5) throws Throwable {
        String vouchNo = cacheHelper.getCache(arg3, cacheData);
        long vNum = Long.parseLong(vouchNo);
        transHeader = transactionHeaderService.getTransactionHeaderdetailsByVoucherNumberAndTransType(vNum, arg4);
        transactions = transactionService.getTransactionInfoByvoucherNumberAndAccountNumber(vNum, arg2);
        if ("CashPaymentAuth".equalsIgnoreCase(arg5)) {
            assertionHelper.verifyTwoTexts("Verifying Status in Transactions Table After Auth of voucherNo: " + vouchNo,
                    transactions.getStatus(), "A");
        } else {
            assertionHelper.verifyTwoTexts(
                    "Verifying Status in Transactions Table After Rejection of voucherNo: " + vouchNo,
                    transactions.getStatus(), "R");
        }
        assertionHelper.verifyTwoTexts("Verifying Transaction Amount in Transactions Table of voucherNo: " + vouchNo,
                transactions.getTransactionAmount().toString(), arg1);
    }
    
    @Then("^verify LOAN_MASTER table where accNo \"([^\"]*)\" and remark \"([^\"]*)\" and disbDateDb \"([^\"]*)\" and disbAmountLoanMstDb \"([^\"]*)\" and flow \"([^\"]*)\"$")
    public void verify_LOAN_MASTER_table_where_accNo_and_remark_and_disbDateDb_and_disbAmountLoanMstDb_and_flow(
            String arg1, String arg2, String arg3, String arg4, String arg5) throws Throwable {
        loanMaster = loanMasterService.getCustLoanMasterDetailsByAccNumber(arg1);
        if ("CashPaymentReject".equalsIgnoreCase(arg5)) {
            assertionHelper.verifyTwoTexts("Validate Disbursed Amount of LOAN_MASTER Table: ", arg4,
                    loanMaster.getDisAmt().toString());
        } else {
            assertionHelper.verifyTwoTexts("Validate Disbursed Amount of LOAN_MASTER Table: ", arg4,
                    loanMaster.getDisAmt().toString());
        }
    }
    
    @Then("^user click on Reject button of Withdrawal Payment Entry Screen$")
    public void user_click_on_Reject_button_of_Withdrawal_Payment_Entry_Screen() throws Throwable {
        seleniumHelper.clickElement("CashPaymentScreen_rejectButton");
    }
    
    @Then("^user verify transaction amount same as Disbursement Amount \"([^\"]*)\" of transfer$")
    public void user_verify_transaction_amount_same_as_Disbursement_Amount_of_transfer(String arg1) throws Throwable {
        assertionHelper.verifyTextEquals("Verify Transfer Transaction Amount On Ui ",
                "LoanDisbursementScreen_transferTransactionAmt", arg1);
    }
    
    @Then("^user enters remark \"([^\"]*)\" of transfer$")
    public void user_enters_remark_of_transfer(String arg1) throws Throwable {
        seleniumHelper.enterText("LoanDisbursementScreen_transferRemark", arg1);
    }
    
    @Then("^verify ACCOUNT_MASTER table where transfer accNo \"([^\"]*)\" and remark \"([^\"]*)\" and TransferAccShadowBal \"([^\"]*)\" and AvailableBal \"([^\"]*)\" and LedgerBal \"([^\"]*)\" and ProdInstYN \"([^\"]*)\" of Transfer Account Number$")
    public void verify_ACCOUNT_MASTER_table_where_accNo_and_remark_and_ShadowBal_and_AvailableBal_and_LedgerBal_and_ProdInstYN_of_Transfer_Account_Number(
            String arg1, String arg2, String arg3, String arg4, String arg5, String arg6) throws Throwable {
        if ("First".equalsIgnoreCase(arg2)) {
            accountMaster = accountService.getAccountMasterDetailsByAccNo(arg1);
            assertionHelper.verifyTwoTexts(
                    "Verifying Transfer AccNo Shadow Balance in ACCOUNT_MASTER Table " + accountMaster.getAccId() + "",
                    accountMaster.getShadowBal().toString(), arg3);
            assertionHelper.verifyTwoTexts("Verifying Transfer AccNo Available Balance in ACCOUNT_MASTER Table ",
                    accountMaster.getAvailableBal().toString(), arg4);
            assertionHelper.verifyTwoTexts("Verifying Transfer AccNo Ledger Balance in ACCOUNT_MASTER Table ",
                    accountMaster.getLedgerBal().toString(), arg5);
            
        } else {
            
            accountMaster = accountService.getAccountMasterDetailsByAccNo(arg1);
            assertionHelper.verifyTwoTexts("Verifying Transfer AccNo Shadow Balance in ACCOUNT_MASTER Table ",
                    accountMaster.getShadowBal().toString(), arg3);
            assertionHelper.verifyTwoTexts("Verifying Transfer AccNo Available Balance in ACCOUNT_MASTER Table ",
                    accountMaster.getAvailableBal().toString(), arg4);
            assertionHelper.verifyTwoTexts("Verifying Transfer AccNo Ledger Balance in ACCOUNT_MASTER Table ",
                    accountMaster.getLedgerBal().toString(), arg5);
        }
        assertionHelper.verifyTwoTexts("Verifying Transfer AccNo Product Insert Y/N Flag in ACCOUNT_MASTER Table ",
                accountMaster.getProdInsertYesNo(), arg6);
    }
    
    @Then("^user verify  transfer account number \"([^\"]*)\" & account holder name \"([^\"]*)\" & amount \"([^\"]*)\" & remark \"([^\"]*)\" On Ui Of Auth Screen$")
    public void user_verify_transfer_account_number_account_holder_name_amount_remark_On_Ui_Of_Auth_Screen(String arg1,
            String arg2, String arg3, String arg4) throws Throwable {
        assertionHelper.verifyTextEquals("Verify Transfer Account Number On Ui ",
                "LoanDisbursementScreen_transferUiAccNo", arg1);
        assertionHelper.verifyTextEquals("Verify Transfer Account Holder Name On Ui ",
                "LoanDisbursementScreen_transferUiAccountHolderNmae", arg2);
        assertionHelper.verifyTextEquals("Verify Transfer Transaction Amount On Ui ",
                "LoanDisbursementScreen_transferUiAmount", arg3);
        assertionHelper.verifyTextEquals("Verify Transfer Remark On Ui ", "LoanDisbursementScreen_transferUiRemark",
                arg4);
    }
    
    @Then("^verify ACCOUNT_MASTER table where transfer accNo \"([^\"]*)\" and remark \"([^\"]*)\" and ShadowBal \"([^\"]*)\" and AvailableBal \"([^\"]*)\" and LedgerBal \"([^\"]*)\" and ProdInstYN \"([^\"]*)\" after Auth and flow \"([^\"]*)\"$")
    public void verify_ACCOUNT_MASTER_table_where_transfer_accNo_and_remark_and_ShadowBal_and_AvailableBal_and_LedgerBal_and_ProdInstYN_after_Auth_and_flow(
            String arg1, String arg2, String arg3, String arg4, String arg5, String arg6, String arg7)
            throws Throwable {
        if ("Auth".equalsIgnoreCase(arg7)) {
            if ("First".equalsIgnoreCase(arg2)) {
                accountMaster = accountService.getAccountMasterDetailsByAccNo(arg1);
                assertionHelper.verifyTwoTexts("Verifying Transfer AccNo Shadow Balance in ACCOUNT_MASTER Table ",
                        accountMaster.getShadowBal().toString(), arg3);
                assertionHelper.verifyTwoTexts("Verifying Transfer AccNo Available Balance in ACCOUNT_MASTER Table ",
                        accountMaster.getAvailableBal().toString(), arg4);
                assertionHelper.verifyTwoTexts("Verifying Transfer AccNo Ledger Balance in ACCOUNT_MASTER Table ",
                        accountMaster.getLedgerBal().toString(), arg5);
                
            } else {
                accountMaster = accountService.getAccountMasterDetailsByAccNo(arg1);
                assertionHelper.verifyTwoTexts("Verifying Transfer AccNo Shadow Balance in ACCOUNT_MASTER Table ",
                        accountMaster.getShadowBal().toString(), arg3);
                assertionHelper.verifyTwoTexts("Verifying Transfer AccNo Available Balance in ACCOUNT_MASTER Table ",
                        accountMaster.getAvailableBal().toString(), arg4);
                assertionHelper.verifyTwoTexts("Verifying Transfer AccNo Ledger Balance in ACCOUNT_MASTER Table ",
                        accountMaster.getLedgerBal().toString(), arg5);
            }
        }
        if ("Auth".equalsIgnoreCase(arg7)) {
            assertionHelper.verifyTwoTexts("Verifying Transfer AccNo Product Insert Y/N Flag in ACCOUNT_MASTER Table ",
                    accountMaster.getProdInsertYesNo(), arg6);
        } else {
            
            if ("First".equalsIgnoreCase(arg2)) {
                accountMaster = accountService.getAccountMasterDetailsByAccNo(arg1);
                assertionHelper.verifyTwoTexts("Verifying Transfer AccNo Shadow Balance in ACCOUNT_MASTER Table ",
                        accountMaster.getShadowBal().toString(), arg3);
                assertionHelper.verifyTwoTexts("Verifying Transfer AccNo Available Balance in ACCOUNT_MASTER Table ",
                        accountMaster.getAvailableBal().toString(), arg4);
                assertionHelper.verifyTwoTexts("Verifying Transfer AccNo Ledger Balance in ACCOUNT_MASTER Table ",
                        accountMaster.getLedgerBal().toString(), arg5);
                
            } else {
                accountMaster = accountService.getAccountMasterDetailsByAccNo(arg1);
                assertionHelper.verifyTwoTexts("Verifying Transfer AccNo Shadow Balance in ACCOUNT_MASTER Table ",
                        accountMaster.getShadowBal().toString(), arg3);
                assertionHelper.verifyTwoTexts("Verifying Transfer AccNo Available Balance in ACCOUNT_MASTER Table ",
                        accountMaster.getAvailableBal().toString(), arg4);
                assertionHelper.verifyTwoTexts("Verifying Transfer AccNo Ledger Balance in ACCOUNT_MASTER Table ",
                        accountMaster.getLedgerBal().toString(), arg5);
            }
            assertionHelper.verifyTwoTexts("Verifying Transfer AccNo Product Insert Y/N Flag in ACCOUNT_MASTER Table ",
                    accountMaster.getProdInsertYesNo(), arg6);
        }
    }
    
}