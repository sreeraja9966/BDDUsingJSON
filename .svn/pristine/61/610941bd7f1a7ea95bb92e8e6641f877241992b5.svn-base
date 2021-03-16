package com.sysnik.selenium.stepConfiguraiton;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.AccountMasterEntity;
import com.sysnik.selenium.entity.CustomerAccountEntity;
import com.sysnik.selenium.entity.CustomerMasterEntity;
import com.sysnik.selenium.entity.DepositMasterEntity;
import com.sysnik.selenium.entity.FlexiUnitParameterEntity;
import com.sysnik.selenium.entity.NomineeMasterEntity;
import com.sysnik.selenium.entity.ProductEntity;
import com.sysnik.selenium.entity.SIMasterEntity;
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
import cucumber.api.java.en.When;

public class FlexiAccount extends TestBase {
    
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
    private ProductEntity product;
    private FlexiUnitParameterEntity flexiUnitParam;
    private CustomerMasterEntity custMaster;
    private CustomerAccountEntity custAccount;
    private AccountMasterEntity accMaster;
    private DepositMasterEntity depositMaster;
    private SIMasterEntity siMaster;
    private NomineeMasterEntity nomineeMaster;
    
    @Then("^setup Flexi Account Screen$")
    public void setup_Flexi_Account_Screen() throws Throwable {
        dbHelper.executeQuery("DELETE FROM Account_Master WHERE STATUS='E' AND CUST_ID='4724'");
        dbHelper.executeQuery("DELETE FROM AC_CONTACT WHERE CONTACT_ID IN (10305,10304)");
    }
    
    @Then("^verify product \"([^\"]*)\" STATUS is active or not with PRODUCT table col STATUS \"([^\"]*)\" and Flexi Applicable falg \"([^\"]*)\"$")
    public void verify_product_STATUS_is_active_or_not_with_PRODUCT_table_col_STATUS_and_Flexi_Applicable_falg(
            String arg1, String arg2, String arg3) throws Throwable {
        
        int prdId = Integer.parseInt(arg1);
        product = productService.findProductDetailsUsindPrdId(prdId);
        assertionHelper.verifyTwoTexts("Verifying product id " + arg1 + " status ", product.getStatus(), arg2);
        assertionHelper.verifyTwoTexts("Verifying product id " + arg1 + "Flexi Applicable flag ",
                product.getFlexiApplicable(), arg3);
        assertionHelper.verifyTwoTexts("Verifying product id " + arg1 + " INTRO_REQ ", product.getIntroReq(), "Y");
    }
    
    @Then("^verify Link Flexi Product For SB / CA with FLEXI_UNIT_PARAMETER  table UNIT_OF_PERIOD \"([^\"]*)\" and  col  PRD_ID \"([^\"]*)\"  and  BASE_PRD_ID \"([^\"]*)\"$")
    public void verify_Link_Flexi_Product_For_SB_CA_with_FLEXI_UNIT_PARAMETER_table_UNIT_OF_PERIOD_and_col_PRD_ID_and_BASE_PRD_ID(
            String arg1, String arg2, String arg3) throws Throwable {
        int prdId = Integer.parseInt(arg3);
        flexiUnitParam = flexiUnitParameterService.getFlexiUnitParameterData(prdId);
        assertionHelper.verifyTwoTexts(
                "Verifying product id " + arg3 + " UNIT_OF_PERIOD in FLEXI_UNIT_PARAMETER Table ",
                flexiUnitParam.getUnitOfPeriod(), arg1);
        
        assertionHelper.verifyTwoTexts("Verifying BASE_PRD_ID in FLEXI_UNIT_PARAMETER Table  ",
                flexiUnitParam.getBasePrdId() + "", arg3);
        assertionHelper.verifyTwoTexts("Verifying PRD_ID in FLEXI_UNIT_PARAMETER Table  ",
                flexiUnitParam.getPrdId() + "", arg2);
        
    }
    
    @Then("^user select Account Type from dropdown as Saving or Current \"([^\"]*)\"$")
    public void user_select_Account_Type_from_dropdown_as_Saving_or_Current(String arg1) throws Throwable {
        dropDownHelper.SelectUsingVisibleText("DDAcountOpeningScreen_AccountType", arg1);
    }
    
    @Then("^user select Product Type from dropdown as Flexi Product \"([^\"]*)\"$")
    public void user_select_Product_Type_from_dropdown_as_Flexi_Product(String arg1) throws Throwable {
        dropDownHelper.SelectUsingVisibleText("DDAcountOpeningScreen_ProductName", arg1);
    }
    
    @Then("^user enters \"([^\"]*)\" active Customer Number$")
    public void user_enters_active_Customer_Number(String arg1) throws Throwable {
        seleniumHelper.enterText("DDAcountOpeningScreen_CustomerNumber", arg1);
    }
    
    @Then("^verify Account opening Date \"([^\"]*)\" with BRANCHPARAMETERS table col CURRENT_DT$")
    public void verify_Account_opening_Date_with_BRANCHPARAMETERS_table_col_CURRENT_DT(String arg1) throws Throwable {
        
        assertionHelper.verifyTextEquals("Verify Account Open Date ", "DDAcountOpeningScreen_AccOpenDate", arg1);
    }
    
    @Then("^user enters \"([^\"]*)\" active Introducer Number$")
    public void user_enters_active_Introducer_Number(String arg1) throws Throwable {
        
        seleniumHelper.enterText("DDAcountOpeningScreen_introducerNum", arg1);
    }
    
    @Then("^Verify \"([^\"]*)\" introducer Is Customer \"([^\"]*)\"  in CUST_MASTER table$")
    public void verify_introducer_Is_Customer_in_CUST_MASTER_table(String arg1, String arg2) throws Throwable {
        
        custMaster = customerMasterService.getCustomerUsingNumber(arg1);
        if ("Y".equalsIgnoreCase(arg2)) {
            assertionHelper.verifyTextEquals("Verifying Introducer Name ", "DDAcountOpeningScreen_introducerName",
                    custMaster.getCustName());
        }
    }
    
    @Then("^user select \"([^\"]*)\" from Nature of Account dropdown$")
    public void user_select_from_Nature_of_Account_dropdown(String arg1) throws Throwable {
        dropDownHelper.SelectUsingVisibleText("DDAcountOpeningScreen_NatureOfAcc", arg1);
    }
    
    @When("^user click on Opening Details tab$")
    public void user_click_on_Opening_Details_tab() throws Throwable {
        seleniumHelper.clickElement("DDAcountOpeningScreen_openingDetailsTab");
    }
    
    @Then("^Verify cust Category \"([^\"]*)\" where Customer Number \"([^\"]*)\"$")
    public void verify_cust_Category_where_Customer_Number(String arg1, String arg2) throws Throwable {
        
        custMaster = customerMasterService.getCustomerUsingNumber(arg2);
        assertionHelper.verifyTextEquals("Verifying customer category ", "DDAcountOpeningScreen_custCategory", arg1);
    }
    
    @Then("^user select \"([^\"]*)\" from Operating Instruction$")
    public void user_select_from_Operating_Instruction(String arg1) throws Throwable {
        
        dropDownHelper.SelectUsingVisibleText("DDAcountOpeningScreen_operatingInstruction", arg1);
    }
    
    @Then("^Verify Currency \"([^\"]*)\"$")
    public void verify_Currency(String arg1) throws Throwable {
        
        assertionHelper.verifyTextEquals("Verifying customer category ", "DDAcountOpeningScreen_currency", arg1);
    }
    
    @When("^user click on Notification Details tab$")
    public void user_click_on_Notification_Details_tab() throws Throwable {
        seleniumHelper.clickElement("DDAcountOpeningScreen_notificationDetailsTab");
    }
    
    @Then("^user select ATM facility  as Yes  \"([^\"]*)\"$")
    public void user_select_ATM_facility_as_Yes(String arg1) throws Throwable {
        seleniumHelper.clickElement(arg1);
    }
    
    @Then("^user select SMS facility  as Yes  \"([^\"]*)\"$")
    public void user_select_SMS_facility_as_Yes(String arg1) throws Throwable {
        seleniumHelper.clickElement(arg1);
    }
    
    @Then("^user select Email Notification as Yes  \"([^\"]*)\"$")
    public void user_select_Email_Notification_as_Yes(String arg1) throws Throwable {
        seleniumHelper.clickElement(arg1);
    }
    
    @Then("^user select ChequeBook facility  as Yes  \"([^\"]*)\"$")
    public void user_select_ChequeBook_facility_as_Yes(String arg1) throws Throwable {
        seleniumHelper.clickElement(arg1);
    }
    
    @Then("^user select Email Address from drop down \"([^\"]*)\" when Email Notification as select Yes$")
    public void user_select_Email_Address_from_drop_down_when_Email_Notification_as_select_Yes(String arg1)
            throws Throwable {
        waitingHelper.sleep(2000);
        dropDownHelper.SelectUsingVisibleText("DDAcountOpeningScreen_existingEmail", arg1);
    }
    
    @Then("^user select Mobile from drop down \"([^\"]*)\" when SMS facility  as select Yes$")
    public void user_select_Mobile_from_drop_down_when_SMS_facility_as_select_Yes(String arg1) throws Throwable {
        waitingHelper.sleep(2000);
        dropDownHelper.SelectUsingVisibleText("DDAcountOpeningScreen_existingMobile", arg1);
    }
    
    @When("^user click on Flexi Account Details tab$")
    public void user_click_on_Flexi_Account_Details_tab() throws Throwable {
        seleniumHelper.clickElement("DDAcountOpeningScreen_FlexiAccountDetailsTab");
    }
    
    @Then("^Verify Flexi Account Details tab ProductId \"([^\"]*)\" ProductName \"([^\"]*)\" MinimumBaseAmount \"([^\"]*)\" MaximumBaseAmount \"([^\"]*)\" UnitAmount \"([^\"]*)\"$")
    public void verify_Flexi_Account_Details_tab_ProductId_ProductName_MinimumBaseAmount_MaximumBaseAmount_UnitAmount(
            String arg1, String arg2, String arg3, String arg4, String arg5) throws Throwable {
        
        assertionHelper.verifyTextEquals("Verifying Product Id On Ui ", "DDAcountOpeningScreen_prdId", arg1);
        assertionHelper.verifyTextEquals("Verifying Product Name On Ui ", "DDAcountOpeningScreen_prodName", arg2);
        assertionHelper.verifyTextEquals("Verifying Product Minimum Base Amount On Ui ",
                "DDAcountOpeningScreen_minBaseAmount", arg3);
        assertionHelper.verifyTextEquals("Verifying Product Maximum Base Amount On Ui ",
                "DDAcountOpeningScreen_maxFlexiAmount", arg4);
        assertionHelper.verifyTextEquals("Verifying Product Unit Amount On Ui ", "DDAcountOpeningScreen_amountPerUnit",
                arg5);
    }
    
    @Then("^verify ProductId \"([^\"]*)\" with FLEXI_UNIT_PARAMETER table col CUT_OFF_LIMIT \"([^\"]*)\" and MAX_FLEXI_AMOUNT \"([^\"]*)\" and AMOUNT_PER_UNIT \"([^\"]*)\"$")
    public void verify_ProductId_with_FLEXI_UNIT_PARAMETER_table_col_CUT_OFF_LIMIT_and_MAX_FLEXI_AMOUNT_and_AMOUNT_PER_UNIT(
            String arg1, String arg2, String arg3, String arg4) throws Throwable {
        
        int prdId = Integer.parseInt(arg1);
        flexiUnitParam = flexiUnitParameterService.getFlexiUnitParameterData(prdId);
        
        assertionHelper.verifyTwoTexts(
                "Verifying Product Id " + arg1 + " Minimum Base Amount in FLEXI_UNIT_PARAMETER Table  ",
                flexiUnitParam.getCutOffLimit().toString(), arg2 + ".000000");
        assertionHelper.verifyTwoTexts(
                "Verifying Product Id " + arg1 + " Maximum Base Amount in FLEXI_UNIT_PARAMETER Table  ",
                flexiUnitParam.getMaxFlexiAmount().toString(), arg3 + ".000000");
        assertionHelper.verifyTwoTexts(
                "Verifying Product Id " + arg1 + " Product Amount Per Unit in FLEXI_UNIT_PARAMETER Table ",
                flexiUnitParam.getAmountPerUnit().toString(), arg4 + ".000000");
    }
    
    @When("^user click on Submit button$")
    public void user_click_on_Submit_button() throws Throwable {
        seleniumHelper.clickElement("DDAcountOpeningScreen_submit");
        waitingHelper.sleep(3000);
    }
    
