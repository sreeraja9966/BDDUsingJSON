package com.sysnik.selenium.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.AccountMasterEntity;
import com.sysnik.selenium.entity.AuthTempEntity;
import com.sysnik.selenium.entity.CustomerMasterEntity;
import com.sysnik.selenium.fw.helper.FilloExcelDataGetter;
import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.fw.testBase.TestBase;
import com.sysnik.selenium.repository.AccountMasterRepo;
import com.sysnik.selenium.repository.AuthTempRepo;
import com.sysnik.selenium.repository.CustomerMasterRepo;

@Service("AuthTempService")
public class AuthTempService extends TestBase {
    
    FilloExcelDataGetter filloExcelDataGetter = new FilloExcelDataGetter();
    
    @Autowired
    private CustomerMasterRepo cmrepo;
    @Autowired
    private AuthTempRepo atrepo;
    @Autowired
    private AccountMasterRepo amrepo;
    
    private AccountMasterEntity accMaster;
    private CustomerMasterEntity customerMaster;
    private AuthTempEntity authTemp;
    
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    
    public AuthTempEntity findByCustNumber(String custNumber) {
        customerMaster = cmrepo.findByCustNumber(custNumber);
        authTemp = atrepo.findByAccId(customerMaster.getCustId());
        return authTemp;
    }
    
    public AuthTempEntity getAuthTempByAccNo(String accNo) {
        accMaster = amrepo.findByAccNo(accNo);
        AuthTempEntity authTempEntity = atrepo.findByAccId(accMaster.getAccId());
        if (authTempEntity != null) {
            return authTempEntity;
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest("Record not found in accountmaster with accNo " + accNo);
            return null;
        }
    }
}
