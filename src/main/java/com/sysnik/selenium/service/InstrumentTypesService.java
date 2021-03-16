package com.sysnik.selenium.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.InstrumentTypesEntity;
import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.fw.testBase.TestBase;
import com.sysnik.selenium.repository.InstrumentTypesRepo;

@Service("InstrumentTypesService")
public class InstrumentTypesService extends TestBase {
    
    @Autowired
    private InstrumentTypesRepo itrepo;
    
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    private InstrumentTypesEntity instrumentType;
    
    public InstrumentTypesEntity getInstrumentTypeDetails(String instType, String prodType) {
        InstrumentTypesEntity instrumentTypesEntity = itrepo.findByInstTypeAndProdType(instType, prodType);
        if ((instrumentTypesEntity) != null) {
            return instrumentTypesEntity;
        } else {
        }
        reportHelper.writeLogInCaseOfFailInChildTest("Record Not Found for Instrument Type: " + instType);
        return null;
    }
    
    public InstrumentTypesEntity getInstrumentTypesAndDescDetails(String prodType, String instTypeDesc) {
        InstrumentTypesEntity instrumentTypesEntity = itrepo.findByProdTypeAndDescription(prodType, instTypeDesc);
        if ((instrumentTypesEntity) != null) {
            return instrumentTypesEntity;
        } else {
        }
        reportHelper.writeLogInCaseOfFailInChildTest("Record Not Found for Instrument Type: " + prodType);
        return null;
    }
}