    @Then("^verify AccountType \"([^\"]*)\" of ACCOUNT_MASTER col  STATUS \"([^\"]*)\" & Customer Account & DEPOSIT_MASTER & SIFlag \"([^\"]*)\" & Flow \"([^\"]*)\"$")
    public void verify_AccountType_of_ACCOUNT_MASTER_col_STATUS_Customer_Account_DEPOSIT_MASTER_SIFlag_Flow(String arg1,
            String arg2, String arg3, String arg4) throws Throwable {
        String SavingAcc_No;
        String SavingUserAccNum;
        String FlexiUserAcc_No;
        
        if ("Saving Account".equalsIgnoreCase(arg1)) {
            if ("Entry".equalsIgnoreCase(arg4)) {
                if ("Y".equalsIgnoreCase(arg3)) {
                    SavingAcc_No = cacheHelper.getCache("InternalAccountNumSBWithSI", cacheData);
                    FlexiUserAcc_No = cacheHelper.getCache("FlexiAccNumSBWithSI", cacheData);
                    SavingUserAccNum = cacheHelper.getCache("UserAccNumSBWithSI", cacheData);
                } else {
                    SavingAcc_No = cacheHelper.getCache("InternalAccountNumSB", cacheData);
                    FlexiUserAcc_No = cacheHelper.getCache("FlexiAccNumSB", cacheData);
                    SavingUserAccNum = cacheHelper.getCache("UserAccNumSB", cacheData);
                }
            } else {
                if ("Y".equalsIgnoreCase(arg3)) {
                    SavingAcc_No = cacheHelper.getCache("InternalAccountNumSBWithSIRejection", cacheData);
                    FlexiUserAcc_No = cacheHelper.getCache("FlexiAccNumSBWithSIRejection", cacheData);
                    SavingUserAccNum = cacheHelper.getCache("UserAccNumSBWithSIRejection", cacheData);
                } else {
                    SavingAcc_No = cacheHelper.getCache("InternalAccountNumSBRejection", cacheData);
                    FlexiUserAcc_No = cacheHelper.getCache("FlexiAccNumSBRejection", cacheData);
                    SavingUserAccNum = cacheHelper.getCache("UserAccNumSBRejection", cacheData);
                }
            }
            accMaster = accountService.getAccountMasterDetailsByAccNo(SavingAcc_No);
            depositMaster = depositMasterService.getDepositMasterDetailsByAccId(accMaster.getAccId());
            custAccount = customerAccountService.getCustomerAccDetailsByUserAccNumber(SavingUserAccNum);
            assertionHelper.verifyTwoTexts("Verifying Status of Saving Account Number in Account Master ",
                    accMaster.getStatus(), "E");
            assertionHelper.verifyTwoTexts("Verifying Account Type of SB Account Number in Account Master ",
                    accMaster.getAccType(), "SB");
            assertionHelper.verifyTwoTexts("Verifying Account Number of SB in Customer Account Table ",
                    custAccount.getAccNo(), SavingAcc_No);
            assertionHelper.verifyTwoTexts("Verifying User Account Number of SB in Customer Account Table ",
                    custAccount.getUserAccNo(), SavingUserAccNum);
            
            assertionHelper.verifyTwoTexts("Validate Deposit_Master AccId of SB AccNo ",
                    accMaster.getAccId().toString(), depositMaster.getAccId().toString());
            
            custAccount = customerAccountService.getCustomerAccDetailsByUserAccNumber(FlexiUserAcc_No);
            String FDAcNo = custAccount.getAccNo();
            accMaster = accountService.getAccountMasterDetailsByAccNo(FDAcNo);
            depositMaster = depositMasterService.getDepositMasterDetailsByAccId(accMaster.getAccId());
            assertionHelper.verifyTwoTexts("Verifying Status of FD Account Number in Account Master ",
                    accMaster.getStatus(), "E");
            assertionHelper.verifyTwoTexts("Verifying Account Type of FD Account Number in Account Master ",
                    accMaster.getAccType(), "FD");
            assertionHelper.verifyTwoTexts("Verifying Account Number of FD ", custAccount.getAccNo(), FDAcNo);
            assertionHelper.verifyTwoTexts("Verifying User Account Number of FD ", custAccount.getUserAccNo(),
                    FlexiUserAcc_No);
            assertionHelper.verifyTwoTexts("Validate Deposit_Master AccId of FD AccNo ",
                    accMaster.getAccId().toString(), depositMaster.getAccId().toString());
            
        } else {
            String CurrentAcc_No;
            String CurrentUserAccNum;
            if ("Entry".equalsIgnoreCase(arg4)) {
                if ("Y".equalsIgnoreCase(arg3)) {
                    CurrentAcc_No = cacheHelper.getCache("InternalAccountNumCAWithSI", cacheData);
                    FlexiUserAcc_No = cacheHelper.getCache("FlexiAccNumCAWithSI", cacheData);
                    CurrentUserAccNum = cacheHelper.getCache("UserAccNumCAWithSI", cacheData);
                } else {
                    CurrentAcc_No = cacheHelper.getCache("InternalAccountNumCA", cacheData);
                    FlexiUserAcc_No = cacheHelper.getCache("FlexiAccNumCA", cacheData);
                    CurrentUserAccNum = cacheHelper.getCache("UserAccNumCA", cacheData);
                }
            } else {
                if ("Y".equalsIgnoreCase(arg3)) {
                    CurrentAcc_No = cacheHelper.getCache("InternalAccountNumCAWithSIRejection", cacheData);
                    FlexiUserAcc_No = cacheHelper.getCache("FlexiAccNumCAWithSIRejection", cacheData);
                    CurrentUserAccNum = cacheHelper.getCache("UserAccNumCAWithSIRejection", cacheData);
                } else {
                    CurrentAcc_No = cacheHelper.getCache("InternalAccountNumCARejection", cacheData);
                    FlexiUserAcc_No = cacheHelper.getCache("FlexiAccNumCARejection", cacheData);
                    CurrentUserAccNum = cacheHelper.getCache("UserAccNumCARejection", cacheData);
                }
            }
            
            accMaster = accountService.getAccountMasterDetailsByAccNo(CurrentAcc_No);
            depositMaster = depositMasterService.getDepositMasterDetailsByAccId(accMaster.getAccId());
            custAccount = customerAccountService.getCustomerAccDetailsByUserAccNumber(CurrentUserAccNum);
            assertionHelper.verifyTwoTexts("Verifying Status of Current Account Number in Account Master ",
                    accMaster.getStatus(), "E");
            assertionHelper.verifyTwoTexts("Verifying Account Type of CA Account Number in Account Master ",
                    accMaster.getAccType(), "CA");
            assertionHelper.verifyTwoTexts("Verifying Account Number of CA in Customer Account Table ",
                    custAccount.getAccNo(), CurrentAcc_No);
            assertionHelper.verifyTwoTexts("Verifying User Account Number of CA in Customer Account Table ",
                    custAccount.getUserAccNo(), CurrentUserAccNum);
            
            assertionHelper.verifyTwoTexts("Validate Deposit_Master AccId of CA AccNo ",
                    accMaster.getAccId().toString(), depositMaster.getAccId().toString());
            
            custAccount = customerAccountService.getCustomerAccDetailsByUserAccNumber(FlexiUserAcc_No);
            String FDAcNo = custAccount.getAccNo();
            accMaster = accountService.getAccountMasterDetailsByAccNo(FDAcNo);
            depositMaster = depositMasterService.getDepositMasterDetailsByAccId(accMaster.getAccId());
            assertionHelper.verifyTwoTexts("Verifying Status of FD Account Number in Account Master ",
                    accMaster.getStatus(), "E");
            assertionHelper.verifyTwoTexts("Verifying Account Type of FD Account Number in Account Master ",
                    accMaster.getAccType(), "FD");
            assertionHelper.verifyTwoTexts("Verifying Account Number of FD ", custAccount.getAccNo(), FDAcNo);
            assertionHelper.verifyTwoTexts("Verifying User Account Number of FD ", custAccount.getUserAccNo(),
                    FlexiUserAcc_No);
            assertionHelper.verifyTwoTexts("Validate Deposit_Master AccId of FD AccNo ",
                    accMaster.getAccId().toString(), depositMaster.getAccId().toString());
        }
    }
    
    @When("^user click on Operator Details tab$")
    public void user_click_on_Operator_Details_tab() throws Throwable {
        seleniumHelper.clickElement("DDAcountOpeningScreen_otherOperatorDetailTab");
    }
    
    @When("^user enters OtherOperatorNumber\"([^\"]*)\" active Customer Number$")
    public void user_enters_OtherOperatorNumber_active_Customer_Number(String arg1) throws Throwable {
        seleniumHelper.enterText("DDAcountOpeningScreen_OtherOperators", arg1);
    }
    
    @Then("^verify AccountType \"([^\"]*)\" of ACCOUNT_MASTER col  STATUS \"([^\"]*)\" & Customer Account & DEPOSIT_MASTER &  UseExistingNominee \"([^\"]*)\"$")
    public void verify_AccountType_of_ACCOUNT_MASTER_col_STATUS_Customer_Account_DEPOSIT_MASTER_UseExistingNominee(
            String arg1, String arg2, String arg3) throws Throwable {
        
        String SavingAcc_No;
        String SavingUserAccNum;
        String FlexiUserAcc_No;
        
        if ("Saving Account".equalsIgnoreCase(arg1)) {
            if ("Yes".equalsIgnoreCase(arg3)) {
                SavingAcc_No = cacheHelper.getCache("InternalAccountNumSBWithSIExistingNomYes", cacheData);
                FlexiUserAcc_No = cacheHelper.getCache("FlexiAccNumSBWithSIExistingNomYes", cacheData);
                SavingUserAccNum = cacheHelper.getCache("UserAccNumSBWithSIExistingNomYes", cacheData);
                
            } else {
                
                SavingAcc_No = cacheHelper.getCache("InternalAccountNumSBWithSIExistingNomNo", cacheData);
                FlexiUserAcc_No = cacheHelper.getCache("FlexiAccNumSBWithSIExistingNomNo", cacheData);
                SavingUserAccNum = cacheHelper.getCache("UserAccNumSBWithSIExistingNomNo", cacheData);
            }
            
            accMaster = accountService.getAccountMasterDetailsByAccNo(SavingAcc_No);
            depositMaster = depositMasterService.getDepositMasterDetailsByAccId(accMaster.getAccId());
            custAccount = customerAccountService.getCustomerAccDetailsByUserAccNumber(SavingUserAccNum);
            assertionHelper.verifyTwoTexts("Verifying Status of Saving Account Number in Account Master ",
                    accMaster.getStatus(), "E");
            assertionHelper.verifyTwoTexts("Verifying Account Type of SB Account Number in Account Master ",
                    accMaster.getAccType(), "SB");
            assertionHelper.verifyTwoTexts("Verifying Account Number of SB in Customer Account Table ",
                    custAccount.getAccNo(), SavingAcc_No);
            assertionHelper.verifyTwoTexts("Verifying User Account Number of SB in Customer Account Table ",
                    custAccount.getUserAccNo(), SavingUserAccNum);
            
            assertionHelper.verifyTwoTexts("Validate Deposit_Master AccId of SB AccNo ",
                    accMaster.getAccId().toString(), depositMaster.getAccId().toString());
            
            custAccount = customerAccountService.getCustomerAccDetailsByUserAccNumber(FlexiUserAcc_No);
            String FDAcNo = custAccount.getAccNo();
            accMaster = accountService.getAccountMasterDetailsByAccNo(FDAcNo);
            depositMaster = depositMasterService.getDepositMasterDetailsByAccId(accMaster.getAccId());
            assertionHelper.verifyTwoTexts("Verifying Status of FD Account Number in Account Master ",
                    accMaster.getStatus(), "E");
            assertionHelper.verifyTwoTexts("Verifying Account Type of FD Account Number in Account Master ",
                    accMaster.getAccType(), "FD");
            assertionHelper.verifyTwoTexts("Verifying Account Number of FD ", custAccount.getAccNo(), FDAcNo);
            assertionHelper.verifyTwoTexts("Verifying User Account Number of FD ", custAccount.getUserAccNo(),
                    FlexiUserAcc_No);
            assertionHelper.verifyTwoTexts("Validate Deposit_Master AccId of FD AccNo ",
                    accMaster.getAccId().toString(), depositMaster.getAccId().toString());
            
        } else {
            
            String CurrentAcc_No;
            String CurrentUserAccNum;
            
            if ("Yes".equalsIgnoreCase(arg3)) {
                CurrentAcc_No = cacheHelper.getCache("InternalAccountNumCAWithSIExistingNomYes", cacheData);
                FlexiUserAcc_No = cacheHelper.getCache("FlexiAccNumCAWithSIExistingNomYes", cacheData);
                CurrentUserAccNum = cacheHelper.getCache("UserAccNumCAWithSIExistingNomYes", cacheData);
            } else {
                CurrentAcc_No = cacheHelper.getCache("InternalAccountNumCAWithSIExistingNomNo", cacheData);
                FlexiUserAcc_No = cacheHelper.getCache("FlexiAccNumCAWithSIExistingNomNo", cacheData);
                CurrentUserAccNum = cacheHelper.getCache("UserAccNumCAWithSIExistingNomNo", cacheData);
            }
            
            accMaster = accountService.getAccountMasterDetailsByAccNo(CurrentAcc_No);
            depositMaster = depositMasterService.getDepositMasterDetailsByAccId(accMaster.getAccId());
            custAccount = customerAccountService.getCustomerAccDetailsByUserAccNumber(CurrentUserAccNum);
            assertionHelper.verifyTwoTexts("Verifying Status of Current Account Number in Account Master ",
                    accMaster.getStatus(), "E");
            assertionHelper.verifyTwoTexts("Verifying Account Type of CA Account Number in Account Master ",
                    accMaster.getAccType(), "CA");
            assertionHelper.verifyTwoTexts("Verifying Account Number of CA in Customer Account Table ",
                    custAccount.getAccNo(), CurrentAcc_No);
            assertionHelper.verifyTwoTexts("Verifying User Account Number of CA in Customer Account Table ",
                    custAccount.getUserAccNo(), CurrentUserAccNum);
            
            assertionHelper.verifyTwoTexts("Validate Deposit_Master AccId of CA AccNo ",
                    accMaster.getAccId().toString(), depositMaster.getAccId().toString());
            
            custAccount = customerAccountService.getCustomerAccDetailsByUserAccNumber(FlexiUserAcc_No);
            String FDAcNo = custAccount.getAccNo();
            accMaster = accountService.getAccountMasterDetailsByAccNo(FDAcNo);
            depositMaster = depositMasterService.getDepositMasterDetailsByAccId(accMaster.getAccId());
            assertionHelper.verifyTwoTexts("Verifying Status of FD Account Number in Account Master ",
                    accMaster.getStatus(), "E");
            assertionHelper.verifyTwoTexts("Verifying Account Type of FD Account Number in Account Master ",
                    accMaster.getAccType(), "FD");
            assertionHelper.verifyTwoTexts("Verifying Account Number of FD ", custAccount.getAccNo(), FDAcNo);
            assertionHelper.verifyTwoTexts("Verifying User Account Number of FD ", custAccount.getUserAccNo(),
                    FlexiUserAcc_No);
            assertionHelper.verifyTwoTexts("Validate Deposit_Master AccId of FD AccNo ",
                    accMaster.getAccId().toString(), depositMaster.getAccId().toString());
        }
    }
    
