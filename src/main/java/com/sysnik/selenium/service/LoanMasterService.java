package com.sysnik.selenium.service;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.AccountMasterEntity;
import com.sysnik.selenium.entity.LoanMasterEntity;
import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.fw.testBase.TestBase;
import com.sysnik.selenium.repository.LoanMasterRepo;

@Service("LoanMasterService")
public class LoanMasterService extends TestBase {
    
    @Autowired
    private LoanMasterRepo loanMasterRepo;
    
    private LoanMasterEntity loanMaster;
    private AccountMasterEntity accMaster;
    
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    Map<String, String> excelData = new HashMap<String, String>();
    
    public LoanMasterEntity getLoanMasterDetailsByAccId(BigInteger accId) {
        LoanMasterEntity loanMaster = loanMasterRepo.findByAccId(accId);
        if ((loanMaster) != null) {
            return loanMaster;
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest("Record Not found in LoanMaster with accId " + accId);
            return null;
        }
    }
    
    public LoanMasterEntity getCustLoanMasterDetailsByAccNumber(String accNumber) {
        accMaster = accountService.getAccountMasterDetailsByAccNo(accNumber);
        LoanMasterEntity loanMasterEntity = loanMasterRepo.findByAccId(accMaster.getAccId());
        if ((loanMasterEntity) != null) {
            return loanMasterEntity;
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest("Record Not Found in loan_master with accNumber " + accNumber);
            return null;
        }
        
    }
    
    public BigDecimal getLoanMasterDataByAccNumber(String accNumber) {
        accMaster = accountService.getAccountMasterDetailsByAccNo(accNumber);
        LoanMasterEntity loanMasterEntity = loanMasterRepo.findByAccId(accMaster.getAccId());
        if ((loanMasterEntity) != null) {
            return loanMasterEntity.getSanctionedAmt();
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest("Record Not Found in loan_master with accNumber " + accNumber);
            return null;
        }
        
    }
    
    public BigDecimal getCustLoanDetailsByAccNumber(String accNumber) {
        accMaster = accountService.getAccountMasterDetailsByAccNo(accNumber);
        LoanMasterEntity loanMasterEntity = loanMasterRepo.findByAccId(accMaster.getAccId());
        if ((loanMasterEntity) != null) {
            return loanMasterEntity.getDisAmt();
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest("Record Not Found in loan_master with accNumber " + accNumber);
            return null;
        }
        
    }
}
