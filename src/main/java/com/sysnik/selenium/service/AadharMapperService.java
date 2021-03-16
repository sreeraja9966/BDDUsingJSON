
package com.sysnik.selenium.service;

import java.math.BigInteger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.AadharMapperEntity;
import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.repository.AadharMapperRepo;

@Service("AadharMapperService")
public class AadharMapperService {
    
    @Autowired
    private AadharMapperRepo aadharMapperRepo;
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    
    public AadharMapperEntity getAadharMapperDetailsByAccId(BigInteger accId) {
        AadharMapperEntity aadharMaperEntity = null;
        aadharMaperEntity = aadharMapperRepo.findByAccId(accId);
        if ((aadharMaperEntity) != null) {
            return aadharMaperEntity;
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest("Record Not found in AadharMapper table with accId" + accId);
            return null;
        }
    }
    
}