    @Then("^user select Other Operator as Partner or Official \"([^\"]*)\" and  Authorized Signatory  as Yes or No  \"([^\"]*)\"$")
    public void user_select_Other_Operator_as_Partner_or_Official_and_Authorized_Signatory_as_Yes_or_No(String arg1,
            String arg2) throws Throwable {
        
        if ("P".equalsIgnoreCase(arg1)) {
            seleniumHelper.clickElement("DDAcountOpeningScreen_accountHolderP");
            waitingHelper.sleep(1500);
        } else if ("O".equalsIgnoreCase(arg1)) {
            seleniumHelper.clickElement("DDAcountOpeningScreen_accountHolderO");
        }
        if ("Y".equalsIgnoreCase(arg2)) {
            seleniumHelper.clickElement("DDAcountOpeningScreen_authorizedSignatoryY");
            robotHelper.pressTab();
            robotHelper.pressEnter();
            try {
                robotHelper.fileUploadUsingRobot(relativePath() + "\\src\\main\\resources\\signature\\sign.jpg");
            } catch (Exception e) {
                reportHelper.writeLogInCaseOfFail("File not Found in the mentioned path=====>" + relativePath()
                        + "\\src\\main\\resources\\signature\\download.jpg");
            }
        } else if ("N".equalsIgnoreCase(arg2)) {
            seleniumHelper.clickElement("DDAcountOpeningScreen_authorizedSignatoryN");
        }
    }
    
    @When("^user click on Add Operator button$")
    public void user_click_on_Add_Operator_button() throws Throwable {
        seleniumHelper.clickElement("DDAcountOpeningScreen_AddOperatorButton");
    }
    
    @Then("^verify AccountType \"([^\"]*)\" of ACCOUNT_MASTER STATUS \"([^\"]*)\" & Customer Account & DEPOSIT_MASTER of joint account & OtherOperator \"([^\"]*)\" & PartOff \"([^\"]*)\" & AuthorizedSignatory \"([^\"]*)\" & SIFlag \"([^\"]*)\" & Flow \"([^\"]*)\"$")
    public void verify_AccountType_of_ACCOUNT_MASTER_STATUS_Customer_Account_DEPOSIT_MASTER_of_joint_account_OtherOperator_PartOff_AuthorizedSignatory_SIFlag_Flow(
            String arg1, String arg2, String arg3, String arg4, String arg5, String arg6, String arg7)
            throws Throwable {
        
        String SavingAcc_No;
        String SavingUserAccNum;
        String FlexiUserAcc_No;
        
        if ("Saving Account".equalsIgnoreCase(arg1)) {
            if ("Entry".equalsIgnoreCase(arg7)) {
                if ("Y".equalsIgnoreCase(arg6)) {
                    SavingAcc_No = cacheHelper.getCache("InternalAccountNumSBWithOperatorWithSI", cacheData);
                    FlexiUserAcc_No = cacheHelper.getCache("FlexiAccNumSBWithOperatorWithSI", cacheData);
                    SavingUserAccNum = cacheHelper.getCache("UserAccNumSBWithOperatorWithSI", cacheData);
                } else {
                    SavingAcc_No = cacheHelper.getCache("InternalAccountNumSBWithOperator", cacheData);
                    FlexiUserAcc_No = cacheHelper.getCache("FlexiAccNumSBWithOperator", cacheData);
                    SavingUserAccNum = cacheHelper.getCache("UserAccNumSBWithOperator", cacheData);
                }
            } else {
                if ("Y".equalsIgnoreCase(arg6)) {
                    SavingAcc_No = cacheHelper.getCache("InternalAccountNumSBWithOperatorWithSIRejection", cacheData);
                    FlexiUserAcc_No = cacheHelper.getCache("FlexiAccNumSBWithOperatorWithSIRejection", cacheData);
                    SavingUserAccNum = cacheHelper.getCache("UserAccNumSBWithOperatorWithSIRejection", cacheData);
                } else {
                    SavingAcc_No = cacheHelper.getCache("InternalAccountNumSBWithOperatorRejection", cacheData);
                    FlexiUserAcc_No = cacheHelper.getCache("FlexiAccNumSBWithOperatorRejection", cacheData);
                    SavingUserAccNum = cacheHelper.getCache("UserAccNumSBWithOperatorRejection", cacheData);
                }
            }
            accMaster = accountService.getAccountMasterDetailsByAccNo(SavingAcc_No);
            depositMaster = depositMasterService.getDepositMasterDetailsByAccId(accMaster.getAccId());
            custAccount = customerAccountService.getCustomerAccDetailsByUserAccNumber(SavingUserAccNum);
            List<CustomerAccountEntity> custAccountList = new ArrayList<>();
            custAccountList = customerAccountService.getCustomerAccDetailsByAccId(custAccount.getAccId());
            assertionHelper.verifyTwoTexts("Verifying Status of Saving Account Number in Account Master ",
                    accMaster.getStatus(), "E");
            assertionHelper.verifyTwoTexts("Verifying Account Type of SB Account Number in Account Master ",
                    accMaster.getAccType(), "SB");
            assertionHelper.verifyTwoTexts("Verifying Account Number of SB in Customer Account Table ",
                    custAccount.getAccNo(), SavingAcc_No);
            assertionHelper.verifyTwoTexts("Verifying Operator Value of SB Account Holder ",
                    custAccountList.get(0).getOperator(), "A");
            assertionHelper.verifyTwoTexts("Verifying Part Off Value of SB Account Holder ",
                    custAccountList.get(0).getPartOff(), "A");
            assertionHelper.verifyTwoTexts("Verifying AUTH_SIG Value of SB Account Holder ",
                    custAccountList.get(0).getAuthSig(), arg5);
            assertionHelper.verifyTwoTexts("Verifying Operator Value of SB Operator ",
                    custAccountList.get(1).getOperator(), arg3);
            assertionHelper.verifyTwoTexts("Verifying Part Off Value of SB Operator ",
                    custAccountList.get(1).getPartOff(), arg4);
            assertionHelper.verifyTwoTexts("Verifying AUTH_SIG Value of SB Operator ",
                    custAccountList.get(1).getAuthSig(), arg5);
            assertionHelper.verifyTwoTexts("Verifying User Account Number of SB in Customer Account Table ",
                    custAccount.getUserAccNo(), SavingUserAccNum);
            
            assertionHelper.verifyTwoTexts("Validate Deposit_Master AccId of SB AccNo ",
                    accMaster.getAccId().toString(), depositMaster.getAccId().toString());
            
            custAccount = customerAccountService.getCustomerAccDetailsByUserAccNumber(FlexiUserAcc_No);
            custAccountList = customerAccountService.getCustomerAccDetailsByAccId(custAccount.getAccId());
            String FDAcNo = custAccount.getAccNo();
            accMaster = accountService.getAccountMasterDetailsByAccNo(FDAcNo);
            depositMaster = depositMasterService.getDepositMasterDetailsByAccId(accMaster.getAccId());
            assertionHelper.verifyTwoTexts("Verifying Status of FD Account Number in Account Master ",
                    accMaster.getStatus(), "E");
            assertionHelper.verifyTwoTexts("Verifying Account Type of FD Account Number in Account Master ",
                    accMaster.getAccType(), "FD");
            assertionHelper.verifyTwoTexts("Verifying Account Number of FD ", custAccount.getAccNo(), FDAcNo);
            assertionHelper.verifyTwoTexts("Verifying Operator Value of FD Account Holder ",
                    custAccountList.get(0).getOperator(), "A");
            assertionHelper.verifyTwoTexts("Verifying Part Off Value of FD Account Holder ",
                    custAccountList.get(0).getPartOff(), "A");
            assertionHelper.verifyTwoTexts("Verifying AUTH_SIG Value of FD Account Holder ",
                    custAccountList.get(0).getAuthSig(), arg5);
            assertionHelper.verifyTwoTexts("Verifying Operator Value of FD Operator ",
                    custAccountList.get(1).getOperator(), arg3);
            assertionHelper.verifyTwoTexts("Verifying Part Off Value of FD Operator ",
                    custAccountList.get(1).getPartOff(), arg4);
            assertionHelper.verifyTwoTexts("Verifying AUTH_SIG Value of FD Operator ",
                    custAccountList.get(1).getAuthSig(), arg5);
            assertionHelper.verifyTwoTexts("Verifying User Account Number of FD ", custAccount.getUserAccNo(),
                    FlexiUserAcc_No);
            assertionHelper.verifyTwoTexts("Validate Deposit_Master AccId of FD AccNo ",
                    accMaster.getAccId().toString(), depositMaster.getAccId().toString());
        } else {
            String CurrentAcc_No;
            String CurrentUserAccNum;
            if ("Entry".equalsIgnoreCase(arg7)) {
                if ("Y".equalsIgnoreCase(arg6)) {
                    CurrentAcc_No = cacheHelper.getCache("InternalAccountNumCAWithOperatorWithSI", cacheData);
                    FlexiUserAcc_No = cacheHelper.getCache("FlexiAccNumCAWithOperatorWithSI", cacheData);
                    CurrentUserAccNum = cacheHelper.getCache("UserAccNumCAWithOperatorWithSI", cacheData);
                } else {
                    CurrentAcc_No = cacheHelper.getCache("InternalAccountNumCAWithOperator", cacheData);
                    FlexiUserAcc_No = cacheHelper.getCache("FlexiAccNumCAWithOperator", cacheData);
                    CurrentUserAccNum = cacheHelper.getCache("UserAccNumCAWithOperator", cacheData);
                }
            } else {
                
                if ("Y".equalsIgnoreCase(arg6)) {
                    CurrentAcc_No = cacheHelper.getCache("InternalAccountNumCAWithOperatorWithSIRejection", cacheData);
                    FlexiUserAcc_No = cacheHelper.getCache("FlexiAccNumCAWithOperatorWithSIRejection", cacheData);
                    CurrentUserAccNum = cacheHelper.getCache("UserAccNumCAWithOperatorWithSIRejection", cacheData);
                } else {
                    CurrentAcc_No = cacheHelper.getCache("InternalAccountNumCAWithOperatorRejection", cacheData);
                    FlexiUserAcc_No = cacheHelper.getCache("FlexiAccNumCAWithOperatorRejection", cacheData);
                    CurrentUserAccNum = cacheHelper.getCache("UserAccNumCAWithOperatorRejection", cacheData);
                }
            }
            accMaster = accountService.getAccountMasterDetailsByAccNo(CurrentAcc_No);
            depositMaster = depositMasterService.getDepositMasterDetailsByAccId(accMaster.getAccId());
            custAccount = customerAccountService.getCustomerAccDetailsByUserAccNumber(CurrentUserAccNum);
            List<CustomerAccountEntity> custAccountList = new ArrayList<>();
            custAccountList = customerAccountService.getCustomerAccDetailsByAccId(custAccount.getAccId());
            assertionHelper.verifyTwoTexts("Verifying Status of Current Account Number in Account Master ",
                    accMaster.getStatus(), "E");
            assertionHelper.verifyTwoTexts("Verifying Account Type of CA Account Number in Account Master ",
                    accMaster.getAccType(), "CA");
            assertionHelper.verifyTwoTexts("Verifying Account Number of CA in Customer Account Table ",
                    custAccount.getAccNo(), CurrentAcc_No);
            assertionHelper.verifyTwoTexts("Verifying Operator Value of CA Account Holder ",
                    custAccountList.get(0).getOperator(), "A");
            assertionHelper.verifyTwoTexts("Verifying Part Off Value of CA Account Holder ",
                    custAccountList.get(0).getPartOff(), "A");
            assertionHelper.verifyTwoTexts("Verifying AUTH_SIG Value of CA Account Holder ",
                    custAccountList.get(0).getAuthSig(), "Y");
            assertionHelper.verifyTwoTexts("Verifying Operator Value of CA Operator ",
                    custAccountList.get(1).getOperator(), arg3);
            assertionHelper.verifyTwoTexts("Verifying Part Off Value of CA Operator ",
                    custAccountList.get(1).getPartOff(), arg4);
            assertionHelper.verifyTwoTexts("Verifying AUTH_SIG Value of CA Operator ",
                    custAccountList.get(1).getAuthSig(), arg5);
            assertionHelper.verifyTwoTexts("Verifying User Account Number of CA in Customer Account Table ",
                    custAccount.getUserAccNo(), CurrentUserAccNum);
            
            assertionHelper.verifyTwoTexts("Validate Deposit_Master AccId of CA AccNo ",
                    accMaster.getAccId().toString(), depositMaster.getAccId().toString());
            
            custAccount = customerAccountService.getCustomerAccDetailsByUserAccNumber(FlexiUserAcc_No);
            custAccountList = customerAccountService.getCustomerAccDetailsByAccId(custAccount.getAccId());
            String FDAcNo = custAccount.getAccNo();
            accMaster = accountService.getAccountMasterDetailsByAccNo(FDAcNo);
            depositMaster = depositMasterService.getDepositMasterDetailsByAccId(accMaster.getAccId());
            assertionHelper.verifyTwoTexts("Verifying Status of FD Account Number in Account Master ",
                    accMaster.getStatus(), "E");
            assertionHelper.verifyTwoTexts("Verifying Account Type of FD Account Number in Account Master ",
                    accMaster.getAccType(), "FD");
            assertionHelper.verifyTwoTexts("Verifying Account Number of FD ", custAccount.getAccNo(), FDAcNo);
            assertionHelper.verifyTwoTexts("Verifying Operator Value of FD ", custAccountList.get(0).getOperator(),
                    "A");
            assertionHelper.verifyTwoTexts("Verifying Part Off Value of FD ", custAccountList.get(0).getPartOff(), "A");
            assertionHelper.verifyTwoTexts("Verifying AUTH_SIG Value of FD ", custAccountList.get(0).getAuthSig(), "Y");
            assertionHelper.verifyTwoTexts("Verifying Operator Value of FD ", custAccountList.get(1).getOperator(),
                    arg3);
            assertionHelper.verifyTwoTexts("Verifying Part Off Value of FD ", custAccountList.get(1).getPartOff(),
                    arg4);
            assertionHelper.verifyTwoTexts("Verifying AUTH_SIG Value of FD ", custAccountList.get(1).getAuthSig(),
                    arg5);
            assertionHelper.verifyTwoTexts("Verifying User Account Number of FD ", custAccount.getUserAccNo(),
                    FlexiUserAcc_No);
            assertionHelper.verifyTwoTexts("Validate Deposit_Master AccId of FD AccNo ",
                    accMaster.getAccId().toString(), depositMaster.getAccId().toString());
        }
        
    }
    
