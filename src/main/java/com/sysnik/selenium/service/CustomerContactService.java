package com.sysnik.selenium.service;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.CustomerContactEntity;
import com.sysnik.selenium.entity.CustomerMasterEntity;
import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.fw.testBase.TestBase;
import com.sysnik.selenium.repository.CustomerContactRepo;
import com.sysnik.selenium.repository.CustomerMasterRepo;

@Service("CustomerContactService")
public class CustomerContactService extends TestBase {
    
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    @Autowired
    private CustomerMasterRepo cmrepo;
    @Autowired
    private CustomerContactRepo ccrepo;
    
    private CustomerMasterEntity customerMaster;
    private CustomerContactEntity custContact;
    
    public List<CustomerContactEntity> findByCustId(BigInteger custId) {
        List<CustomerContactEntity> custContactList = new ArrayList<>();
        ArrayList<String> conTypesList = new ArrayList<String>();
        conTypesList.add("MOB");
        conTypesList.add("EMAIL");
        customerMaster = cmrepo.findByCustNumber(custId.toString());
        custContactList = ccrepo.findByCustIdInAndContactTypeIn(custId, conTypesList);
        return custContactList;
    }
    
    public CustomerContactEntity getCustContactById(Integer id) {
        try {
            custContact = ccrepo.findById(id).get();
        } catch (Exception e) {
            reportHelper.writeLogInCaseOfPassInChildTest("Record Not Found in Cust Contact table with Id:" + id);
        }
        if (custContact != null) {
            return custContact;
        } else {
            reportHelper.writeLogInCaseOfPassInChildTest("Record Not Found in Cust Contact table with Id:" + id);
            return null;
        }
    }
}
