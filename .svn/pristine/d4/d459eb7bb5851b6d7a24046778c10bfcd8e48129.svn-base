package com.sysnik.selenium.stepConfiguraiton;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.RemitInstrumentEntity;
import com.sysnik.selenium.entity.TransactionHeaderEntity;
import com.sysnik.selenium.fw.helper.AssertionHelper;
import com.sysnik.selenium.fw.helper.CacheHelper;
import com.sysnik.selenium.fw.helper.CommonMethodsForVerifications;
import com.sysnik.selenium.fw.helper.ConvertPropertyFileToMap;
import com.sysnik.selenium.fw.helper.DateHelper;
import com.sysnik.selenium.fw.helper.DbHelper;
import com.sysnik.selenium.fw.helper.DropDownHelper;
import com.sysnik.selenium.fw.helper.FindElement;
import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.fw.helper.RobotHelper;
import com.sysnik.selenium.fw.helper.SeleniumHelper;
import com.sysnik.selenium.fw.helper.WaitingHelper;
import com.sysnik.selenium.fw.testBase.TestBase;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;

public class CancelRemittanceInstrument extends TestBase {
    
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    FindElement findElement = AutomationObjectFactory.getFindElementInstance();
    DateHelper dateHelper = AutomationObjectFactory.getDateHelperInstance();
    SeleniumHelper seleniumHelper = AutomationObjectFactory.getSeleniumHelperInstance();
    ConvertPropertyFileToMap convertPropertyFileToMap = AutomationObjectFactory.getConvertPropertyFileToMapInstance();
    RobotHelper robotHelper = AutomationObjectFactory.getRobotHelperInstance();
    DropDownHelper dropDownHelper = AutomationObjectFactory.getDropDownHelperInstance();
    AssertionHelper assertionHelper = AutomationObjectFactory.getAssertionHelperInstance();
    CacheHelper cacheHelper = AutomationObjectFactory.getCacheHelperInstance();
    DbHelper dbHelper = AutomationObjectFactory.getDbHelperInstance();
    CommonMethodsForVerifications commonMethodsForVerifications = AutomationObjectFactory
            .getCommonMethodsForVerificationsInstance();
    WaitingHelper waitingHelper = AutomationObjectFactory.getWaitingHelperInstance();
    
    private RemitInstrumentEntity remitInstrument;
    private TransactionHeaderEntity transactionHeader;
    
    @Given("^user select Remittance Searial Number where \"([^\"]*)\" and beneficiary name \"([^\"]*)\" and instDate \"([^\"]*)\"$")
    public void user_select_Remittance_Searial_Number_where_and_beneficiary_name_and_instDate(String arg1, String arg2,
            String arg3) throws Throwable {
        String RemitSrNum = cacheHelper.getCache(arg1, cacheData);
        waitingHelper.sleep(3000);
        dropDownHelper.SelectUsingVisibleText("RemmitanceScreen_remittanceSrNum",
                RemitSrNum + " - " + arg2 + " - " + arg3);
        
    }
    
    @Given("^user enters cancel reason \"([^\"]*)\"$")
    public void user_enters_cancel_reason(String arg1) throws Throwable {
        seleniumHelper.enterText("RemmitanceScreen_cancelReason", arg1);
    }
    
