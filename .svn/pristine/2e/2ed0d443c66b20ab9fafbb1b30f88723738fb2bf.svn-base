package com.sysnik.selenium.service;

import java.math.BigInteger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.CustomerMasterEntity;
import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.repository.CustomerMasterRepo;

@Service("customerService")
public class CustomerMasterService {
    @Autowired
    private CustomerMasterRepo cmRepo;
    
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    
    public CustomerMasterEntity getCustMasterDetailsByCustId(BigInteger custId) {
        CustomerMasterEntity customerMasterEntity = cmRepo.findByCustId(custId);
        if ((customerMasterEntity) != null) {
            return customerMasterEntity;
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest("Record Not Found in customer master with custId " + custId);
            return null;
        }
        
    }
    
    public String getCustomerCatogeryBycustNumber(String custNumber) {
        CustomerMasterEntity customerMasterEntity = cmRepo.findByCustNumber(custNumber);
        if ((customerMasterEntity) != null) {
            return customerMasterEntity.getCustCategory();
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest(
                    "Record Not Found in customer master with custNumber " + custNumber);
            return null;
        }
        
    }
    
    public String getCustomerDetailsUsingNumber(String custNumber) {
        CustomerMasterEntity customerMasterEntity = cmRepo.findByCustNumber(custNumber);
        if ((customerMasterEntity) != null) {
            return customerMasterEntity.getCustName();
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest(
                    "Record Not Found in customer master with custNumber " + custNumber);
            return null;
        }
        
    }
    
    public CustomerMasterEntity getCustomerUsingNumber(String custNumber) {
        CustomerMasterEntity customerMasterEntity = cmRepo.findByCustNumber(custNumber);
        if ((customerMasterEntity) != null) {
            return customerMasterEntity;
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest(
                    "Record Not Found in customer master with custNumber " + custNumber);
            return null;
        }
        
    }
    
    public CustomerMasterEntity findCustNumber(String custNumber) {
        return cmRepo.findByCustNumber(custNumber);
    }
    
    public String getCustomerDateOfBirthUsingNumber(String custNumber) {
        CustomerMasterEntity customerMasterEntity = cmRepo.findByCustNumber(custNumber);
        if ((customerMasterEntity) != null) {
            return customerMasterEntity.getDob().toString();
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest(
                    "Record Not Found in customer master with custNumber " + custNumber);
            return null;
        }
        
    }
    
}
