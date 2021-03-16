package com.sysnik.selenium.service;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.AccountMasterEntity;
import com.sysnik.selenium.entity.ChequeBookDetailEntity;
import com.sysnik.selenium.entity.ChequeBookMasterEntity;
import com.sysnik.selenium.entity.ChequeBookRequestEntity;
import com.sysnik.selenium.entity.CustomerAccountEntity;
import com.sysnik.selenium.entity.CustomerMasterEntity;
import com.sysnik.selenium.entity.ProductEntity;
import com.sysnik.selenium.entity.StopChequePaymentRequestEntity;
import com.sysnik.selenium.fw.helper.CacheHelper;
import com.sysnik.selenium.fw.helper.FilloExcelDataGetter;
import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.fw.testBase.TestBase;
import com.sysnik.selenium.repository.AccountMasterRepo;
import com.sysnik.selenium.repository.ChequeBookDetailRepo;
import com.sysnik.selenium.repository.ChequeBookMasterRepo;
import com.sysnik.selenium.repository.ChequeBookRequestRepo;
import com.sysnik.selenium.repository.CustomerAccountRepo;
import com.sysnik.selenium.repository.CustomerMasterRepo;
import com.sysnik.selenium.repository.ProductRepo;
import com.sysnik.selenium.repository.StopChequePaymentRequestRepo;

@Service("ChequeBookService")
public class ChequeBookService extends TestBase {
    
    FilloExcelDataGetter filloExcelDataGetter = new FilloExcelDataGetter();
    @Autowired
    private AccountMasterRepo arepo;
    @Autowired
    private ChequeBookRequestRepo cbrepo;
    @Autowired
    private CustomerMasterRepo cmrepo;
    @Autowired
    private CustomerAccountRepo custAccRepo;
    @Autowired
    private ProductRepo prdRepo;
    @Autowired
    private ChequeBookMasterRepo cbmrepo;
    @Autowired
    private ChequeBookDetailRepo cbdrepo;
    @Autowired
    private StopChequePaymentRequestRepo scprrepo;
    
    private CustomerMasterEntity customerMaster;
    private AccountMasterEntity accountMaster;
    private ChequeBookRequestEntity chequeBookRequest;
    private ChequeBookMasterEntity chequeBookMaster;
    private ChequeBookDetailEntity chequeBookDeatil;
    private StopChequePaymentRequestEntity stopChequePayment;
    private List<CustomerAccountEntity> customerAccount;
    private ProductEntity product;
    CacheHelper cacheHelper = AutomationObjectFactory.getCacheHelperInstance();
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    
    public void findAccountDetailsUsingNumber(String Scenario, Map<String, String> CacheMap) {
        String accountNo = cacheHelper.getCache(Scenario, CacheMap);
        accountMaster = arepo.findByAccNo(accountNo);
    }
    
    public ChequeBookRequestEntity findchequeBookRequestDetailsUsingNumber(String StoreInCache) {
        String accountNo = cacheHelper.getCache(StoreInCache, cacheData);
        accountMaster = arepo.findByAccNo(accountNo);
        chequeBookRequest = cbrepo.findByAccID(accountMaster.getAccId());
        if ((chequeBookRequest) != null) {
            return chequeBookRequest;
        } else {
            reportHelper
                    .writeLogInCaseOfFailInChildTest("Record Not Found in chequeBookRequest for accId " + accountNo);
            return null;
        }
    }
    
    public List<ChequeBookMasterEntity> findchequeBookMasterDetailsUsingAccNoAndStatus(String accountNo,
            String Status) {
        List<ChequeBookMasterEntity> chequeBookMasterList = new ArrayList<>();
        accountMaster = arepo.findByAccNo(accountNo);
        if ("E".equalsIgnoreCase(Status)) {
            chequeBookMasterList = cbmrepo.findByAccIDAndStatus(accountMaster.getAccId(), "E");
        } else {
            chequeBookMasterList = cbmrepo.findByAccIDAndStatus(accountMaster.getAccId(), "I");
        }
        if ((chequeBookMasterList) != null) {
            return chequeBookMasterList;
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest("Record Not Found in chequeBookMaster for accId " + accountNo);
            return null;
        }
    }
    
    public ChequeBookMasterEntity findchequeBookMasterDetailsUsingAccNo(String accountNo) {
        accountMaster = arepo.findByAccNo(accountNo);
        chequeBookMaster = cbmrepo.findByAccID(accountMaster.getAccId());
        return chequeBookMaster;
        
    }
    
    public ChequeBookDetailEntity getChqDetailsInfoByAccId(BigInteger accId) {
        ChequeBookDetailEntity chequeBookDetailEntity = cbdrepo.findByChequeBookId(cbmrepo.findByAccID(accId).getId());
        if ((chequeBookDetailEntity) != null) {
            return chequeBookDetailEntity;
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest("Record Not Found in chequeBookDetails for accId " + accId);
            return null;
        }
    }
    
    public ChequeBookDetailEntity getChqDetailsInfoByInstrumentNo(String instrumentNo, BigInteger transId) {
        ChequeBookDetailEntity chequeBookDetailEntity = cbdrepo.findByInstrumentNoAndTransId(instrumentNo, transId);
        if ((chequeBookDetailEntity) != null) {
            return chequeBookDetailEntity;
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest("Record Not Found in chequeBookDetails for instrumentNo "
                    + instrumentNo + " and trandID:" + transId);
            return null;
        }
    }
}
