package com.sysnik.selenium.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.LookupEntity;
import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.repository.LookupRepo;

@Service("LookupService")
public class LookupService {
    @Autowired
    private LookupRepo lookupRepo;
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    
    public LookupEntity getLookdetailsByCodeAndType(String code, String type) {
        LookupEntity lookupEntity = lookupRepo.findByCodeAndType(code, type);
        if ((lookupEntity) != null) {
            return lookupEntity;
        } else {
            reportHelper
                    .writeLogInCaseOfFailInChildTest("Record Not found in LookUp with code " + code + " & type" + type);
            return null;
        }
    }
}
