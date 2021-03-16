package com.sysnik.selenium.fw.helper;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;
import java.util.stream.Collectors;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.Select;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.fw.testBase.TestBase;

public class DbHelper extends TestBase {
    private static final Logger log = Logger.getLogger(DbHelper.class);
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    FindElement findElement = AutomationObjectFactory.getFindElementInstance();
    AssertionHelper assertionHelper = AutomationObjectFactory.getAssertionHelperInstance();
    FilloExcelDataGetter filloExcelDataGetter = AutomationObjectFactory.getFilloExcelDataGetterInstance();
    CacheHelper cacheHelper = AutomationObjectFactory.getCacheHelperInstance();
    SeleniumHelper seleniumHelper = AutomationObjectFactory.getSeleniumHelperInstance();
    ConvertPropertyFileToMap convertPropertyFileToMap = AutomationObjectFactory.getConvertPropertyFileToMapInstance();
    DropDownHelper dropDownHelper = AutomationObjectFactory.getDropDownHelperInstance();
    public static Connection con = null;
    
    public void connectionEstablishmentWithDb() {
        try {
            
            Map<String, String> map = new HashMap<>();
            BufferedReader in = new BufferedReader(
                    new FileReader(relativePath() + "\\src\\main\\resources\\persistense.properties"));
            String line = "";
            String key = null;
            String value = null;
            String[] parts = null;
            while ((line = in.readLine()) != null) {
                parts = line.split("=", 2);
                if (parts.length >= 2) {
                    key = parts[0];
                    value = parts[1];
                    map.put(key, value);
                } else {
                    log.info("ignoring line: " + line);
                }
            }
            
            log.info("KEYSET------->" + map.keySet());
            String dbUrl = null;
            String username = null;
            String password = null;
            String dbName = null;
            
            log.info("DB URL------------->" + map.get("javax.persistence.jdbc.url"));
            log.info("DB Name------------->" + map.get("javax.persistence.jdbc.user"));
            log.info("DB Password------------->" + map.get("javax.persistence.jdbc.password"));
            
            dbUrl = map.get("javax.persistence.jdbc.url").trim();
            username = map.get("javax.persistence.jdbc.user").trim();
            password = map.get("javax.persistence.jdbc.password").trim();
            dbName = map.get("typeofDb");
            try {
                if ("postgres".equalsIgnoreCase(dbName)) {
                    Class.forName("org.postgresql.Driver");
                } else if ("oracle".equalsIgnoreCase(dbName)) {
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                } else if ("sql".equalsIgnoreCase(dbName)) {
                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                    
                }
            } catch (Exception e) {
                log.error(e);
            }
            DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
            con = DriverManager.getConnection(dbUrl, username, password);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public List<String> getListFromQuery(String query) {
        String myName = null;
        String query1 = null;
        String dbName = null;
        query1 = query.trim();
        List<String> reqList = new ArrayList<String>();
        log.info(query + "************QUERY**************");
        try {
            
            Statement stmt = con.createStatement();
            log.info(stmt + "stmtstmtstmt");
            ResultSet rs = null;
            try {
                rs = stmt.executeQuery(query1);
            } catch (Exception e1) {
                // TODO Auto-generated catch block
                e1.printStackTrace();
            }
            log.info(rs.toString() + "--->result");
            ResultSetMetaData rsmd = rs.getMetaData();
            int columnsNumber = rsmd.getColumnCount();
            
            while (rs.next()) {
                for (int i = 1; i <= columnsNumber; i++) {
                    reqList.add(rs.getString(i).trim());
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            log.error(e);
        }
        return reqList;
        
    }
    
    public String connectToDb(String query) {
        String myName = null;
        String query1 = null;
        String dbName = null;
        query1 = query.trim();
        log.info(query + "************QUERY**************");
        try {
            
            Statement stmt = con.createStatement();
            log.info(stmt + "stmtstmtstmt");
            ResultSet rs = null;
            try {
                rs = stmt.executeQuery(query1);
            } catch (Exception e1) {
                // TODO Auto-generated catch block
                e1.printStackTrace();
            }
            log.info(rs.toString() + "--->result");
            
            String multipleResponse = null;
            String multipleResponse2 = null;
            ResultSetMetaData rsmd = rs.getMetaData();
            int columnsNumber = rsmd.getColumnCount();
            try {
                while (rs.next()) {
                    for (int i = 1; i <= columnsNumber; i++) {
                        myName = rs.getString(i).trim();
                        
                        multipleResponse = myName;
                        if (i == 1) {
                            multipleResponse2 = myName;
                        }
                        if (i != 1) {
                            multipleResponse2 = multipleResponse2 + ",".concat(multipleResponse);
                            // multipleResponse2=multipleResponse.concat(myName);
                        }
                        
                        log.info(multipleResponse2 + "  ");
                        
                        log.info(multipleResponse2 + "--->multipleResponse2");
                        multipleResponse = null;
                    }
                }
            } catch (Exception e) {
                
                log.error("query error", e);
            }
            
            // con.close();
            log.info(multipleResponse2 + "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@multipleResponse2");
            
            return multipleResponse2;
        } catch (Exception e) {
            e.printStackTrace();
            log.error(e);
        }
        return "fasak";
    }
    
    public void executeQuery(String query) {
        String myName = null;
        String query1 = null;
        String dbName = null;
        query1 = query.trim();
        
        log.info(query + "************QUERY**************");
        try {
            Statement stmt = con.createStatement();
            log.info(stmt + "stmtstmtstmt");
            stmt.execute(query);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    
    public void inputUsingDb(String xpath, String query) {
        
        xpath = convertPropertyFileToMap.getPropertyFromMap(xpath, xpathLocatorMap);
        FindElement findElement = new FindElement();
        
        try {
            seleniumHelper.enterText(xpath, connectToDb(query));
            
        } catch (Exception e) {
            log.error(e);
        }
        
    }
    
    public void compareResultUsingDb(String query, String result) {
        
        String resultFromDb = connectToDb(query);
        String[] tabledata;
        String columnName = StringUtils.substringBetween(query.toUpperCase(), "SELECT", "FROM");
        tabledata = query.toUpperCase().split("FROM");
        String tableName = tabledata[1];
        
        log.info(resultFromDb + "----------->resultFromDb");
        log.info(result + " ***********************===> result");
        boolean test = result.equalsIgnoreCase(resultFromDb);
        
        if (test) {
            log.info("Expected Text---->" + result + " is Matched with Db Values" + resultFromDb);
            reportHelper.writeLogInCaseOfPassInChildTest("Comparing " + columnName + "column of " + tableName + "table"
                    + " Expected Text---->" + result + " is Matched with Db Values" + resultFromDb);
        } else {
            log.info("");
            reportHelper.writeLogInCaseOfFailInChildTest("Comparing " + columnName + "column of " + tableName + "table"
                    + " Expected Text---->  " + result + " is NOT Matched with Db Values" + resultFromDb);
            // reportHelper.addScreenShotInCaseOfFailInReportInChild("Expected
            // Text---->"+result+ " is NOT Matched with Db Values"+resultFromDb);
        }
        
    }
    
    public void compareExcelResultUsingDb(String query, String queryToFetchresultFromExcel, String fieldName) {
        String result = filloExcelDataGetter.getDataFromaColumnOfAnExcellSheet(queryToFetchresultFromExcel, fieldName);
        String resultFromDb = connectToDb(query);
        String[] tabledata;
        String columnName = StringUtils.substringBetween(query.toUpperCase(), "SELECT", "FROM");
        tabledata = query.toUpperCase().split("FROM");
        String tableName = tabledata[1];
        log.info(resultFromDb + "----------->resultFromDb");
        boolean test = result.equalsIgnoreCase(resultFromDb);
        
        if (test) {
            log.info("Comparing " + columnName + "column of " + tableName + "table" + " Expected Text---->" + result
                    + " is Matched with Db Values" + resultFromDb);
            reportHelper.writeLogInCaseOfPassInChildTest(
                    "Expected Text---->" + result + " is Matched with Db Values" + resultFromDb);
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest("Comparing " + columnName + "column of " + tableName + "table"
                    + " Expected Text---->  " + result + " is NOT Matched with Db Values" + resultFromDb);
            reportHelper.addScreenShotInCaseOfFailInReportInChild(
                    "Expected Text---->" + result + " is NOT Matched with Db Values" + resultFromDb);
        }
        
    }
    
    public void compareResultUsingDbUsingExcel(String query, String queryToFetchresultFromExcel, String fieldName) {
        
        String resultFromDb = connectToDb(query);
        String result = filloExcelDataGetter.getDataFromaColumnOfAnExcellSheet(queryToFetchresultFromExcel, fieldName);
        boolean test = result.equalsIgnoreCase(resultFromDb);
        String[] tabledata;
        String columnName = StringUtils.substringBetween(query.toUpperCase(), "SELECT", "FROM");
        tabledata = query.toUpperCase().split("FROM");
        String tableName = tabledata[1];
        
        if (test) {
            log.info("Expected Text---->" + result + " is Matched with Db Values" + resultFromDb);
            reportHelper.writeLogInCaseOfPassInChildTest("Comparing " + columnName + "column of " + tableName + "table"
                    + " Expected Text---->" + result + " is Matched with Db Values" + resultFromDb);
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest("Comparing " + columnName + "column of " + tableName + "table"
                    + " Expected Text---->  " + result + " is NOT Matched with Db Values" + resultFromDb);
            reportHelper.addScreenShotInCaseOfFailInReportInChild(
                    "Expected Text---->" + result + " is NOT Matched with Db Values" + resultFromDb);
        }
        
    }
    
    public void compareIntUsingDb(int result, String query) {
        String resultFromDb = connectToDb(query);
        String resultAsString = Integer.toString(result);
        boolean test = resultAsString.equals(resultFromDb);
        String[] tabledata;
        String columnName = StringUtils.substringBetween(query.toUpperCase(), "SELECT", "FROM");
        tabledata = query.toUpperCase().split("FROM");
        String tableName = tabledata[1];
        if (test) {
            log.info("Expected Text is--> " + resultAsString + " Matched with Db Values----> " + resultFromDb);
            reportHelper.writeLogInCaseOfPassInChildTest("Comparing " + columnName + "column of " + tableName + "table"
                    + " Expected Text is--> " + resultAsString + " Matched with Db Values----> " + resultFromDb);
        } else {
            log.error("Expected Text is--> " + resultAsString + " NOT Matched with Db Values----> " + resultFromDb);
            reportHelper.writeLogInCaseOfFailInChildTest("Comparing " + columnName + "column of " + tableName + "table"
                    + " Expected Text is--> " + resultAsString + " NOT Matched with Db Values----> " + resultFromDb);
            reportHelper.addScreenShotInCaseOfFailInReportInChild("DB Data not matched");
        }
        
    }
    
    public void verifyUiTextWithDb(String Xpath, String query) {
        try {
            String xpath = convertPropertyFileToMap.getPropertyFromMap(Xpath, xpathLocatorMap);
            String resultFromDb = connectToDb(query);
            String[] tabledata;
            String columnName = StringUtils.substringBetween(query.toUpperCase(), "SELECT", "FROM");
            tabledata = query.toUpperCase().split("FROM");
            String tableName = tabledata[1];
            String textFromUI = findElement.searchClickableElement(By.xpath(xpath)).getText().trim();
            if (textFromUI.equals(null) || textFromUI.equals("")) {
                
                try {
                    textFromUI = findElement.searchClickableElement(By.xpath(xpath)).getAttribute("ng-reflect-model")
                            .trim();
                } catch (Exception e) {
                    textFromUI = findElement.searchClickableElement(By.xpath(xpath)).getAttribute("value").trim();
                }
            }
            boolean test = textFromUI.equalsIgnoreCase(resultFromDb);
            
            if (test) {
                log.info("Expected Text is-->" + textFromUI + " Which is Matched with Db Value--->" + resultFromDb);
                reportHelper.writeLogInCaseOfPassInChildTest(
                        "Comparing " + columnName + "column of " + tableName + "table" + " Expected Text is-->"
                                + textFromUI + " Which is  Matched with Db Value--->" + resultFromDb);
            } else {
                assertionHelper.highlightElementInRedColour(Xpath);
                log.error(
                        "Expected Text is-->" + textFromUI + " Which is NOT Matched with Db Value--->" + resultFromDb);
                reportHelper.writeLogInCaseOfFailInChildTest(
                        "Comparing " + columnName + "column of " + tableName + "table" + " Expected Text is-->"
                                + textFromUI + " Which is NOT Matched with Db Value--->" + resultFromDb);
                reportHelper.addScreenShotInCaseOfFailInReportInChild("DB Data not matched");
                assertionHelper.changeElementColour(Xpath);
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
    }
    
    public void verifyListOfUIElementsUsingDb(String FilePath, String Query) {
        try {
            Properties table2 = new SequencedProperties();
            File file = new File(relativePath() + FilePath + ".properties");
            FileInputStream fi2 = new FileInputStream(file);
            table2.load(fi2);
            List<String> lis = new ArrayList();
            HashMap<String, String> map = new LinkedHashMap<String, String>();
            for (final Entry<Object, Object> entry : table2.entrySet()) {
                map.put((String) entry.getKey(), (String) entry.getValue());
                lis.add((String) entry.getKey());
                
            }
            List<String> values = lis.stream().map(map::get).collect(Collectors.toList());
            String ap;
            StringBuffer req = new StringBuffer();
            for (String val : values) {
                if (!val.contains("select")) {
                    WebElement ele = d.findElement(By.xpath(val));
                    
                    ap = ele.getText();
                    
                    req = req.append(ap).append(",");
                } else {
                    Query = val;
                }
            }
            String actualResult = req.deleteCharAt(req.length() - 1).toString();
            
            compareResultUsingDb(Query, actualResult);
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    
    public void closeDbConnection() {
        try {
            con.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    
    public void verifyUiAmountWithDb(String Xpath, String query) {
        String xpath = convertPropertyFileToMap.getPropertyFromMap(Xpath, xpathLocatorMap);
        String textFromUI = findElement.searchClickableElement(By.xpath(xpath)).getText().trim();
        String[] tabledata;
        String columnName = StringUtils.substringBetween(query.toUpperCase(), "SELECT", "FROM");
        tabledata = query.toUpperCase().split("FROM");
        String tableName = tabledata[1];
        if (!textFromUI.equals(null)) {
            try {
                String resultFromDb;
                try {
                    resultFromDb = connectToDb(query);
                    if (resultFromDb.equals(null) || resultFromDb.equals("")) {
                        resultFromDb = "0";
                    }
                } catch (Exception e1) {
                    e1.printStackTrace();
                    resultFromDb = "0";
                }
                
                if (textFromUI.equals(null) || textFromUI.equals("")) {
                    
                    try {
                        textFromUI = findElement.searchClickableElement(By.xpath(xpath))
                                .getAttribute("ng-reflect-model").trim();
                    } catch (Exception e) {
                        textFromUI = findElement.searchClickableElement(By.xpath(xpath)).getAttribute("value").trim();
                    }
                }
                boolean test = false;
                test = textFromUI.equals(resultFromDb);
                
                if (test) {
                    log.info("Expected Text is-->" + textFromUI + " Which is Matched with Db Value--->" + resultFromDb);
                    reportHelper.writeLogInCaseOfPassInChildTest(
                            "Comparing " + columnName + "column of " + tableName + "table" + " Expected Text is-->"
                                    + textFromUI + " Which is  Matched with Db Value--->" + resultFromDb);
                } else {
                    resultFromDb = resultFromDb.replace(",", "");
                    textFromUI = textFromUI.replace(",", "");
                    BigDecimal numberinIntFromDB = new BigDecimal(resultFromDb);
                    BigDecimal numberinIntFromUI = new BigDecimal(textFromUI);
                    
                    if (numberinIntFromDB.compareTo(numberinIntFromUI) == 0) {
                        log.info("Expected Text is-->" + numberinIntFromUI + " Which is Matched with Db Value--->"
                                + numberinIntFromDB);
                        reportHelper.writeLogInCaseOfPassInChildTest("Comparing " + columnName + "column of "
                                + tableName + "table" + " Expected Text is-->" + numberinIntFromUI
                                + " Which is  Matched with Db Value--->" + numberinIntFromDB);
                    } else {
                        log.error("actualText is :" + textFromUI + " expected text is: " + resultFromDb);
                        assertionHelper.highlightElementInRedColour(Xpath);
                        log.error("Expected Text is-->" + textFromUI + " Which is NOT Matched with Db Value--->"
                                + resultFromDb);
                        reportHelper.writeLogInCaseOfFailInChildTest("Expected Text is-->" + textFromUI
                                + " Which is NOT Matched with Db Value--->" + resultFromDb);
                        reportHelper.addScreenShotInCaseOfFailInReportInChild("DB Data not matched");
                        assertionHelper.changeElementColour(Xpath);
                    }
                }
            }
            
            catch (Exception e) {
                reportHelper.writeLogInCaseOfFailInChildTest("Comparing " + columnName + "column of " + tableName
                        + "table" + " FAILED TO VERIFY UI AMOUNT WITH DB");
                e.printStackTrace();
            }
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest(
                    "Comparing " + columnName + "column of " + tableName + "table" + " VAULE ON UI IS NULL");
        }
    }
    
    public void validateColumnsOfTwoTables(String textToenterInReport, String queryOne, String queryTwo) {
        String resOfQueryOne = connectToDb(queryOne);
        String resOfQueryTwo = connectToDb(queryTwo);
        
        log.info(resOfQueryOne + "resOfQueryOneresOfQueryOneresOfQueryOneresOfQueryOne");
        log.info(resOfQueryTwo + "resOfQueryTworesOfQueryTworesOfQueryTworesOfQueryTwo");
        assertionHelper.verifyTwoTexts(textToenterInReport, resOfQueryOne, resOfQueryTwo);
        
    }
    
    public void validateColumnsOfTwoTablesInCaseOfAmount(String textToenterInReport, String queryOne, String queryTwo) {
        String resOfQueryOne = connectToDb(queryOne);
        String resOfQueryTwo = connectToDb(queryTwo);
        log.info(resOfQueryOne + "resOfQueryOneresOfQueryOneresOfQueryOneresOfQueryOne");
        log.info(resOfQueryTwo + "resOfQueryTworesOfQueryTworesOfQueryTworesOfQueryTwo");
        assertionHelper.verifyTwoAmounts(textToenterInReport, resOfQueryOne, resOfQueryTwo);
        
    }
    
    public void verifyUiDateWithDB(String Xpath, String query) {
        String xpath = convertPropertyFileToMap.getPropertyFromMap(Xpath, xpathLocatorMap);
        String resultFromDb = connectToDb(query);
        DateHelper dateHelper = new DateHelper();
        String textFromUI = findElement.searchClickableElement(By.xpath(xpath)).getText().trim();
        
        if (textFromUI.equals(null) || textFromUI.equals("")) {
            
            try {
                textFromUI = findElement.searchClickableElement(By.xpath(xpath)).getAttribute("ng-reflect-model")
                        .trim();
                textFromUI = dateHelper.convetDateIntoSpecificFormat(textFromUI);
            } catch (Exception e) {
                textFromUI = findElement.searchClickableElement(By.xpath(xpath)).getAttribute("value").trim();
                textFromUI = dateHelper.convetDateIntoSpecificFormat(textFromUI);
            }
        } else {
            textFromUI = dateHelper.convetDateIntoSpecificFormat(textFromUI);
        }
        boolean test = false;
        test = textFromUI.equals(resultFromDb);
        
        if (test) {
            log.info("Expected Text is-->" + textFromUI + " Which is Matched with Db Value--->" + resultFromDb);
            reportHelper.writeLogInCaseOfPassInChildTest(
                    "Expected Text is-->" + textFromUI + " Which is  Matched with Db Value--->" + resultFromDb);
        }
        
        else {
            textFromUI = textFromUI.replace("/", "-");
            test = textFromUI.equals(resultFromDb);
            if (test) {
                log.info("Expected Text is-->" + textFromUI + " Which is Matched with Db Value--->" + resultFromDb);
                reportHelper.writeLogInCaseOfPassInChildTest(
                        "Expected Text is-->" + textFromUI + " Which is  Matched with Db Value--->" + resultFromDb);
            } else {
                assertionHelper.highlightElementInRedColour(Xpath);
                log.error(
                        "Expected Text is-->" + textFromUI + " Which is NOT Matched with Db Value--->" + resultFromDb);
                reportHelper.writeLogInCaseOfFailInChildTest(
                        "Expected Text is-->" + textFromUI + " Which is NOT Matched with Db Value--->" + resultFromDb);
                reportHelper.addScreenShotInCaseOfFailInReportInChild("DB Data not matched");
                assertionHelper.changeElementColour(Xpath);
            }
        }
        
    }
    
    public void verfiyDbWithCacheNumber(String query, String result, String scenario, Map<String, String> cacheMap) {
        String whereCondition = cacheHelper.getCache(scenario, cacheMap);
        String buildQuery = query.concat("='" + whereCondition + "'");
        compareResultUsingDb(buildQuery, result);
    }
    
    public void enterTextUsingDbValue(String xpath, String query) {
        seleniumHelper.enterText(xpath, connectToDb(query));
    }
    
    public void enterTextUsingDbValueUsingExcel(String xpath, String excelQuery, String fieldName) {
        seleniumHelper.enterText(xpath,
                connectToDb(filloExcelDataGetter.getDataFromaColumnOfAnExcellSheet(excelQuery, fieldName)));
    }
    
    public void selectByElementUsingDbQuery(String elements, String dbQuery) {
        
        try {
            String element = convertPropertyFileToMap.getPropertyFromMap(elements, xpathLocatorMap);
            WebElement ele = findElement.searchClickableElement(By.xpath(element));
            Select select = new Select(ele);
            List<WebElement> elementList = select.getOptions();
            List<String> valueList = new LinkedList<String>();
            String text = connectToDb(dbQuery);
            log.info(elementList.size() + "=====================> size of dropdown list");
            for (WebElement dropEle : elementList) {
                
                // log.info(dropEle.getText());
                // valueList.add(dropEle.getText());
                if (text.equalsIgnoreCase(dropEle.getText().trim())) {
                    dropDownHelper.SelectUsingVisibleText(element, dropEle.getText());
                }
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    
}
