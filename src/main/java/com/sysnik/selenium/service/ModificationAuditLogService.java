package com.sysnik.selenium.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.selenium.entity.CustomerMasterEntity;
import com.sysnik.selenium.entity.ModificationAuditLogEntity;
import com.sysnik.selenium.fw.testBase.TestBase;
import com.sysnik.selenium.repository.CustomerMasterRepo;
import com.sysnik.selenium.repository.ModificationAuditLogRepo;

@Service("ModificationAuditLogService")
public class ModificationAuditLogService extends TestBase {
    
    @Autowired
    private CustomerMasterRepo cmrepo;
    
    @Autowired
    private ModificationAuditLogRepo malrepo;
    
    private CustomerMasterEntity customerMaster;
    private ModificationAuditLogEntity modAuditLog;
    
    public List<ModificationAuditLogEntity> findByCustNumber(String custNumber) {
        
        customerMaster = cmrepo.findByCustNumber(custNumber);
        List<ModificationAuditLogEntity> modAuditLogList = new ArrayList<>();
        customerMaster = cmrepo.findByCustNumber(custNumber);
        modAuditLogList = malrepo.findByAccountCustId(customerMaster.getCustId().longValue());
        return modAuditLogList;
    }
    
}
