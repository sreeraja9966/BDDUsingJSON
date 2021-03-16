package com.sysnik.selenium.service;

import java.math.BigInteger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.InventoryBookwiseEntity;
import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.repository.INVENTORYBOOKWISERepo;

@Service("INVENTORYBOOKWISEService")
public class INVENTORYBOOKWISEService {
    @Autowired
    private INVENTORYBOOKWISERepo invBookWiseRepo;
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    
    public InventoryBookwiseEntity getInvBookDetailsByBatchNoAndSeriesAndStartNo(BigInteger batchNo, String series,
            Integer startNo) {
        InventoryBookwiseEntity invBookDetails = null;
        try {
            invBookDetails = invBookWiseRepo.findByBatchNoAndSeriesAndStartNo(batchNo, series, startNo);
        } catch (Exception e) {
            reportHelper.writeLogInCaseOfFailInChildTest(
                    "No Record found with batch No ::" + batchNo + " and Series:: " + series);
            return null;
        }
        if ((invBookDetails) != null) {
            return invBookDetails;
        } else {
            
            reportHelper.writeLogInCaseOfFailInChildTest("No Record found in InventoryBookwiseEntity with batch No ::"
                    + batchNo + " and Series:: " + series);
            return null;
        }
        
    }
    
    public InventoryBookwiseEntity getInvBookDetailsSeriesAndStartNo(String series, Integer startNo) {
        InventoryBookwiseEntity invBookDetails = null;
        try {
            invBookDetails = invBookWiseRepo.findBySeriesAndStartNo(series, startNo);
        } catch (Exception e) {
            reportHelper.writeLogInCaseOfFailInChildTest("No Record found with Series:: " + series);
            return null;
        }
        if ((invBookDetails) != null) {
            return invBookDetails;
        } else {
            
            reportHelper.writeLogInCaseOfFailInChildTest(
                    "No Record found in InventoryBookwiseEntity with Series:: " + series);
            return null;
        }
        
    }
}
