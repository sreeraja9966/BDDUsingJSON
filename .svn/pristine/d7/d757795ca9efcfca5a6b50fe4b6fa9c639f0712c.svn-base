package com.sysnik.selenium.service;

import java.math.BigInteger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.TransDocumentDetailsEntity;
import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.repository.TransDocumentDetailsRepo;

@Service("TransDocumentService")
public class TransDocumentService {
    @Autowired
    private TransDocumentDetailsRepo transDocDetailsRepo;
    private TransDocumentDetailsEntity transDocDetails;
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    
    public TransDocumentDetailsEntity getTransaDocDetailsByvoucherNumberAndTransType(BigInteger voucherNumber,
            String transType) {
        transDocDetails = transDocDetailsRepo.findByVoucherNumberAndTransType(voucherNumber, transType);
        if ((transDocDetails) != null) {
            return transDocDetails;
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest("Record not found in transDocDetails with voucherNo "
                    + voucherNumber + " & TransType " + transType);
            return null;
        }
    }
    
}