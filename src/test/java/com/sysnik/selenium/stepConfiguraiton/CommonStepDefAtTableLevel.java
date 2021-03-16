package com.sysnik.selenium.stepConfiguraiton;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.AccountMasterEntity;
import com.sysnik.selenium.entity.AllLimitMasterEntity;
import com.sysnik.selenium.entity.TokenMasterEntity;
import com.sysnik.selenium.entity.TransactionHeaderEntity;
import com.sysnik.selenium.entity.TransactionsDetailEntity;
import com.sysnik.selenium.entity.UserWiseDenomEntity;
import com.sysnik.selenium.fw.helper.AssertionHelper;
import com.sysnik.selenium.fw.helper.CacheHelper;
import com.sysnik.selenium.fw.helper.DateHelper;
import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.fw.testBase.TestBase;

import cucumber.api.java.en.Then;

public class CommonStepDefAtTableLevel extends TestBase {
    
    private AccountMasterEntity accMaster;
    private TransactionHeaderEntity transactionHeader;
    private List<TransactionsDetailEntity> transactionDetails;
    private List<UserWiseDenomEntity> userwiseDenom;
    private List<AllLimitMasterEntity> allLimitMaster;
    private TokenMasterEntity tokenMaster;
    AssertionHelper assertionHelper = AutomationObjectFactory.getAssertionHelperInstance();
    CacheHelper cacheHelper = AutomationObjectFactory.getCacheHelperInstance();
    DateHelper dateHelper = AutomationObjectFactory.getDateHelperInstance();
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    
    @Then("^verfiy account_master table col AllBalanceCol AvailableBal \"([^\"]*)\" and ShadowBal \"([^\"]*)\" where accNo \"([^\"]*)\"$")
    public void verfiy_account_master_table_col_AllBalancesCol_where_accNo(String arg1, String arg2, String arg3) {
        try {
            accMaster = accountService.getAccountMasterDetailsByAccNo(arg3);
            
            assertionHelper.verifyTwoAmounts("Verifying Available Balance of accNo: " + arg3,
                    accMaster.getAvailableBal() + "", arg1);
            assertionHelper.verifyTwoAmounts("Verifying ledger Balance of accNo: " + arg3,
                    accMaster.getLedgerBal() + "", arg1);
            String replay = null;
            
            try {
                arg2 = arg2.replace(",", "");
            } catch (Exception e) {
                e.printStackTrace();
            }
            
            BigDecimal shadowBal = new BigDecimal(arg2);
            /* shadowBal = shadowBal.negate(); */
            assertionHelper.verifyTwoAmounts("Verifying shadow Balance of accNo: " + arg3,
                    accMaster.getShadowBal() + "", shadowBal + "");
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
    }
    
    @Then("^verify Transaction_Header table TRANS_AMT \"([^\"]*)\"  where voucher_num \"([^\"]*)\" and tranType \"([^\"]*)\" with DenomY$")
    public void verify_Transaction_Header_table_TRANS_AMT_where_voucher_num_and_tranType_with_DenomY(String arg1,
            String arg2, String arg3) {
        
        String vouchNo = cacheHelper.getCache(arg2, cacheData);
        transactionHeader = transactionHeaderService
                .getTransactionHeaderdetailsByVoucherNumberAndTransType(Long.valueOf(vouchNo), arg3);
        
        assertionHelper.verifyTwoAmounts("Verifying Tranasction amount", transactionHeader.getTransactionAmount() + "",
                arg1);
        String status = "E";
        if ("D".equalsIgnoreCase(arg3)) {
            status = "N";
        }
        assertionHelper.verifyTwoTexts("Verifying Status in Header table of voucherNo :" + vouchNo,
                transactionHeader.getStatus(), status);
        assertionHelper.verifyTwoTexts("Verifying IP address in Header Table of voucherNo :" + vouchNo,
                transactionHeader.getOperatorIp(), getSystemIP());
        assertionHelper.verifyTwoAmounts("Verifying trans Amt in Header Table of voucherNo :" + vouchNo,
                transactionHeader.getTransactionAmount() + "", arg1);
    }
    
    @Then("^verify Transaction_Header table after Denom TRANS_AMT \"([^\"]*)\"  where voucher_num \"([^\"]*)\" and tranType \"([^\"]*)\" with DenomY$")
    public void verify_Transaction_Header_table_after_Denom_TRANS_AMT_where_voucher_num_and_tranType_with_DenomY(
            String arg1, String arg2, String arg3) {
        
        String vouchNo = cacheHelper.getCache(arg2, cacheData);
        transactionHeader = transactionHeaderService
                .getTransactionHeaderdetailsByVoucherNumberAndTransType(Long.valueOf(vouchNo), arg3);
        
        assertionHelper.verifyTwoAmounts("Verifying Tranasction amount", transactionHeader.getTransactionAmount() + "",
                arg1);
        String status = "E";
        if ("W".equalsIgnoreCase(arg3)) {
            status = "A";
        }
        assertionHelper.verifyTwoTexts("Verifying Status in Header table of voucherNo :" + vouchNo,
                transactionHeader.getStatus(), status);
        assertionHelper.verifyTwoTexts("Verifying IP address in Header Table of voucherNo :" + vouchNo,
                transactionHeader.getOperatorIp(), getSystemIP());
        assertionHelper.verifyTwoAmounts("Verifying trans Amt in Header Table of voucherNo :" + vouchNo,
                transactionHeader.getTransactionAmount() + "", arg1);
        
    }
    
    @Then("^verify Transaction_Header table after Auth TRANS_AMT \"([^\"]*)\"  where voucher_num \"([^\"]*)\" and tranType \"([^\"]*)\" with DenomY$")
    public void verify_Transaction_Header_table_after_Auth_TRANS_AMT_where_voucher_num_and_tranType_with_DenomY(
            String arg1, String arg2, String arg3) {
        
        String vouchNo = cacheHelper.getCache(arg2, cacheData);
        transactionHeader = transactionHeaderService
                .getTransactionHeaderdetailsByVoucherNumberAndTransType(Long.valueOf(vouchNo), arg3);
        
        assertionHelper.verifyTwoAmounts("Verifying Tranasction amount", transactionHeader.getTransactionAmount() + "",
                arg1);
        String status = "A";
        if ("W".equalsIgnoreCase(arg3)) {
            status = "P";
        }
        assertionHelper.verifyTwoTexts("Verifying Status in Header table of voucherNo :" + vouchNo,
                transactionHeader.getStatus(), status);
        assertionHelper.verifyTwoTexts("Verifying Auth IP address in Header Table of voucherNo :" + vouchNo,
                transactionHeader.getAuthorizeIp(), getSystemIP());
        assertionHelper.verifyTwoAmounts("Verifying trans Amt in Header Table of voucherNo :" + vouchNo,
                transactionHeader.getTransactionAmount() + "", arg1);
        
    }
    
    @Then("^verify Transaction_Header table after Rejection TRANS_AMT \"([^\"]*)\"  where voucher_num \"([^\"]*)\" and tranType \"([^\"]*)\" with DenomY$")
    public void verify_Transaction_Header_table_after_Reject_TRANS_AMT_where_voucher_num_and_tranType_with_DenomY(
            String arg1, String arg2, String arg3) {
        
        String vouchNo = cacheHelper.getCache(arg2, cacheData);
        transactionHeader = transactionHeaderService
                .getTransactionHeaderdetailsByVoucherNumberAndTransType(Long.valueOf(vouchNo), arg3);
        
        assertionHelper.verifyTwoAmounts("Verifying Tranasction amount", transactionHeader.getTransactionAmount() + "",
                arg1);
        String status = "R";
        
        assertionHelper.verifyTwoTexts("Verifying Status in Header table of voucherNo :" + vouchNo,
                transactionHeader.getStatus(), status);
        assertionHelper.verifyTwoTexts("Verifying Auth IP address in Header Table of voucherNo :" + vouchNo,
                transactionHeader.getAuthorizeIp(), getSystemIP());
        assertionHelper.verifyTwoAmounts("Verifying trans Amt in Header Table of voucherNo :" + vouchNo,
                transactionHeader.getTransactionAmount() + "", arg1);
        
    }
    
    @Then("^verify Transaction_Header table TRANS_AMT \"([^\"]*)\"  where voucher_num \"([^\"]*)\" and tranType \"([^\"]*)\" with DenomN$")
    public void verify_Transaction_Header_table_TRANS_AMT_where_voucher_num_and_tranType_with_DenomN(String arg1,
            String arg2, String arg3) {
        
        String vouchNo = cacheHelper.getCache(arg2, cacheData);
        transactionHeader = transactionHeaderService
                .getTransactionHeaderdetailsByVoucherNumberAndTransType(Long.valueOf(vouchNo), arg3);
        
        assertionHelper.verifyTwoAmounts("Verifying Tranasction amount", transactionHeader.getTransactionAmount() + "",
                arg1);
        String status = "E";
        
        assertionHelper.verifyTwoTexts("Verifying Status in Header table of voucherNo :" + vouchNo,
                transactionHeader.getStatus(), status);
        assertionHelper.verifyTwoTexts("Verifying IP address in Header Table of voucherNo :" + vouchNo,
                transactionHeader.getOperatorIp(), getSystemIP());
        assertionHelper.verifyTwoAmounts("Verifying trans Amt in Header Table of voucherNo :" + vouchNo,
                transactionHeader.getTransactionAmount() + "", arg1);
        
    }
    
    @Then("^verify Transaction_Header table after Auth TRANS_AMT \"([^\"]*)\"  where voucher_num \"([^\"]*)\" and tranType \"([^\"]*)\" with DenomN$")
    public void verify_Transaction_Header_table_After_auth_TRANS_AMT_where_voucher_num_and_tranType_with_DenomN(
            String arg1, String arg2, String arg3) {
        
        String vouchNo = cacheHelper.getCache(arg2, cacheData);
        transactionHeader = transactionHeaderService
                .getTransactionHeaderdetailsByVoucherNumberAndTransType(Long.valueOf(vouchNo), arg3);
        
        assertionHelper.verifyTwoAmounts("Verifying Tranasction amount", transactionHeader.getTransactionAmount() + "",
                arg1);
        String status = "A";
        
        assertionHelper.verifyTwoTexts("Verifying Status in Header table of voucherNo :" + vouchNo,
                transactionHeader.getStatus(), status);
        assertionHelper.verifyTwoTexts("Verifying Auth IP address in Header Table of voucherNo :" + vouchNo,
                transactionHeader.getAuthorizeIp(), getSystemIP());
        assertionHelper.verifyTwoAmounts("Verifying trans Amt in Header Table of voucherNo :" + vouchNo,
                transactionHeader.getTransactionAmount() + "", arg1);
        
    }
    
    @Then("^verify Transaction_Header table Rejection TRANS_AMT \"([^\"]*)\"  where voucher_num \"([^\"]*)\" and tranType \"([^\"]*)\" with DenomN$")
    public void verify_Transaction_Header_table_Reject_auth_TRANS_AMT_where_voucher_num_and_tranType_with_DenomN(
            String arg1, String arg2, String arg3) {
        
        String vouchNo = cacheHelper.getCache(arg2, cacheData);
        transactionHeader = transactionHeaderService
                .getTransactionHeaderdetailsByVoucherNumberAndTransType(Long.valueOf(vouchNo), arg3);
        
        assertionHelper.verifyTwoAmounts("Verifying Tranasction amount", transactionHeader.getTransactionAmount() + "",
                arg1);
        String status = "R";
        
        assertionHelper.verifyTwoTexts("Verifying Status in Header table of voucherNo :" + vouchNo,
                transactionHeader.getStatus(), status);
        assertionHelper.verifyTwoTexts("Verifying Auth IP address in Header Table of voucherNo :" + vouchNo,
                transactionHeader.getAuthorizeIp(), getSystemIP());
        assertionHelper.verifyTwoAmounts("Verifying trans Amt in Header Table of voucherNo :" + vouchNo,
                transactionHeader.getTransactionAmount() + "", arg1);
        
    }
    
    @Then("^verify Transaction_Header table child voucher col TRANS_AMT \"([^\"]*)\" where Parentvoucher_num \"([^\"]*)\"$")
    public void verify_Transaction_Header_table_child_voucher_col_TRANS_AMT_where_Parentvoucher_num(String arg1,
            String arg2) {
        String vouchNo = cacheHelper.getCache(arg2, cacheData);
        transactionHeader = transactionHeaderService.getTransactionDetailsUsingParentVoucher(Long.valueOf(vouchNo));
        assertionHelper.verifyTwoAmounts("Verifying transaction amount of childVoucher of vouchNo :" + vouchNo,
                transactionHeader.getTransactionAmount() + "", arg1);
        assertionHelper.verifyTwoTexts("Verifying Status in Header table of childVoucher of voucherNo :" + vouchNo,
                transactionHeader.getStatus(), "E");
        assertionHelper.verifyTwoTexts("Verifying IP address in Header Table of childVoucher of voucherNo :" + vouchNo,
                transactionHeader.getOperatorIp(), getSystemIP());
        
    }
    
    @Then("^verify Transaction_Details table TRANS_AMT \"([^\"]*)\" accNo \"([^\"]*)\"  where voucher_num \"([^\"]*)\" and tranType \"([^\"]*)\"$")
    public void verify_Transaction_Details_table_TRANS_AMT_accNo_where_voucher_num_and_tranType(String arg1,
            String arg2, String arg3, String arg4) {
        String vouchNo = cacheHelper.getCache(arg3, cacheData);
        transactionHeader = transactionHeaderService
                .getTransactionHeaderdetailsByVoucherNumberAndTransType(Long.valueOf(vouchNo), arg4);
        
        transactionDetails = transactionsDetailService
                .getListOfTransDetailsRecordsById(new BigInteger(transactionHeader.getId() + ""));
        assertionHelper.verifyTwoAmounts("Verfiying transaction amt in details table of vouchNo :" + vouchNo,
                transactionDetails.get(0).getTransactionAmount() + "", arg1);
        
    }
    
    @Then("^verify Transaction_Details table child voucher CreditAmount with Debit amount where child Voucher is \"([^\"]*)\"$")
    public void verify_Transaction_Details_table_child_voucher_CreditAmount_with_Debit_amount(String arg1) {
        String vouchNo = cacheHelper.getCache(arg1, cacheData);
        transactionHeader = transactionHeaderService.getTransactionDetailsUsingParentVoucher(Long.valueOf(vouchNo));
        
        transactionDetails = transactionsDetailService
                .getListOfTransDetailsRecordsById(new BigInteger(transactionHeader.getId() + ""));
        BigDecimal cr = new BigDecimal("0");
        BigDecimal dr = new BigDecimal("0");
        for (TransactionsDetailEntity td : transactionDetails) {
            if ("C".equalsIgnoreCase(td.getDrCr())) {
                cr = cr.add(td.getTransactionAmount());
            } else {
                dr = dr.add(td.getTransactionAmount());
            }
        }
        assertionHelper.verifyTwoAmounts("Verfiying CR & DR of Child voucher in details table of vouchNo :" + vouchNo,
                cr + "", dr + "");
    }
    
    @Then("^Verify UserwiseDenom table with \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\"$")
    public void verify_UserwiseDenom_table_with(String arg1, String arg2, String arg3, String arg4, String arg5,
            String arg6, String arg7, String arg8, String arg9, String arg10, String arg11, String arg12, String arg13,
            String arg14, String arg15, String arg16, String arg17, String arg18) throws Throwable {
        List<Integer> denomQty = new ArrayList<Integer>();
        List<BigDecimal> denomRate = new ArrayList<BigDecimal>();
        denomQty = userWiseDenomService.getDenomQtyByBankCodeAnduserId(property.getProperty("BankCode"),
                property.getProperty("LogInUser"));
        denomRate = userWiseDenomService.getDenomRateByBankCodeAnduserId(property.getProperty("BankCode"),
                property.getProperty("LogInUser"));
        
        if (Integer.parseInt(arg1) > Integer.parseInt(arg10)) {
            assertionHelper.verifyTwoAmounts("Verifying Denom Qty of 2000.00",
                    (new BigDecimal("1000").add(new BigDecimal(arg1))) + "", denomQty.get(0) + "");
        } else {
            assertionHelper.verifyTwoAmounts("Verifying Denom Qty of 2000.00",
                    (new BigDecimal("1000").subtract(new BigDecimal(arg10))) + "", denomQty.get(0) + "");
        }
        if (Integer.parseInt(arg2) > Integer.parseInt(arg11)) {
            assertionHelper.verifyTwoAmounts("Verifying Denom Qty of 500.00",
                    (new BigDecimal("1000").add(new BigDecimal(arg2))) + "", denomQty.get(1) + "");
        } else {
            assertionHelper.verifyTwoAmounts("Verifying Denom Qty of 500.00",
                    (new BigDecimal("1000").subtract(new BigDecimal(arg11))) + "", denomQty.get(1) + "");
        }
        if (Integer.parseInt(arg3) > Integer.parseInt(arg12)) {
            assertionHelper.verifyTwoAmounts("Verifying Denom Qty of 200.00",
                    (new BigDecimal("1000").add(new BigDecimal(arg3))) + "", denomQty.get(2) + "");
        } else {
            assertionHelper.verifyTwoAmounts("Verifying Denom Qty of 200.00",
                    (new BigDecimal("1000").subtract(new BigDecimal(arg12))) + "", denomQty.get(2) + "");
        }
        
        if (Integer.parseInt(arg4) > Integer.parseInt(arg13)) {
            assertionHelper.verifyTwoAmounts("Verifying Denom Qty of 100.00",
                    (new BigDecimal("1000").add(new BigDecimal(arg3))) + "", denomQty.get(3) + "");
        } else {
            assertionHelper.verifyTwoAmounts("Verifying Denom Qty of 100.00",
                    (new BigDecimal("1000").subtract(new BigDecimal(arg13))) + "", denomQty.get(3) + "");
        }
        if (Integer.parseInt(arg5) > Integer.parseInt(arg14)) {
            assertionHelper.verifyTwoAmounts("Verifying Denom Qty of 50.00",
                    (new BigDecimal("1000").add(new BigDecimal(arg5))) + "", denomQty.get(4) + "");
        } else {
            assertionHelper.verifyTwoAmounts("Verifying Denom Qty of 50.00",
                    (new BigDecimal("1000").subtract(new BigDecimal(arg14))) + "", denomQty.get(4) + "");
        }
        if (Integer.parseInt(arg6) > Integer.parseInt(arg15)) {
            assertionHelper.verifyTwoAmounts("Verifying Denom Qty of 20.00",
                    (new BigDecimal("1000").add(new BigDecimal(arg6))) + "", denomQty.get(5) + "");
        } else {
            assertionHelper.verifyTwoAmounts("Verifying Denom Qty of 20.00",
                    (new BigDecimal("1000").subtract(new BigDecimal(arg15))) + "", denomQty.get(5) + "");
        }
        if (Integer.parseInt(arg7) > Integer.parseInt(arg16)) {
            assertionHelper.verifyTwoAmounts("Verifying Denom Qty of 10.00",
                    (new BigDecimal("1000").add(new BigDecimal(arg7))) + "", denomQty.get(6) + "");
        } else {
            assertionHelper.verifyTwoAmounts("Verifying Denom Qty of 10.00",
                    (new BigDecimal("1000").subtract(new BigDecimal(arg16))) + "", denomQty.get(6) + "");
        }
        if (Integer.parseInt(arg8) > Integer.parseInt(arg17)) {
            assertionHelper.verifyTwoAmounts("Verifying Denom Qty of 1.00",
                    (new BigDecimal("1000").add(new BigDecimal(arg8))) + "", denomQty.get(7) + "");
        } else {
            assertionHelper.verifyTwoAmounts("Verifying Denom Qty of 1.00",
                    (new BigDecimal("1000").subtract(new BigDecimal(arg17))) + "", denomQty.get(7) + "");
        }
        if (Integer.parseInt(arg9) > Integer.parseInt(arg18)) {
            assertionHelper.verifyTwoAmounts("Verifying Denom Qty of Paisa",
                    (new BigDecimal("1000").add(new BigDecimal(arg9))) + "", denomQty.get(8) + "");
        } else {
            assertionHelper.verifyTwoAmounts("Verifying Denom Qty of Paisa",
                    (new BigDecimal("1000").subtract(new BigDecimal(arg18))) + "", denomQty.get(8) + "");
        }
        
    }
    
    @Then("^Verify UserwiseDenom table with \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" while Reject$")
    public void verify_UserwiseDenom_table_with_reject(String arg1, String arg2, String arg3, String arg4, String arg5,
            String arg6, String arg7, String arg8, String arg9, String arg10, String arg11, String arg12, String arg13,
            String arg14, String arg15, String arg16, String arg17, String arg18) throws Throwable {
        List<Integer> denomQty = new ArrayList<Integer>();
        List<BigDecimal> denomRate = new ArrayList<BigDecimal>();
        denomQty = userWiseDenomService.getDenomQtyByBankCodeAnduserId(property.getProperty("BankCode"),
                property.getProperty("LogInUser"));
        denomRate = userWiseDenomService.getDenomRateByBankCodeAnduserId(property.getProperty("BankCode"),
                property.getProperty("LogInUser"));
        int i = 0;
        for (Integer denom : denomQty) {
            assertionHelper.verifyTwoAmounts("Verifying Denom Qty of " + denomRate.get(i), "1000", denom + "");
            i++;
        }
    }
    
    @Then("^verify AllLimitMaster with \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\"$")
    public void verify_AllLimitMaster_with(String arg1, String arg2, String arg3) throws Throwable {
        allLimitMaster = allLimitMasterService.getAllLimitMasterDetailsByTypeAndTransCode(arg2, arg1);
        for (AllLimitMasterEntity all : allLimitMaster) {
            if ("C".equalsIgnoreCase(all.getCumOrperInst())) {
                assertionHelper.verifyTwoAmounts("Verifiyig Un_Utilised Count of All Limit Master of "
                        + all.getLimitType() + " and Transcode " + arg2, all.getUnUtilisedCount() + "", "99");
                assertionHelper.verifyTwoAmounts(
                        "Verifiyig Un_Utilised Limit of All Limit Master of " + all.getLimitType() + " and Transcode "
                                + arg2,
                        
                        all.getUnUtilisedLimit() + "",
                        (new BigDecimal(arg3)).subtract(new BigDecimal("10000000")).abs() + "");
            }
        }
    }
    
    @Then("^verify TOKENMASTER table status col \"([^\"]*)\" where \"([^\"]*)\"$")
    public void verify_TOKENMASTER_table_status_col(String arg1, String arg2) throws Throwable {
        String tokenStatus = null;
        tokenStatus = tokenMasterService.getStatusByTokenNumber(Integer.parseInt(arg2));
        assertionHelper.verifyTwoTexts("Verifying Status in TOKENMASTER with token No:" + arg2, tokenStatus, arg1);
    }
    
    @Then("verify AccountMaster table status \"([^\"]*)\" column and closedDate where AccNo \"([^\"]*)\"$")
    public void verify_AccountMaster_AfterClosing(String arg1, String arg2) {
        accMaster = accountService.getAccountMasterDetailsByAccNo(arg2);
        if ("C".equalsIgnoreCase(arg1)) {
            if (accMaster.getCloseDt() != null) {
                assertionHelper.verifyTwoTexts("Verifying ClosingDate after closing in AccMaster with AccNo:" + arg2,
                        dateHelper.convertDbDateToDDMMYYYY(accMaster.getCloseDt() + ""),
                        dateHelper.convertDbDateToDDMMYYYY(
                                branchParametersService.getBnrachDetailsByBranchCode(property.getProperty("BranchCode"))
                                        .getCurrentDate() + ""));
            } else {
                reportHelper.writeLogInCaseOfFailInChildTest("Closing Date is null for AccNo:" + arg2);
                
            }
            assertionHelper.verifyTwoTexts("Verifying status after closing in AccMaster with AccNo:" + arg2,
                    accMaster.getStatus(), "C");
            
        } else {
            String date = null;
            if (accMaster.getCloseDt() != null) {
                
            } else {
                date = "NoDate";
            }
            assertionHelper.verifyTwoTexts("Verifying ClosingDate after closing in AccMaster with AccNo:" + arg2, date,
                    "NoDate");
            assertionHelper.verifyTwoTexts("Verifying status after closing in AccMaster with AccNo:" + arg2,
                    accMaster.getStatus(), "A");
            
        }
        
    }
}
