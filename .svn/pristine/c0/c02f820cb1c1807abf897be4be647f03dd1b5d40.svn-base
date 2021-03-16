package com.sysnik.selenium.service;

import java.math.BigInteger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.ClosedAccountsEntity;
import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.repository.ClosedAccountRepo;

@Service("ClosedAccountService")
public class ClosedAccountService {
    @Autowired
    private ClosedAccountRepo closedAccountRepo;
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    
    public ClosedAccountsEntity getClosedAccDetailsUsingAccId(BigInteger accId) {
        ClosedAccountsEntity closedAccountsEntity = closedAccountRepo.findByAccId(accId);
        if (!closedAccountsEntity.equals(null)) {
            return closedAccountsEntity;
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest("No Record found in Closed Account Table With AccId:" + accId);
            return null;
        }
    }
    
}
