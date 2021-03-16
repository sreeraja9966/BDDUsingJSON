
package com.sysnik.selenium.stepConfiguraiton;

import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.lang.reflect.Type;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.AccountMasterEntity;
import com.sysnik.selenium.entity.BranchParametersEntity;
import com.sysnik.selenium.entity.CustomerAccountEntity;
import com.sysnik.selenium.entity.CustomerMasterEntity;
import com.sysnik.selenium.entity.LienEarMarkEntity;
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
import model.DepMaster;
import model.LienNotingData;
import model.LoanMaster;

public class LienNotinStepDefUsingJson extends TestBase {
    
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
    private CustomerMasterEntity custMaster;
    private AccountMasterEntity accMaster;
    private AccountMasterEntity accMaster2;
    private CustomerAccountEntity custAcc;
    private List<LienEarMarkEntity> lienEnmarking;
    private BranchParametersEntity branchParameters;
    List<LienNotingData> lienDataList = null;
    Map<String, LienNotingData> lienDataMap = new HashMap<String, LienNotingData>();
    LienNotingData lienData = null;
    
    @Given("^user opens a scenario \"([^\"]*)\"$")
    public LienNotingData test(String scenario) {
        Gson gson = new Gson();
        try {
            Reader reader = new FileReader("src/main/resources/JSON/LienNoting.json");
            /*
             * ObjectMapper mapper = new ObjectMapper(); byte[] jsonMap; jsonMap = mapper.writeValueAsBytes(reader);
             */
            //lienDataList = gson.fromJson(reader, List.class);
            
            Type typeOfObjectsList = new TypeToken<ArrayList<LienNotingData>>() {
            }.getType();
            
            lienDataList = new Gson().fromJson(reader, typeOfObjectsList);
            
            //  lienDataList = mapper.readValue(reader, List.class);
            for (LienNotingData data : lienDataList) {
                lienDataMap.put(data.getScenario(), data);
                if (scenario.equalsIgnoreCase(data.getScenario())) {
                    
                    lienData = data;
                    
                }
            }
            
        } catch (IOException e) {
            e.printStackTrace();
        }
        return lienData;
    }
    
    @Then("^verify validation Message on Get Call$")
    public void verify_validation_Message_on_Get_Call() throws Throwable {
        assertionHelper.verifyTwoTexts("Verifying Validation Message ",
                seleniumHelper.getTextFromAnElement("LienNotingScreen_GetValidationMsg"),
                lienData.getValidationMessage());
    }
    
    @When("^user enter Deposit accNo on Lien Noting Entry Screen with validation$")
    public void user_enter_Deposit_accNo_on_Lien_Noting_Entry_Screen_validation() throws Throwable {
        
        for (DepMaster depList : lienData.getDepAccNoList()) {
            seleniumHelper.enterText("LienNotingScreen_depositeAccountNumber", depList.getDepAccNo());
            waitingHelper.sleep(2500);
            accMaster = accountService.getAccountMasterDetailsByAccNo(depList.getDepAccNo());
            assertionHelper.verifyTwoAmounts(
                    "Verifying Deposit Account Available Balance of accNo" + depList.getDepAccNo(),
                    seleniumHelper.getTextFromAnElement("LienNotingScreen_depositAccountBalance"),
                    accMaster.getAvailableBal() + "");
            assertionHelper.verifyTwoAmounts("Verifying Present Lien of accNo" + depList.getDepAccNo(),
                    seleniumHelper.getTextFromAnElement("LienNotingScreen_presentLienAmount"),
                    depList.getLienDetails().getPresentLienAmount());
            assertionHelper.verifyTwoAmounts("Verifying  Lien Amount of accNo" + depList.getDepAccNo(),
                    seleniumHelper.getTextFromAnElement("LienNotingScreen_lienAmount"),
                    depList.getLienDetails().getActualLienAmount());
            seleniumHelper.enterText("LienNotingScreen_lienAmount", depList.getLienDetails().getLienAmount());
            waitingHelper.sleep(2500);
            seleniumHelper.enterText("LienNotingScreen_remark", depList.getLienDetails().getRemarks());
            seleniumHelper.clickElement("LienNotingScreen_addRecord");
        }
    }
    
