package com.sysnik.selenium.service;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.AccountMasterEntity;
import com.sysnik.selenium.entity.CustomerAccountEntity;
import com.sysnik.selenium.entity.CustomerMasterEntity;
import com.sysnik.selenium.entity.DepositMasterEntity;
import com.sysnik.selenium.entity.NomineeMasterEntity;
import com.sysnik.selenium.entity.ProductEntity;
import com.sysnik.selenium.entity.SIMasterEntity;
import com.sysnik.selenium.fw.helper.AssertionHelper;
import com.sysnik.selenium.fw.helper.CacheHelper;
import com.sysnik.selenium.fw.helper.CommonMethodsForVerifications;
import com.sysnik.selenium.fw.helper.ExcelHelper;
import com.sysnik.selenium.fw.helper.FilloExcelDataGetter;
import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.fw.testBase.TestBase;
import com.sysnik.selenium.repository.AccountMasterRepo;
import com.sysnik.selenium.repository.CategoryInterestRepo;
import com.sysnik.selenium.repository.CustomerAccountRepo;
import com.sysnik.selenium.repository.CustomerMasterRepo;
import com.sysnik.selenium.repository.DepIntRateRepo;
import com.sysnik.selenium.repository.DipositMasterRepo;
import com.sysnik.selenium.repository.NomineeMasterRepo;
import com.sysnik.selenium.repository.ProductRepo;
import com.sysnik.selenium.repository.SIMasterRepo;

@Service("accountService")
public class AccountService extends TestBase {
    FilloExcelDataGetter filloExcelDataGetter = new FilloExcelDataGetter();
    @Autowired
    private AccountMasterRepo arepo;
    @Autowired
    private CustomerMasterRepo cmrepo;
    @Autowired
    private DipositMasterRepo dmrepo;
    @Autowired
    private CustomerAccountRepo custAccRepo;
    @Autowired
    private SIMasterRepo siRepo;
    @Autowired
    private NomineeMasterRepo nomineeRepo;
    @Autowired
    private ProductRepo prdRepo;
    @Autowired
    private DepIntRateRepo depIntRateRepo;
    @Autowired
    private CategoryInterestRepo catIntRepo;
    private CustomerAccountService customerAccountService;
    private CustomerMasterEntity customerMaster;
    private AccountMasterEntity accountMaster;
    private DepositMasterEntity depositMaster;
    private List<CustomerAccountEntity> customerAccount;
    private CustomerAccountEntity custAccount;
    private SIMasterEntity siMaster;
    private NomineeMasterEntity nomineeMaster;
    private ProductEntity product;
    private DepIntRateService depIntRateService;
    private CategoryInterestService categoryInterestService;
    AssertionHelper assertionHelper = AutomationObjectFactory.getAssertionHelperInstance();
    ExcelHelper excelHelper = AutomationObjectFactory.getExcelHelperInstance();
    TestBase testBase = new TestBase();
    CacheHelper cacheHelper = AutomationObjectFactory.getCacheHelperInstance();
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    Map<String, String> excelData = new HashMap<String, String>();
    CommonMethodsForVerifications commonMethodsForVerifications = AutomationObjectFactory
            .getCommonMethodsForVerificationsInstance();
    
    public AccountMasterEntity findAccountDetailsUsingNumber(String Scenario, Map<String, String> CacheMap) {
        String accountNo = cacheHelper.getCache(Scenario, CacheMap);
        accountMaster = arepo.findByAccNo(accountNo);
        if (accountMaster != null) {
            return accountMaster;
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest("Record not found in accountMaster with accNo " + accountNo);
            return null;
        }
        
    }
    
    public void verifyAccountMasterStatusAfterAuth(String Scenario, Map<String, String> CacheMap,
            String expectedStatus) {
        String userAccNo = cacheHelper.getCache(Scenario, CacheMap);
        
        custAccount = custAccRepo.findByUserAccNoAndOperator(userAccNo, "A");
        accountMaster = getAccountMasterDetailsByAccNo(custAccount.getAccNo());
        
        if (accountMaster != null) {
            assertionHelper.verifyTwoTexts("Verify Account Master , STATUS ", accountMaster.getStatus(),
                    expectedStatus);
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest(
                    "Record Not found in account Master with Acc number " + accountMaster.getAccNo());
        }
    }
    
