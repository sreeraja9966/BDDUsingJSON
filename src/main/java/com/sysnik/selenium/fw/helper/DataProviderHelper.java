package com.sysnik.selenium.fw.helper;

import org.apache.log4j.Logger;
import org.python.jline.internal.Log;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.fw.testBase.TestBase;

public class DataProviderHelper extends TestBase {
    private static final Logger log = Logger.getLogger(DataProviderHelper.class);
    ExcelHelper excelHelper = AutomationObjectFactory.getExcelHelperInstance();
    
    public Object[][] data(String datafile, String sheetName) {
        
        Object[][] custdata = null;
        try {
            excelHelper.setExcelFile(datafile, sheetName);
            int rows = excelHelper.getRowCount(sheetName);
            
            int columns = excelHelper.getColumnCount(sheetName);
            
            custdata = new Object[rows][columns];
            for (int i = 0; i <= rows - 1; i++) {
                for (int j = 0; j <= columns - 1; j++) {
                    custdata[i][j] = excelHelper.getCellData(datafile, sheetName, i, j);
                    
                }
            }
        } catch (Exception e) {
            Log.error(e);
        }
        return custdata;
        
    }
    
}
