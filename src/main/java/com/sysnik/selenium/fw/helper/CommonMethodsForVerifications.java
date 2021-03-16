package com.sysnik.selenium.fw.helper;

import java.math.BigInteger;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
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

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.fw.testBase.TestBase;

public class CommonMethodsForVerifications extends TestBase {
    
    AssertionHelper assertionHelper = AutomationObjectFactory.getAssertionHelperInstance();
    SeleniumHelper seleniumHelper = AutomationObjectFactory.getSeleniumHelperInstance();
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    CacheHelper cacheHelper = AutomationObjectFactory.getCacheHelperInstance();
    FilloExcelDataGetter filloExcelDataGetter = AutomationObjectFactory.getFilloExcelDataGetterInstance();
    AlertHelper alertHelper = AutomationObjectFactory.getAlertHelperInstance();
    DbHelper dbHelper = AutomationObjectFactory.getDbHelperInstance();
    DateHelper dateHelper = AutomationObjectFactory.getDateHelperInstance();
    ExcelHelper excelHelper = AutomationObjectFactory.getExcelHelperInstance();
    ConvertPropertyFileToMap convertPropertyFileToMap = AutomationObjectFactory.getConvertPropertyFileToMapInstance();
    FindElement findElement = AutomationObjectFactory.getFindElementInstance();
    
