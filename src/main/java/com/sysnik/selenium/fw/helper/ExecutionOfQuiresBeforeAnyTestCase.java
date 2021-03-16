package com.sysnik.selenium.fw.helper;

import java.util.regex.Pattern;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.fw.testBase.TestBase;

public class ExecutionOfQuiresBeforeAnyTestCase extends TestBase {
    
    FilloExcelDataGetter filloExcelDataGetter = AutomationObjectFactory.getFilloExcelDataGetterInstance();
    DbHelper dbHelper = AutomationObjectFactory.getDbHelperInstance();
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    
    public String fetchQuiresFromExcel(String query, String fieldName) {
        return filloExcelDataGetter.getDataFromaColumnOfAnExcellSheetForDataSetup(query, fieldName);
    }
    
    public void executeQuriesFromExcel(String query, String fieldName) {
        try {
            String splitedQuires[] = fetchQuiresFromExcel(query, fieldName).split(",");
            for (String quires : splitedQuires) {
                log.info("%%%%%%%%%%%%%%%%%%%%%%%%" + quires + "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
                dbHelper.executeQuery(quires);
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    
    public void dataSetupBeforeTestCase(String query, String fieldName) {
        try {
            String splitedQuires[] = fetchQuiresFromExcel(query, fieldName).split(Pattern.quote("$"));
            String setOne = splitedQuires[0];
            String setTwo = splitedQuires[1];
            String query1 = null;
            try {
                query1 = dbHelper.connectToDb(setOne);
            } catch (Exception e) {
                //reportHelper.writeLogInCaseOfFailInChildTest("Correct Your Select Query");
                e.printStackTrace();
            }
            
            if (query1 != null) {
                
            } else {
                if (setTwo.contains("$")) {
                    setTwo = setTwo.replace("$", "");
                }
                if (setTwo.contains("&")) {
                    String secondSplit[] = setTwo.split("&");
                    for (String queries : secondSplit) {
                        dbHelper.executeQuery(queries);
                    }
                } else {
                    try {
                        dbHelper.executeQuery(setTwo);
                    } catch (Exception e) {
                        //reportHelper.writeLogInCaseOfFailInChildTest("Correct Your Update Query");
                        e.printStackTrace();
                    }
                }
                query1 = dbHelper.connectToDb(setOne);
                if (query1.equals(null)) {
                    
                    //reportHelper.writeLogInCaseOfFailInChildTest("DATA NOT FOUND");
                }
                
            }
        } catch (Exception e) {
            // reportHelper.writeLogInCaseOfFailInChildTest(query + " Record not found");
            e.printStackTrace();
        }
        
    }
    
    public void dataSetupUsingMultipleFields(String excelQuery, String selectField, String updateFiled) {
        String query1 = null;
        String selectValue = fetchQuiresFromExcel(excelQuery, selectField);
        String updateValue = fetchQuiresFromExcel(excelQuery, updateFiled);
        try {
            query1 = dbHelper.connectToDb(selectValue);
        } catch (Exception e) {
            reportHelper.writeLogInCaseOfFailInChildTest("Correct Your Select Query");
            e.printStackTrace();
        }
        if (query1 != null) {
            
        } else {
            try {
                query1 = dbHelper.connectToDb(updateValue);
            } catch (Exception e) {
                reportHelper.writeLogInCaseOfFailInChildTest("Correct Your Update Query");
                e.printStackTrace();
            }
        }
    }
}
