package com.sysnik.selenium.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.selenium.entity.CustomerMasterEntity;
import com.sysnik.selenium.entity.SpInstructionDetailsEntity;
import com.sysnik.selenium.fw.testBase.TestBase;
import com.sysnik.selenium.repository.CustomerMasterRepo;
import com.sysnik.selenium.repository.SpInstructionDetailsRepo;

@Service("SpInstructionDetailsService")
public class SpInstructionDetailsService extends TestBase {
    
    @Autowired
    private CustomerMasterRepo cmrepo;
    @Autowired
    private SpInstructionDetailsRepo spidrepo;
    
    private CustomerMasterEntity customerMaster;
    
    public List<SpInstructionDetailsEntity> getBlacklistSpInstructionDetailsByCustId(String custNumber) {
        List<SpInstructionDetailsEntity> spInstructionDetailsList = new ArrayList<>();
        customerMaster = cmrepo.findByCustNumber(custNumber);
        spInstructionDetailsList = spidrepo.findByCustId(customerMaster.getCustId());
        return spInstructionDetailsList;
        
    }
    
}