    @When("^user enter Deposit accNo on Lien Noting Entry Screen$")
    public void user_enter_Deposit_accNo_on_Lien_Noting_Entry_Screen() throws Throwable {
        
        for (DepMaster depList : lienData.getDepAccNoList()) {
            seleniumHelper.enterText("LienNotingScreen_depositeAccountNumber", depList.getDepAccNo());
            waitingHelper.sleep(2500);
            
        }
    }
    
    @Then("^user finds successMessage$")
    public void user_finds_successMessage() throws Throwable {
        commonMethodsForVerifications.verifyAndSubmitModel(lienData.getSuccessMessage());
    }
    
    @Then("^Verify Lien Table status col with depAcc loanAcc$")
    public void verify_Lien_Table_status_col_with_depAcc_loanAcc() throws Throwable {
        BigDecimal totalLienAmt = new BigDecimal("0");
        for (LoanMaster loanList : lienData.getLoanAccList()) {
            for (DepMaster depList : lienData.getDepAccNoList()) {
                
                accMaster = accountService.getAccountMasterDetailsByAccNo(loanList.getloanAccNo());
                accMaster2 = accountService.getAccountMasterDetailsByAccNo(depList.getDepAccNo());
                branchParameters = branchParametersService
                        .getBnrachDetailsByBranchCode(property.getProperty("BranchCode"));
                lienEnmarking = lienMarkService.getLienDetailsByDepoAndLoanaccIdInList(accMaster2.getAccId(),
                        accMaster.getAccId(), depList.getLienDetails().getStatus());
                totalLienAmt = lienMarkService.getTotalLienAmount(accMaster2.getAccId(), accMaster.getAccId());
                for (LienEarMarkEntity lienTable : lienEnmarking) {
                    assertionHelper.verifyTwoAmounts(
                            "Verifying Lien Date in Lien Table of dep AccNo:" + accMaster2.getAccNo() + " & loan AccNo:"
                                    + accMaster.getAccNo(),
                            dateHelper.convertDbDateToDDMMYYYY(lienTable.getLienDate() + ""),
                            dateHelper.convertDbDateToDDMMYYYY(branchParameters.getCurrentDate() + ""));
                    assertionHelper.verifyTwoTexts(
                            "Verifying Status in Lien Marking table:" + accMaster2.getAccNo() + " & loan AccNo:"
                                    + accMaster.getAccNo(),
                            lienTable.getStatus(), depList.getLienDetails().getStatus());
                    assertionHelper.verifyTwoTexts(
                            "Verifying Enter By in Lien Marking table:" + accMaster2.getAccNo() + " & loan AccNo:"
                                    + accMaster.getAccNo(),
                            lienTable.getEnteredBy(), property.getProperty("LogInUser"));
                    assertionHelper.verifyTwoTexts(
                            "Verifying Remarks in Lien Marking table:" + accMaster2.getAccNo() + " & loan AccNo:"
                                    + accMaster.getAccNo(),
                            lienTable.getLienNoteRemarks(), depList.getLienDetails().getRemarks());
                    if ("A".equalsIgnoreCase(depList.getLienDetails().getStatus())) {
                        assertionHelper.verifyTwoAmounts("Verifying Total Lien Amount in Lien Table", totalLienAmt + "",
                                depList.getLienDetails().getPresentLienAmount());
                    } else if ("E".equalsIgnoreCase(depList.getLienDetails().getStatus())) {
                        assertionHelper.verifyTwoAmounts("Verifying Total Lien Amount in Lien Table", totalLienAmt + "",
                                (new BigDecimal(depList.getLienDetails().getPresentLienAmount())
                                        .add(new BigDecimal(depList.getLienDetails().getLienAmount()))) + "");
                    }
                    
                }
            }
        }
    }
    
    @Then("^verify depAccNo \"([^\"]*)\" depAccBal  presentLien \"([^\"]*)\" LeinAmount \"([^\"]*)\" and remarks \"([^\"]*)\" of \"([^\"]*)\"$")
    public void verify_depAccNo_depAccBal_presentLien_LeinAmount_and_remarks_of(String arg1, String arg2, String arg3,
            String arg4, String arg5) throws Throwable {
        
    }
    
    @When("^user enter accNo on Lien Noting Entry Screen$")
    public void user_enter_accNo_on_Lien_Noting_Entry_Screen() {
        if (lienData != null)
            for (LoanMaster loanList : lienData.getLoanAccList()) {
                seleniumHelper.enterText("LienNotingScreen_LoanAccNo", loanList.getloanAccNo());
                waitingHelper.sleep(2500);
            }
        
    }
    
