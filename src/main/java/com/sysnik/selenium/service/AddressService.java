package com.sysnik.selenium.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.selenium.entity.AddressEntity;
import com.sysnik.selenium.entity.CustomerMasterEntity;
import com.sysnik.selenium.fw.testBase.TestBase;
import com.sysnik.selenium.repository.AddressRepo;
import com.sysnik.selenium.repository.CustomerMasterRepo;

@Service("AddressService")
public class AddressService extends TestBase {
    
    @Autowired
    private CustomerMasterRepo cmrepo;
    @Autowired
    private AddressRepo arepo;
    
    private CustomerMasterEntity customerMaster;
    private AddressEntity address;
    
    public AddressEntity findByCustNumber(String custNumber) {
        customerMaster = cmrepo.findByCustNumber(custNumber);
        address = arepo.findByCustIdAndType(customerMaster.getCustId(), "RO");
        return address;
    }
    
}
