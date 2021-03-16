package com.sysnik.selenium.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.TransactionEntity;
import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.repository.TransactionRepo;

@Service("TransactionService")
public class TransactionService {
    @Autowired
    private TransactionRepo transRepo;
    private TransactionEntity transactions;
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    
    public TransactionEntity getTransactionInfoByvoucherNumberAndAccountNumber(Long voucherNumber,
            String accountNumber) {
        TransactionEntity transactionEntity = transRepo.findByVoucherNumberAndAccountNumber(voucherNumber,
                accountNumber);
        if ((transactionEntity) != null) {
            return transactionEntity;
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest(
                    "Record not found in transactions with voucherNo " + voucherNumber + " & accNo " + accountNumber);
            return null;
        }
    }
    
    public List<TransactionEntity> getTransactionInfoByVoucherAndTransType(Long voucherNumber, String transactionType) {
        List<TransactionEntity> transactionEntity = new ArrayList<TransactionEntity>();
        transactionEntity = transRepo.findByVoucherNumberAndTransactionType(voucherNumber, transactionType);
        if (transactionEntity.size() > 0) {
            return transactionEntity;
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest("Record not found in transactions with voucherNo "
                    + voucherNumber + " & transType " + transactionType);
            return null;
        }
    }
}