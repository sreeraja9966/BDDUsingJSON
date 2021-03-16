package com.sysnik.selenium.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.AccountMasterEntity;
import com.sysnik.selenium.entity.BranchParametersEntity;
import com.sysnik.selenium.entity.CustomerAccountEntity;
import com.sysnik.selenium.entity.CustomerMasterEntity;
import com.sysnik.selenium.entity.FreezeDetailsEntity;
import com.sysnik.selenium.entity.ProductEntity;
import com.sysnik.selenium.fw.helper.AssertionHelper;
import com.sysnik.selenium.fw.helper.CacheHelper;
import com.sysnik.selenium.fw.helper.ExcelHelper;
import com.sysnik.selenium.fw.helper.FilloExcelDataGetter;
import com.sysnik.selenium.fw.testBase.TestBase;
import com.sysnik.selenium.repository.AccountMasterRepo;
import com.sysnik.selenium.repository.BranchParametersRepo;
import com.sysnik.selenium.repository.CustomerAccountRepo;
import com.sysnik.selenium.repository.CustomerMasterRepo;
import com.sysnik.selenium.repository.FreezeDetailsRepo;
import com.sysnik.selenium.repository.ProductRepo;

@Service("FreezeDetailsService")
public class FreezeDetailsService extends TestBase {
    
    FilloExcelDataGetter filloExcelDataGetter = new FilloExcelDataGetter();
    @Autowired
    private AccountMasterRepo amrepo;
    @Autowired
    private CustomerMasterRepo cmrepo;
    @Autowired
    private CustomerAccountRepo custAccRepo;
    @Autowired
    private ProductRepo prdRepo;
    @Autowired
    private FreezeDetailsRepo fdrepo;
    @Autowired
    private BranchParametersRepo bprepo;
    
    private CustomerMasterEntity customerMaster;
    
    private List<CustomerAccountEntity> customerAccount;
    private ProductEntity product;
    private AccountMasterEntity accountMaster;
    private FreezeDetailsEntity freezeDetails;
    private BranchParametersEntity branchParameters;
    
    AssertionHelper assertionHelper = AutomationObjectFactory.getAssertionHelperInstance();
    ExcelHelper excelHelper = AutomationObjectFactory.getExcelHelperInstance();
    TestBase testBase = new TestBase();
    CacheHelper cacheHelper = AutomationObjectFactory.getCacheHelperInstance();
    
    List<String> fristRowDat = excelHelper.getCompleteRowData(
            testBase.relativePath() + "\\src\\main\\resources\\GlobalDataProvider\\dataProvider.xls",
            "FreezeCustomerAccount");
    
    public void customerFreezeEntryVerification(String scenario, Map<String, String> cacheMap) {
        
        String custNumber = excelData.get(scenario + "_" + "custNumber");
        
        customerMaster = cmrepo.findByCustNumber(custNumber);
        freezeDetails = fdrepo.findByCustIdAndFreezeStatusAndFreezeType(customerMaster.getCustId(),
                excelData.get(scenario + "_" + "expectedFreezeStatus"),
                excelData.get(scenario + "_" + "dbFreezeTableFreezeValue"));
        
        cacheHelper.setCacheWithaString(scenario + "_" + "batch", freezeDetails.getBatchNo() + "", cacheMap);
        
        customerAccount = custAccRepo.findByCustIdAndOperator(customerMaster.getCustId(), "A");
        
        for (String colName : fristRowDat) {
            excelData.put(colName, filloExcelDataGetter.getDataFromaColumnOfAnExcellSheet(
                    "select * from " + "FreezeCustomerAccount" + "" + " where Scenario='" + scenario + "'", colName));
            
        }
        
        assertionHelper.verifyTwoTexts("Verifying Cust ID in Customer Account table ",
                customerMaster.getCustId().toString(), freezeDetails.getCustId().toString());
        
        if ("C".equals(excelData.get("relatedTo"))) {
            assertionHelper.verifyTwoTexts("Validate Customer Status in Cust_Master Table After Freeze Entry ",
                    customerMaster.getStatus(), "M");
        } else {
            assertionHelper.verifyTwoTexts("Validate Customer Status in Cust_Master Table After Freeze Entry ",
                    customerMaster.getStatus(), "A");
        }
        
        assertionHelper.verifyTwoTexts("Validate Customer Freeze Value in Cust_Master Table After Freeze Entry ",
                customerMaster.getFreeze(), excelData.get("dbCustFreezeValue"));
        
        assertionHelper.verifyTwoTexts("Freeze Status in Freeze_Details Table After Freeze Entry ",
                freezeDetails.getFreezeStatus(), "E");
        
        assertionHelper.verifyTwoTexts("Freeze Value in Freeze_Details Table ", freezeDetails.getFreezeType(),
                excelData.get("dbFreezeTableFreezeValue"));
        
        assertionHelper.verifyTwoTexts("Freeze Reason in Freeze_Details Table After Freeze Entry ",
                freezeDetails.getFreezeReason(), excelData.get("freezeReason"));
        
        assertionHelper.verifyTwoTexts("Batch Number in Freeze_Details Table After Freeze Entry ",
                freezeDetails.getBatchNo().toString(), cacheHelper.getCache(scenario + "_batch", cacheMap));
        
        // assertionHelper.verifyTwoTexts("Validate Freeze Date in Freeze_Details Table ", //
        // freezeDetails.getFreezeDate().toString(), branchParameters.getCurrentDate().toString());
        
    }
    
