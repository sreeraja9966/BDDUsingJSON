package com.sysnik.selenium.service;

import java.math.BigInteger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.SIMasterEntity;
import com.sysnik.selenium.fw.helper.AssertionHelper;
import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.repository.SIMasterRepo;

@Service("SIMasterService")
public class SIMasterService {
    @Autowired
    private SIMasterRepo siRepo;
    private SIMasterEntity siMaster;
    AssertionHelper assertionHelper = AutomationObjectFactory.getAssertionHelperInstance();
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    
    public SIMasterEntity getSiDetailsByFromAccId(BigInteger fromAccId) {
        return siRepo.findByFromAccId(fromAccId);
        
    }
    
    public SIMasterEntity getSiDetailsByToAccId(BigInteger toAccId) {
        return siRepo.findByToAccId(toAccId);
        
    }
    
    public void siMasterStatusVerificationAfterAuthUsingFromAccId(BigInteger fromAccId, String expectedStatus) {
        
        siMaster = siRepo.findByFromAccId(fromAccId);
        
        if (siMaster != null) {
            assertionHelper.verifyTwoTexts("Verify SI Master , STATUS ", siMaster.getStatus(), expectedStatus);
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest("Record Not found in SIMASTER with FromAccId" + fromAccId);
        }
    }
    
    public SIMasterEntity getSiDetailsBySiNumber(BigInteger siNumber, String branchCode) {
        return siRepo.findBySiNumberAndBranchCode(siNumber, "2101");
        
    }
    
}
