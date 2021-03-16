package com.sysnik.selenium.service;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.AccountContactEntity;
import com.sysnik.selenium.entity.CustomerContactEntity;
import com.sysnik.selenium.entity.CustomerMasterEntity;
import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.fw.testBase.TestBase;
import com.sysnik.selenium.repository.AccountContactRepo;

@Service("AccountContactService")
public class AccountContactService extends TestBase {
    
    @Autowired
    private AccountContactRepo acrepo;
    
    private List<AccountContactEntity> acContactList = new ArrayList<>();;
    private CustomerMasterEntity custMaster;
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    
    public List<AccountContactEntity> getAccountContactData(String custNumber) {
        
        custMaster = customerMasterService.getCustomerUsingNumber(custNumber);
        List<CustomerContactEntity> custContactList = new ArrayList<>();
        custContactList = customerContactService.findByCustId(custMaster.getCustId());
        
        for (CustomerContactEntity custCON : custContactList) {
            acContactList = acrepo.findByContactId(custCON.getId());
        }
        return acContactList;
        
    }
    
    public List<String> getAccContactByAccIdAndContactType(BigInteger accId, String contactType) {
        try {
            acContactList = acrepo.findByAccIdAndContactType(accId, contactType);
        } catch (Exception e) {
            reportHelper.writeLogInCaseOfFailInChildTest(
                    "Record Not Found in Ac_Contact table with accId " + accId + " & contactType " + contactType);
        }
        List<String> contactsFromAcContact = new ArrayList<String>();
        for (AccountContactEntity accContact : acContactList) {
            contactsFromAcContact.add(customerContactService
                    .getCustContactById(Integer.parseInt(accContact.getContactId() + "")).getValue());
        }
        if (contactsFromAcContact.size() > 0) {
            return contactsFromAcContact;
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest(
                    "Record Not Found in Ac_Contact table with accId " + accId + " & contactType " + contactType);
            return null;
        }
    }
}
