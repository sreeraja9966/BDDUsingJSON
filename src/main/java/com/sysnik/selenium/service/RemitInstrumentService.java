package com.sysnik.selenium.service;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.ChequeBookDetailEntity;
import com.sysnik.selenium.entity.ChequeBookDetailsId;
import com.sysnik.selenium.entity.RemitInstrumentEntity;
import com.sysnik.selenium.entity.TransactionHeaderEntity;
import com.sysnik.selenium.fw.helper.FilloExcelDataGetter;
import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.fw.testBase.TestBase;
import com.sysnik.selenium.repository.ChequeBookDetailRepo;
import com.sysnik.selenium.repository.ChequeBookMasterRepo;
import com.sysnik.selenium.repository.RemitInstrumentRepo;
import com.sysnik.selenium.repository.RemitParameterRepo;
import com.sysnik.selenium.repository.TransactionHeaderRepo;

@Service("RemitInstrumentService")
public class RemitInstrumentService extends TestBase {
    
    FilloExcelDataGetter filloExcelDataGetter = new FilloExcelDataGetter();
    
    @Autowired
    private RemitInstrumentRepo rirepo;
    @Autowired
    private RemitParameterRepo rprepo;
    @Autowired
    private TransactionHeaderRepo trrepo;
    @Autowired
    private ChequeBookDetailRepo cbdrepo;
    @Autowired
    private ChequeBookMasterRepo cbmrepo;
    
    private RemitInstrumentEntity remitInstrument;
    private TransactionHeaderEntity transHeader;
    
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    
    public RemitInstrumentEntity findRemitInsrumentData(BigInteger VoucherNo, String transType) {
        
        transHeader = trrepo.findByVoucherNumberAndTransType(VoucherNo.longValue(), transType);
        long id = transHeader.getId();
        BigInteger TransId = BigInteger.valueOf(id);
        remitInstrument = rirepo.findByOrigVoucherId(TransId);
        return remitInstrument;
        
    }
    
    public List<ChequeBookDetailEntity> getChqDetailsInfoByAccId(BigInteger accId) {
        List<ChequeBookDetailEntity> chqBookDetailList = new ArrayList<ChequeBookDetailEntity>();
        
        Integer id = cbmrepo.findByAccID(accId).getId();
        ChequeBookDetailsId chequeBookDetailsId = new ChequeBookDetailsId();
        chequeBookDetailsId.setCheqbookId(id);
        chqBookDetailList = cbdrepo.findByCheqId(id);
        
        if ((chqBookDetailList) != null) {
            return chqBookDetailList;
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest("Record Not Found in chequeBookDetails for accId " + accId);
            return null;
        }
    }
    
    public RemitInstrumentEntity findCancelRemitInsrumentData(BigInteger VoucherNo, String transType) {
        transHeader = trrepo.findByVoucherNumberAndTransType(VoucherNo.longValue(), transType);
        long id = transHeader.getId();
        BigInteger TransId = BigInteger.valueOf(id);
        remitInstrument = rirepo.findByRespondVoucherId(TransId);
        return remitInstrument;
    }
    
    public RemitInstrumentEntity findRemitInsrumentDataByRemitSrNumber(String remitSrNumber) {
        
        remitInstrument = rirepo.findByRemittanceSrNo(remitSrNumber);
        return remitInstrument;
        
    }
}
