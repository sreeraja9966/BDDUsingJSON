package com.sysnik.selenium.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.CustomerDeleteEntity;
import com.sysnik.selenium.entity.CustomerMasterEntity;
import com.sysnik.selenium.fw.helper.AssertionHelper;
import com.sysnik.selenium.fw.helper.FilloExcelDataGetter;
import com.sysnik.selenium.fw.testBase.TestBase;
import com.sysnik.selenium.repository.CustomerDeleteRepo;
import com.sysnik.selenium.repository.CustomerMasterRepo;

@Service("CustomerDeleteService")
public class CustomerDeleteService extends TestBase {
    
    FilloExcelDataGetter filloExcelDataGetter = new FilloExcelDataGetter();
    
    @Autowired
    private CustomerMasterRepo cmrepo;
    @Autowired
    private CustomerDeleteRepo custDeleteRepo;
    
    private CustomerMasterEntity customerMaster;
    private CustomerDeleteEntity customerDelete;
    AssertionHelper assertionHelper = AutomationObjectFactory.getAssertionHelperInstance();
    
    public CustomerDeleteEntity customerDeleteEntryVerification(String custNumber, String Reason, String Flow) {
        customerMaster = cmrepo.findByCustNumber(custNumber);
        customerDelete = custDeleteRepo.findByCustId(customerMaster.getCustId());
        
        assertionHelper.verifyTwoTexts("Verifying Cust ID in Customer Account table ",
                customerMaster.getCustId().toString(), customerDelete.getCustId().toString());
        if ("Entry".equalsIgnoreCase(Flow)) {
            
            assertionHelper.verifyTwoTexts("Validate Status in Customer_Delete Table After Delete Entry ",
                    customerDelete.getStatus(), "E");
            
            assertionHelper.verifyTwoTexts("Validate Status in Customer_Delete Table Before Delete Entry ",
                    customerDelete.getPreviousStat(), "A");
            assertionHelper.verifyTwoTexts("Validate Customer Delete Reason in Customer_Delete Table ",
                    customerDelete.getReasonForDelete(), Reason);
        }
        if ("Auth".equalsIgnoreCase(Flow)) {
            assertionHelper.verifyTwoTexts("Validate Status in Customer_Delete Table After Delete Entry ",
                    customerDelete.getStatus(), "A");
        }
        if ("Reject".equalsIgnoreCase(Flow)) {
            
            assertionHelper.verifyTwoTexts("Validate Status in Customer_Delete Table After Delete Entry ",
                    customerDelete.getStatus(), "R");
            assertionHelper.verifyTwoTexts("Verifying Customer Status in CUST_MASTER Tbale: ",
                    customerMaster.getStatus(), "A");
        }
        return customerDelete;
        
    }
    
    public CustomerDeleteEntity findByCustNumber(String custNumber) {
        
        customerMaster = cmrepo.findByCustNumber(custNumber);
        customerDelete = custDeleteRepo.findByCustId(customerMaster.getCustId());
        return customerDelete;
    }
}
