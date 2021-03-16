package com.sysnik.selenium.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.LoanSettlementLogEntity;
import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.fw.testBase.TestBase;
import com.sysnik.selenium.repository.AccountMasterRepo;
import com.sysnik.selenium.repository.LoanSettlementLogRepo;

@Service("LOANSETTLEMENTLOGService")
public class LOANSETTLEMENTLOGService extends TestBase {
    @Autowired
    private LoanSettlementLogRepo loanSettelRepo;
    @Autowired
    private AccountMasterRepo amrepo;
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    
    public LoanSettlementLogEntity getLoanSettleLogDetailsByaccNo(String accNo) {
        LoanSettlementLogEntity loanSettle = loanSettelRepo.findByAccId(amrepo.findByAccNo(accNo).getAccId());
        if (loanSettle != null) {
            return loanSettle;
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest("Record not found in LOANSETTLELOG with accNo:" + accNo);
            return null;
        }
    }
    
}
