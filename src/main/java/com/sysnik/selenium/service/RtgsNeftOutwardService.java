package com.sysnik.selenium.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.RtgsNeftOutwardEntity;
import com.sysnik.selenium.fw.helper.FilloExcelDataGetter;
import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.fw.testBase.TestBase;
import com.sysnik.selenium.repository.RtgsNeftOutwardRepo;

@Service("RtgsNeftOutwardService")
public class RtgsNeftOutwardService extends TestBase {
    FilloExcelDataGetter filloExcelDataGetter = new FilloExcelDataGetter();
    @Autowired
    private RtgsNeftOutwardRepo rnrepo;
    
    private RtgsNeftOutwardEntity rtgsNeftOutward;
    
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    
    public RtgsNeftOutwardEntity findRtgsNeftOutwardDetailsUsingNumber(String accNumber) {
        
        rtgsNeftOutward = rnrepo.findByAccNumber(accNumber);
        if (rtgsNeftOutward != null) {
            return rtgsNeftOutward;
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest("Record not found in rtgsNeftOutward with accNo " + accNumber);
            return null;
        }
        
    }
}
