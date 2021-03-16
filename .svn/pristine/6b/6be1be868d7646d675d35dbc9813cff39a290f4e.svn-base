package com.sysnik.selenium.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.TransactionHeaderEntity;
import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.repository.TransactionHeaderRepo;

@Service("TransactionHeaderService")
public class TransactionHeaderService {
    @Autowired
    private TransactionHeaderRepo transactionHederRepo;
    private TransactionHeaderEntity transactionHeader;
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    
    public TransactionHeaderEntity getTransactionHeaderdetailsByVoucherNumberAndTransType(Long voucherNumber,
            String transType) {
        TransactionHeaderEntity transactionHeaderEntity = transactionHederRepo
                .findByVoucherNumberAndTransType(voucherNumber, transType);
        if ((transactionHeaderEntity) != null) {
            return transactionHeaderEntity;
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest("record not found in  TransactionHeader with voucher No "
                    + voucherNumber + " & Trans Type " + transType);
            return null;
        }
    }
    
    public TransactionHeaderEntity getTransactionDetailsUsingParentVoucher(Long VoucherNo) {
        TransactionHeaderEntity transHeader = transactionHederRepo.findByParentVoucherNumber(VoucherNo);
        if (transHeader != null) {
            return transHeader;
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest(
                    "record not found in  TransactionHeader with ParentVoucher No " + VoucherNo);
            return null;
        }
    }
    
    public TransactionHeaderEntity getTransactionDetailsUsingId(Long id) {
        TransactionHeaderEntity transHeader = transactionHederRepo.findById(id);
        if (transHeader != null) {
            return transHeader;
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest("record not found in  TransactionHeader with id No " + id);
            return null;
        }
    }
    
    public List<TransactionHeaderEntity> getTransactionDetailsListUsingParentVoucher(Long VoucherNo, String transType) {
        List<TransactionHeaderEntity> transHeader = transactionHederRepo
                .findByParentVoucherNumberAndTransType(VoucherNo, transType);
        if (transHeader.size() > 0) {
            return transHeader;
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest(
                    "record not found in  TransactionHeader with ParentVoucher No " + VoucherNo);
            return null;
        }
    }
    
}