    public List<AccountMasterEntity> getCustomerAccountDetails(String custNumber) {
        List<AccountMasterEntity> accountMasterList = new ArrayList<>();
        customerMaster = cmrepo.findByCustNumber(custNumber);
        customerAccount = custAccRepo.findByCustIdAndOperator(customerMaster.getCustId(), "A");
        
        for (CustomerAccountEntity objcustomerAccount : customerAccount) {
            AccountMasterEntity objAccountMaster = amrepo.findByAccId(objcustomerAccount.getAccId());
            accountMasterList.add(objAccountMaster);
        }
        return accountMasterList;
    }
    
    public FreezeDetailsEntity getFrezzeDetailsByCustId(String custNumber) {
        List<FreezeDetailsEntity> freezeDetailsList = new ArrayList<>();
        customerMaster = cmrepo.findByCustNumber(custNumber);
        freezeDetailsList = fdrepo.findByCustId(customerMaster.getCustId());
        FreezeDetailsEntity id = freezeDetailsList.get(freezeDetailsList.size() - 1);
        return id;
        
    }
    
    public FreezeDetailsEntity getRevokeDetailsByCustId(String custNumber) {
        List<FreezeDetailsEntity> freezeDetailsList = new ArrayList<>();
        customerMaster = cmrepo.findByCustNumber(custNumber);
        freezeDetailsList = fdrepo.findByCustId(customerMaster.getCustId());
        return freezeDetailsList.get(0);
    }
    
    public void customerRevokeEntryVerification(String Scenario, Map<String, String> cacheMap) {
        
        String custNumber = excelData.get(Scenario + "_" + "custNumber");
        
        customerMaster = cmrepo.findByCustNumber(custNumber);
        freezeDetails = fdrepo.findByCustIdAndFreezeStatusAndFreezeType(customerMaster.getCustId(),
                excelData.get(Scenario + "_" + "expectedFreezeStatus"),
                excelData.get(Scenario + "_" + "dbFreezeTableFreezeValue"));
        customerAccount = custAccRepo.findByCustIdAndOperator(customerMaster.getCustId(), "A");
        
        for (String colName : fristRowDat) {
            excelData
                    .put(colName,
                            filloExcelDataGetter.getDataFromaColumnOfAnExcellSheet("select * from "
                                    + "RevokeFreezeCustomerAccount" + "" + " where Scenario='" + Scenario + "'",
                                    colName));
        }
        assertionHelper.verifyTwoTexts("Verifying Cust ID in Customer Account table ",
                customerMaster.getCustId().toString(), freezeDetails.getCustId().toString());
        
        assertionHelper.verifyTwoTexts("Validate Customer Status in Cust_Master Table After Revoke Entry ",
                customerMaster.getStatus(), "A");
        
        assertionHelper.verifyTwoTexts("Validate Customer Freeze Value in Cust_Master Table After Revoke Entry ",
                customerMaster.getFreeze(), excelData.get("dbCustFreezeValue"));
        
        assertionHelper.verifyTwoTexts("Validate Freeze Status in Freeze_Details Table After Revoke Entry ",
                freezeDetails.getFreezeStatus(), "D");
        
        assertionHelper.verifyTwoTexts("Validate Freeze Value in Freeze_Details Table ", freezeDetails.getFreezeType(),
                excelData.get("dbFreezeTableFreezeValue"));
        
        //  assertionHelper.verifyTwoTexts("Validate Revoke Date in Freeze_Details Table ",
        // freezeDetails.getRevokeDate().toString(), branchParameters.getCurrentDate().toString());
        
    }
    
    public List<FreezeDetailsEntity> getBlacklistFrezzeDetailsByCustId(String custNumber) {
        List<FreezeDetailsEntity> freezeDetailsList = new ArrayList<>();
        customerMaster = cmrepo.findByCustNumber(custNumber);
        freezeDetailsList = fdrepo.findByCustId(customerMaster.getCustId());
        return freezeDetailsList;
        
    }
    
    public List<AccountMasterEntity> getBlacklistCustomerAccountDetails(String custNumber) {
        List<AccountMasterEntity> accountMasterList = new ArrayList<>();
        customerMaster = cmrepo.findByCustNumber(custNumber);
        customerAccount = custAccRepo.findByCustIdAndOperator(customerMaster.getCustId(), "A");
        
        for (CustomerAccountEntity objcustomerAccount : customerAccount) {
            AccountMasterEntity objAccountMaster = amrepo.findByAccId(objcustomerAccount.getAccId());
            accountMasterList.add(objAccountMaster);
        }
        return accountMasterList;
    }
    
}
