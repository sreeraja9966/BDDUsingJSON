package com.sysnik.selenium.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.ReconTransactionEntity;
import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.repository.ReconTransactionRepo;

@Service("ReconTransactionService")
public class ReconTransactionService {
    @Autowired
    ReconTransactionRepo reconTrans;
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    
    public ReconTransactionEntity getReconTransDetailsByEntryDateAndEnterBy(Date entryDate, String enterBy) {
        ReconTransactionEntity reconTransEntity = new ReconTransactionEntity();
        Integer groupId = new Integer("1");
        Integer partyId = new Integer("1");
        reconTransEntity = reconTrans.findByEntryDateAndEnterBy(entryDate, enterBy);
        if (reconTransEntity.equals(null)) {
            reportHelper.writeLogInCaseOfFailInChildTest(
                    "Record not found in Recon Trans table with EntryDate " + entryDate + " and EnterBy " + enterBy);
            return null;
        } else {
            return reconTransEntity;
        }
    }
}