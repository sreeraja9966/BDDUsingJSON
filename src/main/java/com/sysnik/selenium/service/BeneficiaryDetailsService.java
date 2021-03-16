package com.sysnik.selenium.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.selenium.entity.BeneficiaryDetailsEntity;
import com.sysnik.selenium.fw.testBase.TestBase;
import com.sysnik.selenium.repository.BeneficiaryDetailsRepo;

@Service("BeneficiaryDetailsService")
public class BeneficiaryDetailsService extends TestBase {
    
    @Autowired
    private BeneficiaryDetailsRepo bdrepo;
    
    private BeneficiaryDetailsEntity benefDetails;
    
    public BeneficiaryDetailsEntity findByBenfccountNumber(String BenefAccNo) {
        benefDetails = bdrepo.findByBenefAccountNo(BenefAccNo);
        return benefDetails;
    }
    
}