    @Then("^user click SI \"([^\"]*)\" Yes or No$")
    public void user_click_SI_Yes_or_No(String arg1) throws Throwable {
        if ("Yes".equalsIgnoreCase(arg1)) {
            seleniumHelper.clickElement("DDAcountOpeningScreen_RedirectToSI");
        }
    }
    
    @Then("^user fetched Name of Debit Acc Num$")
    public void user_fetched_Name_of_Debit_Acc_Num() throws Throwable {
        seleniumHelper.clickElement("SIEntryScreen_fromAccNo");
        waitingHelper.sleep(3000);
    }
    
    @Then("^user enters \"([^\"]*)\" active Credit Account Number$")
    public void user_enters_active_Credit_Account_Number(String arg1) throws Throwable {
        seleniumHelper.enterText("SIEntryScreen_toAccNo", arg1);
    }
    
    @Then("^user select SI Type \"([^\"]*)\" Fixed or Floating$")
    public void user_select_SI_Type_Fixed_or_Floating(String arg1) throws Throwable {
        seleniumHelper.clickElement("SIEntryScreen_siTypeFixed");
    }
    
    @Then("^verify Debit Customer Name On SI Screen Ui of Account Type \"([^\"]*)\" and UseExistingNominee \"([^\"]*)\" & Flow \"([^\"]*)\"$")
    public void verify_Debit_Customer_Name_On_SI_Screen_Ui_of_Account_Type_and_UseExistingNominee_Flow(String arg1,
            String arg2, String arg3) throws Throwable {
        String DebitAccNum;
        if ("Saving Account".equalsIgnoreCase(arg1)) {
            if ("Yes".equalsIgnoreCase(arg2)) {
                if ("Entry".equalsIgnoreCase(arg3)) {
                    DebitAccNum = cacheHelper.getCache("InternalAccountNumSBWithSIExistingNomYes", cacheData);
                } else {
                    DebitAccNum = cacheHelper.getCache("InternalAccountNumSBWithSIExistingNomYesRejection", cacheData);
                }
                accMaster = accountService.getAccountMasterDetailsByAccNo(DebitAccNum);
            } else {
                if ("Entry".equalsIgnoreCase(arg3)) {
                    DebitAccNum = cacheHelper.getCache("InternalAccountNumSBWithSIExistingNomNo", cacheData);
                } else {
                    DebitAccNum = cacheHelper.getCache("InternalAccountNumSBWithSIExistingNomNoRejection", cacheData);
                }
                accMaster = accountService.getAccountMasterDetailsByAccNo(DebitAccNum);
            }
        } else {
            if ("Yes".equalsIgnoreCase(arg2)) {
                if ("Entry".equalsIgnoreCase(arg3)) {
                    DebitAccNum = cacheHelper.getCache("InternalAccountNumCAWithSIExistingNomYes", cacheData);
                } else {
                    DebitAccNum = cacheHelper.getCache("InternalAccountNumCAWithSIExistingNomYesRejection", cacheData);
                }
                accMaster = accountService.getAccountMasterDetailsByAccNo(DebitAccNum);
            } else {
                if ("Entry".equalsIgnoreCase(arg3)) {
                    DebitAccNum = cacheHelper.getCache("InternalAccountNumCAWithSIExistingNomNo", cacheData);
                } else {
                    DebitAccNum = cacheHelper.getCache("InternalAccountNumCAWithSIExistingNomNoRejection", cacheData);
                }
                accMaster = accountService.getAccountMasterDetailsByAccNo(DebitAccNum);
            }
        }
        custMaster = customerMasterService.getCustMasterDetailsByCustId(accMaster.getCustId());
        waitingHelper.sleep(3000);
        assertionHelper.verifyTextEquals("Validate Debit Customer Name Of Ui in Cust_Master Table ",
                "SIEntryScreen_fromCustomerName", custMaster.getCustName());
        
    }
    
    @Then("^verify Debit Customer Name On Ui for Self of Account Type \"([^\"]*)\" and flow \"([^\"]*)\"$")
    public void verify_Debit_Customer_Name_On_Ui_for_Self_of_Account_Type_and_flow(String arg1, String arg2)
            throws Throwable {
        String DebitAccNum;
        if ("Saving Account".equalsIgnoreCase(arg1)) {
            if ("Entry".equalsIgnoreCase(arg2)) {
                DebitAccNum = cacheHelper.getCache("InternalAccountNumSBWithSI", cacheData);
            } else {
                DebitAccNum = cacheHelper.getCache("InternalAccountNumSBWithSIRejection", cacheData);
            }
            accMaster = accountService.getAccountMasterDetailsByAccNo(DebitAccNum);
        } else {
            if ("Entry".equalsIgnoreCase(arg2)) {
                DebitAccNum = cacheHelper.getCache("InternalAccountNumCAWithSI", cacheData);
            } else {
                DebitAccNum = cacheHelper.getCache("InternalAccountNumCAWithSIRejection", cacheData);
            }
            accMaster = accountService.getAccountMasterDetailsByAccNo(DebitAccNum);
        }
        custMaster = customerMasterService.getCustMasterDetailsByCustId(accMaster.getCustId());
        waitingHelper.sleep(3000);
        assertionHelper.verifyTextEquals("Validate Debit Customer Name Of Ui in Cust_Master Table ",
                "SIEntryScreen_fromCustomerName", custMaster.getCustName());
        
    }
    
    @Then("^verify Debit Customer Name On Ui for Joint of Account Type \"([^\"]*)\" and flow \"([^\"]*)\"$")
    public void verify_Debit_Customer_Name_On_Ui_for_Joint_of_Account_Type_and_flow(String arg1, String arg2)
            throws Throwable {
        String DebitAccNum;
        if ("Saving Account".equalsIgnoreCase(arg1)) {
            if ("Entry".equalsIgnoreCase(arg2)) {
                DebitAccNum = cacheHelper.getCache("InternalAccountNumSBWithOperatorWithSI", cacheData);
            } else {
                DebitAccNum = cacheHelper.getCache("InternalAccountNumSBWithOperatorWithSIRejection", cacheData);
            }
            accMaster = accountService.getAccountMasterDetailsByAccNo(DebitAccNum);
        } else {
            if ("Entry".equalsIgnoreCase(arg2)) {
                DebitAccNum = cacheHelper.getCache("InternalAccountNumCAWithOperatorWithSI", cacheData);
            } else {
                DebitAccNum = cacheHelper.getCache("InternalAccountNumCAWithOperatorWithSIRejection", cacheData);
            }
            accMaster = accountService.getAccountMasterDetailsByAccNo(DebitAccNum);
        }
        custMaster = customerMasterService.getCustMasterDetailsByCustId(accMaster.getCustId());
        waitingHelper.sleep(3000);
        assertionHelper.verifyTextEquals("Validate Debit Customer Name Of Ui in Cust_Master Table ",
                "SIEntryScreen_fromCustomerName", custMaster.getCustName());
    }
    
    @Then("^verify Credit Customer Name On Ui \"([^\"]*)\"$")
    public void verify_Credit_Customer_Name_On_Ui(String arg1) throws Throwable {
        accMaster = accountService.getAccountMasterDetailsByAccNo(arg1);
        custMaster = customerMasterService.getCustMasterDetailsByCustId(accMaster.getCustId());
        assertionHelper.verifyTextEquals("Validate Credit Customer Name Of Ui in Cust_Master Table ",
                "SIEntryScreen_toCustomerName", custMaster.getCustName());
    }
    
    @Then("^user enters SI \"([^\"]*)\"$")
    public void user_enters_SI(String arg1) throws Throwable {
        seleniumHelper.enterText("SIEntryScreen_transAmt", arg1);
    }
    
    @Then("^user verify Todays date \"([^\"]*)\" with Branchparameteres$")
    public void user_verify_Todays_date_with_Branchparameteres(String arg1) throws Throwable {
        
        assertionHelper.verifyTextEquals("Verify Today's Date On Ui ", "SIEntryScreen_todaysDate", arg1);
    }
    
    @Then("^user click on Date & SI Settings tab$")
    public void user_click_on_Date_SI_Settings_tab() throws Throwable {
        seleniumHelper.clickElement("SIEntryScreen_siSettiingsTab");
    }
    
    @Then("^user select Frequency from dropdown \"([^\"]*)\"$")
    public void user_select_Frequency_from_dropdown(String arg1) throws Throwable {
        dropDownHelper.SelectUsingVisibleText("SIEntryScreen_siFrequency", arg1);
    }
    
    @Then("^user enters Period \"([^\"]*)\"$")
    public void user_enters_Period(String arg1) throws Throwable {
        seleniumHelper.enterText("SIEntryScreen_period", arg1);
    }
    
    @Then("^user enters GraceDays \"([^\"]*)\"$")
    public void user_enters_GraceDays(String arg1) throws Throwable {
        seleniumHelper.enterText("SIEntryScreen_graceDays", arg1);
    }
    
    @Then("^verify From Narration  \"([^\"]*)\" and To Narration \"([^\"]*)\"$")
    public void verify_From_Narration_and_To_Narration(String arg1, String arg2) throws Throwable {
        
        assertionHelper.verifyTextEquals("Verifying From Narration On Ui ", "SIEntryScreen_fromNaration", arg1);
        
        assertionHelper.verifyTextEquals("Verifying To Narration On Ui ", "SIEntryScreen_toNaration", arg2);
    }
    
    @Then("^user select Freeze SI amount as Yes or No \"([^\"]*)\"$")
    public void user_select_Freeze_SI_amount_as_Yes_or_No(String arg1) throws Throwable {
        if ("Yes".equalsIgnoreCase(arg1)) {
            seleniumHelper.clickElement("SIEntryScreen_balFreezeY");
        } else {
            seleniumHelper.clickElement("SIEntryScreen_balFreezeN");
        }
    }
    
    @Then("^user select Execute when enough credit available as Yes or No \"([^\"]*)\"$")
    public void user_select_Execute_when_enough_credit_available_as_Yes_or_No(String arg1) throws Throwable {
        if ("Yes".equalsIgnoreCase(arg1)) {
            seleniumHelper.clickElement("SIEntryScreen_autoPassY");
        } else {
            seleniumHelper.clickElement("SIEntryScreen_autoPassN");
        }
    }
    
    @Then("^verify Next Due Date \"([^\"]*)\" in Important Dates table of SI$")
    public void verify_Next_Due_Date_in_Important_Dates_table_of_SI(String arg1) throws Throwable {
        assertionHelper.verifyTextEquals("Verifying Next Due Date On Ui ", "SIEntryScreen_nextDueDate", arg1);
    }
    
    @Then("^verify Expiry Date \"([^\"]*)\" in Important Dates table of SI$")
    public void verify_Expiry_Date_in_Important_Dates_table_of_SI(String arg1) throws Throwable {
        assertionHelper.verifyTextEquals("Verifying Expiry Date On Ui ", "SIEntryScreen_expiryDate", arg1);
    }
    
    @Then("^user click on Submit of SI button$")
    public void user_click_on_Submit_of_SI_button() throws Throwable {
        seleniumHelper.clickElement("SIEntryScreen_SubmitButton");
        waitingHelper.sleep(3000);
    }
    
