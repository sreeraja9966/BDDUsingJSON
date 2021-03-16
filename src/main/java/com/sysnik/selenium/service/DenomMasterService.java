package com.sysnik.selenium.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.DenomMasterEntity;
import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.repository.DenomMasterRepo;

@Service("DenomMasterService")
public class DenomMasterService {
    @Autowired
    private DenomMasterRepo denomMasterRepo;
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    
    public List<BigDecimal> getDenomRateByBankCode(String bankCode) {
        List<DenomMasterEntity> deno = denomMasterRepo.findByBankCodeOrderByDenomRateDesc(bankCode);
        List<BigDecimal> denomRate = new ArrayList<BigDecimal>();
        if (deno.size() > 0) {
            
            for (DenomMasterEntity denomMaster : deno) {
                denomRate.add(denomMaster.getDenomRate());
                
            }
            return denomRate;
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest("Record not found in denomMaster with bankCode " + bankCode);
            return null;
        }
    }
}
