package com.sysnik.selenium.service;

import java.math.BigInteger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.selenium.entity.RemitInstrumentEntity;
import com.sysnik.selenium.entity.RemitParameterEntity;
import com.sysnik.selenium.entity.TransactionHeaderEntity;
import com.sysnik.selenium.fw.helper.FilloExcelDataGetter;
import com.sysnik.selenium.fw.testBase.TestBase;
import com.sysnik.selenium.repository.RemitInstrumentRepo;
import com.sysnik.selenium.repository.RemitParameterRepo;
import com.sysnik.selenium.repository.TransactionHeaderRepo;

@Service("RemitParameterService")
public class RemitParameterService extends TestBase {
    
    FilloExcelDataGetter filloExcelDataGetter = new FilloExcelDataGetter();
    
    @Autowired
    private RemitInstrumentRepo rirepo;
    @Autowired
    private RemitParameterRepo rprepo;
    @Autowired
    private TransactionHeaderRepo threpo;
    
    private RemitInstrumentEntity remitInstrument;
    private RemitParameterEntity remitParameter;
    private TransactionHeaderEntity transHeader;
    
    public RemitParameterEntity findRemitParameterDetails(BigInteger VoucherNo, String transType) {
        if (transType.equalsIgnoreCase("D")) {
            transHeader = threpo.findByVoucherNumberAndTransType(VoucherNo.longValue(), transType);
        } else {
            transHeader = threpo.findByVoucherNumberAndTransType(VoucherNo.longValue(), transType);
        }
        long id = transHeader.getId();
        BigInteger TransId = BigInteger.valueOf(id);
        remitInstrument = rirepo.findByOrigVoucherId(TransId);
        remitParameter = rprepo.findByRemittanceType(remitInstrument.getRemittanceType());
        return remitParameter;
        
    }
    
}
