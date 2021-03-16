package com.sysnik.selenium.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.OtsIntWaiverLogEntity;
import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.fw.testBase.TestBase;
import com.sysnik.selenium.repository.AccountMasterRepo;
import com.sysnik.selenium.repository.OtsIntWaiverLogRepo;

@Service("OTSINTWAIVERLOGService")
public class OTSINTWAIVERLOGService extends TestBase {
    @Autowired
    private OtsIntWaiverLogRepo otsIntWaiverRepo;
    @Autowired
    private AccountMasterRepo amrepo;
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    
    public OtsIntWaiverLogEntity getOTSWaiverLogDetailsByaccNo(String accNo) {
        OtsIntWaiverLogEntity otsIntwaiver = otsIntWaiverRepo.findByAccId(amrepo.findByAccNo(accNo).getAccId());
        if (otsIntwaiver != null) {
            return otsIntwaiver;
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest("Record not found in OtsIntWaiverLog with accNo:" + accNo);
            return null;
        }
    }
    
}
