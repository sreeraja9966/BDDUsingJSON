package com.sysnik.selenium.service;

import java.math.BigInteger;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.TransactionsDetailEntity;
import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.repository.TransactionsDetailRepo;

@Service("TransactionsDetailService")
public class TransactionsDetailService {
    @Autowired
    private TransactionsDetailRepo transDetailsRepo;
    private TransactionsDetailEntity transDetails;
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    
    public TransactionsDetailEntity getTransDetailsInfoByIdAndAccountNumber(BigInteger id, String accountNumber) {
        TransactionsDetailEntity transactionsDetailEntity = transDetailsRepo.findByIdAndAccountNumber(id,
                accountNumber);
        if ((transactionsDetailEntity) != null) {
            return transactionsDetailEntity;
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest(
                    "Record not found in TransactionDetails with ID " + id + " & accNo " + accountNumber);
            return null;
        }
    }
    
    public List<TransactionsDetailEntity> getListOfTransDetailsRecordsById(BigInteger id) {
        
        List<TransactionsDetailEntity> transactionsDetailEntity = transDetailsRepo.getTransactionDetailsById(id);
        
        return transactionsDetailEntity;
    }
    
    public List<TransactionsDetailEntity> getListOfTransDetailsRecordsByIdAndDrCr(BigInteger id, String drCr) {
        
        List<TransactionsDetailEntity> transactionsDetailEntity = transDetailsRepo.findByIdAndDrCr(id, drCr);
        
        return transactionsDetailEntity;
    }
}
