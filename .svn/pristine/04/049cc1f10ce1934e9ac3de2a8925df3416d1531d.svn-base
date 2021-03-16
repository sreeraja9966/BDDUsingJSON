package com.sysnik.selenium.stepConfiguraiton;

import java.math.BigDecimal;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.AccountMasterEntity;
import com.sysnik.selenium.entity.LoanMasterEntity;
import com.sysnik.selenium.fw.helper.AssertionHelper;
import com.sysnik.selenium.fw.helper.DbHelper;
import com.sysnik.selenium.fw.testBase.TestBase;

import cucumber.api.java.en.Then;

public class LoanRecoveryStepDef extends TestBase {
    private LoanMasterEntity loanMaster;
    private AccountMasterEntity accMaster;
    AssertionHelper assertionHelper = AutomationObjectFactory.getAssertionHelperInstance();
    DbHelper dbHelper = AutomationObjectFactory.getDbHelperInstance();
    
    @Then("^setup LoanRecoveryCashDeposit Screen$")
    public void setup_LoanRecoveryCashDeposit_Screen() throws Throwable {
        
        dbHelper.executeQuery(
                "update account_master SET SHADOW_BAL =0, LEDGER_BAL =-500000, AVAILABLE_BAL =-500000 WHERE ACC_NO IN ('101210104100000244','101210104100000245','101210104000000059','101210104200000069','101210104100000243','101210104200000070','101210104200000071','101210104000000060','101210104000000061')");
        dbHelper.executeQuery(
                "UPDATE LOAN_MASTER SET INT_DUE =200, INT_CAPITALISED =500 WHERE ACC_ID in (52544,52545,52541)");
        dbHelper.executeQuery(
                "UPDATE LOAN_MASTER SET INT_DUE =200, INT_RECEIVABLE =500 WHERE ACC_ID in (52546,52547,52542)");
        dbHelper.executeQuery("UPDATE LOAN_MASTER SET INT_DUE =500 WHERE ACC_ID in(52548,52549,52543)");
        
    }
    
