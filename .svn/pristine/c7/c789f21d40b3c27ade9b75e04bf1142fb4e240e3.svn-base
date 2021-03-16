package com.sysnik.selenium.service;

import java.math.BigInteger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.AccountMasterEntity;
import com.sysnik.selenium.entity.NomineeMasterEntity;
import com.sysnik.selenium.fw.helper.AssertionHelper;
import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.repository.AccountMasterRepo;
import com.sysnik.selenium.repository.NomineeMasterRepo;

@Service("NomineeMasterService")
public class NomineeMasterService {
    @Autowired
    private NomineeMasterRepo nomineeRepo;
    @Autowired
    private AccountMasterRepo arepo;
    private NomineeMasterEntity nomineeMaster;
    private AccountMasterEntity accountMaster;
    AssertionHelper assertionHelper = AutomationObjectFactory.getAssertionHelperInstance();
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    
    public NomineeMasterEntity getNomineeDetailsByAccId(BigInteger accId) {
        return nomineeRepo.findByAccID(accId);
        
    }
    
    public void nomineeMasterStatusVerificationAfterAuth(BigInteger accId, String expectedStatus) {
        //String accountNo = cacheHelper.getCache(Scenario, CacheMap);
        //accountMaster=arepo.findByAccNo(accountNo);
        nomineeMaster = nomineeRepo.findByAccID(accId);
        
        if (nomineeMaster != null) {
            assertionHelper.verifyTwoTexts("Verify Nominee Master Master , STATUS ", nomineeMaster.getStatus(),
                    expectedStatus);
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest("Record Not found in Nominee MASTER with AccId " + accId);
        }
    }
}
