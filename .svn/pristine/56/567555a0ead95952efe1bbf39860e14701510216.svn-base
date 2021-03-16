package com.sysnik.selenium.service;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.FixedDepositIntDetailsEntity;
import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.repository.FixedDepositIntDetailsRepo;

@Service("FixedDepositIntDetailsService")
public class FixedDepositIntDetailsService {
    @Autowired
    FixedDepositIntDetailsRepo fdIntDetailsRepo;
    private FixedDepositIntDetailsEntity fdIntDetails;
    private List<FixedDepositIntDetailsEntity> fdIntDetailsList;
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    
    public List<String> getInterestDateByAccountID(BigInteger accountID) {
        List<FixedDepositIntDetailsEntity> list = fdIntDetailsRepo.findByAccountIDOrderByIdAsc(accountID);
        List<String> intDate = new ArrayList<String>();
        for (FixedDepositIntDetailsEntity bi : list) {
            
            intDate.add(bi.getInterestDate() + "");
        }
        return intDate;
    }
    
    public List<FixedDepositIntDetailsEntity> getFixedDepositIntDetailsByAccId(BigInteger accountID) {
        try {
            fdIntDetailsList = fdIntDetailsRepo.findByAccountIDOrderByIdAsc(accountID);
        } catch (Exception e) {
            reportHelper
                    .writeLogInCaseOfFailInChildTest("Record Not found in FDINTDETAILS table with accId:" + accountID);
        }
        if (fdIntDetailsList.size() > 0) {
            return fdIntDetailsList;
        } else {
            reportHelper
                    .writeLogInCaseOfFailInChildTest("Record Not found in FDINTDETAILS table with accId:" + accountID);
            return null;
        }
    }
    
}
