package com.sysnik.selenium.service;

import java.math.BigInteger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.InventoryBookwiseLogEntity;
import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.repository.INVENTORYBOOKWISELogRepo;

@Service("INVENTORYBOOKWISELogService")
public class INVENTORYBOOKWISELogService {
    @Autowired
    private INVENTORYBOOKWISELogRepo invBookWiseLogRepo;
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    
    public InventoryBookwiseLogEntity getInvBookLogDetailsByBatchNoAndSeriesAndStartNo(BigInteger batchNo,
            String series, Integer startNo) {
        InventoryBookwiseLogEntity invBookDetails = null;
        try {
            invBookDetails = invBookWiseLogRepo.findByBatchNoAndSeriesAndStartNo(batchNo, series, startNo);
        } catch (Exception e) {
            reportHelper.writeLogInCaseOfFailInChildTest(
                    "No Record found with batch No ::" + batchNo + " and Series:: " + series);
            return null;
        }
        if ((invBookDetails) != null) {
            return invBookDetails;
        } else {
            
            reportHelper.writeLogInCaseOfFailInChildTest(
                    "No Record found with batch No ::" + batchNo + " and Series:: " + series);
            return null;
        }
        
    }
}
