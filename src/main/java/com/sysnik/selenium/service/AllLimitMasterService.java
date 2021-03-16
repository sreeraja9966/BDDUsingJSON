package com.sysnik.selenium.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.selenium.entity.AllLimitMasterEntity;
import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.fw.testBase.TestBase;
import com.sysnik.selenium.repository.AllLimitMasterRepo;

@Service("AllLimitMasterService")
public class AllLimitMasterService extends TestBase {
    @Autowired
    private AllLimitMasterRepo allLimitRepo;
    private AllLimitMasterEntity allLimit;
    ReportHelper reportHelper = new ReportHelper();
    
    public List<AllLimitMasterEntity> getAllLimitMasterDetailsByTypeAndTransCode(String transCode, String activity) {
        List<String> typesList = new ArrayList<String>();
        typesList.add("user");
        typesList.add("bank");
        typesList.add("branch");
        List<String> valueList = new ArrayList<String>();
        
        /*
         * valueList.add(filloExcelDataGetter.getDataFromaColumnOfAnExcellSheet("select * from Login", "UserID"));
         * valueList.add(filloExcelDataGetter.getDataFromaColumnOfAnExcellSheet("select * from Login", "BankCode"));
         * valueList.add(filloExcelDataGetter.getDataFromaColumnOfAnExcellSheet("select * from Login", "BranchCode"));
         */
        valueList.add(property.getProperty("LogInUser"));
        valueList.add(property.getProperty("BankCode"));
        valueList.add(property.getProperty("BranchCode"));
        List<AllLimitMasterEntity> allLimitMaster = allLimitRepo
                .findByLimitTypeInAndValueInAndTransCodeAndActivity(typesList, valueList, transCode, activity);
        if (allLimitMaster.size() > 0) {
            return allLimitMaster;
        } else {
            reportHelper
                    .writeLogInCaseOfFailInChildTest("Record Not Found in allLimitMaster with transcode " + transCode);
            return null;
        }
    }
}