    @Then("^Verify customer Name on Lien Noting Entry Screen of accNo$")
    public void verify_customer_Name_on_Lien_Noting_Entry_Screen_of_accNo() throws Throwable {
        accMaster = accountService.getAccountMasterDetailsByAccNo(lienData.getLoanAccList().get(0).getloanAccNo());
        custMaster = customerMasterService.getCustMasterDetailsByCustId(accMaster.getCustId());
        assertionHelper.verifyTwoTexts("Verifying Customer Name On UI",
                seleniumHelper.getTextFromAnElement("LienNotingScreen_customerName"), custMaster.getCustName());
    }
    
    @When("^user click on AddDetails button on Lien Noting Entry Screen$")
    public void user_click_on_AddDetails_button_on_Lien_Noting_Entry_Screen() throws Throwable {
        seleniumHelper.clickElement("LienNotingScreen_addRecord");
        waitingHelper.sleep(2500);
        
    }
    
    @When("^user click on submit button on Lien Noting Entry Screen$")
    public void user_click_on_submit_button_on_Lien_Noting_Entry_Screen() throws Throwable {
        seleniumHelper.clickElement("LienNotingScreen_submit");
        waitingHelper.sleep(2500);
    }
    
    @When("^user enter lien Amount on Lien Noting Entry Screen$")
    public void user_enter_lien_Amount_on_Lien_Noting_Entry_Screen() {
        seleniumHelper.enterText("LienNotingScreen_lienAmount",
                lienData.getDepAccNoList().get(0).getLienDetails().getLienAmount());
    }
    
    @When("^user select accNo in Lien Noting Auth screen$")
    public void user_select_accNo_in_Lien_Noting_Auth_screen() throws Throwable {
        custAcc = customerAccountService
                .getCustomerAccDetailsByAccNumber(lienData.getLoanAccList().get(0).getloanAccNo());
        dropDownHelper.SelectUsingVisibleText("LienNotingAuthScreen_LoanAccNoDropdown", custAcc.getUserAccNo());
        waitingHelper.sleep(2500);
    }
    
    @Then("^verify depAccNo depAccBal  presentLien LeinAmount and remarks$")
    public void verify_depAccNo_depAccBal_presentLien_LeinAmount_and_remarks() throws Throwable {
        int i = 1;
        String tableXpath = convertPropertyFileToMap.getPropertyFromMap("LienNotingAuthScreen_TablePath",
                xpathLocatorMap);
        for (DepMaster depList : lienData.getDepAccNoList()) {
            accMaster = accountService.getAccountMasterDetailsByAccNo(depList.getDepAccNo());
            
            assertionHelper.verifyTwoTexts("Verifying Deposit Account No ON UI",
                    seleniumHelper.getTextFromAnElement(tableXpath + "/tr[" + i + "]/td[1]"), depList.getDepAccNo());
            assertionHelper.verifyTwoAmounts("Verify Deposit Acc Balance of AccNo::" + depList.getDepAccNo(),
                    seleniumHelper.getTextFromAnElement(tableXpath + "/tr[" + i + "]/td[2]"),
                    accMaster.getAvailableBal() + "");
            assertionHelper.verifyTwoAmounts("Verify Present Lien of AccNo::" + depList.getDepAccNo(),
                    seleniumHelper.getTextFromAnElement(tableXpath + "/tr[" + i + "]/td[3]"),
                    depList.getLienDetails().getPresentLienAmount());
            assertionHelper.verifyTwoAmounts("Verify  Lien Amount of AccNo::" + depList.getDepAccNo(),
                    seleniumHelper.getTextFromAnElement(tableXpath + "/tr[" + i + "]/td[4]"),
                    depList.getLienDetails().getLienAmount());
            assertionHelper.verifyTwoAmounts("Verify  Remarks of AccNo::" + depList.getDepAccNo(),
                    seleniumHelper.getTextFromAnElement(tableXpath + "/tr[" + i + "]/td[5]"),
                    depList.getLienDetails().getRemarks());
            
            i++;
        }
    }
    
    @When("^user click on submit button on Lien Noting Auth screen$")
    public void user_click_on_submit_button_on_Lien_Noting_Auth_screen() throws Throwable {
        seleniumHelper.clickElement("LienNotingAuthScreen_SubmitButton");
        waitingHelper.sleep(2500);
    }
    
}