    @Then("^loan_master table after loan recovery by using intType \"([^\"]*)\" and accNo \"([^\"]*)\" and trasAmt \"([^\"]*)\"$")
    public void verify_loasn_master_after_loan_recovery(String arg1, String arg2, String arg3) {
        accMaster = accountService.getAccountMasterDetailsByAccNo(arg2);
        loanMaster = loanMasterService.getLoanMasterDetailsByAccId(accMaster.getAccId());
        BigDecimal transactionAmount = new BigDecimal(arg3);
        BigDecimal pendingAmount = loanMaster.getIntCapitalised().add(loanMaster.getIntRecv())
                .add(loanMaster.getIntDue()).add(accMaster.getAvailableBal().abs());
        log.info(pendingAmount);
        if (pendingAmount.compareTo(new BigDecimal(arg3)) == 0) {
            if ("Captilised".equalsIgnoreCase(arg1)) {
                assertionHelper.verifyTwoAmounts("Verfiying available balnce in accMaster of accNo:" + arg2,
                        accMaster.getAvailableBal() + "", "0");
                assertionHelper.verifyTwoAmounts("Verfiying Capitilised amount in loanMaster of accNo:" + arg2,
                        loanMaster.getIntCapitalised() + "", "0");
                assertionHelper.verifyTwoAmounts("Verfiying IntDue amount in loanMaster of accNo:" + arg2,
                        loanMaster.getIntDue() + "", "0");
                
            } else if ("Recivable".equalsIgnoreCase(arg1)) {
                assertionHelper.verifyTwoAmounts("Verfiying available balnce in accMaster of accNo:" + arg2,
                        accMaster.getAvailableBal() + "", "0");
                assertionHelper.verifyTwoAmounts("Verfiying Receviable amount in loanMaster of accNo:" + arg2,
                        loanMaster.getIntRecv() + "", "0");
                assertionHelper.verifyTwoAmounts("Verfiying IntDue amount in loanMaster of accNo:" + arg2,
                        loanMaster.getIntDue() + "", "0");
            } else if ("AsonWhen".equalsIgnoreCase(arg1)) {
                assertionHelper.verifyTwoAmounts("Verfiying available balnce in accMaster of accNo:" + arg2,
                        accMaster.getAvailableBal() + "", "0");
                
                assertionHelper.verifyTwoAmounts("Verfiying IntDue amount in loanMaster of accNo:" + arg2,
                        loanMaster.getIntDue() + "", "0");
            }
        } else if (pendingAmount.compareTo(new BigDecimal(arg3)) == 1) {
            BigDecimal intAmount = new BigDecimal("500");
            
            if (intAmount.compareTo(new BigDecimal(arg3)) == 1 || intAmount.compareTo(new BigDecimal(arg3)) == 0) {
                if ("Captilised".equalsIgnoreCase(arg1)) {
                    assertionHelper.verifyTwoAmounts("Verfiying available balnce in accMaster of accNo:" + arg2,
                            accMaster.getAvailableBal() + "", "-499500");
                    assertionHelper.verifyTwoAmounts("Verfiying Capitilised amount in loanMaster of accNo:" + arg2,
                            loanMaster.getIntCapitalised() + "", "0");
                    assertionHelper.verifyTwoAmounts("Verfiying IntDue amount in loanMaster of accNo:" + arg2,
                            loanMaster.getIntDue() + "", "200");
                    
                } else if ("Recivable".equalsIgnoreCase(arg1)) {
                    assertionHelper.verifyTwoAmounts("Verfiying available balnce in accMaster of accNo:" + arg2,
                            accMaster.getAvailableBal() + "", "-500000");
                    assertionHelper.verifyTwoAmounts("Verfiying Receviable amount in loanMaster of accNo:" + arg2,
                            loanMaster.getIntRecv() + "", "0");
                    assertionHelper.verifyTwoAmounts("Verfiying IntDue amount in loanMaster of accNo:" + arg2,
                            loanMaster.getIntDue() + "", "200");
                } else if ("AsonWhen".equalsIgnoreCase(arg1)) {
                    assertionHelper.verifyTwoAmounts("Verfiying available balnce in accMaster of accNo:" + arg2,
                            accMaster.getAvailableBal() + "", "-500000");
                    
                    assertionHelper.verifyTwoAmounts("Verfiying IntDue amount in loanMaster of accNo:" + arg2,
                            loanMaster.getIntDue() + "", "0");
                }
            } else {
                
                if ("Captilised".equalsIgnoreCase(arg1)) {
                    assertionHelper.verifyTwoAmounts("Verfiying available balnce in accMaster of accNo:" + arg2,
                            accMaster.getAvailableBal() + "", "-499000");
                    assertionHelper.verifyTwoAmounts("Verfiying Capitilised amount in loanMaster of accNo:" + arg2,
                            loanMaster.getIntCapitalised() + "", "0");
                    assertionHelper.verifyTwoAmounts("Verfiying IntDue amount in loanMaster of accNo:" + arg2,
                            loanMaster.getIntDue() + "", "200");
                    
                } else if ("Recivable".equalsIgnoreCase(arg1)) {
                    assertionHelper.verifyTwoAmounts("Verfiying available balnce in accMaster of accNo:" + arg2,
                            accMaster.getAvailableBal() + "", "-499500");
                    assertionHelper.verifyTwoAmounts("Verfiying Receviable amount in loanMaster of accNo:" + arg2,
                            loanMaster.getIntRecv() + "", "0");
                    assertionHelper.verifyTwoAmounts("Verfiying IntDue amount in loanMaster of accNo:" + arg2,
                            loanMaster.getIntDue() + "", "200");
                } else if ("AsonWhen".equalsIgnoreCase(arg1)) {
                    assertionHelper.verifyTwoAmounts("Verfiying available balnce in accMaster of accNo:" + arg2,
                            accMaster.getAvailableBal() + "", "-499500");
                    
                    assertionHelper.verifyTwoAmounts("Verfiying IntDue amount in loanMaster of accNo:" + arg2,
                            loanMaster.getIntDue() + "", "0");
                }
            }
        }
    }
}
