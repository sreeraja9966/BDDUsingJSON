package com.sysnik.selenium.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.TokenMasterEntity;
import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.repository.TokenMasterRepo;

@Service("TokenMasterService")
public class TokenMasterService {
    @Autowired
    private TokenMasterRepo tmRepo;
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    
    public String getStatusByTokenNumber(Integer tokenNumber) {
        TokenMasterEntity tokenMasterEntity = tmRepo.findByTokenNumberAndBranchCode(tokenNumber, "2101");
        if ((tokenMasterEntity) != null) {
            return tokenMasterEntity.getStatus();
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest("Record Not Found in TokenMaster with tokenNo " + tokenNumber);
            return null;
        }
    }
}
