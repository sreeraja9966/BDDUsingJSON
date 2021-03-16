package com.sysnik.selenium.service;

import java.math.BigInteger;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.CustomerAccountEntity;
import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.repository.CustomerAccountRepo;

@Service("customerAccountService")
public class CustomerAccountService {
    @Autowired
    private CustomerAccountRepo custAccRepo;
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    
    public List<CustomerAccountEntity> getCustomerAccDetailsByAccId(BigInteger accId) {
        List<CustomerAccountEntity> customerAccountEntity = custAccRepo.findByAccId(accId);
        if (customerAccountEntity.size() > 0) {
            return customerAccountEntity;
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest("Record Not Found in CustomerAccount with accId " + accId);
            return null;
        }
    }
    
    public List<CustomerAccountEntity> getCustomerAccDetailsByCustId(BigInteger CustId, String operator) {
        
        List<CustomerAccountEntity> customerAccountEntity = custAccRepo.findByCustIdAndOperator(CustId, operator);
        if (customerAccountEntity.size() > 0) {
            return customerAccountEntity;
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest(
                    "Record Not Found in CustomerAccount with custId " + CustId + " & operator " + operator);
            return null;
        }
    }
    
    public CustomerAccountEntity getCustomerAccDetailsByUserAccNumber(String userAccNo) {
        CustomerAccountEntity customerAccountEntity = custAccRepo.findByUserAccNoAndOperator(userAccNo, "A");
        return customerAccountEntity;
    }
    
    public CustomerAccountEntity getCustomerAccDetailsByAccNumber(String AccNo) {
        CustomerAccountEntity customerAccountEntity = custAccRepo.findByAccNoAndOperator(AccNo, "A");
        return customerAccountEntity;
    }
}
