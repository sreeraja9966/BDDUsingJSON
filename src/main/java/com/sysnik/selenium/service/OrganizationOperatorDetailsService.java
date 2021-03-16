package com.sysnik.selenium.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.selenium.entity.CustomerMasterEntity;
import com.sysnik.selenium.entity.OrganizationOperatorDetailsEntity;
import com.sysnik.selenium.fw.testBase.TestBase;
import com.sysnik.selenium.repository.CustomerMasterRepo;
import com.sysnik.selenium.repository.OrganizationOperatorDetailsRepo;

@Service("OrganizationOperatorDetailsService")
public class OrganizationOperatorDetailsService extends TestBase {
    
    @Autowired
    private CustomerMasterRepo cmrepo;
    @Autowired
    private OrganizationOperatorDetailsRepo oorepo;
    
    private CustomerMasterEntity customerMaster;
    private OrganizationOperatorDetailsEntity orgOperator;
    
    public List<OrganizationOperatorDetailsEntity> findByCustNumber(String custNumber) {
        customerMaster = cmrepo.findByCustNumber(custNumber);
        List<OrganizationOperatorDetailsEntity> OrgOperatorDetailsList = new ArrayList<>();
        OrgOperatorDetailsList = oorepo.findByCustId(customerMaster.getCustId());
        return OrgOperatorDetailsList;
    }
}