    @Then("^verify SI_MASTER table col Credit Account Num \"([^\"]*)\" and NextDueDate \"([^\"]*)\" and ExpiryDate \"([^\"]*)\" and SiType \"([^\"]*)\" and Amount \"([^\"]*)\" and NatureofAccount \"([^\"]*)\" and AccountType \"([^\"]*)\" & Flow \"([^\"]*)\"$")
    public void verify_SI_MASTER_table_col_Credit_Account_Num_and_NextDueDate_and_ExpiryDate_and_SiType_and_Amount_and_NatureofAccount_and_AccountType_Flow(
            String arg1, String arg2, String arg3, String arg4, String arg5, String arg6, String arg7, String arg8)
            throws Throwable {
        String SiNumber;
        String debitAccNum;
        if ("Self".equalsIgnoreCase(arg6)) {
            if ("Saving Account".equalsIgnoreCase(arg7)) {
                if ("Entry".equalsIgnoreCase(arg8)) {
                    SiNumber = cacheHelper.getCache("SINum_SB", cacheData);
                } else {
                    SiNumber = cacheHelper.getCache("SINum_SBRejection", cacheData);
                }
            } else {
                if ("Entry".equalsIgnoreCase(arg8)) {
                    SiNumber = cacheHelper.getCache("SINum_CA", cacheData);
                } else {
                    SiNumber = cacheHelper.getCache("SINum_CARejection", cacheData);
                }
            }
        } else {
            if ("Saving Account".equalsIgnoreCase(arg7)) {
                if ("Entry".equalsIgnoreCase(arg8)) {
                    SiNumber = cacheHelper.getCache("SINum_SBWithOperator", cacheData);
                } else {
                    SiNumber = cacheHelper.getCache("SINum_SBWithOperatorRejection", cacheData);
                }
                
            } else {
                if ("Entry".equalsIgnoreCase(arg8)) {
                    SiNumber = cacheHelper.getCache("SINum_CAWithOperator", cacheData);
                } else {
                    SiNumber = cacheHelper.getCache("SINum_CAWithOperatorRejection", cacheData);
                }
            }
        }
        
        if ("Self".equalsIgnoreCase(arg6)) {
            if ("Saving Account".equalsIgnoreCase(arg7)) {
                if ("Entry".equalsIgnoreCase(arg8)) {
                    debitAccNum = cacheHelper.getCache("InternalAccountNumSBWithSI", cacheData);
                } else {
                    debitAccNum = cacheHelper.getCache("InternalAccountNumSBWithSIRejection", cacheData);
                }
            } else {
                if ("Entry".equalsIgnoreCase(arg8)) {
                    debitAccNum = cacheHelper.getCache("InternalAccountNumCAWithSI", cacheData);
                } else {
                    debitAccNum = cacheHelper.getCache("InternalAccountNumCAWithSIRejection", cacheData);
                }
            }
            
        } else {
            if ("Saving Account".equalsIgnoreCase(arg7)) {
                if ("Entry".equalsIgnoreCase(arg8)) {
                    debitAccNum = cacheHelper.getCache("InternalAccountNumSBWithOperatorWithSI", cacheData);
                } else {
                    debitAccNum = cacheHelper.getCache("InternalAccountNumSBWithOperatorWithSIRejection", cacheData);
                }
            } else {
                if ("Entry".equalsIgnoreCase(arg8)) {
                    debitAccNum = cacheHelper.getCache("InternalAccountNumCAWithOperatorWithSI", cacheData);
                } else {
                    debitAccNum = cacheHelper.getCache("InternalAccountNumCAWithOperatorWithSIRejection", cacheData);
                }
                
            }
            
        }
        
        BigInteger SiNum = new BigInteger(SiNumber);
        siMaster = sIMasterService.getSiDetailsBySiNumber(SiNum, property.getProperty("BranchCode"));
        String creditAccNum = arg1;
        BigInteger toAccId = accountService.getAccountMasterDetailsByAccNo(creditAccNum).getAccId();
        BigInteger fromAccId = accountService.getAccountMasterDetailsByAccNo(debitAccNum).getAccId();
        assertionHelper.verifyTwoTexts("Verifying Status of SI Number " + SiNumber + " in SI_Master Table ",
                siMaster.getStatus(), "E");
        assertionHelper.verifyTwoTexts("Validate SI Frequency in SI_Master Table", siMaster.getSiFrequency(), "M1");
        assertionHelper.verifyTwoTexts("Validate From AccID in SI_Master Table", siMaster.getFromAccId().toString(),
                fromAccId.toString());
        assertionHelper.verifyTwoTexts("Validate To AccID in SI_Master Table", siMaster.getToAccId().toString(),
                toAccId.toString());
        assertionHelper.verifyTwoTexts("Validate Next Due Date in SI_Master Table",
                siMaster.getNextDueDate().toString(), arg2);
        
        assertionHelper.verifyTwoTexts("Validate Expiry Date in SI_Master Table", siMaster.getExpiryDt().toString(),
                arg3);
        assertionHelper.verifyTwoTexts("Validate First Due Date in SI_Master Table",
                siMaster.getFirstDueDate().toString(), arg2);
        if ("F".equalsIgnoreCase(arg4)) {
            
            assertionHelper.verifyTwoAmounts("Validate SI Trans Amount in SI_Master Table",
                    siMaster.getTransAmt().toString(), arg5);
            
            assertionHelper.verifyTwoTexts("Validate SI Type in SI_Master Table", siMaster.getSiType().toString(), "F");
        } else {
            assertionHelper.verifyTwoAmounts("Validate SI Trans Amount in SI_Master Table",
                    siMaster.getTransAmt().toString(), "0.00");
            assertionHelper.verifyTwoTexts("Validate SI Type in SI_Master Table", siMaster.getSiType().toString(), "V");
        }
    }
    
    @Then("^user select Proceed for Nominee as Yes \"([^\"]*)\" Nominee Entry screen display$")
    public void user_select_Proceed_for_Nominee_as_Yes_Nominee_Entry_screen_display(String arg1) throws Throwable {
        if ("Yes".equalsIgnoreCase(arg1)) {
            seleniumHelper.clickElement("DDAcountOpeningScreen_RedirectToNominee");
        }
    }
    
    @Then("^Verify \"([^\"]*)\" account number Details$")
    public void verify_account_number_Details(String arg1) throws Throwable {
        String AccNum = cacheHelper.getCache(arg1, cacheData);
        waitingHelper.sleep(3000);
        assertionHelper.verifyTextEquals("Verifying Account Number On Nominee Screen ",
                "DDAcountOpeningScreen_accNumNominee", AccNum);
    }
    
    @Then("^user select Use Existing Nominee as Yes or No  \"([^\"]*)\"$")
    public void user_select_Use_Existing_Nominee_as_Yes_or_No(String arg1) throws Throwable {
        if ("Yes".equalsIgnoreCase(arg1)) {
            seleniumHelper.clickElement("DDAcountOpeningScreen_existingNomineeY");
        } else {
            seleniumHelper.clickElement("DDAcountOpeningScreen_existingNomineeN");
        }
    }
    
    @Then("^user select Customer as Nominee as Yes or No \"([^\"]*)\"$")
    public void user_select_Customer_as_Nominee_as_Yes_or_No(String arg1) throws Throwable {
        if ("Yes".equalsIgnoreCase(arg1)) {
            seleniumHelper.clickElement("DDAcountOpeningScreen_custAsNomineeY");
        } else {
            seleniumHelper.clickElement("DDAcountOpeningScreen_custAsNomineeN");
        }
    }
    
    @Then("^user enters Nominee Name \"([^\"]*)\"$")
    public void user_enters_Nominee_Name(String arg1) throws Throwable {
        seleniumHelper.enterText("DDAcountOpeningScreen_nomName", arg1);
    }
    
    @Then("^user enters Nominee Date of Birth \"([^\"]*)\"$")
    public void user_enters_Nominee_Date_of_Birth(String arg1) throws Throwable {
        seleniumHelper.enterText("DDAcountOpeningScreen_dobNominee", arg1);
    }
    
    @Then("^user verify Nominee Age \"([^\"]*)\"$")
    public void user_verify_Nominee_Age(String arg1) throws Throwable {
        assertionHelper.verifyTextEquals("Verifying Nominee Age On Ui ", "DDAcountOpeningScreen_nomAge", arg1);
    }
    
    @Then("^user select Nominee Photo as Yes or No \"([^\"]*)\"$")
    public void user_select_Nominee_Photo_as_Yes_or_No(String arg1) throws Throwable {
        if ("Yes".equalsIgnoreCase(arg1)) {
            seleniumHelper.clickElement("DDAcountOpeningScreen_nomPhotoY");
        } else {
            seleniumHelper.clickElement("DDAcountOpeningScreen_nomPhotoN");
        }
    }
    
    @Then("^user select Nominee Releationship from dropdown  \"([^\"]*)\"$")
    public void user_select_Nominee_Releationship_from_dropdown(String arg1) throws Throwable {
        dropDownHelper.SelectUsingVisibleText("DDAcountOpeningScreen_nomRelationship", arg1);
    }
    
    @Then("^user select  Nominee address same as account holder as Yes or No  \"([^\"]*)\"$")
    public void user_select_Nominee_address_same_as_account_holder_as_Yes_or_No(String arg1) throws Throwable {
        if ("Yes".equalsIgnoreCase(arg1)) {
            seleniumHelper.clickElement("DDAcountOpeningScreen_nomAddressY");
        } else {
            seleniumHelper.clickElement("DDAcountOpeningScreen_nomAddressN");
        }
    }
    
    @Then("^user enters NomineeCustomerAddress \"([^\"]*)\"$")
    public void user_enters_NomineeCustomerAddress(String arg1) throws Throwable {
        seleniumHelper.enterText("DDAcountOpeningScreen_nomAddress", arg1);
    }
    
    @Then("^observe Nominee is Minor or Major \"([^\"]*)\"$")
    public void observe_Nominee_is_Minor_or_Major(String arg1) throws Throwable {
        assertionHelper.verifyTextEquals("Nominee is minor or Major ", "DDAcountOpeningScreen_major", arg1);
    }
    
    @Then("^user select Nominee in All Account Number from dropdown \"([^\"]*)\"$")
    public void user_select_Nominee_in_All_Account_Number_from_dropdown(String arg1) throws Throwable {
        waitingHelper.sleep(3000);
        dropDownHelper.SelectUsingIndex("DDAcountOpeningScreen_nomAllAccNum", 1);
    }
    
    @Then("^user verify  Customer Number \"([^\"]*)\" and Nominee Name \"([^\"]*)\" and Date of Birth \"([^\"]*)\" and Nominee Age \"([^\"]*)\"$")
    public void user_verify_Customer_Number_and_Nominee_Name_and_Date_of_Birth_and_Nominee_Age(String arg1, String arg2,
            String arg3, String arg4) throws Throwable {
        assertionHelper.verifyTextEquals("Verifying Nominee Customer Number On Ui ", "DDAcountOpeningScreen_nomcustNo",
                arg1);
        assertionHelper.verifyTextEquals("Verifying Nominee Name On Ui ", "DDAcountOpeningScreen_nomName", arg2);
        assertionHelper.verifyTextEquals("Verifying Nominee DOB On Ui ", "DDAcountOpeningScreen_dobNominee", arg3);
        assertionHelper.verifyTextEquals("Verifying Nominee Age On Ui ", "DDAcountOpeningScreen_nomAge", arg4);
    }
    
    @Then("^user verify Nominee Releationship from dropdown  \"([^\"]*)\"$")
    public void user_verify_Nominee_Releationship_from_dropdown(String arg1) throws Throwable {
        
        assertionHelper.verifyTwoTexts("Verifying Nominee Relationship On Ui ",
                dropDownHelper.getSelectedValue("DDAcountOpeningScreen_nomRelationship"), arg1);
        
    }
    
    @Then("^user verify NomineeCustomerAddress \"([^\"]*)\"$")
    public void user_verify_NomineeCustomerAddress(String arg1) throws Throwable {
        assertionHelper.verifyTextEquals("Verifying Nominee Address On Ui ", "DDAcountOpeningScreen_nomAddress", arg1);
    }
    
    @When("^user click on Nominee Submit button$")
    public void user_click_on_Nominee_Submit_button() throws Throwable {
        seleniumHelper.clickElement("DDAcountOpeningScreen_nomSubmit");
        waitingHelper.sleep(3000);
    }
    
    @Then("^verify NOMINEE_MASTER table Status \"([^\"]*)\" and \"([^\"]*)\" and  Account Number \"([^\"]*)\" and NomineeAsCust \"([^\"]*)\"$")
    public void verify_NOMINEE_MASTER_table_Status_and_and_Account_Number_and_NomineeAsCust(String arg1, String arg2,
            String arg3, String arg4) throws Throwable {
        
        String AccNum = cacheHelper.getCache(arg3, cacheData);
        accMaster = accountService.getAccountMasterDetailsByAccNo(AccNum);
        nomineeMaster = nomineeMasterService.getNomineeDetailsByAccId(accMaster.getAccId());
        
        assertionHelper.verifyTwoTexts("Verifying Status in Nominee Master Table ", nomineeMaster.getStatus(), arg1);
        if ("Y".equalsIgnoreCase(arg4)) {
            assertionHelper.verifyTwoTexts("Verifying Nominee As Cust in Nominee Master Table ",
                    nomineeMaster.getNomAsCust(), arg4);
        } else {
            assertionHelper.verifyTwoTexts("Verifying Nominee As Cust in Nominee Master Table ",
                    nomineeMaster.getNomAsCust(), arg4);
        }
        assertionHelper.verifyTwoTexts("Verifying Nominee Name in Nominee Master Table ", nomineeMaster.getNomName(),
                arg2);
    }
    
    @Given("^user select account type from dropdown \"([^\"]*)\"$")
    public void user_select_account_type_from_dropdown(String arg1) throws Throwable {
        dropDownHelper.SelectUsingVisibleText("DDAcountOpeningScreen_AccountType", arg1);
    }
    
    @Given("^user select unauthorized accounts from drop dowwn \"([^\"]*)\" & \"([^\"]*)\"$")
    public void user_select_unauthorized_accounts_from_drop_dowwn(String arg1, String arg2) throws Throwable {
        
        String InternalAccNum = cacheHelper.getCache(arg1, cacheData);
        String UserAccNum = cacheHelper.getCache(arg2, cacheData);
        waitingHelper.sleep(3000);
        dropDownHelper.SelectUsingVisibleText("DDAcountOpeningScreen_accNumber", InternalAccNum + " - " + UserAccNum);
        waitingHelper.sleep(3000);
    }
    
    @Then("^verify ProductName \"([^\"]*)\" CustName \"([^\"]*)\" IntroName \"([^\"]*)\" NatureOfAcc \"([^\"]*)\" AccopenDate \"([^\"]*)\"$")
    public void verify_ProductName_CustName_IntroName_NatureOfAcc_AccopenDate(String arg1, String arg2, String arg3,
            String arg4, String arg5) throws Throwable {
        
        assertionHelper.verifyTextEquals("Verifying Product Name On Ui ", "DDAcountOpeningScreen_prdId", arg1);
        assertionHelper.verifyTextEquals("Verifying Customer Name On Ui ", "DDAcountOpeningScreen_custName", arg2);
        assertionHelper.verifyTextEquals("Verifying Introducer Name On Ui ", "DDAcountOpeningScreen_introducerName",
                arg3);
        assertionHelper.verifyTwoTexts("Verifying Nature Of Account On Ui ",
                dropDownHelper.getSelectedValue("DDAcountOpeningScreen_NatureOfAcc"), arg4);
        assertionHelper.verifyTextEquals("Verifying Account Open Date On Ui ", "DDAcountOpeningScreen_AccOpenDate",
                arg5);
    }
    
