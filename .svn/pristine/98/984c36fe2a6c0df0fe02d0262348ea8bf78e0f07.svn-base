package com.sysnik.selenium.service;

import java.math.BigInteger;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.DepositIntpaymentHistoryEntity;
import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.repository.DEPOSITINTERESTHISTORYRepo;

@Service("DepositInterestHistoryService")
public class DepositInterestHistoryService {
    @Autowired
    private DEPOSITINTERESTHISTORYRepo depositInterestHistory;
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    
    public DepositIntpaymentHistoryEntity getDepositInterestHistoryByAccId(BigInteger accId) {
        
        List<DepositIntpaymentHistoryEntity> depositIntpaymentHistoryEntityList;
        depositIntpaymentHistoryEntityList = depositInterestHistory.findByAccIdOrderByIdDesc(accId);
        DepositIntpaymentHistoryEntity depositIntpaymentHistoryEntity;
        if (depositIntpaymentHistoryEntityList.size() > 0) {
            depositIntpaymentHistoryEntity = depositIntpaymentHistoryEntityList.get(0);
            return depositIntpaymentHistoryEntity;
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest(
                    "Record Not found in Deposit Interest History Table with AccId" + accId);
            return null;
        }
    }
}
