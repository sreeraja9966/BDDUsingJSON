package com.sysnik.selenium.service;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.LienEarMarkEntity;
import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.repository.LienmarkRepo;

@Service("LienMarkService")
public class LienMarkService {
    @Autowired
    private LienmarkRepo lien;
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    
    public List<LienEarMarkEntity> getLienDetailsByDepoAndLoanaccIdInList(BigInteger depAccId, BigInteger loanAccId,
            String status) {
        List<LienEarMarkEntity> lienMark = null;
        
        try {
            lienMark = lien.findByDepositAccIdAndLoanAccIdAndStatus(depAccId, loanAccId, status);
        } catch (Exception e) {
            reportHelper.writeLogInCaseOfFailInChildTest(
                    "Record Not found in LienEarMark table with depAccId" + depAccId + " & loanAccId" + loanAccId);
        }
        if ((lienMark).size() > 0) {
            return lienMark;
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest(
                    "Record Not found in LienEarMark table with depAccId" + depAccId + " & loanAccId" + loanAccId);
            return null;
        }
    }
    
    public LienEarMarkEntity getLienDetailsByDepoAndLoanaccId(BigInteger depAccId, BigInteger loanAccId) {
        LienEarMarkEntity lienMark = null;
        
        try {
            lienMark = lien.findByDepositAccIdAndLoanAccId(depAccId, loanAccId);
        } catch (Exception e) {
            reportHelper.writeLogInCaseOfFailInChildTest(
                    "Record Not found in LienEarMark table with depAccId" + depAccId + " & loanAccId" + loanAccId);
        }
        if ((lienMark) != null) {
            return lienMark;
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest(
                    "Record Not found in LienEarMark table with depAccId" + depAccId + " & loanAccId" + loanAccId);
            return null;
        }
    }
    
    public BigDecimal getTotalLienAmount(BigInteger depAccId, BigInteger loanAccId) {
        BigDecimal lienAmt = new BigDecimal("0");
        try {
            lienAmt = lien.getTotalLienAmount(depAccId, loanAccId);
        } catch (Exception e) {
            reportHelper.writeLogInCaseOfFailInChildTest(
                    "Record Not found in LienEarMark table with depAccId" + depAccId + " & loanAccId" + loanAccId);
        }
        if (lienAmt.compareTo(new BigDecimal("0")) == 0) {
            reportHelper.writeLogInCaseOfFailInChildTest(
                    "Record Not found in LienEarMark table with depAccId" + depAccId + " & loanAccId" + loanAccId);
            return null;
            
        } else {
            return lienAmt;
        }
    }
}
