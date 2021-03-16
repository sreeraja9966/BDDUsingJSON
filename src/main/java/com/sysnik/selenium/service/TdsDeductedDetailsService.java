package com.sysnik.selenium.service;

import java.math.BigInteger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.TdsDeductedDetailsEntity;
import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.repository.TdsDeductedDetailsRepo;

@Service("TdsDeductedDetailsService")
public class TdsDeductedDetailsService {
    @Autowired
    private TdsDeductedDetailsRepo tdsDeductedDetailsRepo;
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    
    public TdsDeductedDetailsEntity getTdsDeductedDetailsByAccId(BigInteger accId) {
        TdsDeductedDetailsEntity tdsDetails = null;
        tdsDetails = tdsDeductedDetailsRepo.findByAccId(accId);
        if ((tdsDetails) != null) {
            return tdsDetails;
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest(
                    "Record Not found in TDS Deducted Details table with accId" + accId);
            return null;
        }
    }
}
