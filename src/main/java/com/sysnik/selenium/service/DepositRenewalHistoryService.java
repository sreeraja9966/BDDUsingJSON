package com.sysnik.selenium.service;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.DepositRenewalHistoryEntity;
import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.repository.DepositRenewalHistoryRepo;

@Service("DepositRenewalHistoryService")
public class DepositRenewalHistoryService {
    @Autowired
    private DepositRenewalHistoryRepo depRenewalHistory;
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    
    public List<DepositRenewalHistoryEntity> getRenewalDetailsByAccNo(String accId) {
        List<DepositRenewalHistoryEntity> depositRenewalHis = new ArrayList<DepositRenewalHistoryEntity>();
        depositRenewalHis = depRenewalHistory.findByAccId(new BigInteger(accId));
        
        if ((depositRenewalHis).size() > 0) {
            
            return depositRenewalHis;
        } else {
            reportHelper
                    .writeLogInCaseOfFailInChildTest("Record Not Found in deposit renewal history with AccId " + accId);
            return null;
        }
        
    }
}
