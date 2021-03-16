package com.sysnik.selenium.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.selenium.entity.RemitInstrumentEntity;
import com.sysnik.selenium.entity.RemitValidationEntity;
import com.sysnik.selenium.fw.helper.FilloExcelDataGetter;
import com.sysnik.selenium.fw.testBase.TestBase;
import com.sysnik.selenium.repository.RemitInstrumentRepo;
import com.sysnik.selenium.repository.RemitValidationRepo;

@Service("RemitValidationService")
public class RemitValidationService extends TestBase {
    
    FilloExcelDataGetter filloExcelDataGetter = new FilloExcelDataGetter();
    
    @Autowired
    private RemitInstrumentRepo rirepo;
    @Autowired
    private RemitValidationRepo rvrepo;
    
    private RemitInstrumentEntity remitInstrument;
    private RemitValidationEntity remitValidation;
    
    public RemitValidationEntity findRemitValidationData(String remitSrNumber) {
        remitInstrument = rirepo.findByRemittanceSrNo(remitSrNumber);
        remitValidation = rvrepo.findByRemitId(remitInstrument.getId());
        return remitValidation;
        
    }
    
}
