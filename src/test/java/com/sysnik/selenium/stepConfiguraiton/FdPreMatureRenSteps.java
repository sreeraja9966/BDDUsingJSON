package com.sysnik.selenium.stepConfiguraiton;

import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.lang.reflect.Type;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import java.util.function.Function;

import org.openqa.selenium.By;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.FluentWait;
import org.openqa.selenium.support.ui.Wait;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.AccountMasterEntity;
import com.sysnik.selenium.entity.BranchParametersEntity;
import com.sysnik.selenium.entity.CustomerAccountEntity;
import com.sysnik.selenium.entity.CustomerMasterEntity;
import com.sysnik.selenium.entity.TransactionHeaderEntity;
import com.sysnik.selenium.entity.TransactionsDetailEntity;
import com.sysnik.selenium.fw.helper.AssertionHelper;
import com.sysnik.selenium.fw.helper.CacheHelper;
import com.sysnik.selenium.fw.helper.CommonMethodsForVerifications;
import com.sysnik.selenium.fw.helper.ConvertPropertyFileToMap;
import com.sysnik.selenium.fw.helper.DateHelper;
import com.sysnik.selenium.fw.helper.DbHelper;
import com.sysnik.selenium.fw.helper.DropDownHelper;
import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.fw.helper.RobotHelper;
import com.sysnik.selenium.fw.helper.SeleniumHelper;
import com.sysnik.selenium.fw.helper.WaitingHelper;
import com.sysnik.selenium.fw.testBase.TestBase;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import model.FdRen;

public class FdPreMatureRenSteps extends TestBase {
    FdRen fdren = null;
    
    List<FdRen> fdPreMatrenList = null;
    Map<String, FdRen> fdPreMatrenMap = new HashMap<String, FdRen>();
    
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
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    FdAccountClosingStepDef fdAccountClosingStepDef = new FdAccountClosingStepDef();
    private CustomerAccountEntity custAcc;
    private CustomerMasterEntity custMaster;
    private AccountMasterEntity accMaster;
    private AccountMasterEntity renewalAccMaster;
    private TransactionHeaderEntity transHeader;
    private List<TransactionsDetailEntity> childTransDetailsList;
    private TransactionsDetailEntity transDetails;
    private BranchParametersEntity branchparam;
    
    @Given("^user opens a scenario for FD Pre Mature Renewal \"([^\"]*)\"$")
    public FdRen test(String scenario) {
        
        try {
            Reader reader = new FileReader("src/main/resources/JSON/FdPreMatureRenewal.json");
            /*
             * ObjectMapper mapper = new ObjectMapper(); byte[] jsonMap; jsonMap = mapper.writeValueAsBytes(reader);
             */
            //lienDataList = gson.fromJson(reader, List.class);
            
            Type typeOfObjectsList = new TypeToken<ArrayList<FdRen>>() {
            }.getType();
            
            fdPreMatrenList = new Gson().fromJson(reader, typeOfObjectsList);
            
            //  lienDataList = mapper.readValue(reader, List.class);
            for (FdRen data : fdPreMatrenList) {
                fdPreMatrenMap.put(data.getScenario(), data);
                if (scenario.equalsIgnoreCase(data.getScenario())) {
                    
                    fdren = data;
                    
                }
            }
            
        } catch (IOException e) {
            e.printStackTrace();
        }
        return fdren;
    }
    
    
    
}
