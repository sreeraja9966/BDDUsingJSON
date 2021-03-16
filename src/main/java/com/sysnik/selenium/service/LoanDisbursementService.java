package com.sysnik.selenium.service;

import java.math.BigInteger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.selenium.entity.AccountMasterEntity;
import com.sysnik.selenium.entity.LoanDisbursementEntity;
import com.sysnik.selenium.fw.testBase.TestBase;
import com.sysnik.selenium.repository.LoanDisbursementRepo;

import ch.qos.logback.classic.db.DBHelper;

@Service("LoanDisbursementService")
public class LoanDisbursementService extends TestBase {
    
    @Autowired
    private LoanDisbursementRepo ldrepo;
    
    private AccountMasterEntity accMaster;
    
    private LoanDisbursementEntity loanDisb;
    
    DBHelper dbHelper = new DBHelper();
    
    public LoanDisbursementEntity getLoanDisbDatails(String accNumber, BigInteger vouchNo) {
        
        accMaster = accountService.getAccountMasterDetailsByAccNo(accNumber);
        loanDisb = ldrepo.findByAccIdAndVoucherNo(accMaster.getAccId(), vouchNo);
        
        return loanDisb;
    }
    
}
