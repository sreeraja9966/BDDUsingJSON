package com.sysnik.selenium.service;

import java.math.BigInteger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.selenium.entity.ChargesTypeMasterEntity;
import com.sysnik.selenium.repository.ChargesTypeMasterRepo;

@Service("ChargesTypeMasterService")
public class ChargesTypeMasterService {
    
    @Autowired
    private ChargesTypeMasterRepo ctmrepo;
    
    private ChargesTypeMasterEntity chargeTypeMaster;
    
    public String findChargesTypeMasterData(BigInteger id) {
        
        chargeTypeMaster = ctmrepo.findById(id);
        return chargeTypeMaster.getChargeCode();
    }
    
}
