package com.sysnik.selenium.service;

import java.math.BigInteger;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.DepositMasterEntity;
import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.repository.DipositMasterRepo;

@Service("depositMasterService")
public class DepositMasterService {
    @Autowired
    private DipositMasterRepo depositRepo;
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    
    public DepositMasterEntity getDepositMasterDetailsByAccId(BigInteger accId) {
        DepositMasterEntity depositMasterEntity = depositRepo.findByAccId(accId);
        if ((depositMasterEntity) != null) {
            return depositMasterEntity;
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest("Record Not Found in deposit master with AccId " + accId);
            return null;
        }
    }
    
    public Date getMaturityDtByAccId(BigInteger accId) {
        
        return getDepositMasterDetailsByAccId(accId).getMaturityDt();
    }
    
}