    @When("^user click on Opening Details Tab$")
    public void user_click_on_Opening_Details_Tab() throws Throwable {
        seleniumHelper.clickElement("DDAcountOpeningScreen_openingdetailsTab");
    }
    
    @Then("^verify Category \"([^\"]*)\" OperatingInstru \"([^\"]*)\" Currency \"([^\"]*)\"$")
    public void verify_Category_OperatingInstru_Currency(String arg1, String arg2, String arg3) throws Throwable {
        
        assertionHelper.verifyTextEquals("Verifying Cust Category On Ui ", "DDAcountOpeningScreen_custCategory", arg1);
        assertionHelper.verifyTextEquals("Verifying Operating Instruction On Ui ",
                "DDAcountOpeningScreen_operatingInstr", arg2);
        assertionHelper.verifyTextEquals("Verifying Currency On Ui ", "DDAcountOpeningScreen_currency", arg3);
    }
    
    @When("^user click on Notification Details Tab$")
    public void user_click_on_Notification_Details_Tab() throws Throwable {
        seleniumHelper.clickElement("DDAcountOpeningScreen_notificationDetailsTab");
    }
    
    @Then("^verify ATMFacility \"([^\"]*)\" SMSFacility \"([^\"]*)\" EmailNoti \"([^\"]*)\" ChqbkFacility \"([^\"]*)\" EmailID \"([^\"]*)\" MobileNo \"([^\"]*)\"$")
    public void verify_ATMFacility_SMSFacility_EmailNoti_ChqbkFacility_EmailID_MobileNo(String arg1, String arg2,
            String arg3, String arg4, String arg5, String arg6) throws Throwable {
        
        assertionHelper.verifyTextEquals("Verifying ATM Facility On Ui ", "DDAcountOpeningScreen_atmFacilityY", arg1);
        assertionHelper.verifyTextEquals("Verifying SMS Facility On Ui ", "DDAcountOpeningScreen_smsFacilityY", arg2);
        assertionHelper.verifyTextEquals("Verifying Email Notification On Ui ",
                "DDAcountOpeningScreen_emailNotificationY", arg3);
        assertionHelper.verifyTextEquals("Verifying Cheque Book Facility On Ui ",
                "DDAcountOpeningScreen_chequeBookFacilityY", arg4);
        assertionHelper.verifyTextEquals("Verifying Email ID On Ui ", "DDAcountOpeningScreen_email", arg5);
        assertionHelper.verifyTextEquals("Verifying Mobile Number On Ui ", "DDAcountOpeningScreen_mobile", arg6);
    }
    
    @When("^user click on Flexi Account Details Tab$")
    public void user_click_on_Flexi_Account_Details_Tab() throws Throwable {
        seleniumHelper.clickElement("DDAcountOpeningScreen_FlexiAccountDetailsTab");
    }
    
    @Then("^verify ProdId \"([^\"]*)\" ProductName \"([^\"]*)\" NatureOfAcc \"([^\"]*)\" MiniBaseAmt \"([^\"]*)\" MaxBaseAmt \"([^\"]*)\" UnitAmt \"([^\"]*)\" SiFlag \"([^\"]*)\"$")
    public void verify_ProdId_ProductName_NatureOfAcc_MiniBaseAmt_MaxBaseAmt_UnitAmt_SiFlag(String arg1, String arg2,
            String arg3, String arg4, String arg5, String arg6, String arg7) throws Throwable {
        
        assertionHelper.verifyTextEquals("Verifying Product Id On Ui ", "DDAcountOpeningScreen_flexiPrdId", arg1);
        assertionHelper.verifyTextEquals("Verifying Product Name On Ui ", "DDAcountOpeningScreen_flexiProdName", arg2);
        
        if ("Self".equalsIgnoreCase(arg3)) {
            if ("Flexi-Saving Account".equalsIgnoreCase(arg2)) {
                if ("Y".equalsIgnoreCase(arg7)) {
                    String UserflexiAccountNumberSBWithSI = cacheHelper.getCache("FlexiAccNumSBWithSI", cacheData);
                    custAccount = customerAccountService
                            .getCustomerAccDetailsByUserAccNumber(UserflexiAccountNumberSBWithSI);
                    assertionHelper.verifyTextEquals("Verifying Flexi Account Number On Ui ",
                            "DDAcountOpeningScreen_flexiAccountNum", custAccount.getAccNo());
                } else {
                    String UserflexiAccountNumberSB = cacheHelper.getCache("FlexiAccNumSB", cacheData);
                    custAccount = customerAccountService.getCustomerAccDetailsByUserAccNumber(UserflexiAccountNumberSB);
                    assertionHelper.verifyTextEquals("Verifying Flexi Account Number On Ui ",
                            "DDAcountOpeningScreen_flexiAccountNum", custAccount.getAccNo());
                }
            } else {
                if ("Y".equalsIgnoreCase(arg7)) {
                    String UserflexiAccountNumberCAWithSI = cacheHelper.getCache("FlexiAccNumCAWithSI", cacheData);
                    custAccount = customerAccountService
                            .getCustomerAccDetailsByUserAccNumber(UserflexiAccountNumberCAWithSI);
                    assertionHelper.verifyTextEquals("Verifying Flexi Account Number On Ui ",
                            "DDAcountOpeningScreen_flexiAccountNum", custAccount.getAccNo());
                } else {
                    String UserflexiAccountNumberCA = cacheHelper.getCache("FlexiAccNumCA", cacheData);
                    custAccount = customerAccountService.getCustomerAccDetailsByUserAccNumber(UserflexiAccountNumberCA);
                    assertionHelper.verifyTextEquals("Verifying Flexi Account Number On Ui ",
                            "DDAcountOpeningScreen_flexiAccountNum", custAccount.getAccNo());
                }
            }
        } else {
            if ("Flexi-Saving Account".equalsIgnoreCase(arg2)) {
                if ("Y".equalsIgnoreCase(arg7)) {
                    String UserflexiAccountNumSBWithSI = cacheHelper.getCache("FlexiAccNumSBWithOperatorWithSI",
                            cacheData);
                    custAccount = customerAccountService
                            .getCustomerAccDetailsByUserAccNumber(UserflexiAccountNumSBWithSI);
                    assertionHelper.verifyTextEquals("Verifying Flexi Account Number On Ui ",
                            "DDAcountOpeningScreen_flexiAccountNum", custAccount.getAccNo());
                } else {
                    String UserflexiAccountNumSB = cacheHelper.getCache("FlexiAccNumSBWithOperator", cacheData);
                    custAccount = customerAccountService.getCustomerAccDetailsByUserAccNumber(UserflexiAccountNumSB);
                    assertionHelper.verifyTextEquals("Verifying Flexi Account Number On Ui ",
                            "DDAcountOpeningScreen_flexiAccountNum", custAccount.getAccNo());
                }
            } else {
                if ("Y".equalsIgnoreCase(arg7)) {
                    String UserflexiAccountNumCAWithSI = cacheHelper.getCache("FlexiAccNumCAWithOperatorWithSI",
                            cacheData);
                    custAccount = customerAccountService
                            .getCustomerAccDetailsByUserAccNumber(UserflexiAccountNumCAWithSI);
                    assertionHelper.verifyTextEquals("Verifying Flexi Account Number On Ui ",
                            "DDAcountOpeningScreen_flexiAccountNum", custAccount.getAccNo());
                } else {
                    String UserflexiAccountNumCA = cacheHelper.getCache("FlexiAccNumCAWithOperator", cacheData);
                    custAccount = customerAccountService.getCustomerAccDetailsByUserAccNumber(UserflexiAccountNumCA);
                    assertionHelper.verifyTextEquals("Verifying Flexi Account Number On Ui ",
                            "DDAcountOpeningScreen_flexiAccountNum", custAccount.getAccNo());
                }
            }
        }
        assertionHelper.verifyTextEquals("Verifying Product Minimum Base Amount On Ui ",
                "DDAcountOpeningScreen_flexiMinBaseAmount", arg4);
        assertionHelper.verifyTextEquals("Verifying Product Maximum Base Amount On Ui ",
                "DDAcountOpeningScreen_flexiMaxFlexiAmount", arg5);
        assertionHelper.verifyTextEquals("Verifying Product Unit Amount On Ui ",
                "DDAcountOpeningScreen_flexiAmountPerUnit", arg6);
        
    }
    
    @Then("^user click on Nominee Details Tab$")
    public void user_click_on_Nominee_Details_Tab() throws Throwable {
        seleniumHelper.clickElement("DDAcountAuthorizationScreen_nomineeDetailsTab");
    }
    
    @Then("^user verify Operator number \"([^\"]*)\" & Operator Type \"([^\"]*)\" & Sign \"([^\"]*)\"$")
    public void user_verify_Operator_number_Operator_Type_Sign(String arg1, String arg2, String arg3) throws Throwable {
        assertionHelper.verifyTextEquals("Verifying Operator Number On Ui ",
                "DDAcountAuthorizationScreen_otherOperatorNum", arg1);
        assertionHelper.verifyTextEquals("Verifying Operator Type On Ui ",
                "DDAcountAuthorizationScreen_otherOperatorType", arg2);
        assertionHelper.verifyTextEquals("Verifying Operator Sign On Ui ",
                "DDAcountAuthorizationScreen_otherOperatorSign", arg3);
    }
    
    @When("^user click on Standing Instruction Tab$")
    public void user_click_on_Standing_Instruction_Tab() throws Throwable {
        seleniumHelper.clickElement("DDAcountAuthorizationScreen_standingInstructionTab");
        waitingHelper.sleep(4000);
    }
    
    @Then("^verify SINum \"([^\"]*)\" DebitAccNo \"([^\"]*)\" CreditAccNo \"([^\"]*)\" Amt \"([^\"]*)\" AccType \"([^\"]*)\" NatureOfAcc \"([^\"]*)\" & flow \"([^\"]*)\"$")
    public void verify_SINum_DebitAccNo_CreditAccNo_Amt_AccType_NatureOfAcc_flow(String arg1, String arg2, String arg3,
            String arg4, String arg5, String arg6, String arg7) throws Throwable {
        String SiNumber;
        String DebitAccNum;
        if ("Saving Account".equalsIgnoreCase(arg5)) {
            if ("Self".equalsIgnoreCase(arg6)) {
                if ("Auth".equalsIgnoreCase(arg7)) {
                    SiNumber = cacheHelper.getCache("SINum_SB", cacheData);
                    DebitAccNum = cacheHelper.getCache("InternalAccountNumSBWithSI", cacheData);
                } else {
                    SiNumber = cacheHelper.getCache("SINum_SBRejection", cacheData);
                    DebitAccNum = cacheHelper.getCache("InternalAccountNumSBWithSIRejection", cacheData);
                }
            } else {
                if ("Auth".equalsIgnoreCase(arg7)) {
                    SiNumber = cacheHelper.getCache("SINum_SBWithOperator", cacheData);
                    DebitAccNum = cacheHelper.getCache("InternalAccountNumSBWithOperatorWithSI", cacheData);
                } else {
                    SiNumber = cacheHelper.getCache("SINum_SBWithOperatorRejection", cacheData);
                    DebitAccNum = cacheHelper.getCache("InternalAccountNumSBWithOperatorWithSIRejection", cacheData);
                }
            }
        } else {
            if ("Self".equalsIgnoreCase(arg6)) {
                if ("Auth".equalsIgnoreCase(arg7)) {
                    SiNumber = cacheHelper.getCache("SINum_CA", cacheData);
                    DebitAccNum = cacheHelper.getCache("InternalAccountNumCAWithSI", cacheData);
                } else {
                    SiNumber = cacheHelper.getCache("SINum_CARejection", cacheData);
                    DebitAccNum = cacheHelper.getCache("InternalAccountNumCAWithSIRejection", cacheData);
                }
                
            } else {
                if ("Auth".equalsIgnoreCase(arg7)) {
                    SiNumber = cacheHelper.getCache("SINum_CAWithOperator", cacheData);
                    DebitAccNum = cacheHelper.getCache("InternalAccountNumCAWithOperatorWithSI", cacheData);
                } else {
                    SiNumber = cacheHelper.getCache("SINum_CAWithOperatorRejection", cacheData);
                    DebitAccNum = cacheHelper.getCache("InternalAccountNumCAWithOperatorWithSIRejection", cacheData);
                }
            }
        }
        waitingHelper.sleep(3000);
        assertionHelper.verifyTextEquals("Verifying SI Number On Ui ", "DDAcountAuthorizationScreen_siNumber",
                SiNumber);
        assertionHelper.verifyTextEquals("Verifying Debit Account Number On Ui ",
                "DDAcountAuthorizationScreen_debitAccNum", DebitAccNum);
        assertionHelper.verifyTextEquals("Verifying Credit Account Number On Ui ",
                "DDAcountAuthorizationScreen_creditAccNum", arg3);
        assertionHelper.verifyTextEquals("Verifying SI Amount On Ui ", "DDAcountAuthorizationScreen_siAmount", arg4);
    }
    
