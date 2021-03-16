package com.sysnik.selenium.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.selenium.entity.ChargesTypeDetailsEntity;
import com.sysnik.selenium.entity.ChargesTypeMasterEntity;
import com.sysnik.selenium.repository.ChargesTypeDetailsRepo;
import com.sysnik.selenium.repository.ChargesTypeMasterRepo;

@Service("ChargesTypeDetailsService")
public class ChargesTypeDetailsService {
    
    @Autowired
    private ChargesTypeMasterRepo ctmrepo;
    
    @Autowired
    private ChargesTypeDetailsRepo ctdrepo;
    
    private ChargesTypeMasterEntity chargeTypeMaster;
    private ChargesTypeDetailsEntity chargesTypeDetails;
    
    public ChargesTypeDetailsEntity getChargesTypesDeatilsData(String ChargeCode) {
        chargeTypeMaster = ctmrepo.findByChargeCode(ChargeCode);
        chargesTypeDetails = ctdrepo.findByChargeTypeId(chargeTypeMaster.getId());
        return chargesTypeDetails;
    }
}
