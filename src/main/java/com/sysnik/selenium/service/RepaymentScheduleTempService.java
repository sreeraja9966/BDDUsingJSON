package com.sysnik.selenium.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.selenium.entity.AccountMasterEntity;
import com.sysnik.selenium.entity.RepaymentScheduleTempEntity;
import com.sysnik.selenium.fw.testBase.TestBase;
import com.sysnik.selenium.repository.RepaymentScheduleTempRepo;

@Service("RepaymentScheduleTempService")
public class RepaymentScheduleTempService extends TestBase {
    
    @Autowired
    private RepaymentScheduleTempRepo rstrepo;
    
    private AccountMasterEntity accMaster;
    
    public List<RepaymentScheduleTempEntity> getLoanRepaymentScheduleTempData(String accNumber) {
        List<RepaymentScheduleTempEntity> repaymentScheduleTempList = new ArrayList<RepaymentScheduleTempEntity>();
        accMaster = accountService.getAccountMasterDetailsByAccNo(accNumber);
        
        repaymentScheduleTempList = rstrepo.findByAccId(accMaster.getAccId());
        
        return repaymentScheduleTempList;
        
    }
    
}