    @Then("^verify si_master table status where si number is \"([^\"]*)\" of AccType \"([^\"]*)\" & NatureOfAcc \"([^\"]*)\" & flow \"([^\"]*)\"$")
    public void verify_si_master_table_status_where_si_number_is_of_AccType_NatureOfAcc_flow(String arg1, String arg2,
            String arg3, String arg4) throws Throwable {
        String SiNumber;
        if ("Saving Account".equalsIgnoreCase(arg2)) {
            if ("Self".equalsIgnoreCase(arg3)) {
                if ("Auth".equalsIgnoreCase(arg4)) {
                    SiNumber = cacheHelper.getCache("SINum_SB", cacheData);
                } else {
                    SiNumber = cacheHelper.getCache("SINum_SBRejection", cacheData);
                }
            } else {
                if ("Auth".equalsIgnoreCase(arg4)) {
                    SiNumber = cacheHelper.getCache("SINum_SBWithOperator", cacheData);
                } else {
                    SiNumber = cacheHelper.getCache("SINum_SBWithOperatorRejection", cacheData);
                }
            }
        } else {
            if ("Self".equalsIgnoreCase(arg3)) {
                if ("Auth".equalsIgnoreCase(arg4)) {
                    SiNumber = cacheHelper.getCache("SINum_CA", cacheData);
                } else {
                    SiNumber = cacheHelper.getCache("SINum_CARejection", cacheData);
                }
            } else {
                if ("Auth".equalsIgnoreCase(arg4)) {
                    SiNumber = cacheHelper.getCache("SINum_CAWithOperator", cacheData);
                } else {
                    SiNumber = cacheHelper.getCache("SINum_CAWithOperatorRejection", cacheData);
                }
            }
        }
        
        BigInteger SiNum = new BigInteger(SiNumber);
        siMaster = sIMasterService.getSiDetailsBySiNumber(SiNum, property.getProperty("BranchCode"));
        if ("Auth".equalsIgnoreCase(arg4)) {
            assertionHelper.verifyTwoTexts("Verifying " + SiNumber + " SI Number Status in SI_Master Table ",
                    siMaster.getStatus().toString(), "A");
        } else {
            assertionHelper.verifyTwoTexts("Verifying " + SiNumber + " SI Number Status in SI_Master Table ",
                    siMaster.getStatus().toString(), "E");
        }
    }
    
    @Then("^user click on Authorize button of CASA Account Authorization$")
    public void user_click_on_Authorize_button_of_CASA_Account_Authorization() throws Throwable {
        seleniumHelper.clickElement("DDAcountAuthorizationScreen_authorizeButton");
    }
    
    @Then("^verify account_master table status col where acc_no is \"([^\"]*)\" & flow \"([^\"]*)\"$")
    public void verify_account_master_table_status_col_where_acc_no_is_flow(String arg1, String arg2) throws Throwable {
        
        String InternalAccNum = cacheHelper.getCache(arg1, cacheData);
        accMaster = accountService.getAccountMasterDetailsByAccNo(InternalAccNum);
        if ("Auth".equalsIgnoreCase(arg2)) {
            assertionHelper.verifyTwoTexts(
                    "Verifying Account Master Table " + InternalAccNum + " Account Number " + "Status ",
                    accMaster.getStatus(), "A");
        } else {
            assertionHelper.verifyTwoTexts(
                    "Verifying Account Master Table " + InternalAccNum + " Account Number " + "Status ",
                    accMaster.getStatus(), "R");
        }
    }
    
    @Then("^verify SI_MASTER table col Credit Account Num \"([^\"]*)\" and NextDueDate \"([^\"]*)\" and ExpiryDate \"([^\"]*)\" and SiType \"([^\"]*)\" and Amount \"([^\"]*)\" and NatureofAccount \"([^\"]*)\" and AccountType \"([^\"]*)\" &  UseExistingNominee \"([^\"]*)\"$")
    public void verify_SI_MASTER_table_col_Credit_Account_Num_and_NextDueDate_and_ExpiryDate_and_SiType_and_Amount_and_NatureofAccount_and_AccountType_UseExistingNominee(
            String arg1, String arg2, String arg3, String arg4, String arg5, String arg6, String arg7, String arg8)
            throws Throwable {
        
        String SiNumber;
        String debitAccNum;
        if ("Yes".equalsIgnoreCase(arg8)) {
            if ("Saving Account".equalsIgnoreCase(arg7)) {
                SiNumber = cacheHelper.getCache("ExistingNomYesSINum_SB", cacheData);
            } else {
                SiNumber = cacheHelper.getCache("ExistingNomYesSINum_CA", cacheData);
            }
        } else {
            if ("Saving Account".equalsIgnoreCase(arg7)) {
                SiNumber = cacheHelper.getCache("ExistingNomNoSINum_SB", cacheData);
            } else {
                SiNumber = cacheHelper.getCache("ExistingNomNoSINum_CA", cacheData);
            }
        }
        
        if ("Yes".equalsIgnoreCase(arg8)) {
            if ("Saving Account".equalsIgnoreCase(arg7)) {
                debitAccNum = cacheHelper.getCache("InternalAccountNumSBWithSIExistingNomYes", cacheData);
            } else {
                debitAccNum = cacheHelper.getCache("InternalAccountNumCAWithSIExistingNomYes", cacheData);
            }
        } else {
            if ("Saving Account".equalsIgnoreCase(arg7)) {
                debitAccNum = cacheHelper.getCache("InternalAccountNumSBWithSIExistingNomNo", cacheData);
            } else {
                debitAccNum = cacheHelper.getCache("InternalAccountNumCAWithSIExistingNomNo", cacheData);
            }
        }
        
        BigInteger SiNum = new BigInteger(SiNumber);
        siMaster = sIMasterService.getSiDetailsBySiNumber(SiNum, property.getProperty("BranchCode"));
        String creditAccNum = arg1;
        BigInteger toAccId = accountService.getAccountMasterDetailsByAccNo(creditAccNum).getAccId();
        BigInteger fromAccId = accountService.getAccountMasterDetailsByAccNo(debitAccNum).getAccId();
        assertionHelper.verifyTwoTexts("Verifying Status of SI number " + SiNumber + " in SI_Master Table ",
                siMaster.getStatus(), "E");
        assertionHelper.verifyTwoTexts("Validate SI Frequency in SI_Master Table", siMaster.getSiFrequency(), "M1");
        assertionHelper.verifyTwoTexts("Validate From AccID in SI_Master Table", siMaster.getFromAccId().toString(),
                fromAccId.toString());
        assertionHelper.verifyTwoTexts("Validate To AccID in SI_Master Table", siMaster.getToAccId().toString(),
                toAccId.toString());
        assertionHelper.verifyTwoTexts("Validate Next Due Date in SI_Master Table",
                siMaster.getNextDueDate().toString(), arg2);
        
        assertionHelper.verifyTwoTexts("Validate Expiry Date in SI_Master Table", siMaster.getExpiryDt().toString(),
                arg3);
        assertionHelper.verifyTwoTexts("Validate First Due Date in SI_Master Table",
                siMaster.getFirstDueDate().toString(), arg2);
        if ("F".equalsIgnoreCase(arg4)) {
            
            assertionHelper.verifyTwoAmounts("Validate SI Trans Amount in SI_Master Table",
                    siMaster.getTransAmt().toString(), arg5);
            
            assertionHelper.verifyTwoTexts("Validate SI Type in SI_Master Table", siMaster.getSiType().toString(), "F");
        } else {
            assertionHelper.verifyTwoAmounts("Validate SI Trans Amount in SI_Master Table",
                    siMaster.getTransAmt().toString(), "0.00");
            assertionHelper.verifyTwoTexts("Validate SI Type in SI_Master Table", siMaster.getSiType().toString(), "V");
        }
    }
    
    @Then("^verify nomineeCustNumber \"([^\"]*)\" CustAsNominee \"([^\"]*)\" NomineeName \"([^\"]*)\" DOB \"([^\"]*)\" Age \"([^\"]*)\" NomineePhoto \"([^\"]*)\" NomineeReln \"([^\"]*)\" NomineeAddrSameAsAccountHolder \"([^\"]*)\" NomineeAddr \"([^\"]*)\" NomineeMajor \"([^\"]*)\"$")
    public void verify_nomineeCustNumber_CustAsNominee_NomineeName_DOB_Age_NomineePhoto_NomineeReln_NomineeAddrSameAsAccountHolder_NomineeAddr_NomineeMajor(
            String arg1, String arg2, String arg3, String arg4, String arg5, String arg6, String arg7, String arg8,
            String arg9, String arg10) throws Throwable {
        if ("Yes".equalsIgnoreCase(arg2)) {
            assertionHelper.verifyTextEquals("Verify CustAsNominee Flag On Ui ",
                    "DDAcountAuthorizationScreen_custAsNomineeY", arg2);
            assertionHelper.verifyTextEquals("Verify Nominee Customer Number On Ui ",
                    "DDAcountAuthorizationScreen_nomineeCustNumber", arg1);
        } else {
            assertionHelper.verifyTextEquals("Verify CustAsNominee Flag On Ui ",
                    "DDAcountAuthorizationScreen_custAsNomineeN", arg2);
            assertionHelper.verifyTextEquals("Verify Nominee Address Same As Account Holder Flag On Ui ",
                    "DDAcountAuthorizationScreen_nomAddrAccAddrY", arg8);
        }
        assertionHelper.verifyTextEquals("Verify Nominee Name On Ui ", "DDAcountAuthorizationScreen_nomName", arg3);
        assertionHelper.verifyTextEquals("Verify DOB On Ui ", "DDAcountAuthorizationScreen_dob", arg4);
        assertionHelper.verifyTextEquals("Verify Age On Ui ", "DDAcountAuthorizationScreen_age", arg5);
        assertionHelper.verifyTextEquals("Verify NomineePhoto Flag On Ui ", "DDAcountAuthorizationScreen_nomPhotoN",
                arg6);
        assertionHelper.verifyTwoTexts("Verifying Nominee Relationship On Ui ",
                dropDownHelper.getSelectedValue("DDAcountOpeningScreen_nomRelationship"), arg7);
        
        assertionHelper.verifyTextEquals("Verify Nominee Address On Ui ", "DDAcountAuthorizationScreen_nomAddr", arg9);
        assertionHelper.verifyTextEquals("Verify Nominee Major or Minor On Ui ", "DDAcountAuthorizationScreen_minorN",
                arg10);
    }
    
    @Then("^verify ProdId \"([^\"]*)\" ProductName \"([^\"]*)\" NatureOfAcc \"([^\"]*)\" MiniBaseAmt \"([^\"]*)\" MaxBaseAmt \"([^\"]*)\" UnitAmt \"([^\"]*)\" CustAsNominee \"([^\"]*)\" & Flow \"([^\"]*)\"$")
    public void verify_ProdId_ProductName_NatureOfAcc_MiniBaseAmt_MaxBaseAmt_UnitAmt_CustAsNominee_Flow(String arg1,
            String arg2, String arg3, String arg4, String arg5, String arg6, String arg7, String arg8)
            throws Throwable {
        
        assertionHelper.verifyTextEquals("Verifying Product Id On Ui ", "DDAcountOpeningScreen_flexiPrdId", arg1);
        assertionHelper.verifyTextEquals("Verifying Product Name On Ui ", "DDAcountOpeningScreen_flexiProdName", arg2);
        
        String flexiAccountNumberSBWithSIExistingNomYes;
        if ("Flexi-Saving Account".equalsIgnoreCase(arg2)) {
            if ("Yes".equalsIgnoreCase(arg7)) {
                if ("Auth".equalsIgnoreCase(arg8)) {
                    flexiAccountNumberSBWithSIExistingNomYes = cacheHelper.getCache("FlexiAccNumSBWithSIExistingNomYes",
                            cacheData);
                } else {
                    flexiAccountNumberSBWithSIExistingNomYes = cacheHelper
                            .getCache("FlexiAccNumSBWithSIExistingNomYesRejection", cacheData);
                }
                custAccount = customerAccountService
                        .getCustomerAccDetailsByUserAccNumber(flexiAccountNumberSBWithSIExistingNomYes);
                assertionHelper.verifyTextEquals("Verifying Flexi Account Number On Ui ",
                        "DDAcountOpeningScreen_flexiAccountNum", custAccount.getAccNo());
            } else {
                String flexiAccountNumberSBExistingNomNo;
                if ("Auth".equalsIgnoreCase(arg8)) {
                    flexiAccountNumberSBExistingNomNo = cacheHelper.getCache("FlexiAccNumSBWithSIExistingNomNo",
                            cacheData);
                } else {
                    flexiAccountNumberSBExistingNomNo = cacheHelper
                            .getCache("FlexiAccNumSBWithSIExistingNomNoRejection", cacheData);
                }
                custAccount = customerAccountService
                        .getCustomerAccDetailsByUserAccNumber(flexiAccountNumberSBExistingNomNo);
                assertionHelper.verifyTextEquals("Verifying Flexi Account Number On Ui ",
                        "DDAcountOpeningScreen_flexiAccountNum", custAccount.getAccNo());
            }
        } else {
            String flexiAccountNumberCAExistingNomYes;
            if ("Yes".equalsIgnoreCase(arg7)) {
                if ("Auth".equalsIgnoreCase(arg8)) {
                    flexiAccountNumberCAExistingNomYes = cacheHelper.getCache("FlexiAccNumCAWithSIExistingNomYes",
                            cacheData);
                } else {
                    flexiAccountNumberCAExistingNomYes = cacheHelper
                            .getCache("FlexiAccNumCAWithSIExistingNomYesRejection", cacheData);
                }
                custAccount = customerAccountService
                        .getCustomerAccDetailsByUserAccNumber(flexiAccountNumberCAExistingNomYes);
                assertionHelper.verifyTextEquals("Verifying Flexi Account Number On Ui ",
                        "DDAcountOpeningScreen_flexiAccountNum", custAccount.getAccNo());
            } else {
                String flexiAccountNumberCAExistingNomNo;
                if ("Auth".equalsIgnoreCase(arg8)) {
                    flexiAccountNumberCAExistingNomNo = cacheHelper.getCache("FlexiAccNumCAWithSIExistingNomNo",
                            cacheData);
                } else {
                    flexiAccountNumberCAExistingNomNo = cacheHelper
                            .getCache("FlexiAccNumCAWithSIExistingNomNoRejection", cacheData);
                }
                custAccount = customerAccountService
                        .getCustomerAccDetailsByUserAccNumber(flexiAccountNumberCAExistingNomNo);
                assertionHelper.verifyTextEquals("Verifying Flexi Account Number On Ui ",
                        "DDAcountOpeningScreen_flexiAccountNum", custAccount.getAccNo());
            }
        }
        assertionHelper.verifyTextEquals("Verifying Product Minimum Base Amount On Ui ",
                "DDAcountOpeningScreen_flexiMinBaseAmount", arg4);
        assertionHelper.verifyTextEquals("Verifying Product Maximum Base Amount On Ui ",
                "DDAcountOpeningScreen_flexiMaxFlexiAmount", arg5);
        assertionHelper.verifyTextEquals("Verifying Product Unit Amount On Ui ",
                "DDAcountOpeningScreen_flexiAmountPerUnit", arg6);
    }
    