    public void accountMasterVerification(String excelSheetName, String Scenario, Map<String, String> CacheMap,
            Map<String, String> excelMap) {
        String userAccNo = cacheHelper.getCache(Scenario, CacheMap);
        custAccount = custAccRepo.findByUserAccNoAndOperator(userAccNo, "A");
        String accountNo = custAccount.getAccNo();
        /*
         * List<String> fristRowDat = excelHelper.getCompleteRowData( testBase.relativePath() +
         * "\\src\\main\\resources\\GlobalDataProvider\\dataProvider.xls", excelSheetName);
         */
        
        if (accountNo != null) {
            accountMaster = arepo.findByAccNo(accountNo);
            customerMaster = cmrepo.findByCustId(accountMaster.getCustId());
            depositMaster = dmrepo.findByAccId(accountMaster.getAccId());
            customerAccount = custAccRepo.findByAccId(accountMaster.getAccId());
            product = prdRepo.findByProdId(accountMaster.getPrdId());
            String custNumber = customerMaster.getCustNumber();
            
            /*
             * for (String colName : fristRowDat) { excelData.put(colName,
             * filloExcelDataGetter.getDataFromaColumnOfAnExcellSheet( "select * from " + excelSheetName + "" +
             * " where Scenario='" + Scenario + "'", colName)); }
             */
            excelData = commonMethodsForVerifications.loadExcelDataIntoMap(excelSheetName, Scenario, excelMap);
            
            /*
             * if ("Y".equalsIgnoreCase(excelData.get("INTRODUCERISCUSTOMER"))) {
             * assertionHelper.verifyTextEquals("//input[@id='introducerNum']", cmrepo.findByCustId(new
             * BigInteger(customerMaster.getIntroducerCustomer())).getCustNumber() + ""); }
             */
            assertionHelper.verifyTwoTexts("STATUS", accountMaster.getStatus(), "E");
            
            assertionHelper.verifyTwoAmounts("LedgerBal", accountMaster.getLedgerBal() + "", "0");
            
            assertionHelper.verifyTwoAmounts("AvailableBal", accountMaster.getAvailableBal() + "", "0");
            
            assertionHelper.verifyTwoAmounts("ShadowBal", accountMaster.getShadowBal() + "", "0");
            
            assertionHelper.verifyTwoAmounts("UnclearedBalCR", accountMaster.getUnclearBalCr() + "", "0");
            
            assertionHelper.verifyTwoAmounts("UnclearedBalDR", accountMaster.getUnclearBalDr() + "", "0");
            
            assertionHelper.verifyTwoAmounts("DaysOpngBal", accountMaster.getDaysOpeningBal() + "", "0");
            
            assertionHelper.verifyTwoAmounts("FreezeAmt", accountMaster.getFreezeAmt() + "", "0");
            
            assertionHelper.verifyTwoTexts("Freeze", accountMaster.getFreeze() + "", "N");
            assertionHelper.verifyTwoTexts("custNumber", customerMaster.getCustId() + "",
                    accountMaster.getCustId() + "");
            if ("self".equalsIgnoreCase(filloExcelDataGetter.getDataFromaColumnOfAnExcellSheet(
                    "select * from " + excelSheetName + "" + " where Scenario='" + Scenario + "'", "natureOfAcc"))) {
                assertionHelper.verifyTwoTexts("Verifing accountNo in custAcc table ",
                        customerAccount.get(0).getAccNo(), accountNo);
                assertionHelper.verifyTwoTexts("Verifing custId in custAcc table ",
                        customerAccount.get(0).getCustId() + "", accountMaster.getCustId() + "");
                assertionHelper.verifyTwoTexts("Verifing PART_OFF Column in custAcc table ",
                        customerAccount.get(0).getPartOff(), "A");
            }
            
            else {
                assertionHelper.verifyTwoTexts("Verifing accountNo in custAcc table ",
                        customerAccount.get(0).getAccNo(), accountNo);
                assertionHelper.verifyTwoTexts("Verifing custId in custAcc table ",
                        customerAccount.get(0).getCustId() + "", accountMaster.getCustId() + "");
                assertionHelper.verifyTwoTexts(
                        "Verifing PART_OFF Column in custAcc table of Cust_id :: " + customerAccount.get(0).getCustId(),
                        customerAccount.get(0).getPartOff(), "A");
                assertionHelper.verifyTwoTexts("Verifing custId in custAcc table for other operator",
                        customerAccount.get(1).getCustId() + "",
                        cmrepo.findByCustNumber(filloExcelDataGetter.getDataFromaColumnOfAnExcellSheet(
                                "select * from " + excelSheetName + "" + " where Scenario='" + Scenario + "'",
                                "OtherOperatorNumber")).getCustId() + "");
                assertionHelper.verifyTwoTexts(
                        "Verifing PART_OFF Column in custAcc table of custId :: " + customerAccount.get(1).getCustId(),
                        customerAccount.get(1).getPartOff(),
                        filloExcelDataGetter.getDataFromaColumnOfAnExcellSheet(
                                "select * from " + excelSheetName + "" + " where Scenario='" + Scenario + "'",
                                "OtherOperator"));
                
            }
            if ("SB".equalsIgnoreCase(filloExcelDataGetter.getDataFromaColumnOfAnExcellSheet(
                    "select * from " + excelSheetName + "" + " where Scenario='" + Scenario + "'", "accType"))
                    || "CA".equalsIgnoreCase(filloExcelDataGetter.getDataFromaColumnOfAnExcellSheet(
                            "select * from " + excelSheetName + "" + " where Scenario='" + Scenario + "'",
                            "accType"))) {
                assertionHelper.verifyTwoTexts("Verifing IntRate in DepMaster & Product", product.getIntRate() + "",
                        depositMaster.getIntRate() + "");
            } else {
                assertionHelper.verifyTwoTexts("Verifing IntRate in DepMaster & depIntRate & CatIntRate",
                        depositMaster.getIntRate() + "",
                        TestBase.depIntRateService
                                .getIntRateByProductCode(excelData.get("productName"),
                                        new BigDecimal(excelData.get("installAmt")),
                                        new BigDecimal(excelData.get("installAmt")),
                                        Integer.valueOf(excelData.get("depPeriodDays")),
                                        Integer.valueOf(excelData.get("depPeriodDays")),
                                        Integer.valueOf(excelData.get("depPeriodMonths")),
                                        Integer.valueOf(excelData.get("depPeriodMonths")))
                                .add(TestBase.categoryInterestService.getIntRateByCustNumber(
                                        excelData.get("custNumber"), excelData.get("productName")))
                                + "");
                assertionHelper.verifyTwoAmounts("Verifing Installment amount", depositMaster.getInstallAmt() + "",
                        excelData.get("installAmt"));
            }
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest("Account No is not found with given number: " + accountNo);
        }
    }
    