    public void verifyAndSubmitModel(String successMessage) {
        
        WebElement ele;
        try {
            ele = d.findElement(By.xpath("//h6[@id='modale']"));
        } catch (Exception e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
            ele = null;
        }
        if (!ele.getText().equalsIgnoreCase(null)) {
            String expectedText = null;
            try {
                String xpath = convertPropertyFileToMap.getPropertyFromMap("Common_ModelText", xpathLocatorMap);
                try {
                    
                    Wait<WebDriver> wait = new FluentWait<WebDriver>(d).withTimeout(30, TimeUnit.SECONDS)
                            .pollingEvery(5, TimeUnit.SECONDS).ignoring(NoSuchElementException.class)
                            .ignoring(StaleElementReferenceException.class);
                    WebElement foo = wait.until(new Function<WebDriver, WebElement>() {
                        public WebElement apply(WebDriver driver) {
                            return driver.findElement(By.xpath(xpath));
                        }
                    });
                    
                } catch (Exception e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                    
                }
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            assertionHelper.hardAssertionForModel("Verifying Model Message  ", "Common_ModelText", successMessage.trim());
            
            seleniumHelper.clickElement("Common_ModelOkButton");
            
            /*
             * catch (Exception e) { seleniumHelper.clickElement("Common_ModelOkButton"); }
             */
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest("Model Not Found");
        }
        
    }
    
    public void verifyModelMessage(String successMessage) {
        String expectedText = null;
        try {
            String xpath = convertPropertyFileToMap.getPropertyFromMap("Common_ModelText", xpathLocatorMap);
            try {
                
                Wait<WebDriver> wait = new FluentWait<WebDriver>(d).withTimeout(30, TimeUnit.SECONDS)
                        .pollingEvery(5, TimeUnit.SECONDS).ignoring(NoSuchElementException.class)
                        .ignoring(StaleElementReferenceException.class);
                WebElement foo = wait.until(new Function<WebDriver, WebElement>() {
                    public WebElement apply(WebDriver driver) {
                        return driver.findElement(By.xpath(xpath));
                    }
                });
                
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
                
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        assertionHelper.verifyTextEquals("Verifying Model Message", "Common_ModelText", successMessage);
        
    }
    
    public void verifyModelNumberWithDb(String Xpath, String query) {
        
        String numberInModel = seleniumHelper.getOnlyNumbersFromAnElement(Xpath);
        // dbHelper.compareResultUsingDb(query, numberInModel);
    }
    
    public void getAccountNumberModelResponse(String Xpath, String accountNumberType, Map<String, String> cacheMap) {
        try {
            
            String xpath = convertPropertyFileToMap.getPropertyFromMap("Common_ModelText", xpathLocatorMap);
            try {
                
                Wait<WebDriver> wait = new FluentWait<WebDriver>(d).withTimeout(30, TimeUnit.SECONDS)
                        .pollingEvery(5, TimeUnit.SECONDS).ignoring(NoSuchElementException.class)
                        .ignoring(StaleElementReferenceException.class);
                WebElement foo = wait.until(new Function<WebDriver, WebElement>() {
                    public WebElement apply(WebDriver driver) {
                        return driver.findElement(By.xpath(xpath));
                    }
                });
                
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
                
            }
            String textInModel = seleniumHelper.getTextFromAnElement(xpath);
            String accInModel = seleniumHelper.getOnlyNumbersFromAnElement(Xpath);
            
            cacheHelper.setCacheWithaString(accountNumberType, accInModel, cacheMap);
            if (!cacheHelper.getCache(accountNumberType, cacheMap).equals(null)) {
                reportHelper.writeLogInCaseOfPassInChildTest(accountNumberType + " is sucessful with account no "
                        + cacheHelper.getCache(accountNumberType, cacheMap));
            }
            
            else {
                reportHelper.writeLogInCaseOfFailInChildTest(
                        accountNumberType + " creation is failed With reason " + textInModel);
                reportHelper.addScreenShotInCaseOfFailInReportInChild(
                        "Reason for" + accountNumberType + " creation failure is " + textInModel);
            }
            // seleniumHelper.clickElement("//h6[@id='modale']//following::button[contains(text(),'OK')]");
        } catch (Exception e) {
            
            seleniumHelper.clickElement("Common_ModelOkButton");
            seleniumHelper.clickElement("Common_ModelRedOkButton");
            e.printStackTrace();
        }
    }
    
    // String query,String fieldName,
    public String verifyStringWithDbFunction(String... rrr) {
        
        String functionFromDB = "select * from cust_master where custid='#' and status='#'";
        for (String a : rrr) {
            functionFromDB.replace("#", a);
        }
        return functionFromDB;
    }
    
    public void verifyOpenDateInAccOpng(String opngDateXpathKey) {
        
        assertionHelper.verifyCalendarText("Verifying BranchLive date with account open date ", opngDateXpathKey,
                branchParametersService.getBnrachLiveDate(
                        filloExcelDataGetter.getDataFromaColumnOfAnExcellSheet("select * from login", "BranchCode"))
                        + "");
        
    }
    
    public void verfyCustCategoryInAccOpng(String CustCategoryInAccOpngXpathKey, String custNumber) {
        assertionHelper
                .verifyTextEquals("Verifying CATEGORY of Customer ", CustCategoryInAccOpngXpathKey,
                        lookupService
                                .getLookdetailsByCodeAndType(
                                        customerMasterService.getCustomerCatogeryBycustNumber(custNumber), "CATEGORY")
                                .getDescription());
    }
    
    public void verifyLiveDatePlusPeriodOnUI(String textToWriteInreport, String xpath, BigInteger periodInMonths,
            BigInteger periodInDays) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String presentdate = branchParametersService.getBnrachLiveDate("2101") + "";
        log.info(presentdate + "presentdatepresentdatepresentdatepresentdate");
        
        LocalDate date = LocalDate.parse(presentdate, formatter);
        
        LocalDate reqDate = date.plusMonths(periodInMonths.longValue());
        reqDate = reqDate.plusDays(periodInDays.longValue());
        log.info(reqDate + "reqDatereqDatereqDatereqDatereqDate");
        //String expectedDate = dateHelper.convetDateIntoSpecificFormat(reqDate + "");
        assertionHelper.verifyCalendarText(textToWriteInreport, xpath, reqDate + "");
        
    }
    
    public Map<String, String> loadExcelDataIntoMap(String excelSheetName, String Scenario,
            Map<String, String> excelData) {
        
        List<String> fristRowDat = excelHelper.getCompleteRowData(
                relativePath() + "\\src\\main\\resources\\GlobalDataProvider\\temp.xls", excelSheetName);
        
        for (String colName : fristRowDat) {
            excelData.put(Scenario + "_" + colName, filloExcelDataGetter.getDataFromaColumnOfAnExcellSheet(
                    "select * from " + excelSheetName + "" + " where Scenario='" + Scenario + "'", colName));
        }
        return excelData;
    }
    
    public void verifyTableDataWithExcel(String excelDetails, String tableDetails, Map<String, String> cacheMap) {
        
        String excelDetailsfromDataFile[] = excelDetails.split(",");
        String excelTableName = excelDetailsfromDataFile[0];
        String Scenario = excelDetailsfromDataFile[1];
        
        List<String> noofCloumnsInaTable = new ArrayList<>();
        List<String> tableColDetails = new ArrayList<String>();
        List<String> noOftablesAndCol = new ArrayList<>();
        tableColDetails.add(tableDetails);
        String tableName = null;
        String colName = null;
        String dataFromExecl = null;
        String excelColName = null;
        String lookupType = null;
        String convertedDateFromExcel = null;
        String otherTableDetails[] = null;
        String otherTableNameOne = null;
        String otherColumnNameOne = null;
        String otherTableWhereConditionOne = null;
        String otherTableNameTwo = null;
        String otherColumnNameTwo = null;
        String otherTableWhereConditionTwo = null;
        String otherTableNameThree = null;
        String otherTableColumnNameThree = null;
        String otherTableWhereConditionThree = null;
        String[] tableKeyList = null;
        List noOfTables = new ArrayList<>();
        for (String table : tableColDetails) {
            tableKeyList = table.split(",");
        }
        for (String tableKeys : tableKeyList) {
            noOftablesAndCol.add(tableKeys);
        }
        String[] tableColNames = null;
        for (String t : noOftablesAndCol) {
            tableColNames = t.split("&");
            tableName = tableColNames[0];
            colName = tableColNames[1];
            
            noofCloumnsInaTable = dbHelper.getListFromQuery(
                    "SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME ='" + tableName + "'");
            for (String colValue : noofCloumnsInaTable) {
                
                try {
                    excelColName = filloExcelDataGetter.getDataFromaColumnOfAnExcellSheet(
                            "select * from " + excelTableName + "  where Sno= '-1'", colValue);
                    dataFromExecl = filloExcelDataGetter.getDataFromaColumnOfAnExcellSheet(
                            "select * from " + excelTableName + "  where Scenario= '" + Scenario + "'", colValue);
                    
                    otherTableDetails = filloExcelDataGetter.getDataFromaColumnOfAnExcellSheet(
                            "select * from " + excelTableName + "  where Sno= '1'", colValue).split(",");
                    log.info(dataFromExecl
                            + " if condition dataFromExecldataFromExecldataFromExecldataFromExecldataFromExecldataFromExecldataFromExecldataFromExecl");
                    if (dataFromExecl != null && !dataFromExecl.isEmpty()) {
                        if (excelColName.equalsIgnoreCase("lookup")) {
                            lookupType = filloExcelDataGetter.getDataFromaColumnOfAnExcellSheet(
                                    "select * from " + excelTableName + "  where Sno= '0'", colValue);
                            dbHelper.compareResultUsingDb("SELECT DESCRIPTION FROM LOOKUP WHERE code IN " + "(SELECT "
                                    + colValue + "  FROM CUST_MASTER WHERE CUST_NUMBER =" + "'"
                                    + cacheHelper.getCache(Scenario, cacheMap) + "') AND" + " type LIKE '" + lookupType
                                    + "'", dataFromExecl);
                        } else if (excelColName.equalsIgnoreCase("lookupMutiple")) {
                            otherTableWhereConditionOne = otherTableDetails[0];
                            otherTableNameTwo = otherTableDetails[1];
                            otherTableWhereConditionTwo = otherTableDetails[2];
                            lookupType = filloExcelDataGetter.getDataFromaColumnOfAnExcellSheet(
                                    "select * from " + excelTableName + "  where Sno= '0'", colValue);
                            dbHelper.compareResultUsingDb("select lookup.DESCRIPTION  from lookup inner join "
                                    + tableName + " on lookup.code=" + tableName + "." + colValue + " join "
                                    + otherTableNameTwo + " on " + tableName + "." + otherTableWhereConditionOne + "="
                                    + otherTableNameTwo + "." + otherTableWhereConditionTwo + " where "
                                    + otherTableNameTwo + "." + colName + " ='"
                                    + cacheHelper.getCache(Scenario, cacheMap) + "' and lookup.type='" + lookupType
                                    + "'", dataFromExecl);
                        }
                        
                        else if (excelColName.equalsIgnoreCase("id")) {
                            dbHelper.compareResultUsingDb("select cust_number from cust_master WHERE CUST_ID in "
                                    + "(select " + colValue + " from cust_master where cust_number='"
                                    + cacheHelper.getCache(Scenario, cacheMap) + "')", dataFromExecl);
                        } else if (excelColName.equalsIgnoreCase("date")) {
                            convertedDateFromExcel = seleniumHelper.changeDateFormat(dataFromExecl);
                            dbHelper.compareResultUsingDb("select " + colValue + " from " + tableName + " where "
                                    + colName + " ='" + cacheHelper.getCache(Scenario, cacheMap) + "'",
                                    convertedDateFromExcel);
                        }
                        
                        else if (excelColName.equalsIgnoreCase("twoTable")) {
                            otherTableWhereConditionOne = otherTableDetails[0];
                            otherTableNameTwo = otherTableDetails[1];
                            otherTableWhereConditionTwo = otherTableDetails[2];
                            
                            dbHelper.compareResultUsingDb("select " + tableName + "." + colValue + " from " + tableName
                                    + " inner join " + otherTableNameTwo + " on " + tableName + "."
                                    + otherTableWhereConditionOne + "=" + otherTableNameTwo + "."
                                    + otherTableWhereConditionTwo + " where " + otherTableNameTwo + "." + colName + "='"
                                    + cacheHelper.getCache(Scenario, cacheMap) + "'", dataFromExecl);
                        } else if (excelColName.equalsIgnoreCase("threeTables")) {
                            otherTableWhereConditionOne = otherTableDetails[0];
                            otherTableNameTwo = otherTableDetails[1];
                            otherColumnNameTwo = otherTableDetails[2];
                            otherTableWhereConditionTwo = otherTableDetails[3];
                            otherTableNameThree = otherTableDetails[4];
                            otherTableColumnNameThree = otherTableDetails[5];
                            
                            dbHelper.compareResultUsingDb(
                                    "select " + tableName + "." + colValue + " from " + tableName + " inner join "
                                            + otherTableNameTwo + " on " + tableName + "." + otherTableWhereConditionOne
                                            + "=" + otherTableNameTwo + "." + otherColumnNameTwo + " join "
                                            + otherTableNameThree + " on " + otherTableNameThree + "."
                                            + otherTableColumnNameThree + "=" + otherTableNameTwo + "."
                                            + otherTableWhereConditionTwo + " where " + otherTableNameThree + "."
                                            + colName + "='" + cacheHelper.getCache(Scenario, cacheMap) + "'",
                                    dataFromExecl);
                        }
                        
                        else {
                            dbHelper.compareResultUsingDb("select " + colValue + " from " + tableName + " where "
                                    + colName + " ='" + cacheHelper.getCache(Scenario, cacheMap) + "'", dataFromExecl);
                        }
                    }
                    
                } catch (Exception e) {
                    
                    e.printStackTrace();
                }
                
            }
        }
    }
    
    public void verifyAndConfirmModel(String successMessage) {
        try {
            WebElement ele;
            try {
                ele = d.findElement(By.xpath("//h6[@id='modale']"));
            } catch (Exception e1) {
                // TODO Auto-generated catch block
                e1.printStackTrace();
                ele = null;
            }
            if (!ele.getText().equalsIgnoreCase(null)) {
                try {
                    assertionHelper.verifyTextEquals("Verifying Model Message", "Common_ModelText", successMessage);
                    seleniumHelper.clickElement("Common_ModelConfirmButton");
                } catch (Exception e) {
                    seleniumHelper.clickElement("Common_ModelConfirmButton");
                }
            } else {
                reportHelper.writeLogInCaseOfFailInChildTest("Model Not Found*****");
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            reportHelper.writeLogInCaseOfFailInChildTest("Model Not Found&&&&");
        }
        
    }
    
}
