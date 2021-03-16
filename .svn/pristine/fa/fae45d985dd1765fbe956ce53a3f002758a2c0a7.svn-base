package com.sysnik.selenium.fw.helper;

import com.codoid.products.exception.FilloException;
import com.codoid.products.fillo.Connection;
import com.codoid.products.fillo.Fillo;
import com.codoid.products.fillo.Recordset;
import com.sysnik.selenium.fw.testBase.TestBase;

public class FilloExcelDataGetter extends TestBase {
    
    Fillo fillo = new Fillo();
    Connection connection;
    Recordset recordset;
    
    public void connectedToExcelDataFile() {
        try {
            connection = fillo
                    .getConnection(relativePath().concat("\\src\\main\\resources//GlobalDataProvider//temp.xls"));
            
        } catch (FilloException e) {
            
            e.printStackTrace();
        }
    }
    
    public String getDataFromaColumnOfAnExcellSheet(String query, String fieldName) {
        DbHelper dbHelper = new DbHelper();
        
        try {
            connectedToExcelDataFile();
            log.info("Excel query ========>" + query + "********FiledName*************" + fieldName);
            recordset = connection.executeQuery(query.trim());
            
            while (recordset.next()) {
                if (recordset.getField(fieldName.trim()).toUpperCase().contains("SELECT")) {
                    return dbHelper.connectToDb(recordset.getField(fieldName.trim()));
                } else {
                    return recordset.getField(fieldName.trim());
                }
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }
    
    public String getDataFromaColumnOfAnExcellSheetForDataSetup(String query, String fieldName) {
        DbHelper dbHelper = new DbHelper();
        
        try {
            connectedToExcelDataFile();
            log.info("Excel query ========>" + query + "********FiledName*************" + fieldName);
            recordset = connection.executeQuery(query.trim());
            
            while (recordset.next()) {
                
                return recordset.getField(fieldName.trim());
                
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }
    
    public void updateDatInaExcelSheetORInsert(String strQuery) {
        
        try {
            connection.executeUpdate(strQuery);
        } catch (FilloException e) {
            
            e.printStackTrace();
        }
    }
    
    public void closeExcelConnection() {
        recordset.close();
        connection.close();
    }
}