    public void nomineeMasterVerificationInDDopng(String excelSheetName, String Scenario,
            Map<String, String> CacheMap) {
        String userAccNo = cacheHelper.getCache(Scenario, CacheMap);
        custAccount = custAccRepo.findByUserAccNoAndOperator(userAccNo, "A");
        String accountNo = custAccount.getAccNo();
        if (accountNo != null) {
            accountMaster = arepo.findByAccNo(accountNo);
            nomineeMaster = nomineeRepo.findByAccID(accountMaster.getAccId());
            if (nomineeMaster != null) {
                List<String> fristRowDat = excelHelper.getCompleteRowData(
                        testBase.relativePath() + "\\src\\main\\resources\\GlobalDataProvider\\dataProvider.xls",
                        excelSheetName);
                for (String colName : fristRowDat) {
                    excelData.put(colName, filloExcelDataGetter.getDataFromaColumnOfAnExcellSheet(
                            "select * from " + excelSheetName + "" + " where Scenario='" + Scenario + "'", colName));
                }
                assertionHelper.verifyTwoTexts("AccId in Nominee MASTER", nomineeMaster.getAccID() + "",
                        accountMaster.getAccId() + "");
                
                assertionHelper.verifyTwoTexts("Nominee Name in Nominee MASTER", nomineeMaster.getNomName(),
                        excelData.get("SInomName"));
                assertionHelper.verifyTwoTexts("Status in Nominee MASTER", nomineeMaster.getStatus(), "E");
                
            } else {
                reportHelper.writeLogInCaseOfFailInChildTest(
                        "nominee Master record is not found with given AccID: " + accountMaster.getAccId());
            }
            
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest("Account No is not found with given number: " + accountNo);
        }
        
    }
    
    public void siMasterVerficationInDDAccOpng(String excelSheetName, String Scenario, Map<String, String> CacheMap) {
        String userAccNo = cacheHelper.getCache(Scenario, CacheMap);
        custAccount = custAccRepo.findByUserAccNoAndOperator(userAccNo, "A");
        String accountNo = custAccount.getAccNo();
        if (accountNo != null) {
            accountMaster = arepo.findByAccNo(accountNo);
            siMaster = siRepo.findByFromAccId(accountMaster.getAccId());
            if (siMaster != null) {
                List<String> fristRowDat = excelHelper.getCompleteRowData(
                        testBase.relativePath() + "\\src\\main\\resources\\GlobalDataProvider\\dataProvider.xls",
                        excelSheetName);
                for (String colName : fristRowDat) {
                    excelData.put(colName, filloExcelDataGetter.getDataFromaColumnOfAnExcellSheet(
                            "select * from " + excelSheetName + "" + " where Scenario='" + Scenario + "'", colName));
                }
                assertionHelper.verifyTwoTexts("FROMAccId in SI_MATER", siMaster.getFromAccId() + "",
                        accountMaster.getAccId() + "");
                
                assertionHelper.verifyTwoTexts("ToAccId in SI_MATER", siMaster.getToAccId() + "",
                        arepo.findByAccNo(excelData.get("SIToAccount")).getAccId() + "");
                assertionHelper.verifyTwoAmounts("SI Amount in SI_MASTER ", siMaster.getTransAmt() + "",
                        excelData.get("SIAmount"));
            } else {
                reportHelper.writeLogInCaseOfFailInChildTest(
                        "SI No is not found with given FromAccID: " + accountMaster.getAccId());
            }
            
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest("Account No is not found with given number: " + accountNo);
        }
        
    }
    
    public AccountMasterEntity getAccountMasterDetailsByAccNo(String accNo) {
        AccountMasterEntity accountMasterEntity = arepo.findByAccNo(accNo);
        if (accountMasterEntity != null) {
            return accountMasterEntity;
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest("Record not found in accountmaster with accNo " + accNo);
            return null;
        }
    }
    
    public String getAccountMasterByAccNo(String accNo) {
        AccountMasterEntity accountMasterEntity = arepo.findByAccNo(accNo);
        if (accountMasterEntity != null) {
            return accountMasterEntity.getAccNo();
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest("Record not found in accountmaster with accNo " + accNo);
            return null;
        }
    }
}
