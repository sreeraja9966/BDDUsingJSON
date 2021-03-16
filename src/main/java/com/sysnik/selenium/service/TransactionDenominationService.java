package com.sysnik.selenium.service;

import java.math.BigInteger;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.TransactionDenominationEntity;
import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.repository.TransactionDenominationRepo;

@Service("TransactionDenominationService")
public class TransactionDenominationService {
    @Autowired
    private TransactionDenominationRepo transDenomRepo;
    private TransactionDenominationEntity transDenom;
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    
    public List<TransactionDenominationEntity> getTransDenomDetailsByTransId(BigInteger transId) {
        List<TransactionDenominationEntity> transactionDenominationEntity = transDenomRepo
                .findByTransIdOrderByTransTypeDesc(transId);
        if ((transactionDenominationEntity) != null) {
            return transactionDenominationEntity;
        } else {
            reportHelper
                    .writeLogInCaseOfFailInChildTest("Record Not Found In Transaction Denom with transId " + transId);
            return null;
        }
    }
}