    @Then("^verify si_master table status where si number is \"([^\"]*)\" of AccType \"([^\"]*)\" & CustAsNominee \"([^\"]*)\" & flow \"([^\"]*)\"$")
    public void verify_si_master_table_status_where_si_number_is_of_AccType_CustAsNominee_flow(String arg1, String arg2,
            String arg3, String arg4) throws Throwable {
        
        String SiNumber;
        if ("Saving Account".equalsIgnoreCase(arg2)) {
            if ("Yes".equalsIgnoreCase(arg3)) {
                if ("Auth".equalsIgnoreCase(arg4)) {
                    SiNumber = cacheHelper.getCache("ExistingNomYesSINum_SB", cacheData);
                } else {
                    SiNumber = cacheHelper.getCache("ExistingNomYesSINum_SBRejection", cacheData);
                }
            } else {
                if ("Auth".equalsIgnoreCase(arg4)) {
                    SiNumber = cacheHelper.getCache("ExistingNomNoSINum_SB", cacheData);
                } else {
                    SiNumber = cacheHelper.getCache("ExistingNomNoSINum_SBRejection", cacheData);
                }
            }
        } else {
            if ("Yes".equalsIgnoreCase(arg3)) {
                if ("Auth".equalsIgnoreCase(arg4)) {
                    SiNumber = cacheHelper.getCache("ExistingNomYesSINum_CA", cacheData);
                } else {
                    SiNumber = cacheHelper.getCache("ExistingNomYesSINum_CARejection", cacheData);
                }
            } else {
                if ("Auth".equalsIgnoreCase(arg4)) {
                    SiNumber = cacheHelper.getCache("ExistingNomNoSINum_CA", cacheData);
                } else {
                    SiNumber = cacheHelper.getCache("ExistingNomNoSINum_CARejection", cacheData);
                }
            }
        }
        
        BigInteger SiNum = new BigInteger(SiNumber);
        siMaster = sIMasterService.getSiDetailsBySiNumber(SiNum, property.getProperty("BranchCode"));
        if ("Auth".equalsIgnoreCase(arg4)) {
            assertionHelper.verifyTwoTexts("Verifying " + SiNumber + " SI Number Status in SI_Master Table ",
                    siMaster.getStatus().toString(), "A");
        } else {
            assertionHelper.verifyTwoTexts("Verifying " + SiNumber + " SI Number Status in SI_Master Table ",
                    siMaster.getStatus().toString(), "E");
        }
    }
    
    @Then("^verify SINum \"([^\"]*)\" DebitAccNo \"([^\"]*)\" CreditAccNo \"([^\"]*)\" Amt \"([^\"]*)\" AccType \"([^\"]*)\" CustAsNominee \"([^\"]*)\" & flow \"([^\"]*)\"$")
    public void verify_SINum_DebitAccNo_CreditAccNo_Amt_AccType_CustAsNominee_flow(String arg1, String arg2,
            String arg3, String arg4, String arg5, String arg6, String arg7) throws Throwable {
        
        String SiNumber;
        String DebitAccNum;
        if ("Saving Account".equalsIgnoreCase(arg5)) {
            if ("Yes".equalsIgnoreCase(arg6)) {
                if ("Auth".equalsIgnoreCase(arg7)) {
                    SiNumber = cacheHelper.getCache("ExistingNomYesSINum_SB", cacheData);
                    DebitAccNum = cacheHelper.getCache("InternalAccountNumSBWithSIExistingNomYes", cacheData);
                } else {
                    SiNumber = cacheHelper.getCache("ExistingNomYesSINum_SBRejection", cacheData);
                    DebitAccNum = cacheHelper.getCache("InternalAccountNumSBWithSIExistingNomYesRejection", cacheData);
                }
                
            } else {
                if ("Auth".equalsIgnoreCase(arg7)) {
                    SiNumber = cacheHelper.getCache("ExistingNomNoSINum_SB", cacheData);
                    DebitAccNum = cacheHelper.getCache("InternalAccountNumSBWithSIExistingNomNo", cacheData);
                } else {
                    SiNumber = cacheHelper.getCache("ExistingNomNoSINum_SBRejection", cacheData);
                    DebitAccNum = cacheHelper.getCache("InternalAccountNumSBWithSIExistingNomNoRejection", cacheData);
                }
            }
        } else {
            if ("Yes".equalsIgnoreCase(arg6)) {
                if ("Auth".equalsIgnoreCase(arg7)) {
                    SiNumber = cacheHelper.getCache("ExistingNomYesSINum_CA", cacheData);
                    DebitAccNum = cacheHelper.getCache("InternalAccountNumCAWithSIExistingNomYes", cacheData);
                } else {
                    SiNumber = cacheHelper.getCache("ExistingNomYesSINum_CARejection", cacheData);
                    DebitAccNum = cacheHelper.getCache("InternalAccountNumCAWithSIExistingNomYesRejection", cacheData);
                }
            } else {
                if ("Auth".equalsIgnoreCase(arg7)) {
                    SiNumber = cacheHelper.getCache("ExistingNomNoSINum_CA", cacheData);
                    DebitAccNum = cacheHelper.getCache("InternalAccountNumCAWithSIExistingNomNo", cacheData);
                } else {
                    SiNumber = cacheHelper.getCache("ExistingNomNoSINum_CARejection", cacheData);
                    DebitAccNum = cacheHelper.getCache("InternalAccountNumCAWithSIExistingNomNoRejection", cacheData);
                }
                
            }
        }
        waitingHelper.sleep(3000);
        assertionHelper.verifyTextEquals("Verifying SI Number On Ui ", "DDAcountAuthorizationScreen_siNumber",
                SiNumber);
        assertionHelper.verifyTextEquals("Verifying Debit Account Number On Ui ",
                "DDAcountAuthorizationScreen_debitAccNum", DebitAccNum);
        assertionHelper.verifyTextEquals("Verifying Credit Account Number On Ui ",
                "DDAcountAuthorizationScreen_creditAccNum", arg3);
        assertionHelper.verifyTextEquals("Verifying SI Amount On Ui ", "DDAcountAuthorizationScreen_siAmount", arg4);
        
    }
    
    @Then("^user click on Reject button of CASA Account Authorization$")
    public void user_click_on_Reject_button_of_CASA_Account_Authorization() throws Throwable {
        seleniumHelper.clickElement("DDAcountAuthorizationScreen_rejectButton");
    }
    
    @Then("^verify ProdId \"([^\"]*)\" ProductName \"([^\"]*)\" NatureOfAcc \"([^\"]*)\" MiniBaseAmt \"([^\"]*)\" MaxBaseAmt \"([^\"]*)\" UnitAmt \"([^\"]*)\" SiFlag \"([^\"]*)\" for Rejection$")
    public void verify_ProdId_ProductName_NatureOfAcc_MiniBaseAmt_MaxBaseAmt_UnitAmt_SiFlag_for_Rejection(String arg1,
            String arg2, String arg3, String arg4, String arg5, String arg6, String arg7) throws Throwable {
        assertionHelper.verifyTextEquals("Verifying Product Id On Ui ", "DDAcountOpeningScreen_flexiPrdId", arg1);
        assertionHelper.verifyTextEquals("Verifying Product Name On Ui ", "DDAcountOpeningScreen_flexiProdName", arg2);
        
        if ("Self".equalsIgnoreCase(arg3)) {
            if ("Flexi-Saving Account".equalsIgnoreCase(arg2)) {
                if ("Y".equalsIgnoreCase(arg7)) {
                    String UserflexiAccountNumberSBWithSI = cacheHelper.getCache("FlexiAccNumSBWithSIRejection",
                            cacheData);
                    custAccount = customerAccountService
                            .getCustomerAccDetailsByUserAccNumber(UserflexiAccountNumberSBWithSI);
                    assertionHelper.verifyTextEquals("Verifying Flexi Account Number On Ui ",
                            "DDAcountOpeningScreen_flexiAccountNum", custAccount.getAccNo());
                } else {
                    String UserflexiAccountNumberSB = cacheHelper.getCache("FlexiAccNumSBRejection", cacheData);
                    custAccount = customerAccountService.getCustomerAccDetailsByUserAccNumber(UserflexiAccountNumberSB);
                    assertionHelper.verifyTextEquals("Verifying Flexi Account Number On Ui ",
                            "DDAcountOpeningScreen_flexiAccountNum", custAccount.getAccNo());
                }
            } else {
                if ("Y".equalsIgnoreCase(arg7)) {
                    String UserflexiAccountNumberCAWithSI = cacheHelper.getCache("FlexiAccNumCAWithSIRejection",
                            cacheData);
                    custAccount = customerAccountService
                            .getCustomerAccDetailsByUserAccNumber(UserflexiAccountNumberCAWithSI);
                    assertionHelper.verifyTextEquals("Verifying Flexi Account Number On Ui ",
                            "DDAcountOpeningScreen_flexiAccountNum", custAccount.getAccNo());
                } else {
                    String UserflexiAccountNumberCA = cacheHelper.getCache("FlexiAccNumCARejection", cacheData);
                    custAccount = customerAccountService.getCustomerAccDetailsByUserAccNumber(UserflexiAccountNumberCA);
                    assertionHelper.verifyTextEquals("Verifying Flexi Account Number On Ui ",
                            "DDAcountOpeningScreen_flexiAccountNum", custAccount.getAccNo());
                }
            }
        } else {
            if ("Flexi-Saving Account".equalsIgnoreCase(arg2)) {
                if ("Y".equalsIgnoreCase(arg7)) {
                    String UserflexiAccountNumSBWithSI = cacheHelper
                            .getCache("FlexiAccNumSBWithOperatorWithSIRejection", cacheData);
                    custAccount = customerAccountService
                            .getCustomerAccDetailsByUserAccNumber(UserflexiAccountNumSBWithSI);
                    assertionHelper.verifyTextEquals("Verifying Flexi Account Number On Ui ",
                            "DDAcountOpeningScreen_flexiAccountNum", custAccount.getAccNo());
                } else {
                    String UserflexiAccountNumSB = cacheHelper.getCache("FlexiAccNumSBWithOperatorRejection",
                            cacheData);
                    custAccount = customerAccountService.getCustomerAccDetailsByUserAccNumber(UserflexiAccountNumSB);
                    assertionHelper.verifyTextEquals("Verifying Flexi Account Number On Ui ",
                            "DDAcountOpeningScreen_flexiAccountNum", custAccount.getAccNo());
                }
            } else {
                if ("Y".equalsIgnoreCase(arg7)) {
                    String UserflexiAccountNumCAWithSI = cacheHelper
                            .getCache("FlexiAccNumCAWithOperatorWithSIRejection", cacheData);
                    custAccount = customerAccountService
                            .getCustomerAccDetailsByUserAccNumber(UserflexiAccountNumCAWithSI);
                    assertionHelper.verifyTextEquals("Verifying Flexi Account Number On Ui ",
                            "DDAcountOpeningScreen_flexiAccountNum", custAccount.getAccNo());
                } else {
                    String UserflexiAccountNumCA = cacheHelper.getCache("FlexiAccNumCAWithOperatorRejection",
                            cacheData);
                    custAccount = customerAccountService.getCustomerAccDetailsByUserAccNumber(UserflexiAccountNumCA);
                    assertionHelper.verifyTextEquals("Verifying Flexi Account Number On Ui ",
                            "DDAcountOpeningScreen_flexiAccountNum", custAccount.getAccNo());
                }
            }
        }
        assertionHelper.verifyTextEquals("Verifying Product Minimum Base Amount On Ui ",
                "DDAcountOpeningScreen_flexiMinBaseAmount", arg4);
        assertionHelper.verifyTextEquals("Verifying Product Maximum Base Amount On Ui ",
                "DDAcountOpeningScreen_flexiMaxFlexiAmount", arg5);
        assertionHelper.verifyTextEquals("Verifying Product Unit Amount On Ui ",
                "DDAcountOpeningScreen_flexiAmountPerUnit", arg6);
    }
    
    @Then("^user select reject reason type \"([^\"]*)\" from dropdown$")
    public void user_select_reject_reason_type_from_dropdown(String arg1) throws Throwable {
        dropDownHelper.SelectUsingVisibleText("DDAcountAuthorizationScreen_rejReasonType", arg1);
    }
    
    @Then("^user enters reject reason \"([^\"]*)\"$")
    public void user_enters_reject_reason(String arg1) throws Throwable {
        
        seleniumHelper.enterText("DDAcountAuthorizationScreen_reason", arg1);
    }
    
    @Then("^user click on Save button$")
    public void user_click_on_Save_button() throws Throwable {
        seleniumHelper.clickElement("DDAcountAuthorizationScreen_saveButton");
    }
    
}