    @Then("^verify \"([^\"]*)\" and \"([^\"]*)\" on Ui Originating and Payment Mode \"([^\"]*)\"$")
    public void verify_and_on_Ui_Originating_and_Payment_Mode(String arg1, String arg2, String arg3) throws Throwable {
        
        String RemitSrNum = cacheHelper.getCache(arg1, cacheData);
        assertionHelper.verifyTextEquals("Verifying ORIG_RESP Value with UI ", "RemmitanceScreen_orig", arg2);
        
        dbHelper.verifyUiAmountWithDb("//div//form[@name='cancelRemittanceInstrument']//input[@id='remittanceAmount']",
                "SELECT REMITTANCE_AMOUNT FROM REMIT_INSTRUMENT WHERE REMITTANCE_SRNO='" + RemitSrNum + "'");
        
        if ("Cash".equalsIgnoreCase(arg3)) {
            dbHelper.verifyUiTextWithDb(
                    "//div//form[@name='cancelRemittanceInstrument']//select[@id='cashTransfer']//option[2]",
                    "SELECT PAY_MODE FROM REMIT_INSTRUMENT WHERE REMITTANCE_SRNO='" + RemitSrNum + "'");
        } else {
            dbHelper.verifyUiTextWithDb(
                    "//div//form[@name='cancelRemittanceInstrument']//select[@id='cashTransfer']//option[3]",
                    "SELECT PAY_MODE FROM REMIT_INSTRUMENT WHERE REMITTANCE_SRNO='" + RemitSrNum + "'");
            
            dbHelper.verifyUiTextWithDb("//div//form[@name='cancelRemittanceInstrument']//input[@id='creditAccNo']",
                    "SELECT DR_ACCOUNT_NO FROM REMIT_INSTRUMENT WHERE REMITTANCE_SRNO='" + RemitSrNum + "'");
        }
        dbHelper.verifyUiTextWithDb("//div//form[@name='cancelRemittanceInstrument']//input[@id='remittanceSrNo']",
                "SELECT REMITTANCE_SRNO FROM REMIT_INSTRUMENT WHERE REMITTANCE_SRNO='" + RemitSrNum + "'");
        
        dbHelper.verifyUiDateWithDB("//div//form[@name='cancelRemittanceInstrument']//input[@id='staleDate']",
                "SELECT STALE_DT FROM REMIT_INSTRUMENT WHERE REMITTANCE_SRNO='" + RemitSrNum + "'");
        
        dbHelper.verifyUiTextWithDb("//div//form[@name='cancelRemittanceInstrument']//input[@id='beneficiaryName']",
                "SELECT BEN_NAME FROM REMIT_INSTRUMENT WHERE REMITTANCE_SRNO='" + RemitSrNum + "'");
        
        dbHelper.verifyUiTextWithDb("//div//form[@name='cancelRemittanceInstrument']//input[@id='beneficiaryBankCode']",
                "SELECT BANK_NAME FROM BANKPARAMETERS WHERE BANK_CODE IN (SELECT BENEF_BANK_CODE FROM REMIT_INSTRUMENT "
                        + "WHERE STATUS='A' AND REMITTANCE_SRNO='" + RemitSrNum + "')");
        
        dbHelper.verifyUiTextWithDb("//div//form[@name='cancelRemittanceInstrument']//input[@id='beneficiaryCityCode']",
                "SELECT CITY FROM BRANCHPARAMETERS WHERE BRANCHCODE IN (SELECT BENEF_BRANCH_CODE FROM REMIT_INSTRUMENT "
                        + "WHERE STATUS='A' AND REMITTANCE_SRNO='" + RemitSrNum + "')");
        
        dbHelper.verifyUiTextWithDb(
                "//div//form[@name='cancelRemittanceInstrument']//input[@id='beneficiaryBranchCode']",
                "SELECT BRANCHNAME FROM BRANCHPARAMETERS WHERE BRANCHCODE IN (SELECT BENEF_BRANCH_CODE FROM REMIT_INSTRUMENT "
                        + "WHERE STATUS='A' AND REMITTANCE_SRNO='" + RemitSrNum + "')");
        
        seleniumHelper.clickElement("RemmitanceScreen_submit");
        waitingHelper.sleep(1000);
    }
    
    @Then("^verify REMIT_INSTRUMENT Table After Cancel voucher_num \"([^\"]*)\" and tranType \"([^\"]*)\" and Pay_Mode \"([^\"]*)\" and RemitNumStoreInCache \"([^\"]*)\" and accNo \"([^\"]*)\" and cancelreason \"([^\"]*)\"$")
    public void verify_REMIT_INSTRUMENT_Table_After_Cancel_voucher_num_and_tranType_and_Pay_Mode_and_RemitNumStoreInCache_and_accNo_and_cancelreason(
            String arg1, String arg2, String arg3, String arg4, String arg5, String arg6) throws Throwable {
        
        String RemitSrNum = cacheHelper.getCache(arg4, cacheData);
        String RespondingVouchNum = cacheHelper.getCache(arg1, cacheData);
        long vNum = Long.parseLong(RespondingVouchNum);
        transactionHeader = transactionHeaderService.getTransactionHeaderdetailsByVoucherNumberAndTransType(vNum, arg2);
        
        remitInstrument = remitInstrumentService.findRemitInsrumentDataByRemitSrNumber(RemitSrNum);
        assertionHelper.verifyTwoTexts("Validate status in REMIT_INSTRUMENT Table: ", remitInstrument.getStatus(), "C");
        
        assertionHelper.verifyTwoTexts("Validate Cancel Reason in REMIT_INSTRUMENT Table: ",
                remitInstrument.getCancelReason(), arg6);
        
        String Canceldate = remitInstrument.getCancelDate().toString();
        String cdate = Canceldate.substring(0, 10);
        String cd1 = dateHelper.convetDateIntoSpecificFormat(cdate);
        assertionHelper.verifyTwoTexts("Validate Cancel Date in REMIT_INSTRUMENT Table: ", cd1,
                branchParametersService.getBnrachLiveDate(property.getProperty("BranchCode")).toString());
        
        assertionHelper.verifyTwoTexts("Validate Trans Type in Transaction_Header Table: ",
                transactionHeader.getTransType(), "T");
        
        assertionHelper.verifyTwoTexts("Validate RESP_VOUCHER_ID in REMIT_INSTRUMENT Table: " + RespondingVouchNum,
                remitInstrument.getRespondVoucherId().toString(), transactionHeader.getId().toString());
        
    }
}
