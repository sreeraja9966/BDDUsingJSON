package com.sysnik.selenium.stepConfiguraiton;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.AccountMasterEntity;
import com.sysnik.selenium.entity.BeneficiaryDetailsEntity;
import com.sysnik.selenium.entity.ChequeBookDetailEntity;
import com.sysnik.selenium.entity.ChequeBookMasterEntity;
import com.sysnik.selenium.entity.CustomerMasterEntity;
import com.sysnik.selenium.entity.RemitInstrumentEntity;
import com.sysnik.selenium.entity.RemitParameterEntity;
import com.sysnik.selenium.entity.RtgsNeftOutwardEntity;
import com.sysnik.selenium.entity.TransactionEntity;
import com.sysnik.selenium.entity.TransactionHeaderEntity;
import com.sysnik.selenium.entity.TransactionsDetailEntity;
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

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class RemittanceInstrumentIssue extends TestBase {
    
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    FindElement findElement = AutomationObjectFactory.getFindElementInstance();
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
    DateHelper dateHelper = AutomationObjectFactory.getDateHelperInstance();
    CommonDefnitions commonDefnitions = new CommonDefnitions();
    private TransactionHeaderEntity transactionHeader;
    private RemitInstrumentEntity remitInstrument;
    private RemitParameterEntity remitParameter;
    private AccountMasterEntity accMaster;
    private RtgsNeftOutwardEntity rtgsNeftOutward;
    private CustomerMasterEntity custMaster;
    private ChequeBookMasterEntity chequeBookMaster;
    private ChequeBookDetailEntity chequeBookDetail;
    private BeneficiaryDetailsEntity benefDetails;
    
    @Given("^User creates a parentReport \"([^\"]*)\"$")
    public void user_creates_a_parentReport(String arg1) throws Throwable {
        
        reportHelper.appendToExstingReport(arg1);
        waitingHelper.sleep(3000);
        dbHelper.executeQuery("DELETE FROM REMIT_INSTRUMENT WHERE STATUS='E'");
        dbHelper.executeQuery(
                "UPDATE ACCOUNT_MASTER SET PROD_INSERT_YN='N', SHADOW_BAL=0 , AVAILABLE_BAL=400000, LEDGER_BAL=400000 WHERE ACC_NO IN ('101210101010000100','101210101000000560','101210101100000404','101210101100000405','101210101100000933','101210101100000934','101210101100000935','101210101100000936')");
        dbHelper.executeQuery(
                "UPDATE CHEQUE_BOOK_DETAIL SET STATUS='I' WHERE STATUS='P' AND CHEQUE_BOOK_ID IN (SELECT ID FROM CHEQUE_BOOK_MASTER WHERE ACC_ID IN (50001,50002,52683,52684))");
        
        dbHelper.executeQuery(
                "DELETE FROM rtgs_neft_outward WHERE acc_number IN ('101210101100000933','101210101100000934','101210101100000935','101210101100000936')");
        dbHelper.executeQuery("DELETE FROM BENEFICIARY_DETAILS WHERE BENEF_ACC_NO IN ('101210101100000408')");
    }
    
    @Given("^user opens a testCase Remittance Instrument Issue \"([^\"]*)\"$")
    public void user_opens_a_testCase_Remittance_Instrument_Issue(String arg1) throws Throwable {
        commonDefnitions.user_opnes_a_testCase(arg1);
    }
    
    @Given("^user select \"([^\"]*)\" PO or DD$")
    public void user_select_PO_or_DD(String arg1) throws Throwable {
        waitingHelper.sleep(3000);
        dropDownHelper.SelectUsingVisibleText("RemmitanceScreen_remittanceType", arg1);
    }
    
    @Then("^Verify \"([^\"]*)\" on Ui Originating$")
    public void verify_on_Ui_Originating(String arg1) throws Throwable {
        
        assertionHelper.verifyTextEquals("Verify ORIG_RESP on Ui", "RemmitanceScreen_orig", arg1);
    }
    
    @Then("^user select \"([^\"]*)\" Cash or Transfer$")
    public void user_select_Cash_or_Transfer(String arg1) throws Throwable {
        
        dropDownHelper.SelectUsingVisibleText("RemmitanceScreen_paymentMode", arg1);
    }
    
    @Then("^user enters \"([^\"]*)\"$")
    public void user_enters(String arg1) throws Throwable {
        
        seleniumHelper.enterText("RemmitanceScreen_remittanceAmount", arg1);
    }
    
    @Then("^verify Remittance Commition \"([^\"]*)\" and CGST \"([^\"]*)\" and SGST \"([^\"]*)\" where chargeTypeId \"([^\"]*)\"$")
    public void verify_Remittance_Commition_and_CGST_and_SGST_where_chargeTypeId(String arg1, String arg2, String arg3,
            String arg4) throws Throwable {
        
        BigInteger chargeTypeId = new BigInteger(arg4);
        String chargeCode = chargesTypeMasterService.findChargesTypeMasterData(chargeTypeId);
        if (chargeCode.equalsIgnoreCase("DDISSUE")) {
            waitingHelper.sleep(2000);
            assertionHelper.verifyTextEquals("Verify Remittance Commision on Ui ", "RemmitanceScreen_commission", arg1);
            assertionHelper.verifyTextEquals("Verify CGST on Ui ", "RemmitanceScreen_CGSTKey", arg2);
            assertionHelper.verifyTextEquals("Verify SGST on Ui ", "RemmitanceScreen_SGSTKey", arg3);
        }
    }
    
    @Then("^Verify \"([^\"]*)\" Yes or No$")
    public void verify_Yes_or_No(String arg1) throws Throwable {
        if ("Y".equalsIgnoreCase(arg1)) {
            seleniumHelper.clickElement("RemmitanceScreen_payableAtParY");
        } else {
            seleniumHelper.clickElement("RemmitanceScreen_payableAtParN");
        }
    }
    
    @And("^user enters beneficiary name \"([^\"]*)\"$")
    public void user_enters_beneficiary_name(String arg1) throws Throwable {
        seleniumHelper.enterText("RemmitanceScreen_beneficiaryName", arg1);
    }
    
    @Then("^Verify \"([^\"]*)\" is BRANCHPARAMETERS Logged In Branch Current_DT$")
    public void verify_is_BRANCHPARAMETERS_Logged_In_Branch_Current_DT(String arg1) throws Throwable {
        assertionHelper.verifyCalendarText("Verify Create Date On Ui", "RemmitanceScreen_createDate",
                branchParametersService.getBnrachLiveDate(arg1).toString());
    }
    
    @Then("^Verify \"([^\"]*)\" is BANKPARAMETERS Logged In Bank BANK_NAME$")
    public void verify_is_BANKPARAMETERS_Logged_In_Bank_BANK_NAME(String arg1) throws Throwable {
        waitingHelper.sleep(500);
        assertionHelper.verifyTextEquals("Verify Bank Name on Ui", "RemmitanceScreen_micrBankCode", arg1);
    }
    
    @Then("^Verify \"([^\"]*)\" is BRANCHPARAMETERS Logged In Branch CITY$")
    public void verify_is_BRANCHPARAMETERS_Logged_In_Branch_CITY(String arg1) throws Throwable {
        waitingHelper.sleep(3000);
        assertionHelper.verifyTextEquals("Verify Bank City Name on Ui", "RemmitanceScreen_micrCityCode", arg1);
    }
    
    @Then("^Verify \"([^\"]*)\" is BRANCHPARAMETERS Logged In Branch BRANCHNAME$")
    public void verify_is_BRANCHPARAMETERS_Logged_In_Branch_BRANCHNAME(String arg1) throws Throwable {
        assertionHelper.verifyTextEquals("Verify Branch Name on Ui", "RemmitanceScreen_MicrBranchCode", arg1);
    }
    
    @Then("^user click on Remittance Instrument Issue Screen submit$")
    public void user_click_on_Remittance_Instrument_Issue_Screen_submit() throws Throwable {
        seleniumHelper.clickElement("RemmitanceScreen_submit");
    }
    
    @When("^user click on Remittance Instrument Issue Screen confirm$")
    public void user_click_on_Remittance_Instrument_Issue_Screen_confirm() throws Throwable {
        seleniumHelper.clickElement("RemmitanceScreen_confirmButton");
        waitingHelper.sleep(3000);
    }
    
    @Then("^store voucher number on model with name \"([^\"]*)\" and \"([^\"]*)\"$")
    public void store_voucher_number_on_model_with_name_and(String arg1, String arg2) throws Throwable {
        commonDefnitions.store_number_on_model_with_name_and(arg1, arg2);
    }
    
    @Then("^user find remittance \"([^\"]*)\"$")
    public void user_find_remittance(String arg1) throws Throwable {
        commonMethodsForVerifications.verifyAndSubmitModel(arg1);
    }
    
    @Then("^verify Transaction_Details Table TRANS_AMT \"([^\"]*)\" accNo \"([^\"]*)\"  where voucher_num \"([^\"]*)\" and tranType \"([^\"]*)\" and Remittance Commition \"([^\"]*)\" and CGST \"([^\"]*)\" and SGST \"([^\"]*)\" and AddingChargesAmount \"([^\"]*)\"$")
    public void verify_Transaction_Details_Table_TRANS_AMT_accNo_where_voucher_num_and_tranType_and_Remittance_Commition_and_CGST_and_SGST_and_AddingChargesAmount(
            String arg1, String arg2, String arg3, String arg4, String arg5, String arg6, String arg7, String arg8)
            throws Throwable {
        
        String vouchNo = cacheHelper.getCache(arg3, cacheData);
        long vNum = Long.parseLong(vouchNo);
        if ("D".equalsIgnoreCase(arg4)) {
            
            transactionHeader = transactionHeaderService.getTransactionHeaderdetailsByVoucherNumberAndTransType(vNum,
                    arg4);
        } else {
            transactionHeader = transactionHeaderService.getTransactionDetailsUsingParentVoucher(vNum);
        }
        long id = transactionHeader.getId();
        BigInteger TransId = BigInteger.valueOf(id);
        List<TransactionsDetailEntity> transDetailsList = new ArrayList<>();
        transDetailsList = transactionsDetailService.getListOfTransDetailsRecordsById(TransId);
        
        if (transactionHeader.getTransType().equals("D")) {
            assertionHelper.verifyTwoAmounts("Verifying Remittance Amount in Transaction Details ",
                    transDetailsList.get(0).getTransactionAmount().toString(), arg1);
            assertionHelper.verifyTwoAmounts("Verifying Remmitance Commision amount  in Transaction Details ",
                    transDetailsList.get(3).getTransactionAmount().toString(), arg5);
            assertionHelper.verifyTwoAmounts("Verifying CGST Amount  in Transaction Details ",
                    transDetailsList.get(1).getTransactionAmount().toString(), arg6);
            assertionHelper.verifyTwoAmounts("Verifying SGST amount  in Transaction Details",
                    transDetailsList.get(2).getTransactionAmount().toString(), arg7);
            
        } else {
            
            assertionHelper.verifyTwoAmounts(
                    "Verifying Remittance Amount Credited to Account Number " + arg2 + " in Transaction Details ",
                    transDetailsList.get(3).getTransactionAmount().toString(), arg8);
            assertionHelper.verifyTwoAmounts("Verifying Remmitance Commision Amount  in Transaction Details ",
                    transDetailsList.get(2).getTransactionAmount().toString(), arg5);
            assertionHelper.verifyTwoAmounts("Verifying CGST amount  in Transaction Details",
                    transDetailsList.get(0).getTransactionAmount().toString(), arg6);
            assertionHelper.verifyTwoAmounts("Verifying SGST amount  in Transaction Details ",
                    transDetailsList.get(1).getTransactionAmount().toString(), arg7);
        }
    }
    
    @Then("^verify REMIT_INSTRUMENT Table Remittance_AMT \"([^\"]*)\" Pay_Mode \"([^\"]*)\"  where voucher_num \"([^\"]*)\" and ORIG_RESP \"([^\"]*)\"  and tranType \"([^\"]*)\" and remittanceType \"([^\"]*)\" and beneficiaryName \"([^\"]*)\" and accNo \"([^\"]*)\" Denom Y$")
    public void verify_REMIT_INSTRUMENT_Table_Remittance_AMT_Pay_Mode_where_voucher_num_and_ORIG_RESP_and_tranType_and_remittanceType_and_beneficiaryName_and_accNo_Denom_Y(
            String arg1, String arg2, String arg3, String arg4, String arg5, String arg6, String arg7, String arg8)
            throws Throwable {
        
        String vouchNo = cacheHelper.getCache(arg3, cacheData);
        long vNum = Long.parseLong(vouchNo);
        transactionHeader = transactionHeaderService.getTransactionHeaderdetailsByVoucherNumberAndTransType(vNum, arg5);
        BigInteger bigIntegerVouchNo = new BigInteger(vouchNo);
        remitInstrument = remitInstrumentService.findRemitInsrumentData(bigIntegerVouchNo, arg5);
        remitParameter = remitParameterService.findRemitParameterDetails(bigIntegerVouchNo, arg5);
        
        if (remitInstrument.getStatus().equals("N")) {
            assertionHelper.verifyTwoTexts("Validate status in REMIT_INSTRUMENT Table: ", remitInstrument.getStatus(),
                    "N");
            assertionHelper.verifyTwoTexts("Validate Orig_Resp Value in REMIT_INSTRUMENT Table: ",
                    remitInstrument.getOrigResp(), "O");
            
            assertionHelper.verifyTwoTexts("Validate Origin Voucher Id in REMIT_INSTRUMENT Table: ",
                    remitInstrument.getOriginatVoucherId().toString(), transactionHeader.getId().toString());
            
            if ("PO - Pay Order".equalsIgnoreCase(arg6)) {
                assertionHelper.verifyTwoTexts(
                        "Validate Remittance Type Of REMIT_INSTRUMENT Table With REMIT_PARAMETER Table: ",
                        remitInstrument.getRemittanceType(), remitParameter.getRemittanceType());
                assertionHelper.verifyTwoTexts("Validate Payable At Par in REMIT_PARAMETER Table: ",
                        remitParameter.getPayableAtParYN(), "Y");
                
            } else {
                assertionHelper.verifyTwoTexts(
                        "Validate Remittance Type Of REMIT_INSTRUMENT Table With REMIT_PARAMETER Table: ",
                        remitInstrument.getRemittanceType(), remitParameter.getRemittanceType());
                assertionHelper.verifyTwoTexts("Validate Payable At Par in REMIT_PARAMETER Table: ",
                        remitParameter.getPayableAtParYN(), "N");
            }
            
            assertionHelper.verifyTwoTexts("Validate Status in REMIT_PARAMETER Table: ", remitParameter.getStatus(),
                    "A");
            
            assertionHelper.verifyTwoTexts("Validate Dr_Cr Flag in REMIT_INSTRUMENT Table: ",
                    remitInstrument.getDrCrFlag(), "C");
            assertionHelper.verifyTwoTexts("Validate Benificiary Name in REMIT_INSTRUMENT Table: ",
                    remitInstrument.getBeneficiaryName(), arg7);
            
            String CreateDate = remitInstrument.getCreateDate().toString();
            String output1 = CreateDate.substring(0, 10);
            String cd1 = dateHelper.convetDateIntoSpecificFormat(output1);
            String StaleDate = remitInstrument.getStaleDate().toString();
            String output2 = StaleDate.substring(0, 10);
            String sd1 = dateHelper.convetDateIntoSpecificFormat(output2);
            Long monthsDiff = dateHelper.diffbetweenDatesInMonths(cd1, sd1);
            int stalePeriod = remitParameter.getStalePeriod();
            
            assertionHelper.verifyTwoTexts("Validate Stale Period in REMIT_PARAMETER Table: ",
                    String.valueOf(stalePeriod), monthsDiff.toString());
            assertionHelper.verifyTwoTexts(
                    "Validate Benf_City_Code Of REMIT_INSTRUMENT Table With REMIT_PARAMETER Table: ",
                    remitInstrument.getBeneficiaryCityCode(), remitParameter.getCityCode());
            if ("Cash".equalsIgnoreCase(arg2)) {
                assertionHelper.verifyTwoTexts("Validate Payment Mode in REMIT_INSTRUMENT Table: ",
                        remitInstrument.getPayMode(), "CS");
            } else {
                assertionHelper.verifyTwoTexts("Validate Payment Mode in REMIT_INSTRUMENT Table: ",
                        remitInstrument.getPayMode(), "TR");
                assertionHelper.verifyTwoTexts("Validate Debit Account Number in REMIT_INSTRUMENT Table: ",
                        remitInstrument.getDrAccountNo(), arg8);
                accMaster = accountService.getAccountMasterDetailsByAccNo(arg8);
                cacheHelper.setCacheWithaString(arg3 + "_" + "availableBal", accMaster.getAvailableBal() + "",
                        cacheData);
                cacheHelper.setCacheWithaString(arg3 + "_" + "ledgerBal", accMaster.getLedgerBal() + "", cacheData);
                cacheHelper.setCacheWithaString(arg3 + "_" + "shadowBal", accMaster.getShadowBal() + "", cacheData);
                
                assertionHelper.verifyTwoAmounts("Validate Available Balance in Account_Master Table: ",
                        accMaster.getAvailableBal().toString(),
                        cacheHelper.getCache(arg3 + "_" + "availableBal", cacheData));
                assertionHelper.verifyTwoAmounts("Validate Ledger Balance in Account_Master Table: ",
                        accMaster.getLedgerBal().toString(), cacheHelper.getCache(arg3 + "_" + "ledgerBal", cacheData));
                assertionHelper.verifyTwoAmounts("Validate Shadow Balance in Account_Master Table: ",
                        accMaster.getShadowBal().toString(), cacheHelper.getCache(arg3 + "_" + "shadowBal", cacheData));
                assertionHelper.verifyTwoTexts("Validate Prod_Insert Y/N Flag in Account_Master Table: ",
                        accMaster.getProdInsertYesNo(), "N");
            }
        } else {
            assertionHelper.verifyTwoTexts("Validate status in REMIT_INSTRUMENT Table: ", remitInstrument.getStatus(),
                    "R");
            
        }
    }
    
    @Then("^verify DENO_MASTER Table Denom_Rate \"([^\"]*)\" where bankCode \"([^\"]*)\"$")
    public void verify_DENO_MASTER_Table_Denom_Rate_where_bankCode(String arg1, String arg2) throws Throwable {
        
        int i = 0;
        try {
            Thread.sleep(1500);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        List<WebElement> noOfrecordInTable = d.findElements(By.xpath(arg1 + "/table/tbody/tr/td[2]"));
        List<BigDecimal> dbRecords = denomMasterService.getDenomRateByBankCode(property.getProperty("BankCode"));
        for (BigDecimal x : dbRecords) {
            assertionHelper.verifyTwoAmounts("Comparing Denom Rate On UI and Denom_Master Table", dbRecords.get(i) + "",
                    noOfrecordInTable.get(i).getText());
            i++;
        }
    }
    
    @Then("^Verify UserwiseDenom table with \"([^\"]*)\"$")
    public void verify_UserwiseDenom_table_with(String arg1) throws Throwable {
        
        int i = 0;
        try {
            Thread.sleep(1500);
        } catch (InterruptedException e) {
            
            e.printStackTrace();
        }
        List<WebElement> denomRate = d.findElements(By.xpath(arg1 + "/table/tbody/tr/td[2]"));
        List<WebElement> denomQty = d.findElements(By.xpath(arg1 + "/table/tbody/tr/td[5]"));
        List<Integer> dbrecords = userWiseDenomService.getDenomQtyByBankCodeAnduserId(property.getProperty("BankCode"),
                property.getProperty("LogInUser"));
        for (Integer x : dbrecords) {
            if (!denomRate.get(i).equals(null) || !denomRate.get(i).equals(0)) {
                assertionHelper.verifyTwoAmounts("Comparing Denom Qty On UI and Userwise Denom Table of "
                        + denomRate.get(i).getText() + " Denom Rate ", dbrecords.get(i) + "",
                        denomQty.get(i).getText());
                i++;
            }
        }
        
    }
    
    @Given("^user select VoucherNumber where voucher_num \"([^\"]*)\"$")
    public void user_select_VoucherNumber_where_voucher_num(String arg1) throws Throwable {
        String vouchNo = cacheHelper.getCache(arg1, cacheData);
        waitingHelper.sleep(3000);
        dropDownHelper.SelectUsingVisibleText("CashReceiptScreen_VoucherNumberDropDown", vouchNo);
    }
    
    @Then("^Verify \"([^\"]*)\" on Ui TotalTransAmount$")
    public void verify_on_Ui_TotalTransAmount(String arg1) throws Throwable {
        waitingHelper.sleep(3000);
        assertionHelper.verifyAmountEquals("Verifying Total Trans Amount in Cash Receipt Screen ",
                "CashReceiptScreen_TotalTransactionAmount", arg1);
    }
    
    @Then("^Store User Denom Before Transaction with name \"([^\"]*)\" where  DenomY_N \"([^\"]*)\" and  bankCode \"([^\"]*)\" and userId \"([^\"]*)\"$")
    public void store_User_Denom_Before_Transaction_with_name_where_DenomY_N_and_bankCode_and_userId(String arg1,
            String arg2, String arg3, String arg4) throws Throwable {
        
        if (!"N".equalsIgnoreCase(arg2)) {
            List<Integer> dbrecordsOfQty = userWiseDenomService.getDenomQtyByBankCodeAnduserId(arg3, arg4);
            List<BigDecimal> dbrecordsOfRate = userWiseDenomService.getDenomRateByBankCodeAnduserId(arg3, arg4);
            int j = 0;
            for (Integer i : dbrecordsOfQty) {
                cacheHelper.setCacheWithaString(arg1 + " _ " + "UserQty " + dbrecordsOfRate.get(j), i + "", cacheData);
                j++;
                
            }
        }
    }
    
    @Then("^verify TRANSACTION_HEADER Table where voucher_num \"([^\"]*)\" and status \"([^\"]*)\"$")
    public void verify_TRANSACTION_HEADER_Table_where_voucher_num_and_status(String arg1, String arg2)
            throws Throwable {
        String vouchNo = cacheHelper.getCache(arg1, cacheData);
        long vNum = Long.parseLong(vouchNo);
        transactionHeader = transactionHeaderService.getTransactionHeaderdetailsByVoucherNumberAndTransType(vNum, arg2);
        if (transactionHeader.getStatus().equals("E")) {
            assertionHelper.verifyTwoTexts(
                    "Verifying Status in Transaction Header Table After Cash Receipt of voucherNo: " + vouchNo,
                    transactionHeader.getStatus(), "E");
        } else {
            assertionHelper.verifyTwoTexts(
                    "Verifying Status in Transaction Header Table After Cash Receipt of voucherNo: " + vouchNo,
                    transactionHeader.getStatus(), "R");
        }
    }
    
    @Then("^user enters Debit Account Number\"([^\"]*)\"$")
    public void user_enters_Debit_Account_Number(String arg1) throws Throwable {
        seleniumHelper.enterText("RemmitanceScreen_drAccountNo", arg1);
    }
    
    @Then("^user select Instrument Type \"([^\"]*)\" from Instrument Type dropdown$")
    public void user_select_Instrument_Type_from_Instrument_Type_dropdown(String arg1) throws Throwable {
        dropDownHelper.SelectUsingVisibleText("RemmitanceScreen_instrumentType", arg1);
    }
    
    @Then("^user enters Instrument Date \"([^\"]*)\"$")
    public void user_enters_Instrument_Date(String arg1) throws Throwable {
        seleniumHelper.enterText("RemmitanceScreen_instrumentDate", arg1);
    }
    
    @Then("^user enters Instrument Number\"([^\"]*)\"$")
    public void user_enters_Instrument_Number(String arg1) throws Throwable {
        seleniumHelper.enterText("RemmitanceScreen_instrumentNumber", arg1);
    }
    
    @Then("^user enters Create Date \"([^\"]*)\"$")
    public void user_enters_Create_Date(String arg1) throws Throwable {
        seleniumHelper.enterText("RemmitanceScreen_createDate", arg1);
    }
    
    @Then("^Verify Transaction_Details with Instrument Deatils Instrument Type \"([^\"]*)\" Instrument Number \"([^\"]*)\" Instrument Date \"([^\"]*)\"  where voucher_num \"([^\"]*)\" and tranType \"([^\"]*)\"$")
    public void verify_Transaction_Details_with_Instrument_Deatils_Instrument_Type_Instrument_Number_Instrument_Date_where_voucher_num_and_tranType(
            String arg1, String arg2, String arg3, String arg4, String arg5) throws Throwable {
        
        String vouchNo = cacheHelper.getCache(arg4, cacheData);
        long vNum = Long.parseLong(vouchNo);
        transactionHeader = transactionHeaderService.getTransactionHeaderdetailsByVoucherNumberAndTransType(vNum, arg5);
        long id = transactionHeader.getId();
        BigInteger TransId = BigInteger.valueOf(id);
        List<TransactionsDetailEntity> transDetailsList = new ArrayList<>();
        transDetailsList = transactionsDetailService.getListOfTransDetailsRecordsById(TransId);
        
        assertionHelper.verifyTwoTexts("Validate Instrument Type in Transaction Details Table",
                transDetailsList.get(0).getInstrumentType(), arg1);
        assertionHelper.verifyTwoTexts("Validate Instrument Number in Transaction Details Table",
                transDetailsList.get(0).getInstrumentNumber() + "", arg2);
        assertionHelper.verifyTwoTexts("Validate Instrument Date in Transaction Details Table",
                transDetailsList.get(0).getInstrumentDate().toString(), arg3);
    }
    
    @Then("^verify validation Message of Date \"([^\"]*)\" and \"([^\"]*)\"$")
    public void verify_validation_Message_of_Date_and(String arg1, String arg2) throws Throwable {
        waitingHelper.sleep(3000);
        assertionHelper.verifyTwoTexts("Verifying Ui Validation Message ", seleniumHelper.getTextFromAnElement(arg1),
                arg2);
    }
    
    @Then("^verify validation Message of Cheque \"([^\"]*)\" and \"([^\"]*)\"$")
    public void verify_validation_Message_of_Cheque_and(String arg1, String arg2) throws Throwable {
        dbHelper.executeQuery(
                "UPDATE CHEQUE_BOOK_DETAIL SET STATUS='P' WHERE STATUS='I' AND INSTR_NO=3 AND CHEQUE_BOOK_ID IN (SELECT ID FROM CHEQUE_BOOK_MASTER WHERE ACC_ID IN (50001))");
        waitingHelper.sleep(3000);
        assertionHelper.verifyTwoTexts("Verifying Ui Validation Message ", seleniumHelper.getTextFromAnElement(arg1),
                arg2);
    }
    
    @Given("^user select voucher_num \"([^\"]*)\" and TypeOfTrans \"([^\"]*)\" and beneficiary name \"([^\"]*)\" and TRANS_AMT \"([^\"]*)\" and ORIG_RESP \"([^\"]*)\" and chq_holder \"([^\"]*)\" and PaymentMode \"([^\"]*)\" and InstrumentNumber \"([^\"]*)\" and  Trans_Type \"([^\"]*)\"$")
    public void user_select_voucher_num_and_TypeOfTrans_and_beneficiary_name_and_TRANS_AMT_and_ORIG_RESP_and_chq_holder_and_PaymentMode_and_InstrumentNumber_and_Trans_Type(
            String arg1, String arg2, String arg3, String arg4, String arg5, String arg6, String arg7, String arg8,
            String arg9) throws Throwable {
        
        String vouchNo = cacheHelper.getCache(arg1, cacheData);
        waitingHelper.sleep(2000);
        dropDownHelper.SelectUsingVisibleText("RemmitanceScreen_voucherNumber",
                vouchNo + "-" + arg2 + "-" + arg3 + "-" + arg4);
        transactionHeader = transactionHeaderService.getTransactionHeaderdetailsByVoucherNumberAndTransType(
                Long.parseLong(cacheHelper.getCache(arg1, cacheData)), arg9);
        long id = transactionHeader.getId();
        
        assertionHelper.verifyTextEquals("Verifying ORIG_RESP Value with UI ", "RemmitanceScreen_orig", arg5);
        
        dbHelper.verifyUiTextWithDb("//div[@id='pills-tabContent']//input[@id='paymentMode']",
                "SELECT PAY_MODE FROM REMIT_INSTRUMENT WHERE ORIG_VOUCHER_ID='" + id + "'");
        
        dbHelper.verifyUiAmountWithDb("//div[@id='pills-tabContent']//input[@id='amount']",
                "SELECT REMITTANCE_AMOUNT FROM REMIT_INSTRUMENT WHERE ORIG_VOUCHER_ID='" + id + "'");
        
        dbHelper.verifyUiTextWithDb("//div[@id='pills-tabContent']//input[@id='instrumentType']",
                "SELECT REMITTANCE_TYPE FROM REMIT_INSTRUMENT WHERE ORIG_VOUCHER_ID='" + id + "'");
        
        dbHelper.verifyUiTextWithDb("//div[@id='pills-tabContent']//input[@id='beneficiaryName']",
                "SELECT BEN_NAME FROM REMIT_INSTRUMENT WHERE ORIG_VOUCHER_ID='" + id + "'");
        
        dbHelper.verifyUiTextWithDb("//div[@id='pills-tabContent']//input[@id='bankName']",
                "SELECT BANK_NAME FROM BANKPARAMETERS WHERE BANK_CODE IN (SELECT BANK_CODE FROM REMIT_INSTRUMENT "
                        + "WHERE STATUS='E' AND ORIG_VOUCHER_ID='" + id + "')");
        
        dbHelper.verifyUiTextWithDb("//div[@id='pills-tabContent']//input[@id='CityName']",
                "SELECT CITY FROM BRANCHPARAMETERS WHERE BRANCHCODE IN (SELECT BRANCH_CODE FROM REMIT_INSTRUMENT "
                        + "WHERE STATUS='E' AND ORIG_VOUCHER_ID='" + id + "')");
        
        dbHelper.verifyUiTextWithDb("//div[@id='pills-tabContent']//input[@id='branchName']",
                "SELECT BRANCHNAME FROM BRANCHPARAMETERS WHERE BRANCHCODE IN (SELECT BRANCH_CODE FROM REMIT_INSTRUMENT "
                        + "WHERE STATUS='E' AND ORIG_VOUCHER_ID='" + id + "')");
        
        if ("Transfer".equalsIgnoreCase(arg7)) {
            
            dbHelper.verifyUiTextWithDb("//div[@id='pills-tabContent']//input[@id='debitAccountNumber']",
                    "SELECT DR_ACCOUNT_NO FROM REMIT_INSTRUMENT WHERE ORIG_VOUCHER_ID='" + id + "'");
            if ("Y".equalsIgnoreCase(arg6)) {
                assertionHelper.verifyNumberEquals("Verifying Instrument Number Of Ui ",
                        "RemmitanceScreen_instrumentNumber", arg8);
            }
        }
    }
    
    @Given("^user click on auhtorizeButton$")
    public void user_click_on_auhtorizeButton() throws Throwable {
        seleniumHelper.clickElement("RemmitanceScreen_verifyVoucherButton");
    }
    
    @Then("^verify Transactions table after Auth TRANS_AMT \"([^\"]*)\" accNo \"([^\"]*)\"  where voucher_num \"([^\"]*)\" and tranType \"([^\"]*)\"  and Remittance Commition \"([^\"]*)\" and CGST \"([^\"]*)\" and SGST \"([^\"]*)\" and AddingChargesAmount \"([^\"]*)\"$")
    public void verify_Transactions_table_after_Auth_TRANS_AMT_accNo_where_voucher_num_and_tranType_and_Remittance_Commition_and_CGST_and_SGST_and_AddingChargesAmount(
            String arg1, String arg2, String arg3, String arg4, String arg5, String arg6, String arg7, String arg8)
            throws Throwable {
        
        String vouchNo = cacheHelper.getCache(arg3, cacheData);
        long vNum = Long.parseLong(vouchNo);
        transactionHeader = transactionHeaderService.getTransactionHeaderdetailsByVoucherNumberAndTransType(vNum, arg4);
        List<TransactionEntity> transactionsList = new ArrayList<>();
        transactionsList = transactionService.getTransactionInfoByVoucherAndTransType(vNum, arg4);
        if (transactionsList.get(0).getStatus().equals("A")) {
            assertionHelper.verifyTwoTexts("Verifying Status in Transactions Table After Auth of voucherNo: " + vouchNo,
                    transactionsList.get(0).getStatus(), "A");
            
            if (transactionHeader.getTransType().equals("D")) {
                assertionHelper.verifyTwoAmounts("Verifying Remittance Amount in Transaction Details ",
                        transactionsList.get(0).getTransactionAmount().toString(), arg1);
                assertionHelper.verifyTwoAmounts("Verifying Remmitance Commision Amount  in Transaction Details ",
                        transactionsList.get(3).getTransactionAmount().toString(), arg5);
                assertionHelper.verifyTwoAmounts("Verifying CGST amount  in Transaction Details",
                        transactionsList.get(1).getTransactionAmount().toString(), arg6);
                assertionHelper.verifyTwoAmounts("Verifying SGST amount  in Transaction Details ",
                        transactionsList.get(2).getTransactionAmount().toString(), arg7);
            } else {
                
                assertionHelper.verifyTwoAmounts("Verifying Remittance GL Amount in Transaction Details ",
                        transactionsList.get(0).getTransactionAmount().toString(), arg8);
                assertionHelper.verifyTwoAmounts(
                        "Verifying Remittance Amount Credited to Account Number " + arg2 + " in Transaction Details ",
                        transactionsList.get(1).getTransactionAmount().toString(), arg1);
                assertionHelper.verifyTwoAmounts("Verifying Remmitance Commision Amount  in Transaction Details ",
                        transactionsList.get(2).getTransactionAmount().toString(), arg5);
                assertionHelper.verifyTwoAmounts("Verifying CGST amount  in Transaction Details",
                        transactionsList.get(3).getTransactionAmount().toString(), arg6);
                assertionHelper.verifyTwoAmounts("Verifying SGST amount  in Transaction Details ",
                        transactionsList.get(4).getTransactionAmount().toString(), arg7);
            }
        } else {
            assertionHelper.verifyTwoTexts("Verifying Status in Transactions Table After Auth of voucherNo: " + vouchNo,
                    transactionsList.get(0).getStatus(), "R");
        }
        
    }
    
    @Then("^verify REMIT_INSTRUMENT Table voucher_num \"([^\"]*)\" and tranType \"([^\"]*)\" and Pay_Mode \"([^\"]*)\" and RemitNumStoreInCache \"([^\"]*)\" and accNo \"([^\"]*)\"$")
    public void verify_REMIT_INSTRUMENT_Table_voucher_num_and_tranType_and_Pay_Mode_and_RemitNumStoreInCache_and_accNo(
            String arg1, String arg2, String arg3, String arg4, String arg5) throws Throwable {
        
        String RemitNum = cacheHelper.getCache(arg4, cacheData);
        remitInstrument = remitInstrumentService.findRemitInsrumentDataByRemitSrNumber(RemitNum);
        
        assertionHelper.verifyTwoTexts("Validate status in REMIT_INSTRUMENT Table: ", remitInstrument.getStatus(), "A");
        assertionHelper.verifyTwoTexts("Validate Remittance Serial Number in REMIT_INSTRUMENT Table: ",
                remitInstrument.getRemittanceSrNo(), RemitNum);
        if ("Transfer".equalsIgnoreCase(arg3)) {
            assertionHelper.verifyTwoTexts("Validate Debit Account Number in REMIT_INSTRUMENT Table: ",
                    remitInstrument.getDrAccountNo(), arg5);
            accMaster = accountService.getAccountMasterDetailsByAccNo(arg5);
            cacheHelper.setCacheWithaString(arg1 + "_" + "availableBal", accMaster.getAvailableBal() + "", cacheData);
            cacheHelper.setCacheWithaString(arg1 + "_" + "ledgerBal", accMaster.getLedgerBal() + "", cacheData);
            cacheHelper.setCacheWithaString(arg1 + "_" + "shadowBal", accMaster.getShadowBal() + "", cacheData);
            
            assertionHelper.verifyTwoAmounts("Validate Available Balance in Account_Master Table: ",
                    accMaster.getAvailableBal().toString(),
                    cacheHelper.getCache(arg1 + "_" + "availableBal", cacheData));
            
            assertionHelper.verifyTwoAmounts("Validate Ledger Balance in Account_Master Table: ",
                    accMaster.getLedgerBal().toString(), cacheHelper.getCache(arg1 + "_" + "ledgerBal", cacheData));
            
            assertionHelper.verifyTwoAmounts("Validate Shadow Balance in Account_Master Table: ",
                    accMaster.getShadowBal().toString(), cacheHelper.getCache(arg1 + "_" + "shadowBal", cacheData));
            
            assertionHelper.verifyTwoTexts("Validate Prod_Insert Y/N Flag in Account_Master Table: ",
                    accMaster.getProdInsertYesNo(), "Y");
        }
    }
    
    @Then("^user click on rejectButton$")
    public void user_click_on_rejectButton() throws Throwable {
        seleniumHelper.clickElement("CashReceiptScreen_RejectButton");
    }
    
    @Given("^user click on Remittance Instrument Issue rejectButton$")
    public void user_click_on_Remittance_Instrument_Issue_rejectButton() throws Throwable {
        seleniumHelper.clickElement("RemmitanceScreen_rejectButton");
    }
    
    @Then("^verify REMIT_INSTRUMENT Table Remittance_AMT \"([^\"]*)\" Pay_Mode \"([^\"]*)\"  where voucher_num \"([^\"]*)\" and ORIG_RESP \"([^\"]*)\"  and tranType \"([^\"]*)\" and remittanceType \"([^\"]*)\" and beneficiaryName \"([^\"]*)\" and accNo \"([^\"]*)\" Denom N$")
    public void verify_REMIT_INSTRUMENT_Table_Remittance_AMT_Pay_Mode_where_voucher_num_and_ORIG_RESP_and_tranType_and_remittanceType_and_beneficiaryName_and_accNo_Denom_N(
            String arg1, String arg2, String arg3, String arg4, String arg5, String arg6, String arg7, String arg8)
            throws Throwable {
        
        String vouchNo = cacheHelper.getCache(arg3, cacheData);
        long vNum = Long.parseLong(vouchNo);
        transactionHeader = transactionHeaderService.getTransactionHeaderdetailsByVoucherNumberAndTransType(vNum, arg5);
        BigInteger bigIntegerVouchNo = new BigInteger(vouchNo);
        remitInstrument = remitInstrumentService.findRemitInsrumentData(bigIntegerVouchNo, arg5);
        remitParameter = remitParameterService.findRemitParameterDetails(bigIntegerVouchNo, arg5);
        
        if (remitInstrument.getStatus().equals("E")) {
            assertionHelper.verifyTwoTexts("Validate status in REMIT_INSTRUMENT Table: ", remitInstrument.getStatus(),
                    "E");
            assertionHelper.verifyTwoTexts("Validate Orig_Resp Value in REMIT_INSTRUMENT Table: ",
                    remitInstrument.getOrigResp(), "O");
            
            assertionHelper.verifyTwoTexts("Validate Origin Voucher Id in REMIT_INSTRUMENT Table: ",
                    remitInstrument.getOriginatVoucherId().toString(), transactionHeader.getId().toString());
            
            if ("PO - Pay Order".equalsIgnoreCase(arg6)) {
                assertionHelper.verifyTwoTexts(
                        "Validate Remittance Type Of REMIT_INSTRUMENT Table With REMIT_PARAMETER Table: ",
                        remitInstrument.getRemittanceType(), remitParameter.getRemittanceType());
                assertionHelper.verifyTwoTexts("Validate Payable At Par in REMIT_PARAMETER Table: ",
                        remitParameter.getPayableAtParYN(), "Y");
                
            } else {
                assertionHelper.verifyTwoTexts(
                        "Validate Remittance Type Of REMIT_INSTRUMENT Table With REMIT_PARAMETER Table: ",
                        remitInstrument.getRemittanceType(), remitParameter.getRemittanceType());
                assertionHelper.verifyTwoTexts("Validate Payable At Par in REMIT_PARAMETER Table: ",
                        remitParameter.getPayableAtParYN(), "N");
            }
            
            assertionHelper.verifyTwoTexts("Validate Status in REMIT_PARAMETER Table: ", remitParameter.getStatus(),
                    "A");
            
            assertionHelper.verifyTwoTexts("Validate Dr_Cr Flag in REMIT_INSTRUMENT Table: ",
                    remitInstrument.getDrCrFlag(), "C");
            assertionHelper.verifyTwoTexts("Validate Benificiary Name in REMIT_INSTRUMENT Table: ",
                    remitInstrument.getBeneficiaryName(), arg7);
            
            String CreateDate = remitInstrument.getCreateDate().toString();
            String output1 = CreateDate.substring(0, 10);
            String cd1 = dateHelper.convetDateIntoSpecificFormat(output1);
            String StaleDate = remitInstrument.getStaleDate().toString();
            String output2 = StaleDate.substring(0, 10);
            String sd1 = dateHelper.convetDateIntoSpecificFormat(output2);
            Long monthsDiff = dateHelper.diffbetweenDatesInMonths(cd1, sd1);
            int stalePeriod = remitParameter.getStalePeriod();
            
            assertionHelper.verifyTwoTexts("Validate Stale Period in REMIT_PARAMETER Table: ",
                    String.valueOf(stalePeriod), monthsDiff.toString());
            assertionHelper.verifyTwoTexts(
                    "Validate Benf_City_Code Of REMIT_INSTRUMENT Table With REMIT_PARAMETER Table: ",
                    remitInstrument.getBeneficiaryCityCode(), remitParameter.getCityCode());
            if ("Cash".equalsIgnoreCase(arg2)) {
                assertionHelper.verifyTwoTexts("Validate Payment Mode in REMIT_INSTRUMENT Table: ",
                        remitInstrument.getPayMode(), "CS");
            } else {
                assertionHelper.verifyTwoTexts("Validate Payment Mode in REMIT_INSTRUMENT Table: ",
                        remitInstrument.getPayMode(), "TR");
                assertionHelper.verifyTwoTexts("Validate Debit Account Number in REMIT_INSTRUMENT Table: ",
                        remitInstrument.getDrAccountNo(), arg8);
                accMaster = accountService.getAccountMasterDetailsByAccNo(arg8);
                cacheHelper.setCacheWithaString(arg3 + "_" + "availableBal", accMaster.getAvailableBal() + "",
                        cacheData);
                cacheHelper.setCacheWithaString(arg3 + "_" + "ledgerBal", accMaster.getLedgerBal() + "", cacheData);
                cacheHelper.setCacheWithaString(arg3 + "_" + "shadowBal", accMaster.getShadowBal() + "", cacheData);
                
                assertionHelper.verifyTwoAmounts("Validate Available Balance in Account_Master Table: ",
                        accMaster.getAvailableBal().toString(),
                        cacheHelper.getCache(arg3 + "_" + "availableBal", cacheData));
                assertionHelper.verifyTwoAmounts("Validate Ledger Balance in Account_Master Table: ",
                        accMaster.getLedgerBal().toString(), cacheHelper.getCache(arg3 + "_" + "ledgerBal", cacheData));
                assertionHelper.verifyTwoAmounts("Validate Shadow Balance in Account_Master Table: ",
                        accMaster.getShadowBal().toString(), cacheHelper.getCache(arg3 + "_" + "shadowBal", cacheData));
                assertionHelper.verifyTwoTexts("Validate Prod_Insert Y/N Flag in Account_Master Table: ",
                        accMaster.getProdInsertYesNo(), "N");
            }
        } else {
            assertionHelper.verifyTwoTexts("Validate status in REMIT_INSTRUMENT Table: ", remitInstrument.getStatus(),
                    "R");
            
        }
    }
    
    @Then("^verify Transactions table after Reject TRANS_AMT \"([^\"]*)\" accNo \"([^\"]*)\"  where voucher_num \"([^\"]*)\" and tranType \"([^\"]*)\"  and Remittance Commition \"([^\"]*)\" and CGST \"([^\"]*)\" and SGST \"([^\"]*)\" and AddingChargesAmount \"([^\"]*)\"$")
    public void verify_Transactions_table_after_Reject_TRANS_AMT_accNo_where_voucher_num_and_tranType_and_Remittance_Commition_and_CGST_and_SGST_and_AddingChargesAmount(
            String arg1, String arg2, String arg3, String arg4, String arg5, String arg6, String arg7, String arg8)
            throws Throwable {
        String vouchNo = cacheHelper.getCache(arg3, cacheData);
        long vNum = Long.parseLong(vouchNo);
        transactionHeader = transactionHeaderService.getTransactionHeaderdetailsByVoucherNumberAndTransType(vNum, arg4);
        List<TransactionEntity> transactionsList = new ArrayList<>();
        transactionsList = transactionService.getTransactionInfoByVoucherAndTransType(vNum, arg4);
        if (transactionsList.get(0).getStatus().equals("R")) {
            assertionHelper.verifyTwoTexts("Verifying Status in Transactions Table After Auth of voucherNo: " + vouchNo,
                    transactionsList.get(0).getStatus(), "R");
            
            if (transactionHeader.getTransType().equals("D")) {
                assertionHelper.verifyTwoAmounts("Verifying Remittance Amount in Transaction Details ",
                        transactionsList.get(0).getTransactionAmount().toString(), arg1);
                assertionHelper.verifyTwoAmounts("Verifying Remmitance Commision Amount  in Transaction Details ",
                        transactionsList.get(3).getTransactionAmount().toString(), arg5);
                assertionHelper.verifyTwoAmounts("Verifying CGST amount  in Transaction Details",
                        transactionsList.get(1).getTransactionAmount().toString(), arg6);
                assertionHelper.verifyTwoAmounts("Verifying SGST amount  in Transaction Details ",
                        transactionsList.get(2).getTransactionAmount().toString(), arg7);
            } else {
                
                assertionHelper.verifyTwoAmounts("Verifying Remittance GL Amount in Transaction Details ",
                        transactionsList.get(0).getTransactionAmount().toString(), arg8);
                assertionHelper.verifyTwoAmounts(
                        "Verifying Remittance Amount Credited to Account Number " + arg2 + " in Transaction Details ",
                        transactionsList.get(1).getTransactionAmount().toString(), arg1);
                assertionHelper.verifyTwoAmounts("Verifying Remmitance Commision Amount  in Transaction Details ",
                        transactionsList.get(2).getTransactionAmount().toString(), arg5);
                assertionHelper.verifyTwoAmounts("Verifying CGST amount  in Transaction Details",
                        transactionsList.get(3).getTransactionAmount().toString(), arg6);
                assertionHelper.verifyTwoAmounts("Verifying SGST amount  in Transaction Details ",
                        transactionsList.get(4).getTransactionAmount().toString(), arg7);
            }
        }
    }
    
    @Then("^verify REMIT_INSTRUMENT Table voucher_num \"([^\"]*)\" and tranType \"([^\"]*)\" and Pay_Mode \"([^\"]*)\" and RemitNumStoreInCache \"([^\"]*)\" and accNo \"([^\"]*)\" with Denom N$")
    public void verify_REMIT_INSTRUMENT_Table_voucher_num_and_tranType_and_Pay_Mode_and_RemitNumStoreInCache_and_accNo_with_Denom_N(
            String arg1, String arg2, String arg3, String arg4, String arg5) throws Throwable {
        String RemitNum = cacheHelper.getCache(arg4, cacheData);
        remitInstrument = remitInstrumentService.findRemitInsrumentDataByRemitSrNumber(RemitNum);
        
        assertionHelper.verifyTwoTexts("Validate status in REMIT_INSTRUMENT Table: ", remitInstrument.getStatus(), "A");
        assertionHelper.verifyTwoTexts("Validate Remittance Serial Number in REMIT_INSTRUMENT Table: ",
                remitInstrument.getRemittanceSrNo(), RemitNum);
        if ("Transfer".equalsIgnoreCase(arg3)) {
            assertionHelper.verifyTwoTexts("Validate Debit Account Number in REMIT_INSTRUMENT Table: ",
                    remitInstrument.getDrAccountNo(), arg5);
            accMaster = accountService.getAccountMasterDetailsByAccNo(arg5);
            cacheHelper.setCacheWithaString(arg1 + "_" + "availableBal", accMaster.getAvailableBal() + "", cacheData);
            cacheHelper.setCacheWithaString(arg1 + "_" + "ledgerBal", accMaster.getLedgerBal() + "", cacheData);
            cacheHelper.setCacheWithaString(arg1 + "_" + "shadowBal", accMaster.getShadowBal() + "", cacheData);
            
            assertionHelper.verifyTwoAmounts("Validate Available Balance in Account_Master Table: ",
                    accMaster.getAvailableBal().toString(),
                    cacheHelper.getCache(arg1 + "_" + "availableBal", cacheData));
            
            assertionHelper.verifyTwoAmounts("Validate Ledger Balance in Account_Master Table: ",
                    accMaster.getLedgerBal().toString(), cacheHelper.getCache(arg1 + "_" + "ledgerBal", cacheData));
            
            assertionHelper.verifyTwoAmounts("Validate Shadow Balance in Account_Master Table: ",
                    accMaster.getShadowBal().toString(), cacheHelper.getCache(arg1 + "_" + "shadowBal", cacheData));
            
            assertionHelper.verifyTwoTexts("Validate Prod_Insert Y/N Flag in Account_Master Table: ",
                    accMaster.getProdInsertYesNo(), "Y");
        }
    }
    
    @Given("^user select \"([^\"]*)\" RTGS or NEFT$")
    public void user_select_RTGS_or_NEFT(String arg1) throws Throwable {
        waitingHelper.sleep(3000);
        dropDownHelper.SelectUsingVisibleText("RemmitanceScreen_remittanceType", arg1);
    }
    
    @Given("^user select \"([^\"]*)\" Cash or Transfer of Remittance$")
    public void user_select_Cash_or_Transfer_of_Remittance(String arg1) throws Throwable {
        dropDownHelper.SelectUsingVisibleText("RemmitanceScreen_payMode", arg1);
    }
    
    @When("^user click on Add Beneficiary button$")
    public void user_click_on_Add_Beneficiary_button() throws Throwable {
        dbHelper.executeQuery("DELETE FROM BENEFICIARY_DETAILS WHERE BENEF_ACC_NO IN ('101210101100000408')");
        waitingHelper.sleep(3000);
        seleniumHelper.clickElement("RemmitanceScreen_addbeneficiaryButton");
    }
    
    @When("^user enters Beneficiary Name in field\"([^\"]*)\"$")
    public void user_enters_Beneficiary_Name_in_field(String arg1) throws Throwable {
        seleniumHelper.enterText("RemmitanceScreen_benefName", arg1);
    }
    
    @When("^user enters Account Number in field\"([^\"]*)\"$")
    public void user_enters_Account_Number_in_field(String arg1) throws Throwable {
        seleniumHelper.enterText("RemmitanceScreen_benefAccountNo", arg1);
    }
    
    @When("^user enters Contact Number in field\"([^\"]*)\"$")
    public void user_enters_Contact_Number_in_field(String arg1) throws Throwable {
        seleniumHelper.enterText("RemmitanceScreen_benifContactNo", arg1);
    }
    
    @When("^user enters Address Line Number one in field\"([^\"]*)\"$")
    public void user_enters_Address_Line_Number_one_in_field(String arg1) throws Throwable {
        seleniumHelper.enterText("RemmitanceScreen_benefAddress1", arg1);
    }
    
    @When("^user enters Address Line Number two in field\"([^\"]*)\"$")
    public void user_enters_Address_Line_Number_two_in_field(String arg1) throws Throwable {
        seleniumHelper.enterText("RemmitanceScreen_benefAddress2", arg1);
    }
    
    @When("^user enters Address Line Number three in field\"([^\"]*)\"$")
    public void user_enters_Address_Line_Number_three_in_field(String arg1) throws Throwable {
        seleniumHelper.enterText("RemmitanceScreen_benefAddress3", arg1);
    }
    
    @When("^user enters Pin Code in field\"([^\"]*)\"$")
    public void user_enters_Pin_Code_in_field(String arg1) throws Throwable {
        seleniumHelper.enterText("RemmitanceScreen_benefPinCode", arg1);
    }
    
    @When("^user enters IFSC Code in field\"([^\"]*)\"$")
    public void user_enters_IFSC_Code_in_field(String arg1) throws Throwable {
        seleniumHelper.enterText("RemmitanceScreen_benefIfsc", arg1);
    }
    
    @When("^user enters Bank Name in field\"([^\"]*)\"$")
    public void user_enters_Bank_Name_in_field(String arg1) throws Throwable {
        seleniumHelper.enterText("RemmitanceScreen_benefbankName", arg1);
    }
    
    @When("^user enters City in field\"([^\"]*)\"$")
    public void user_enters_City_in_field(String arg1) throws Throwable {
        seleniumHelper.enterText("RemmitanceScreen_benefCityName", arg1);
    }
    
    @When("^user click Save button$")
    public void user_click_Save_button() throws Throwable {
        seleniumHelper.clickElement("RemmitanceScreen_SaveButton");
    }
    
    @When("^user verify beneficiary name \"([^\"]*)\" on Ui$")
    public void user_verify_beneficiary_name_on_Ui(String arg1) throws Throwable {
        assertionHelper.verifyTextEquals("Verifying Beneficiary Name On Ui ", "RemmitanceScreen_beneficiaryName", arg1);
    }
    
    @Then("^Verify \"([^\"]*)\" is BANKPARAMETERS Logged In Bank BANK_NAME of RTGS$")
    public void verify_is_BANKPARAMETERS_Logged_In_Bank_BANK_NAME_of_RTGS(String arg1) throws Throwable {
        assertionHelper.verifyTextEquals("Verifying Bank Name on Ui ", "RemmitanceScreen_micrBankCode1", arg1);
    }
    
    @Then("^Verify \"([^\"]*)\" is BRANCHPARAMETERS Logged In Branch CITY of RTGS$")
    public void verify_is_BRANCHPARAMETERS_Logged_In_Branch_CITY_of_RTGS(String arg1) throws Throwable {
        assertionHelper.verifyTextEquals("Verifying City Name on Ui ", "RemmitanceScreen_micrCityCode1", arg1);
    }
    
    @Then("^Verify \"([^\"]*)\" is BRANCHPARAMETERS Logged In Branch BRANCHNAME of RTGS$")
    public void verify_is_BRANCHPARAMETERS_Logged_In_Branch_BRANCHNAME_of_RTGS(String arg1) throws Throwable {
        assertionHelper.verifyTextEquals("Verifying Branch Name on Ui ", "RemmitanceScreen_MicrBranchCode1", arg1);
    }
    
    @Then("^Verify \"([^\"]*)\" of RTGS$")
    public void verify_of_RTGS(String arg1) throws Throwable {
        assertionHelper.verifyTextEquals("Verifying IFSC Code on Ui ", "RemmitanceScreen_IFSC", arg1);
    }
    
    @Then("^verify REMIT_INSTRUMENT Table Remittance_AMT \"([^\"]*)\" Pay_Mode \"([^\"]*)\"  where voucher_num \"([^\"]*)\" and ORIG_RESP \"([^\"]*)\"  and tranType \"([^\"]*)\" and remittanceType \"([^\"]*)\" and beneficiaryName \"([^\"]*)\" and accNo \"([^\"]*)\" Denom N for RTGS$")
    public void verify_REMIT_INSTRUMENT_Table_Remittance_AMT_Pay_Mode_where_voucher_num_and_ORIG_RESP_and_tranType_and_remittanceType_and_beneficiaryName_and_accNo_Denom_N_for_RTGS(
            String arg1, String arg2, String arg3, String arg4, String arg5, String arg6, String arg7, String arg8)
            throws Throwable {
        String vouchNo = cacheHelper.getCache(arg3, cacheData);
        long vNum = Long.parseLong(vouchNo);
        transactionHeader = transactionHeaderService.getTransactionHeaderdetailsByVoucherNumberAndTransType(vNum, arg5);
        BigInteger bigIntegerVouchNo = new BigInteger(vouchNo);
        remitInstrument = remitInstrumentService.findRemitInsrumentData(bigIntegerVouchNo, arg5);
        remitParameter = remitParameterService.findRemitParameterDetails(bigIntegerVouchNo, arg5);
        
        if (remitInstrument.getStatus().equals("E")) {
            assertionHelper.verifyTwoTexts("Validate status in REMIT_INSTRUMENT Table: ", remitInstrument.getStatus(),
                    "E");
            assertionHelper.verifyTwoTexts("Validate Orig_Resp Value in REMIT_INSTRUMENT Table: ",
                    remitInstrument.getOrigResp(), "R");
            
            assertionHelper.verifyTwoTexts("Validate Origin Voucher Id in REMIT_INSTRUMENT Table: ",
                    remitInstrument.getOriginatVoucherId().toString(), transactionHeader.getId().toString());
            
            assertionHelper.verifyTwoTexts("Validate Payable At Par in REMIT_PARAMETER Table: ",
                    remitParameter.getPayableAtParYN(), "Y");
            
            if ("RT - RTGS".equalsIgnoreCase(arg6)) {
                assertionHelper.verifyTwoTexts(
                        "Validate Remittance Type Of REMIT_INSTRUMENT Table With REMIT_PARAMETER Table: ",
                        remitInstrument.getRemittanceType(), remitParameter.getRemittanceType());
                
            } else {
                assertionHelper.verifyTwoTexts(
                        "Validate Remittance Type Of REMIT_INSTRUMENT Table With REMIT_PARAMETER Table: ",
                        remitInstrument.getRemittanceType(), remitParameter.getRemittanceType());
            }
            
            assertionHelper.verifyTwoTexts("Validate Status in REMIT_PARAMETER Table: ", remitParameter.getStatus(),
                    "A");
            
            assertionHelper.verifyTwoTexts("Validate Dr_Cr Flag in REMIT_INSTRUMENT Table: ",
                    remitInstrument.getDrCrFlag(), "C");
            assertionHelper.verifyTwoTexts("Validate Benificiary Name in REMIT_INSTRUMENT Table: ",
                    remitInstrument.getBeneficiaryName(), arg7);
            
            String CreateDate = remitInstrument.getCreateDate().toString();
            String output1 = CreateDate.substring(0, 10);
            String cd1 = dateHelper.convetDateIntoSpecificFormat(output1);
            String StaleDate = remitInstrument.getStaleDate().toString();
            String output2 = StaleDate.substring(0, 10);
            String sd1 = dateHelper.convetDateIntoSpecificFormat(output2);
            Long monthsDiff = dateHelper.diffbetweenDatesInMonths(cd1, sd1);
            int stalePeriod = remitParameter.getStalePeriod();
            
            assertionHelper.verifyTwoTexts("Validate Stale Period in REMIT_PARAMETER Table: ",
                    String.valueOf(stalePeriod), monthsDiff.toString());
            assertionHelper.verifyTwoTexts(
                    "Validate Benf_City_Code Of REMIT_INSTRUMENT Table With REMIT_PARAMETER Table: ",
                    remitInstrument.getBeneficiaryCityCode(), remitParameter.getCityCode());
            if ("Cash".equalsIgnoreCase(arg2)) {
                assertionHelper.verifyTwoTexts("Validate Payment Mode in REMIT_INSTRUMENT Table: ",
                        remitInstrument.getPayMode(), "CS");
            } else {
                assertionHelper.verifyTwoTexts("Validate Payment Mode in REMIT_INSTRUMENT Table: ",
                        remitInstrument.getPayMode(), "TR");
                assertionHelper.verifyTwoTexts("Validate Debit Account Number in REMIT_INSTRUMENT Table: ",
                        remitInstrument.getDrAccountNo(), arg8);
                accMaster = accountService.getAccountMasterDetailsByAccNo(arg8);
                cacheHelper.setCacheWithaString(arg3 + "_" + "availableBal", accMaster.getAvailableBal() + "",
                        cacheData);
                cacheHelper.setCacheWithaString(arg3 + "_" + "ledgerBal", accMaster.getLedgerBal() + "", cacheData);
                cacheHelper.setCacheWithaString(arg3 + "_" + "shadowBal", accMaster.getShadowBal() + "", cacheData);
                
                assertionHelper.verifyTwoAmounts("Validate Available Balance in Account_Master Table: ",
                        accMaster.getAvailableBal().toString(),
                        cacheHelper.getCache(arg3 + "_" + "availableBal", cacheData));
                assertionHelper.verifyTwoAmounts("Validate Ledger Balance in Account_Master Table: ",
                        accMaster.getLedgerBal().toString(), cacheHelper.getCache(arg3 + "_" + "ledgerBal", cacheData));
                assertionHelper.verifyTwoAmounts("Validate Shadow Balance in Account_Master Table: ",
                        accMaster.getShadowBal().toString(), cacheHelper.getCache(arg3 + "_" + "shadowBal", cacheData));
                assertionHelper.verifyTwoTexts("Validate Prod_Insert Y/N Flag in Account_Master Table: ",
                        accMaster.getProdInsertYesNo(), "N");
            }
        } else {
            assertionHelper.verifyTwoTexts("Validate status in REMIT_INSTRUMENT Table: ", remitInstrument.getStatus(),
                    "R");
            
        }
    }
    
    @Then("^verify RtgsNeftOutward table where accNo \"([^\"]*)\" where voucher_num \"([^\"]*)\" and txnType \"([^\"]*)\" and TRANS_AMT \"([^\"]*)\" and BeneficiaryAcNo \"([^\"]*)\"$")
    public void verify_RtgsNeftOutward_table_where_accNo_where_voucher_num_and_txnType_and_TRANS_AMT_and_BeneficiaryAcNo(
            String arg1, String arg2, String arg3, String arg4, String arg5) throws Throwable {
        String vouchNo = cacheHelper.getCache(arg2, cacheData);
        long vNum = Long.parseLong(vouchNo);
        rtgsNeftOutward = rtgsNeftOutwardService.findRtgsNeftOutwardDetailsUsingNumber(arg1);
        accMaster = accountService.getAccountMasterDetailsByAccNo(arg1);
        custMaster = customerMasterService.getCustMasterDetailsByCustId(accMaster.getCustId());
        cacheHelper.setCacheWithaString("UtrNum", rtgsNeftOutward.getOrgUtrNo(), cacheData);
        cacheHelper.setCacheWithaString("OrginMsgId", rtgsNeftOutward.getOrgBizMsgIdr(), cacheData);
        benefDetails = beneficiaryDetailsService.findByBenfccountNumber(arg5);
        assertionHelper.verifyTwoTexts("Verifying Customer Name in rtgs_neft_outward table ", "SAGAR RAM PAWAR",
                custMaster.getCustName());
        
        assertionHelper.verifyTwoTexts("Verifying HO IFSC in rtgs_neft_outward table ", "SYSN0002101",
                rtgsNeftOutward.getHoIfsc());
        assertionHelper.verifyTwoTexts("Verifying Beneficiary ID in rtgs_neft_outward table ",
                rtgsNeftOutward.getBenefId().toString(), benefDetails.getBeneficiaryId().toString());
        
        assertionHelper.verifyTwoTexts("Verifying Origin Message ID in rtgs_neft_outward table ",
                cacheHelper.getCache("OrginMsgId", cacheData), rtgsNeftOutward.getOrgBizMsgIdr());
        
        assertionHelper.verifyTwoTexts("Verifying Voucher Number in rtgs_neft_outward table ", vouchNo,
                rtgsNeftOutward.getVoucherNo().toString());
        
        assertionHelper.verifyTwoTexts("Verifying Transaction Date in rtgs_neft_outward table ",
                dateHelper.getSystemDate("YYYY-MM-DD"), rtgsNeftOutward.getTxnDate().toString());
        if ("NE".equalsIgnoreCase(arg3)) {
            
            assertionHelper.verifyTwoTexts("Verifying Origin UTR Number in rtgs_neft_outward table ", "NE", arg3);
            assertionHelper.verifyTwoTexts("Verifying Origin UTR Number in rtgs_neft_outward table ",
                    cacheHelper.getCache("UtrNum", cacheData), rtgsNeftOutward.getOrgUtrNo());
            
            assertionHelper.verifyTwoTexts("Verifying Transaction Amount in rtgs_neft_outward table ", arg4 + ".00",
                    rtgsNeftOutward.getTxnAmount().toString());
        } else {
            
            assertionHelper.verifyTwoTexts("Verifying Origin UTR Number in rtgs_neft_outward table ", "RT", arg3);
            assertionHelper.verifyTwoTexts("Verifying Origin UTR Number in rtgs_neft_outward table ",
                    cacheHelper.getCache("UtrNum", cacheData), rtgsNeftOutward.getOrgUtrNo());
            
            assertionHelper.verifyTwoTexts("Verifying Transaction Amount in rtgs_neft_outward table ", arg4 + ".00",
                    rtgsNeftOutward.getTxnAmount().toString());
        }
    }
    
    @Then("^verify CHEQUE_BOOK_MASTER & CHEQUE_BOOK_DETAIL table where Account Number \"([^\"]*)\" and Instrument Number\"([^\"]*)\"  where voucher_num \"([^\"]*)\" and tranType \"([^\"]*)\"$")
    public void verify_CHEQUE_BOOK_MASTER_CHEQUE_BOOK_DETAIL_table_where_Account_Number_and_Instrument_Number_where_voucher_num_and_tranType(
            String arg1, String arg2, String arg3, String arg4) throws Throwable {
        chequeBookMaster = chequeBookService.findchequeBookMasterDetailsUsingAccNo(arg1);
        cacheHelper.setCacheWithaString("FromNum", chequeBookMaster.getFromNo() + "", cacheData);
        cacheHelper.setCacheWithaString("ToNum", chequeBookMaster.getEndNo() + "", cacheData);
        String vouchNo = cacheHelper.getCache(arg3, cacheData);
        transactionHeader = transactionHeaderService
                .getTransactionHeaderdetailsByVoucherNumberAndTransType(Long.parseLong(vouchNo), arg4);
        
        chequeBookDetail = chequeBookService.getChqDetailsInfoByInstrumentNo(arg2,
                new BigInteger(transactionHeader.getId() + ""));
        
        assertionHelper.verifyTwoTexts("Verifying Status in Cheque Book Master Table ", chequeBookMaster.getStatus(),
                "I");
        assertionHelper.verifyTwoTexts("Verifying From number in Cheque Book Master Table ",
                cacheHelper.getCache("FromNum", cacheData), arg2);
        
        assertionHelper.verifyTwoTexts("Verifying Status in Cheque Book Detail Table ", chequeBookDetail.getStatus(),
                "P");
        assertionHelper.verifyTwoTexts("Verifying Instrument Number in Cheque Book Detail Table ",
                chequeBookDetail.getInstrumentNo(), arg2);
        
        assertionHelper.verifyTwoTexts(
                "Verifying Paid Date in Cheque Book Detail Table " + " transId:" + transactionHeader.getId(),
                dateHelper.convertDbDateToDDMMYYYY(chequeBookDetail.getPaidDate() + ""),
                dateHelper.convertDbDateToDDMMYYYY(
                        branchParametersService.getBnrachLiveDate(property.getProperty("BranchCode")) + ""));
    }
}
