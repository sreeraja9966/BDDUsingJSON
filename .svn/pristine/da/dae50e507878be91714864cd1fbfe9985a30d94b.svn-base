package com.sysnik.selenium.service;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.BranchParametersEntity;
import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.repository.BranchParametersRepo;

@Service("BranchParametersService")
public class BranchParametersService {
    @Autowired
    BranchParametersRepo branchParametersRepo;
    
    private BranchParametersEntity branchParameters;
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    
    public Date getBnrachLiveDate(String branchCode) {
        BranchParametersEntity branchParametersEntity = branchParametersRepo.findByBranchCode(branchCode);
        if ((branchParametersEntity) != null) {
            return branchParametersEntity.getCurrentDate();
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest(
                    "Record not found in branchparameters with branchcode " + branchCode);
            return null;
        }
    }
    
    public String getDenominationYN(String branchCode) {
        BranchParametersEntity branchParametersEntity = branchParametersRepo.findByBranchCode(branchCode);
        if ((branchParametersEntity) != null) {
            return branchParametersEntity.getDenominationYN();
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest(
                    "Record not found in branchparameters with branchcode " + branchCode);
            return null;
        }
    }
    
    public String getBrachCode(String branchCode) {
        return branchParametersRepo.findByBranchCode(branchCode).getBranchCode();
    }
    
    public BranchParametersEntity getBnrachDetailsByBranchCode(String branchCode) {
        BranchParametersEntity branchParametersEntity = branchParametersRepo.findByBranchCode(branchCode);
        if ((branchParametersEntity) != null) {
            return branchParametersEntity;
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest(
                    "Record not found in branchparameters with branchcode " + branchCode);
            return null;
        }
    }
}
